Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.18805.1629913547243145592
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 10:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UsUG5CVj;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id u3so69695ejz.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UAtfGq3NWiB55ba5Jw97zuew65Nd1vuTlN8jr2Sr7Kc=;
        b=UsUG5CVj8hZp/1ryr9gj5cJudBu11vMsD2xCBQV6cPjWkizn/XCbHmPXP5Lye6gico
         9B5IKaounPD0/jG7aFJGpqJ/3VNV8Aw/iOfN1jzZJZDxHL6puGkAvxKNrmeANeF9G9aN
         vz/2FO5o2URQPw1MZ0luHXyLABWf/F6gRiYYjzoXaHBglP9TAoFH+OLaBG+MbqNKcdbx
         i9HW5e82fHErz2R1GqEqmaZa2q9rAJ5ycDZYWi3VSxwD6quX+Vncy6hL5tQT3Ivxa7CK
         5PBXvyuiCvN3V5+f2asXs+mizLcoGeQ/nl/2YO0AdhAdV3O9SP9XcHcT1/3C5CVppYFo
         2bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UAtfGq3NWiB55ba5Jw97zuew65Nd1vuTlN8jr2Sr7Kc=;
        b=kY9U8BMlzfX+Cord0qyQa6U1hoU4OgagPJd9Ud47nRiIkMLm39vKnVrEjIvPgby0aD
         VNKyFwB158pHux7sxI/5+J+IRMLn1zaC5fseHan7VNz9iUSUTB8Lpu5qJERaLN17bwqH
         edTKjL+TrVYazngI3psDp9V/Oqexrl9M6nZVI1GT42L3onXP6JTMZfdml6+Z2IeZIBqU
         dvswbo0yOc3dqT42XPmORC2ZYSxGkPvC9t8/HXyRopKwHKm1FaPFZDpWpnCPMP6x0hO9
         J9RPsnb95CxbwRwFU5MaSbW4GlvAzgWrVkQnfl9a1ARy5RHw9L51cCcKuIH1Uuoy4SU5
         Sv3Q==
X-Gm-Message-State: AOAM533Y9jH9fVwsHNCjMbMnnBINEXgwQ1eFAsq/2I4PuvFs87nf6hgk
	mbKvUdeZMx/BhKBOPI/YJBS/Eb0CWVVDtyhPSq0=
X-Google-Smtp-Source: ABdhPJzv//r448M8u5Z0Ben0lA5Z6+kGFVXX+BDiKMiLv3KCCzQiSWpL9ALe3a9eev1YDHEfXHCttFLF0sxm3CjSUqU=
X-Received: by 2002:a17:906:93e1:: with SMTP id yl1mr6573035ejb.334.1629913545356;
 Wed, 25 Aug 2021 10:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <169E9C6226DE3CC6.18091@lists.openembedded.org> <32b22790-eac9-9e8d-ab6c-661bb77e2fac@windriver.com>
In-Reply-To: <32b22790-eac9-9e8d-ab6c-661bb77e2fac@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 25 Aug 2021 13:45:34 -0400
Message-ID: <CADkTA4M4O5kkPv2zhosT1XQZrtWXe0=arT=zPH4eTxd=WtVZpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: upgrade to 1.17 release
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 25, 2021 at 1:30 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> Testing done:
>
> bitbake -k world

I assume that only oe-core is in the bblayers ? or is it more extensive ?

>
> bitbake core-image-full-cmdline && bitbake core-image-full-cmdline -c testimage
>
> Result:
>
> World build passes without warnings/errors.
>
> All image tests passed

But do any of those test images have anything more than go ptests ?
They didn't last time I checked.

Bruce

