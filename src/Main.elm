module Main exposing (main)

import Game exposing (Game, Msg)

main : Program () Game Msg
main =
    let
        initialGame =
            Game.makeGame "The Spooky House"

        ( masterBedroom, game1 ) =
            Game.addRoom
                "Master Bedroom"
                "A large, spacious bedroom. There's a generic queen bed. The walls are plain white, there are windows to your right high up on the wall, and a large closet across the room. Left of the closet is a door leading out of the room."
                initialGame

        ( bedroomHallway, game2 ) =
            Game.addRoom
                "Bedroom Hallway"
                "A small hallway connecting bedrooms. All the doors are locked except the one to the master bedroom. The hallway opens up into the kitchen."
                game1

        ( kitchen, game3 ) =
            Game.addRoom
                "Kitchen"
                "Your basic home kitchen. Fridge, stove, sink. Not much else to say."
                game2

        ( diningLivingRoom, game4 ) =
            Game.addRoom
                "Dining & Living Room"
                "A classic combintation living room and dining room space. There's a TV in one corner and a shelf of statues along another wall."
                game3

        ( mudRoom, game5 ) =
            Game.addRoom
                "Mud Room"
                "A small room for storing your dirty boots. Also has a washer and dryer."
                game4

        ( basement, game6 ) =
            Game.addRoom
                "Basement"
                "A dark cold basement. The walls are bare."
                game5

        ( altBasement, game7 ) =
            Game.addRoom
                "Alt Basement"
                "A mirror of the other basement. It smells ancient, like no one has been here in ages."
                game6

        ( altMasterBedroom, game8) =
            Game.addRoom
                "Alt Master Bedroom"
                "A large, spacious bedroom. There's a large four-poster bed. It's ornate mahogany posts lead up to an emerald canopy. The walls are a deep red, there are windows to your right high up on the wall, and a large closet across the room. Left of the closet is a door leading out of the room."
                game7

        ( altBedroomHallway, game9 ) =
            Game.addRoom
                "Alt Bedroom Hallway"
                "A mirror of the other hallway. The walls feel alive. When you look at them nothing, but out of the corner of your eye it looks like they're breathing."
                game8

        ( altKitchen, game10 ) =
            Game.addRoom
                "Alt Kitchen"
                "An almost perfect mirror of the other kitchen, but there are no appliances. Why wouldn't you have appliances in a kitchen?"
                game9

        ( altMudRoom, game11 ) =
            Game.addRoom
                "Alt Mud Room"
                "A mirror of the other mud room except no washer and dryer."
                game10

        altRooms =
            [ altBasement
            , altMudRoom
            , altKitchen
            , altBedroomHallway
            , altMasterBedroom
            ]
    in
    game11
        -- Original connections
        |> Game.addConnection
            { from = masterBedroom
            , to = bedroomHallway
            , name = "Hallway Door"
            , description = "A simple bedroom door"
            , message = "You walk into the hallway."
            }
        |> Game.addConnection
            { from = bedroomHallway
            , to = masterBedroom
            , name = "Master Bedroom Door"
            , description = "A simple bedroom door"
            , message = "You walk into the master bedroom."
            }
        |> Game.addConnection
            { from = bedroomHallway
            , to = kitchen
            , name = "Hallway to Kitchen"
            , description = "A simple entryway"
            , message = "You walk into the kitchen."
            }
        |> Game.addConnection
            { from = kitchen
            , to = bedroomHallway
            , name = "Kitchen to Hallway"
            , description = "A simple entryway"
            , message = "You walk into the hallway."
            }
        |> Game.addConnection
            { from = kitchen
            , to = diningLivingRoom
            , name = "Kitchen to Living Room"
            , description = "A simple entryway"
            , message = "You walk into the living room."
            }
        |> Game.addConnection
            { from = diningLivingRoom
            , to = kitchen
            , name = "Living Room to Kitchen"
            , description = "A simple entryway"
            , message = "You walk into the kitchen."
            }
        |> Game.addConnection
            { from = kitchen
            , to = mudRoom
            , name = "Kitchen to Mud Room"
            , description = "A simple entryway"
            , message = "You walk into the mud room."
            }
        |> Game.addConnection
            { from = mudRoom
            , to = kitchen
            , name = "Mud Room to Kitchen"
            , description = "A simple entryway"
            , message = "You walk into the kitchen."
            }
        |> Game.addConnection
            { from = diningLivingRoom
            , to = mudRoom
            , name = "Dining Room to Mud Room"
            , description = "A simple entryway"
            , message = "You walk into the mud room."
            }
        |> Game.addConnection
            { from = mudRoom
            , to = diningLivingRoom
            , name = "Mud Room to Dining Room"
            , description = "A simple entryway"
            , message = "You walk into the dining room."
            }
        |> Game.addConnection
            { from = mudRoom
            , to = basement
            , name = "Door to Basement"
            , description = "A simple door and staircase"
            , message = "You walk down into the basement."
            }
        |> Game.addConnection
            { from = basement
            , to = mudRoom
            , name = "Stairs to Mud Room"
            , description = "Some stairs and a simple door"
            , message = "You walk up to the mud room."
            }
        -- The divide
        |> Game.addConnection
            { from = basement
            , to = altBasement
            , name = "A peculiar little tunnel"
            , description = "A dark, long, narrow tunnel. You can't quite make out the other end but there seems to be a faint light."
            , message = "You crawl through the tunnel."
            }
        |> Game.addConnection
            { from = altBasement
            , to = basement
            , name = "A peculiar little tunnel"
            , description = "A dark, long, narrow tunnel. You can't quite make out the other end but there seems to be a faint light."
            , message = "You crawl back through the tunnel."
            }
        -- Alt connections
        |> Game.addConnection
            { from = altMasterBedroom
            , to = altBedroomHallway
            , name = "Alt Hallway Door"
            , description = "An orante bedroom door with carvings of violent rituals."
            , message = "You walk into the alt hallway."
            }
        |> Game.addConnection
            { from = altBedroomHallway
            , to = altMasterBedroom
            , name = "Alt Master Bedroom Door"
            , description = "An orante bedroom door with carvings of violent rituals."
            , message = "You walk into the alt master bedroom."
            }
        |> Game.addConnection
            { from = altBedroomHallway
            , to = altKitchen
            , name = "Alt Hallway to Alt Kitchen"
            , description = "An archway covered by a dark drape."
            , message = "You walk into the alt kitchen."
            }
        |> Game.addConnection
            { from = altKitchen
            , to = altBedroomHallway
            , name = "Alt Kitchen to Alt Hallway"
            , description = "An archway covered by a dark drape."
            , message = "You walk into the alt hallway."
            }
        |> Game.addConnection
            { from = altKitchen
            , to = altMudRoom
            , name = "Alt Kitchen to Alt Mud Room"
            , description = "A heavy wooden door"
            , message = "You walk into the alt mud room."
            }
        |> Game.addConnection
            { from = altMudRoom
            , to = altKitchen
            , name = "Alt Mud Room to Alt Kitchen"
            , description = "A heavy wooden door"
            , message = "You walk into the alt kitchen."
            }
        |> Game.addConnection
            { from = altMudRoom
            , to = altBasement
            , name = "Door to Alt Basement"
            , description = "A heavy wooden door and creaky staircase"
            , message = "You walk down into the alt basement."
            }
        |> Game.addConnection
            { from = altBasement
            , to = altMudRoom
            , name = "Stairs to Alt Mud Room"
            , description = "Some creaky stairs and a heavy wooden door"
            , message = "You walk up to the alt mud room."
            }
        -- Items
        |> Game.createTool
            "Kitchen Knife"
            "A basic knife you'd find in any kitchen."
            (\_ g ->
                if Game.getCurrentRoom g == kitchen then
                    ( g, "You set to work, dicing up some tomatoes. Why did you do that?" )

                else
                    ( g, "You lash out with the knife. There's no need for violent acts!")
            )
        |> Game.addItemToRoom kitchen
        |> Game.createTool
            "Dog Statue"
            "A statue of your favorite dog."
            (\_ g ->
                if Game.getCurrentRoom g == altMasterBedroom then
                    ( g
                        |> Game.endGame
                            """The now live dog grabs the cat statue and smashes it to tiny pieces.

It then barks and pushes you back through the alt house, and back through the tunnel. As you emerge on the other side the opening to the tunnel snaps shut. There's no sign that it was ever there."""
                    , "The statue suddenly bursts to life!"
                    )
                else if List.any ((==) (Game.getCurrentRoom g)) altRooms then
                    ( g, "The statue feels ice cold, weird." )

                else 
                    ( g, "You look at the statue of your favorite dog. It warms your heart." )
            )
        |> Game.addItemToRoom diningLivingRoom
        |> Game.createTool
            "Cat Statue"
            "A statue of a hideous looking cat."
            (\_ g ->
                if List.any ((==) (Game.getCurrentRoom g)) altRooms then
                    ( g, "Looking at the cat statue fills you with dread." )

                else 
                    ( g
                        |> Game.endGame
                            """The cat's claws dig deep into your skin. You try to fight back but it's too powerful.

Slowly the world fades to black..."""
                    , "Suddenly the cat comes to life and leaps at you!"
                    )
            )
        |> Game.addItemToRoom altMasterBedroom
        |> Game.finalize
            masterBedroom
            "You wake up in a beautiful master bedroom."
        |> Game.program
    