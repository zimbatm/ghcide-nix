{ sources ? import ./sources.nix
, system ? builtins.currentSystem
}:
let
  haskellnix = import sources."haskell.nix";
  overlay = import ../overlay.nix;
  sourcesOverlay = _: __: {
    inherit sources;
  };
in
import sources.nixpkgs {
  overlays = haskellnix.overlays ++ [ sourcesOverlay overlay ];
  config = haskellnix.config;
  inherit system;
}