>
> Sakib
>
> On 2021-08-25 1:20 p.m., Sakib Sajal wrote:
>
> go 1.17 includes small enhancements to the language.
> Release notes: https://golang.org/doc/go1.17
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  .../go/{go-1.16.5.inc => go-1.17.inc}         |  6 +-
>  ...ow-CC-and-CXX-to-have-multiple-words.patch | 10 ++-
>  ...ent-based-hash-generation-less-pedan.patch | 62 +++++++++++-------
>  ...-to-be-overridden-in-the-environment.patch | 18 ++++--
>  ...4-ld-add-soname-to-shareable-objects.patch | 13 ++--
>  ...de-CC-when-building-dist-and-go_boot.patch | 15 +++--
>  ...dist-separate-host-and-target-builds.patch | 64 ++++++++++---------
>  ...d-go-make-GOROOT-precious-by-default.patch | 21 ++++--
>  ...008-use-GOBUILDMODE-to-set-buildmode.patch |  9 ++-
>  ...go-make-sure-CC-and-CXX-are-absolute.patch | 45 ++++++-------
>  ...ive_1.16.5.bb => go-binary-native_1.17.bb} |  4 +-
>  ...an_1.16.5.bb => go-cross-canadian_1.17.bb} |  0
>  .../{go-cross_1.16.5.bb => go-cross_1.17.bb}  |  0
>  ...crosssdk_1.16.5.bb => go-crosssdk_1.17.bb} |  0
>  ...{go-native_1.16.5.bb => go-native_1.17.bb} |  0
>  ...o-runtime_1.16.5.bb => go-runtime_1.17.bb} |  0
>  .../go/{go_1.16.5.bb => go_1.17.bb}           |  0
>  18 files changed, 163 insertions(+), 106 deletions(-)
>  rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.17.inc} (85%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (80%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (80%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (78%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0004-ld-add-soname-to-shareable-objects.patch (78%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (76%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0006-cmd-dist-separate-host-and-target-builds.patch (90%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0007-cmd-go-make-GOROOT-precious-by-default.patch (78%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0008-use-GOBUILDMODE-to-set-buildmode.patch (84%)
>  rename meta/recipes-devtools/go/{go-1.16 => go-1.17}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb => go-binary-native_1.17.bb} (83%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb => go-cross-canadian_1.17.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.16.5.bb => go-cross_1.17.bb} (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb => go-crosssdk_1.17.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.16.5.bb => go-native_1.17.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb => go-runtime_1.17.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.17.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 47f23f5c39..5b8a532943 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -23,7 +23,7 @@ GDBVERSION ?= "10.%"
>  GLIBCVERSION ?= "2.34"
>  LINUXLIBCVERSION ?= "5.13%"
>  QEMUVERSION ?= "6.0%"
> -GOVERSION ?= "1.16%"
> +GOVERSION ?= "1.17%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>  # llvm version being used, so always bump it with llvm recipe version bump
>  LLVMVERSION ?= "12.0.1"
> diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools/go/go-1.17.inc
> similarity index 85%
> rename from meta/recipes-devtools/go/go-1.16.5.inc
> rename to meta/recipes-devtools/go/go-1.17.inc
> index 545aa0c828..6b412afe25 100644
> --- a/meta/recipes-devtools/go/go-1.16.5.inc
> +++ b/meta/recipes-devtools/go/go-1.17.inc
> @@ -1,7 +1,7 @@
>  require go-common.inc
>
> -GO_BASEVERSION = "1.16"
> -PV = "1.16.5"
> +GO_BASEVERSION = "1.17"
> +PV = "1.17"
>  FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> @@ -17,4 +17,4 @@ SRC_URI += "\
>      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
>      file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
>  "
> -SRC_URI[main.sha256sum] = "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
> +SRC_URI[main.sha256sum] = "3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d"
> diff --git a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> similarity index 80%
> rename from meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> rename to meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> index 5f4823be22..8a833e05d3 100644
> --- a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> @@ -1,4 +1,4 @@
> -From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001
> +From 0e964d3ca3496beb4f3732abe501b50e262b6646 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:01:13 +0430
>  Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
> @@ -10,14 +10,15 @@ the meta/recipes-devtools/go tree by
>  Matt Madison <matt@madison.systems>.
>
>  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> -
>  ---
>   src/cmd/go/internal/envcmd/env.go | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> +index 1553d26391..20d0587899 100644
>  --- a/src/cmd/go/internal/envcmd/env.go
>  +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
> +@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {
>
>   cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
>   if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
> @@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   }
>   env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
>   env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> similarity index 80%
> rename from meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> rename to meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> index 04d0e496c0..b78b6afa24 100644
> --- a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> @@ -1,4 +1,4 @@
> -From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001
> +From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:14:22 +0430
>  Subject: [PATCH 2/9] cmd/go: make content-based hash generation less pedantic
> @@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
>   2 files changed, 49 insertions(+), 19 deletions(-)
>
> +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> +index 20d0587899..ff6f0d810a 100644
>  --- a/src/cmd/go/internal/envcmd/env.go
>  +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> +@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
>   func ExtraEnvVarsCostly() []cfg.EnvVar {
>   var b work.Builder
>   b.Init()
> @@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   if err != nil {
>   // Should not happen - b.CFlags was given an empty package.
>   fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
> +index 5a225fb9f1..a37872e7c7 100644
>  --- a/src/cmd/go/internal/work/exec.go
>  +++ b/src/cmd/go/internal/work/exec.go
> -@@ -37,6 +37,8 @@ import (
> +@@ -38,6 +38,8 @@ import (
>   "cmd/go/internal/trace"
>   )
>
> @@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   // actionList returns the list of actions in the dag rooted at root
>   // as visited in a depth-first post-order traversal.
>   func actionList(root *Action) []*Action {
> -@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio
> +@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
>   // Assume b.WorkDir is being trimmed properly.
>   // When -trimpath is used with a package built from the module cache,
>   // use the module path and version instead of the directory.
> @@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   fmt.Fprintf(h, "dir %s\n", p.Dir)
>   } else if cfg.BuildTrimpath && p.Module != nil {
>   fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
> -@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio
> +@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
>   }
> - if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> + if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
>   fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
>  - cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
> -- fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags, ldflags)
>  + cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
> -+ fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags, cflags, ldflags)
> - if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> -- fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> -+ fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
> +
> +- ccExe := b.ccExe()
> ++ ccExe := b.ccExe(true)
> + fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
> + // Include the C compiler tool ID so that if the C
> + // compiler changes we rebuild the package.
> +@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
> + }
>   }
> - if len(p.FFiles) > 0 {
> -- fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> -+ fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> + if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> +- cxxExe := b.cxxExe()
> ++ cxxExe := b.cxxExe(true)
> + fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
> + if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
> + fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> + }
>   }
> - // TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
> - }
> -@@ -2401,33 +2403,48 @@ var (
> + if len(p.FFiles) > 0 {
> +- fcExe := b.fcExe()
> ++ fcExe := b.fcExe(true)
> + fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
> + if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
> + fmt.Fprintf(h, "FC ID=%q\n", fcID)
> +@@ -2438,33 +2440,48 @@ var (
>   // gccCmd returns a gcc command line prefix
>   // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
>   func (b *Builder) GccCmd(incdir, workdir string) []string {
> @@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   }
>
>   // compilerExe returns the compiler to use given an
> -@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {
> +@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
>   // of the compiler but can have additional arguments if they
>   // were present in the environment value.
>   // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
> @@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   return compiler
>   }
>
> -@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {
> +@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
>   }
>
>   // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
> @@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   defaults := "-g -O2"
>
>   if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
> -@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package
> +@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
>   return
>   }
>
> @@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   return
>   }
>
> -@@ -2653,7 +2683,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> +@@ -2700,7 +2730,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
>
>   func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
>   p := a.Package
> @@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   if err != nil {
>   return nil, nil, err
>   }
> -@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str
> +@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
>
>   // Run SWIG on one SWIG input file.
>   func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
> @@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   if err != nil {
>   return "", "", err
>   }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> similarity index 78%
> rename from meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> rename to meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> index 662c705471..e5d0ee90e2 100644
> --- a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> @@ -1,7 +1,8 @@
> -From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001
> +From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:15:37 +0430
> -Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the environment
> +Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> + environment
>
>  to allow for split host/target build roots
>
> @@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   src/cmd/go/internal/cfg/cfg.go | 6 +++++-
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index bec17696f3..d82f612e75 100644
>  --- a/src/cmd/dist/build.go
>  +++ b/src/cmd/dist/build.go
> -@@ -246,7 +246,9 @@ func xinit() {
> - workdir = xworkdir()
> +@@ -248,7 +248,9 @@ func xinit() {
> + }
>   xatexit(rmworkdir)
>
>  - tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> @@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   }
>
>   // compilerEnv returns a map from "goos/goarch" to the
> +diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
> +index 57a3c1ff6f..825d8c70f2 100644
>  --- a/src/cmd/go/internal/cfg/cfg.go
>  +++ b/src/cmd/go/internal/cfg/cfg.go
> -@@ -64,7 +64,11 @@ func defaultContext() build.Context {
> +@@ -67,7 +67,11 @@ func defaultContext() build.Context {
>   // variables. This matches the initialization of ToolDir in
>   // go/build, except for using ctxt.GOROOT rather than
>   // runtime.GOROOT.
> @@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   }
>
>   ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> similarity index 78%
> rename from meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> rename to meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> index cd875f1164..bc5cabeca0 100644
> --- a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> @@ -1,4 +1,4 @@
> -From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001
> +From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:16:32 +0430
>  Subject: [PATCH 4/9] ld: add soname to shareable objects
> @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   src/cmd/link/internal/ld/lib.go | 3 +++
>   1 file changed, 3 insertions(+)
>
> +diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
> +index 644faeb2fb..5b7e48636e 100644
>  --- a/src/cmd/link/internal/ld/lib.go
>  +++ b/src/cmd/link/internal/ld/lib.go
> -@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {
>   argv = append(argv, "-Wl,-z,relro")
>   }
>   argv = append(argv, "-shared")
> @@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   if ctxt.HeadType == objabi.Hwindows {
>   if *flagAslr {
>   argv = addASLRargs(argv)
> -@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {
>   argv = append(argv, "-Wl,-z,relro")
>   }
>   argv = append(argv, "-shared")
> @@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   case BuildModePlugin:
>   if ctxt.HeadType == objabi.Hdarwin {
>   argv = append(argv, "-dynamiclib")
> -@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {
>   argv = append(argv, "-Wl,-z,relro")
>   }
>   argv = append(argv, "-shared")
> @@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   }
>   }
>
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> similarity index 76%
> rename from meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> rename to meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> index 59c12d9546..a7d9932f4d 100644
> --- a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> @@ -1,4 +1,4 @@
> -From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001
> +From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:17:16 +0430
>  Subject: [PATCH 5/9] make.bash: override CC when building dist and
> @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   src/make.bash | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> +diff --git a/src/make.bash b/src/make.bash
> +index 7986125a06..dd67029700 100755
>  --- a/src/make.bash
>  +++ b/src/make.bash
> -@@ -178,7 +178,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
> +@@ -181,7 +181,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
>   exit 1
>   fi
>   rm -f cmd/dist/dist
> @@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>
>   # -e doesn't propagate out of eval, so check success by hand.
>   eval $(./cmd/dist/dist env -p || echo FAIL=true)
> -@@ -209,7 +209,7 @@ fi
> +@@ -206,7 +206,7 @@ fi
>   # Run dist bootstrap to complete make.bash.
>   # Bootstrap installs a proper cmd/dist, built with the new toolchain.
>   # Throw ours, built with Go 1.4, away after bootstrap.
> --./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> -+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> +-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
> ++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
>   rm -f ./cmd/dist/dist
>
>   # DO NOT ADD ANY NEW CODE HERE.
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> similarity index 90%
> rename from meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> rename to meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> index 7aee0bac43..e92cc9b28b 100644
> --- a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> @@ -1,4 +1,4 @@
> -From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001
> +From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:18:12 +0430
>  Subject: [PATCH 6/9] cmd/dist: separate host and target builds
> @@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
>   1 file changed, 112 insertions(+), 43 deletions(-)
>
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index d82f612e75..af24e01198 100644
>  --- a/src/cmd/dist/build.go
>  +++ b/src/cmd/dist/build.go
> -@@ -41,6 +41,7 @@ var (
> - goldflags        string
> +@@ -43,6 +43,7 @@ var (
> + goexperiment     string
>   workdir          string
>   tooldir          string
>  + build_tooldir    string
>   oldgoos          string
>   oldgoarch        string
>   exe              string
> -@@ -53,6 +54,7 @@ var (
> +@@ -55,6 +56,7 @@ var (
>
>   rebuildall   bool
>   defaultclang bool
> @@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>
>   vflag int // verbosity
>   )
> -@@ -249,6 +251,8 @@ func xinit() {
> +@@ -251,6 +253,8 @@ func xinit() {
>   if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
>   tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
>   }
> @@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   }
>
>   // compilerEnv returns a map from "goos/goarch" to the
> -@@ -480,8 +484,10 @@ func setup() {
> +@@ -496,8 +500,10 @@ func setup() {
>   p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
>   if rebuildall {
>   xremoveall(p)
> @@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>
>   if goos != gohostos || goarch != gohostarch {
>   p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
> -@@ -1244,12 +1250,29 @@ func cmdbootstrap() {
> +@@ -1266,13 +1272,30 @@ func cmdbootstrap() {
> + defer timelog("end", "dist bootstrap")
>
> - var noBanner bool
> - var debug bool
> + var noBanner, noClean bool
>  + var hostOnly bool
>  + var targetOnly bool
>  + var toBuild = []string{"std", "cmd"}
> -+
> + var debug bool
>   flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
>   flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
>   flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
> + flag.BoolVar(&noClean, "no-clean", noClean, "print deprecation warning")
>  + flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
>  + flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only target binaries, not host")
>
>  - xflagparse(0)
>  + xflagparse(-1)
> -
> ++
>  + if hostOnly && targetOnly {
>  + fatalf("specify only one of --host-only or --target-only\n")
>  + }
> @@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>  + fatalf("package names not permitted without --host-only or --target-only\n")
>  + }
>  + }
> - // Set GOPATH to an internal directory. We shouldn't actually
> - // need to store files here, since the toolchain won't
> - // depend on modules outside of vendor directories, but if
> -@@ -1303,8 +1326,13 @@ func cmdbootstrap() {
> +
> + if noClean {
> + xprintf("warning: --no-clean is deprecated and has no effect; use 'go install std cmd' instead\n")
> +@@ -1345,8 +1368,13 @@ func cmdbootstrap() {
>   xprintf("\n")
>   }
>
> @@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   goBootstrap := pathf("%s/go_bootstrap", tooldir)
>   cmdGo := pathf("%s/go", gobin)
>   if debug {
> -@@ -1333,7 +1361,11 @@ func cmdbootstrap() {
> +@@ -1375,7 +1403,11 @@ func cmdbootstrap() {
>   xprintf("\n")
>   }
>   xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
> @@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>  + } else {
>  + os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
>  + }
> + // Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
> + os.Setenv("GOEXPERIMENT", goexperiment)
>   goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> - if debug {
> - run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> -@@ -1370,50 +1402,84 @@ func cmdbootstrap() {
> +@@ -1414,50 +1446,84 @@ func cmdbootstrap() {
>   }
>   checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
>
> @@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>  - timelog("build", "host toolchain")
>  - if vflag > 0 {
>  - xprintf("\n")
> +- }
> +- xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
>  +
>  + if goos == oldgoos && goarch == oldgoarch {
>  + // Common case - not setting up for cross-compilation.
> @@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>  + os.Setenv("GOARCH", goarch)
>  + os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
>  + xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
> - }
> -- xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
> ++ }
>   goInstall(goBootstrap, "std", "cmd")
>   checkNotStale(goBootstrap, "std", "cmd")
>   checkNotStale(cmdGo, "std", "cmd")
> @@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>  - timelog("build", "target toolchain")
>  - if vflag > 0 {
>  - xprintf("\n")
> -- }
> ++ if debug {
> ++ run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> ++ run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> ++ checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
> ++ copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
> + }
>  - goos = oldgoos
>  - goarch = oldgoarch
>  - os.Setenv("GOOS", goos)
> @@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>  - run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
>  - checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
>  - copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
> -+ if debug {
> -+ run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> -+ run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> -+ checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
> -+ copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
> -+ }
>   }
>
>   // Check that there are no new files in $GOROOT/bin other than
> -@@ -1430,8 +1496,11 @@ func cmdbootstrap() {
> +@@ -1474,8 +1540,11 @@ func cmdbootstrap() {
>   }
>   }
>
> @@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>
>   if goos == "android" {
>   // Make sure the exec wrapper will sync a fresh $GOROOT to the device.
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> similarity index 78%
> rename from meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> rename to meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> index 4b4d0d4f3d..d522512699 100644
> --- a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> @@ -1,4 +1,4 @@
> -From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001
> +From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:18:56 +0430
>  Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
> @@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
>   3 files changed, 34 insertions(+)
>
> +diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
> +index 69940cb001..b0c1667def 100644
>  --- a/src/cmd/go/internal/work/action.go
>  +++ b/src/cmd/go/internal/work/action.go
> -@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
> +@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
>   if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
>   continue
>   }
> @@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   haveShlib[filepath.Base(p1.Shlib)] = true
>   // TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
>   // we'll end up building an overall library or executable that depends at runtime
> +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
> +index 0ed2389cd5..c3f8a82880 100644
>  --- a/src/cmd/go/internal/work/build.go
>  +++ b/src/cmd/go/internal/work/build.go
> -@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
> +@@ -189,6 +189,8 @@ See also: go install, go get, go clean.
>
>   const concurrentGCBackendCompilationEnabledByDefault = true
>
> @@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   func init() {
>   // break init cycle
>   CmdBuild.Run = runBuild
> -@@ -179,6 +181,10 @@ func init() {
> +@@ -201,6 +203,10 @@ func init() {
>
>   AddBuildFlags(CmdBuild, DefaultBuildFlags)
>   AddBuildFlags(CmdInstall, DefaultBuildFlags)
> @@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   }
>
>   // Note that flags consulted by other parts of the code
> +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
> +index a37872e7c7..f4e83b97e2 100644
>  --- a/src/cmd/go/internal/work/exec.go
>  +++ b/src/cmd/go/internal/work/exec.go
> -@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
> +@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
>   return errors.New("binary-only packages are no longer supported")
>   }
>
> @@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   if err := b.Mkdir(a.Objdir); err != nil {
>   return err
>   }
> -@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
> +@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
>   return err
>   }
>
> @@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   if err := b.Mkdir(a.Objdir); err != nil {
>   return err
>   }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> similarity index 84%
> rename from meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> rename to meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> index 4e5d5021d6..9a1bce809c 100644
> --- a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> @@ -1,4 +1,4 @@
> -From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001
> +From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:19:26 +0430
>  Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
> @@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   src/cmd/go/internal/work/build.go | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
> +index c3f8a82880..23d1aa4836 100644
>  --- a/src/cmd/go/internal/work/build.go
>  +++ b/src/cmd/go/internal/work/build.go
> -@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
> +@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, mask BuildFlagMask) {
>
>   cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
>   cmd.Flag.Var(buildCompiler{}, "compiler", "")
> @@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
>   cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
>   cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
>   if mask&OmitModFlag == 0 {
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> similarity index 75%
> rename from meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> rename to meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> index dcbdf58752..f8bd491f93 100644
> --- a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> +++ b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> @@ -1,7 +1,7 @@
> -From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00 2001
> +From c5f3c1aa77753254586c0c8a6893862ae97eabe1 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 22 Feb 2021 17:54:01 -0800
> -Subject: [PATCH] Revert "cmd/go: make sure CC and CXX are absolute"
> +Subject: [PATCH 9/9] Revert "cmd/go: make sure CC and CXX are absolute"
>
>  OE uses CC/CXX values which consists of cmpiler and options together,
>  secondly, the environment is canned so this check add little value to OE
> @@ -16,47 +16,44 @@ This reverts commit aa161e799df7e1eba99d2be10271e76b6f758142.
>  Upstream-Status: Inappropriate [OE-Specific]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> - src/cmd/go/internal/envcmd/env.go        |  5 -----
> + src/cmd/go/internal/envcmd/env.go        |  2 +-
>   src/cmd/go/internal/work/init.go         |  7 -------
>   src/cmd/go/testdata/script/env_write.txt | 24 ------------------------
> - 3 files changed, 36 deletions(-)
> + 3 files changed, 1 insertion(+), 32 deletions(-)
>
>  diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
> -index 6937187522..29f9057c3f 100644
> +index ff6f0d810a..ca0494b5d4 100644
>  --- a/src/cmd/go/internal/envcmd/env.go
>  +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {
> - if !filepath.IsAbs(val) && val != "" {
> +@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) error {
>   return fmt.Errorf("GOPATH entry is relative; must be absolute path: %q", val)
>   }
> -- // Make sure CC and CXX are absolute paths
> -- case "CC", "CXX":
> -- if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
> -- return fmt.Errorf("%s entry is relative; must be absolute path: %q", key, val)
> -- }
> - }
> -
> - if !utf8.ValidString(val) {
> + // Make sure CC and CXX are absolute paths
> +- case "CC", "CXX", "GOMODCACHE":
> ++ case "GOMODCACHE":
> + if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
> + return fmt.Errorf("%s entry is relative; must be absolute path: %q", key, val)
> + }
>  diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/internal/work/init.go
> -index ba7c7c2fbb..3a6df5f758 100644
> +index 37a3e2d0ff..e529cc2917 100644
>  --- a/src/cmd/go/internal/work/init.go
>  +++ b/src/cmd/go/internal/work/init.go
> -@@ -41,13 +41,6 @@ func BuildInit() {
> +@@ -38,13 +38,6 @@ func BuildInit() {
> + }
>   cfg.BuildPkgdir = p
>   }
> -
> +-
>  - // Make sure CC and CXX are absolute paths
>  - for _, key := range []string{"CC", "CXX"} {
>  - if path := cfg.Getenv(key); !filepath.IsAbs(path) && path != "" && path != filepath.Base(path) {
>  - base.Fatalf("go %s: %s environment variable is relative; must be absolute path: %s\n", flag.Args()[0], key, path)
>  - }
>  - }
> --
> - // For each experiment that has been enabled in the toolchain, define a
> - // build tag with the same name but prefixed by "goexperiment." which can be
> - // used for compiling alternative files for the experiment. This allows
> + }
> +
> + func instrumentInit() {
>  diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/go/testdata/script/env_write.txt
> -index bda1e57826..c99aadb7f2 100644
> +index b5e9739167..566c876658 100644
>  --- a/src/cmd/go/testdata/script/env_write.txt
>  +++ b/src/cmd/go/testdata/script/env_write.txt
>  @@ -129,30 +129,6 @@ go env -w GOTMPDIR=
> @@ -91,5 +88,5 @@ index bda1e57826..c99aadb7f2 100644
>   env GOOS=
>   env GOARCH=
>  --
> -2.30.1
> +2.25.1
>
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.17.bb
> index b3e2b6a60e..2b3db17d3b 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>  PROVIDES = "go-native"
>
>  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> -SRC_URI[go_linux_amd64.sha256sum] = "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
> -SRC_URI[go_linux_arm64.sha256sum] = "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
> +SRC_URI[go_linux_amd64.sha256sum] = "6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d"
> +SRC_URI[go_linux_arm64.sha256sum] = "01a9af009ada22122d3fcb9816049c1d21842524b38ef5d5a0e2ee4b26d7c3e7"
>
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb b/meta/recipes-devtools/go/go-cross_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
> rename to meta/recipes-devtools/go/go-cross_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb b/meta/recipes-devtools/go/go-native_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.16.5.bb
> rename to meta/recipes-devtools/go/go-native_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb b/meta/recipes-devtools/go/go-runtime_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
> rename to meta/recipes-devtools/go/go-runtime_1.17.bb
> diff --git a/meta/recipes-devtools/go/go_1.16.5.bb b/meta/recipes-devtools/go/go_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.16.5.bb
> rename to meta/recipes-devtools/go/go_1.17.bb
>
>
>
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
