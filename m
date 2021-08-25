Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web11.19848.1629917931772130892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 11:58:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rm2oOjlb;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id t4so274914vsm.5
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 11:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=St0bOYwb9gVtmVG5SO87a6lZCQWqY6BeKoSy2qxCnbs=;
        b=rm2oOjlbewZ15X3Kg2OlsR8N3gvh8PAwMXKZ6PFqCxtfL0mUmlYakZdcuIPCGZIYRr
         nL8NrIeD+K4JxvH5/2zyVuu8a44VinOM0h92z6783iOe2PMxDczdUIo+nECelVA1YLnM
         mQKe8WDtDrPE4vqyhQxINUkSpK4rc5XXxoJSzgiZ03t1qsqv/eWjqZ5fLexnFd5LBZIb
         IumudNNng3rvhWIX9bSklJgVeuIvdYJvDNRjl867RN/7IQO47p0Zjc/PjJJWNXSBFNYu
         Di5FVs1oxgd64LW/ZdF7N21xl2xcIDBvwocZ2zDuN4hUJLeK7ASKE14tP3pi0GNgFgMG
         StFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=St0bOYwb9gVtmVG5SO87a6lZCQWqY6BeKoSy2qxCnbs=;
        b=rF1BMo56sma+ZV1QZZdYQk4i6ntoX2P8Ne14cneFCZAxoYhI5QTejXZ79/smTuXAi7
         flyOniyVsu9CpvDsaGFZXoPbmS84Ixv7lUC23LruYkpDZ0hzeiCrCP3x/Fi85axum0oB
         6PlG0ea0lmNk5Z9fpJBMp9Eeff1Y32RSNX+YQq2QKEhT3QMO3FImypZ8XQAOH70GQKxy
         4PznaNqF+YCuLUtBkq66+PC1i9p8LEzb8eczghXBxUWgDIMWMILj9APE28X4uzigPwAN
         sCu4eooaF8ldr5ZHjfgbuabYTVrn6ipe9N0ueAnwkxEHAJf3Dq35qRF/yLBCI2DMn5rX
         2kHg==
X-Gm-Message-State: AOAM530EKxGd6VKAI08xQDaZNkxu4xlDM1E77aAauVWCz2gC+B0Ty1rv
	Vwiyyb1EOkQDXprX235Q2/TEqTlJ0oDUR0rvntY=
X-Google-Smtp-Source: ABdhPJytOfGnCWODBDVi332p7lgRnB+RwLM16d3zWNJpHbAnhHf9LWv5+hqXhGo65LC+NIFIZ5qiScANtjzi/vGJO2M=
X-Received: by 2002:a67:f502:: with SMTP id u2mr32887073vsn.51.1629917930499;
 Wed, 25 Aug 2021 11:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <169E9C6226DE3CC6.18091@lists.openembedded.org>
 <32b22790-eac9-9e8d-ab6c-661bb77e2fac@windriver.com> <CADkTA4M4O5kkPv2zhosT1XQZrtWXe0=arT=zPH4eTxd=WtVZpA@mail.gmail.com>
In-Reply-To: <CADkTA4M4O5kkPv2zhosT1XQZrtWXe0=arT=zPH4eTxd=WtVZpA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 25 Aug 2021 20:58:38 +0200
Message-ID: <CANNYZj9dsOkd5w7n4o8oox732VNZMmR6FunbOn_R3=y0X4qHfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: upgrade to 1.17 release
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Sakib Sajal <sakib.sajal@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000042b17305ca66d741"

--00000000000042b17305ca66d741
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Aug 2021 at 19:45, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> >
> > bitbake core-image-full-cmdline && bitbake core-image-full-cmdline -c
> testimage
> >
> > Result:
> >
> > World build passes without warnings/errors.
> >
> > All image tests passed
>
> But do any of those test images have anything more than go ptests ?
> They didn't last time I checked.
>

But Bruce, it is not reasonable to ask for testing with anything else than
oe-core, especially if the submitter has no idea what layers exactly that
would be, and what kind of testing is supposed to be performed with them.
If oe-core has testing gaps, then the gaps should be addressed, otherwise I
think it's on you to cherry-pick the proposed update into your builds and
run the tests you may have with all those other layers.

That said, I agree that it's a bit late to place this into oe-core now, and
it's best to stash this until the start of the next cycle.

Alex


>
> Bruce
>
> >
> > Sakib
> >
> > On 2021-08-25 1:20 p.m., Sakib Sajal wrote:
> >
> > go 1.17 includes small enhancements to the language.
> > Release notes: https://golang.org/doc/go1.17
> >
> > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >  .../go/{go-1.16.5.inc => go-1.17.inc}         |  6 +-
> >  ...ow-CC-and-CXX-to-have-multiple-words.patch | 10 ++-
> >  ...ent-based-hash-generation-less-pedan.patch | 62 +++++++++++-------
> >  ...-to-be-overridden-in-the-environment.patch | 18 ++++--
> >  ...4-ld-add-soname-to-shareable-objects.patch | 13 ++--
> >  ...de-CC-when-building-dist-and-go_boot.patch | 15 +++--
> >  ...dist-separate-host-and-target-builds.patch | 64 ++++++++++---------
> >  ...d-go-make-GOROOT-precious-by-default.patch | 21 ++++--
> >  ...008-use-GOBUILDMODE-to-set-buildmode.patch |  9 ++-
> >  ...go-make-sure-CC-and-CXX-are-absolute.patch | 45 ++++++-------
> >  ...ive_1.16.5.bb => go-binary-native_1.17.bb} |  4 +-
> >  ...an_1.16.5.bb => go-cross-canadian_1.17.bb} |  0
> >  .../{go-cross_1.16.5.bb => go-cross_1.17.bb}  |  0
> >  ...crosssdk_1.16.5.bb => go-crosssdk_1.17.bb} |  0
> >  ...{go-native_1.16.5.bb => go-native_1.17.bb} |  0
> >  ...o-runtime_1.16.5.bb => go-runtime_1.17.bb} |  0
> >  .../go/{go_1.16.5.bb => go_1.17.bb}           |  0
> >  18 files changed, 163 insertions(+), 106 deletions(-)
> >  rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.17.inc} (85%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (80%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> (80%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> (78%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0004-ld-add-soname-to-shareable-objects.patch (78%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> (76%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0006-cmd-dist-separate-host-and-target-builds.patch (90%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0007-cmd-go-make-GOROOT-precious-by-default.patch (78%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0008-use-GOBUILDMODE-to-set-buildmode.patch (84%)
> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)
> >  rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb =>
> go-binary-native_1.17.bb} (83%)
> >  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb =>
> go-cross-canadian_1.17.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-cross_1.16.5.bb => go-cross_1.17.bb}
> (100%)
> >  rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb =>
> go-crosssdk_1.17.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-native_1.16.5.bb =>
> go-native_1.17.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb =>
> go-runtime_1.17.bb} (100%)
> >  rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.17.bb} (100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > index 47f23f5c39..5b8a532943 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -23,7 +23,7 @@ GDBVERSION ?= "10.%"
> >  GLIBCVERSION ?= "2.34"
> >  LINUXLIBCVERSION ?= "5.13%"
> >  QEMUVERSION ?= "6.0%"
> > -GOVERSION ?= "1.16%"
> > +GOVERSION ?= "1.17%"
> >  # This can not use wildcards like 8.0.% since it is also used in mesa
> to denote
> >  # llvm version being used, so always bump it with llvm recipe version
> bump
> >  LLVMVERSION ?= "12.0.1"
> > diff --git a/meta/recipes-devtools/go/go-1.16.5.inc
> b/meta/recipes-devtools/go/go-1.17.inc
> > similarity index 85%
> > rename from meta/recipes-devtools/go/go-1.16.5.inc
> > rename to meta/recipes-devtools/go/go-1.17.inc
> > index 545aa0c828..6b412afe25 100644
> > --- a/meta/recipes-devtools/go/go-1.16.5.inc
> > +++ b/meta/recipes-devtools/go/go-1.17.inc
> > @@ -1,7 +1,7 @@
> >  require go-common.inc
> >
> > -GO_BASEVERSION = "1.16"
> > -PV = "1.16.5"
> > +GO_BASEVERSION = "1.17"
> > +PV = "1.17"
> >  FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> >
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> > @@ -17,4 +17,4 @@ SRC_URI += "\
> >      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> >      file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
> >  "
> > -SRC_URI[main.sha256sum] =
> "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
> > +SRC_URI[main.sha256sum] =
> "3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d"
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> > similarity index 80%
> > rename from
> meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> > index 5f4823be22..8a833e05d3 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> > @@ -1,4 +1,4 @@
> > -From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001
> > +From 0e964d3ca3496beb4f3732abe501b50e262b6646 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:01:13 +0430
> >  Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
> > @@ -10,14 +10,15 @@ the meta/recipes-devtools/go tree by
> >  Matt Madison <matt@madison.systems>.
> >
> >  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> > -
> >  ---
> >   src/cmd/go/internal/envcmd/env.go | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> > +index 1553d26391..20d0587899 100644
> >  --- a/src/cmd/go/internal/envcmd/env.go
> >  +++ b/src/cmd/go/internal/envcmd/env.go
> > -@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
> > +@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {
> >
> >   cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> >   if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
> > @@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   }
> >   env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
> >   env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > similarity index 80%
> > rename from
> meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > index 04d0e496c0..b78b6afa24 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > @@ -1,4 +1,4 @@
> > -From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001
> > +From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:14:22 +0430
> >  Subject: [PATCH 2/9] cmd/go: make content-based hash generation less
> pedantic
> > @@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
> >   2 files changed, 49 insertions(+), 19 deletions(-)
> >
> > +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> > +index 20d0587899..ff6f0d810a 100644
> >  --- a/src/cmd/go/internal/envcmd/env.go
> >  +++ b/src/cmd/go/internal/envcmd/env.go
> > -@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> > +@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> >   func ExtraEnvVarsCostly() []cfg.EnvVar {
> >   var b work.Builder
> >   b.Init()
> > @@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   if err != nil {
> >   // Should not happen - b.CFlags was given an empty package.
> >   fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> > +diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> > +index 5a225fb9f1..a37872e7c7 100644
> >  --- a/src/cmd/go/internal/work/exec.go
> >  +++ b/src/cmd/go/internal/work/exec.go
> > -@@ -37,6 +37,8 @@ import (
> > +@@ -38,6 +38,8 @@ import (
> >   "cmd/go/internal/trace"
> >   )
> >
> > @@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   // actionList returns the list of actions in the dag rooted at root
> >   // as visited in a depth-first post-order traversal.
> >   func actionList(root *Action) []*Action {
> > -@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio
> > +@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >   // Assume b.WorkDir is being trimmed properly.
> >   // When -trimpath is used with a package built from the module cache,
> >   // use the module path and version instead of the directory.
> > @@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   fmt.Fprintf(h, "dir %s\n", p.Dir)
> >   } else if cfg.BuildTrimpath && p.Module != nil {
> >   fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
> > -@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio
> > +@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >   }
> > - if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> > + if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
> >   fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> >  - cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
> > -- fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags,
> ldflags)
> >  + cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
> > -+ fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags, cflags,
> ldflags)
> > - if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> > -- fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> > -+ fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
> > +
> > +- ccExe := b.ccExe()
> > ++ ccExe := b.ccExe(true)
> > + fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
> > + // Include the C compiler tool ID so that if the C
> > + // compiler changes we rebuild the package.
> > +@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> > + }
> >   }
> > - if len(p.FFiles) > 0 {
> > -- fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> > -+ fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> > + if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> > +- cxxExe := b.cxxExe()
> > ++ cxxExe := b.cxxExe(true)
> > + fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
> > + if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
> > + fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> > + }
> >   }
> > - // TODO(rsc): Should we include the SWIG version or
> Fortran/GCC/G++/Objective-C compiler versions?
> > - }
> > -@@ -2401,33 +2403,48 @@ var (
> > + if len(p.FFiles) > 0 {
> > +- fcExe := b.fcExe()
> > ++ fcExe := b.fcExe(true)
> > + fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
> > + if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
> > + fmt.Fprintf(h, "FC ID=%q\n", fcID)
> > +@@ -2438,33 +2440,48 @@ var (
> >   // gccCmd returns a gcc command line prefix
> >   // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> >   func (b *Builder) GccCmd(incdir, workdir string) []string {
> > @@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   }
> >
> >   // compilerExe returns the compiler to use given an
> > -@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {
> > +@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
> >   // of the compiler but can have additional arguments if they
> >   // were present in the environment value.
> >   // For example if CC="gcc -DGOPHER" then the result is ["gcc",
> "-DGOPHER"].
> > @@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   return compiler
> >   }
> >
> > -@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {
> > +@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
> >   }
> >
> >   // CFlags returns the flags to use when invoking the C, C++ or Fortran
> compilers, or cgo.
> > @@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   defaults := "-g -O2"
> >
> >   if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS,
> checkCompilerFlags); err != nil {
> > -@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package
> > +@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> >   return
> >   }
> >
> > @@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   return
> >   }
> >
> > -@@ -2653,7 +2683,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> > +@@ -2700,7 +2730,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> >
> >   func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo,
> outObj []string, err error) {
> >   p := a.Package
> > @@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   if err != nil {
> >   return nil, nil, err
> >   }
> > -@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str
> > +@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> >
> >   // Run SWIG on one SWIG input file.
> >   func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir
> string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string,
> err error) {
> > @@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   if err != nil {
> >   return "", "", err
> >   }
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > similarity index 78%
> > rename from
> meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > index 662c705471..e5d0ee90e2 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > @@ -1,7 +1,8 @@
> > -From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001
> > +From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:15:37 +0430
> > -Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> environment
> > +Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> > + environment
> >
> >  to allow for split host/target build roots
> >
> > @@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   src/cmd/go/internal/cfg/cfg.go | 6 +++++-
> >   2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> > +index bec17696f3..d82f612e75 100644
> >  --- a/src/cmd/dist/build.go
> >  +++ b/src/cmd/dist/build.go
> > -@@ -246,7 +246,9 @@ func xinit() {
> > - workdir = xworkdir()
> > +@@ -248,7 +248,9 @@ func xinit() {
> > + }
> >   xatexit(rmworkdir)
> >
> >  - tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> > @@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   }
> >
> >   // compilerEnv returns a map from "goos/goarch" to the
> > +diff --git a/src/cmd/go/internal/cfg/cfg.go
> b/src/cmd/go/internal/cfg/cfg.go
> > +index 57a3c1ff6f..825d8c70f2 100644
> >  --- a/src/cmd/go/internal/cfg/cfg.go
> >  +++ b/src/cmd/go/internal/cfg/cfg.go
> > -@@ -64,7 +64,11 @@ func defaultContext() build.Context {
> > +@@ -67,7 +67,11 @@ func defaultContext() build.Context {
> >   // variables. This matches the initialization of ToolDir in
> >   // go/build, except for using ctxt.GOROOT rather than
> >   // runtime.GOROOT.
> > @@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   }
> >
> >   ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> > similarity index 78%
> > rename from
> meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> > index cd875f1164..bc5cabeca0 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> > @@ -1,4 +1,4 @@
> > -From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001
> > +From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:16:32 +0430
> >  Subject: [PATCH 4/9] ld: add soname to shareable objects
> > @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   src/cmd/link/internal/ld/lib.go | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > +diff --git a/src/cmd/link/internal/ld/lib.go
> b/src/cmd/link/internal/ld/lib.go
> > +index 644faeb2fb..5b7e48636e 100644
> >  --- a/src/cmd/link/internal/ld/lib.go
> >  +++ b/src/cmd/link/internal/ld/lib.go
> > -@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
> > +@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {
> >   argv = append(argv, "-Wl,-z,relro")
> >   }
> >   argv = append(argv, "-shared")
> > @@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   if ctxt.HeadType == objabi.Hwindows {
> >   if *flagAslr {
> >   argv = addASLRargs(argv)
> > -@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
> > +@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {
> >   argv = append(argv, "-Wl,-z,relro")
> >   }
> >   argv = append(argv, "-shared")
> > @@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   case BuildModePlugin:
> >   if ctxt.HeadType == objabi.Hdarwin {
> >   argv = append(argv, "-dynamiclib")
> > -@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
> > +@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {
> >   argv = append(argv, "-Wl,-z,relro")
> >   }
> >   argv = append(argv, "-shared")
> > @@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   }
> >   }
> >
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > similarity index 76%
> > rename from
> meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > index 59c12d9546..a7d9932f4d 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > @@ -1,4 +1,4 @@
> > -From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001
> > +From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:17:16 +0430
> >  Subject: [PATCH 5/9] make.bash: override CC when building dist and
> > @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   src/make.bash | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > +diff --git a/src/make.bash b/src/make.bash
> > +index 7986125a06..dd67029700 100755
> >  --- a/src/make.bash
> >  +++ b/src/make.bash
> > -@@ -178,7 +178,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
> > +@@ -181,7 +181,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> >   exit 1
> >   fi
> >   rm -f cmd/dist/dist
> > @@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >
> >   # -e doesn't propagate out of eval, so check success by hand.
> >   eval $(./cmd/dist/dist env -p || echo FAIL=true)
> > -@@ -209,7 +209,7 @@ fi
> > +@@ -206,7 +206,7 @@ fi
> >   # Run dist bootstrap to complete make.bash.
> >   # Bootstrap installs a proper cmd/dist, built with the new toolchain.
> >   # Throw ours, built with Go 1.4, away after bootstrap.
> > --./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> > -+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag
> $GO_DISTFLAGS "$@"
> > +-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
> > ++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap -a $vflag
> $GO_DISTFLAGS "$@"
> >   rm -f ./cmd/dist/dist
> >
> >   # DO NOT ADD ANY NEW CODE HERE.
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> > similarity index 90%
> > rename from
> meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> > index 7aee0bac43..e92cc9b28b 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> > @@ -1,4 +1,4 @@
> > -From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001
> > +From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:18:12 +0430
> >  Subject: [PATCH 6/9] cmd/dist: separate host and target builds
> > @@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
> >   1 file changed, 112 insertions(+), 43 deletions(-)
> >
> > +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> > +index d82f612e75..af24e01198 100644
> >  --- a/src/cmd/dist/build.go
> >  +++ b/src/cmd/dist/build.go
> > -@@ -41,6 +41,7 @@ var (
> > - goldflags        string
> > +@@ -43,6 +43,7 @@ var (
> > + goexperiment     string
> >   workdir          string
> >   tooldir          string
> >  + build_tooldir    string
> >   oldgoos          string
> >   oldgoarch        string
> >   exe              string
> > -@@ -53,6 +54,7 @@ var (
> > +@@ -55,6 +56,7 @@ var (
> >
> >   rebuildall   bool
> >   defaultclang bool
> > @@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >
> >   vflag int // verbosity
> >   )
> > -@@ -249,6 +251,8 @@ func xinit() {
> > +@@ -251,6 +253,8 @@ func xinit() {
> >   if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> >   tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> >   }
> > @@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   }
> >
> >   // compilerEnv returns a map from "goos/goarch" to the
> > -@@ -480,8 +484,10 @@ func setup() {
> > +@@ -496,8 +500,10 @@ func setup() {
> >   p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
> >   if rebuildall {
> >   xremoveall(p)
> > @@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >
> >   if goos != gohostos || goarch != gohostarch {
> >   p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
> > -@@ -1244,12 +1250,29 @@ func cmdbootstrap() {
> > +@@ -1266,13 +1272,30 @@ func cmdbootstrap() {
> > + defer timelog("end", "dist bootstrap")
> >
> > - var noBanner bool
> > - var debug bool
> > + var noBanner, noClean bool
> >  + var hostOnly bool
> >  + var targetOnly bool
> >  + var toBuild = []string{"std", "cmd"}
> > -+
> > + var debug bool
> >   flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> >   flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap
> process")
> >   flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
> > + flag.BoolVar(&noClean, "no-clean", noClean, "print deprecation
> warning")
> >  + flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host
> binaries, not target")
> >  + flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only
> target binaries, not host")
> >
> >  - xflagparse(0)
> >  + xflagparse(-1)
> > -
> > ++
> >  + if hostOnly && targetOnly {
> >  + fatalf("specify only one of --host-only or --target-only\n")
> >  + }
> > @@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >  + fatalf("package names not permitted without --host-only or
> --target-only\n")
> >  + }
> >  + }
> > - // Set GOPATH to an internal directory. We shouldn't actually
> > - // need to store files here, since the toolchain won't
> > - // depend on modules outside of vendor directories, but if
> > -@@ -1303,8 +1326,13 @@ func cmdbootstrap() {
> > +
> > + if noClean {
> > + xprintf("warning: --no-clean is deprecated and has no effect; use 'go
> install std cmd' instead\n")
> > +@@ -1345,8 +1368,13 @@ func cmdbootstrap() {
> >   xprintf("\n")
> >   }
> >
> > @@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   goBootstrap := pathf("%s/go_bootstrap", tooldir)
> >   cmdGo := pathf("%s/go", gobin)
> >   if debug {
> > -@@ -1333,7 +1361,11 @@ func cmdbootstrap() {
> > +@@ -1375,7 +1403,11 @@ func cmdbootstrap() {
> >   xprintf("\n")
> >   }
> >   xprintf("Building Go toolchain2 using go_bootstrap and Go
> toolchain1.\n")
> > @@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >  + } else {
> >  + os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> >  + }
> > + // Now that cmd/go is in charge of the build process, enable
> GOEXPERIMENT.
> > + os.Setenv("GOEXPERIMENT", goexperiment)
> >   goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> > - if debug {
> > - run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> > -@@ -1370,50 +1402,84 @@ func cmdbootstrap() {
> > +@@ -1414,50 +1446,84 @@ func cmdbootstrap() {
> >   }
> >   checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> >
> > @@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >  - timelog("build", "host toolchain")
> >  - if vflag > 0 {
> >  - xprintf("\n")
> > +- }
> > +- xprintf("Building packages and commands for host, %s/%s.\n", goos,
> goarch)
> >  +
> >  + if goos == oldgoos && goarch == oldgoarch {
> >  + // Common case - not setting up for cross-compilation.
> > @@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >  + os.Setenv("GOARCH", goarch)
> >  + os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> >  + xprintf("Building packages and commands for target, %s/%s.\n", goos,
> goarch)
> > - }
> > -- xprintf("Building packages and commands for host, %s/%s.\n", goos,
> goarch)
> > ++ }
> >   goInstall(goBootstrap, "std", "cmd")
> >   checkNotStale(goBootstrap, "std", "cmd")
> >   checkNotStale(cmdGo, "std", "cmd")
> > @@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >  - timelog("build", "target toolchain")
> >  - if vflag > 0 {
> >  - xprintf("\n")
> > -- }
> > ++ if debug {
> > ++ run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> > ++ run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir),
> pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> > ++ checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> > ++ copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir),
> writeExec)
> > + }
> >  - goos = oldgoos
> >  - goarch = oldgoarch
> >  - os.Setenv("GOOS", goos)
> > @@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >  - run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir),
> pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> >  - checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> >  - copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir),
> writeExec)
> > -+ if debug {
> > -+ run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
> > -+ run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir),
> pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> > -+ checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> > -+ copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir),
> writeExec)
> > -+ }
> >   }
> >
> >   // Check that there are no new files in $GOROOT/bin other than
> > -@@ -1430,8 +1496,11 @@ func cmdbootstrap() {
> > +@@ -1474,8 +1540,11 @@ func cmdbootstrap() {
> >   }
> >   }
> >
> > @@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >
> >   if goos == "android" {
> >   // Make sure the exec wrapper will sync a fresh $GOROOT to the device.
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > similarity index 78%
> > rename from
> meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > index 4b4d0d4f3d..d522512699 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > @@ -1,4 +1,4 @@
> > -From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001
> > +From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:18:56 +0430
> >  Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
> > @@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
> >   3 files changed, 34 insertions(+)
> >
> > +diff --git a/src/cmd/go/internal/work/action.go
> b/src/cmd/go/internal/work/action.go
> > +index 69940cb001..b0c1667def 100644
> >  --- a/src/cmd/go/internal/work/action.go
> >  +++ b/src/cmd/go/internal/work/action.go
> > -@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
> > +@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1
> *Action, shlib string) {
> >   if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
> >   continue
> >   }
> > @@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   haveShlib[filepath.Base(p1.Shlib)] = true
> >   // TODO(rsc): The use of ModeInstall here is suspect, but if we only
> do ModeBuild,
> >   // we'll end up building an overall library or executable that depends
> at runtime
> > +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> > +index 0ed2389cd5..c3f8a82880 100644
> >  --- a/src/cmd/go/internal/work/build.go
> >  +++ b/src/cmd/go/internal/work/build.go
> > -@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
> > +@@ -189,6 +189,8 @@ See also: go install, go get, go clean.
> >
> >   const concurrentGCBackendCompilationEnabledByDefault = true
> >
> > @@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   func init() {
> >   // break init cycle
> >   CmdBuild.Run = runBuild
> > -@@ -179,6 +181,10 @@ func init() {
> > +@@ -201,6 +203,10 @@ func init() {
> >
> >   AddBuildFlags(CmdBuild, DefaultBuildFlags)
> >   AddBuildFlags(CmdInstall, DefaultBuildFlags)
> > @@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   }
> >
> >   // Note that flags consulted by other parts of the code
> > +diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> > +index a37872e7c7..f4e83b97e2 100644
> >  --- a/src/cmd/go/internal/work/exec.go
> >  +++ b/src/cmd/go/internal/work/exec.go
> > -@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
> > +@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Context, a
> *Action) (err error) {
> >   return errors.New("binary-only packages are no longer supported")
> >   }
> >
> > @@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   if err := b.Mkdir(a.Objdir); err != nil {
> >   return err
> >   }
> > -@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
> > +@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx
> context.Context, a *Action) (err error) {
> >   return err
> >   }
> >
> > @@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   if err := b.Mkdir(a.Objdir); err != nil {
> >   return err
> >   }
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> > similarity index 84%
> > rename from
> meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> > index 4e5d5021d6..9a1bce809c 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> > @@ -1,4 +1,4 @@
> > -From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001
> > +From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:19:26 +0430
> >  Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
> > @@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   src/cmd/go/internal/work/build.go | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> > +index c3f8a82880..23d1aa4836 100644
> >  --- a/src/cmd/go/internal/work/build.go
> >  +++ b/src/cmd/go/internal/work/build.go
> > -@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
> > +@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, mask
> BuildFlagMask) {
> >
> >   cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
> >   cmd.Flag.Var(buildCompiler{}, "compiler", "")
> > @@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
> >   cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
> >   if mask&OmitModFlag == 0 {
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> > similarity index 75%
> > rename from
> meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> > rename to
> meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> > index dcbdf58752..f8bd491f93 100644
> > ---
> a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> > +++
> b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> > @@ -1,7 +1,7 @@
> > -From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00 2001
> > +From c5f3c1aa77753254586c0c8a6893862ae97eabe1 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 22 Feb 2021 17:54:01 -0800
> > -Subject: [PATCH] Revert "cmd/go: make sure CC and CXX are absolute"
> > +Subject: [PATCH 9/9] Revert "cmd/go: make sure CC and CXX are absolute"
> >
> >  OE uses CC/CXX values which consists of cmpiler and options together,
> >  secondly, the environment is canned so this check add little value to OE
> > @@ -16,47 +16,44 @@ This reverts commit
> aa161e799df7e1eba99d2be10271e76b6f758142.
> >  Upstream-Status: Inappropriate [OE-Specific]
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  ---
> > - src/cmd/go/internal/envcmd/env.go        |  5 -----
> > + src/cmd/go/internal/envcmd/env.go        |  2 +-
> >   src/cmd/go/internal/work/init.go         |  7 -------
> >   src/cmd/go/testdata/script/env_write.txt | 24 ------------------------
> > - 3 files changed, 36 deletions(-)
> > + 3 files changed, 1 insertion(+), 32 deletions(-)
> >
> >  diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> > -index 6937187522..29f9057c3f 100644
> > +index ff6f0d810a..ca0494b5d4 100644
> >  --- a/src/cmd/go/internal/envcmd/env.go
> >  +++ b/src/cmd/go/internal/envcmd/env.go
> > -@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {
> > - if !filepath.IsAbs(val) && val != "" {
> > +@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) error {
> >   return fmt.Errorf("GOPATH entry is relative; must be absolute path:
> %q", val)
> >   }
> > -- // Make sure CC and CXX are absolute paths
> > -- case "CC", "CXX":
> > -- if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
> > -- return fmt.Errorf("%s entry is relative; must be absolute path: %q",
> key, val)
> > -- }
> > - }
> > -
> > - if !utf8.ValidString(val) {
> > + // Make sure CC and CXX are absolute paths
> > +- case "CC", "CXX", "GOMODCACHE":
> > ++ case "GOMODCACHE":
> > + if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
> > + return fmt.Errorf("%s entry is relative; must be absolute path: %q",
> key, val)
> > + }
> >  diff --git a/src/cmd/go/internal/work/init.go
> b/src/cmd/go/internal/work/init.go
> > -index ba7c7c2fbb..3a6df5f758 100644
> > +index 37a3e2d0ff..e529cc2917 100644
> >  --- a/src/cmd/go/internal/work/init.go
> >  +++ b/src/cmd/go/internal/work/init.go
> > -@@ -41,13 +41,6 @@ func BuildInit() {
> > +@@ -38,13 +38,6 @@ func BuildInit() {
> > + }
> >   cfg.BuildPkgdir = p
> >   }
> > -
> > +-
> >  - // Make sure CC and CXX are absolute paths
> >  - for _, key := range []string{"CC", "CXX"} {
> >  - if path := cfg.Getenv(key); !filepath.IsAbs(path) && path != "" &&
> path != filepath.Base(path) {
> >  - base.Fatalf("go %s: %s environment variable is relative; must be
> absolute path: %s\n", flag.Args()[0], key, path)
> >  - }
> >  - }
> > --
> > - // For each experiment that has been enabled in the toolchain, define a
> > - // build tag with the same name but prefixed by "goexperiment." which
> can be
> > - // used for compiling alternative files for the experiment. This allows
> > + }
> > +
> > + func instrumentInit() {
> >  diff --git a/src/cmd/go/testdata/script/env_write.txt
> b/src/cmd/go/testdata/script/env_write.txt
> > -index bda1e57826..c99aadb7f2 100644
> > +index b5e9739167..566c876658 100644
> >  --- a/src/cmd/go/testdata/script/env_write.txt
> >  +++ b/src/cmd/go/testdata/script/env_write.txt
> >  @@ -129,30 +129,6 @@ go env -w GOTMPDIR=
> > @@ -91,5 +88,5 @@ index bda1e57826..c99aadb7f2 100644
> >   env GOOS=
> >   env GOARCH=
> >  --
> > -2.30.1
> > +2.25.1
> >
> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> > similarity index 83%
> > rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> > rename to meta/recipes-devtools/go/go-binary-native_1.17.bb
> > index b3e2b6a60e..2b3db17d3b 100644
> > --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> > +++ b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> >  PROVIDES = "go-native"
> >
> >  SRC_URI = "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}
> "
> > -SRC_URI[go_linux_amd64.sha256sum] =
> "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
> > -SRC_URI[go_linux_arm64.sha256sum] =
> "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
> > +SRC_URI[go_linux_amd64.sha256sum] =
> "6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d"
> > +SRC_URI[go_linux_arm64.sha256sum] =
> "01a9af009ada22122d3fcb9816049c1d21842524b38ef5d5a0e2ee4b26d7c3e7"
> >
> >  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
> >  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> > rename to meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> > diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb
> b/meta/recipes-devtools/go/go-cross_1.17.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
> > rename to meta/recipes-devtools/go/go-cross_1.17.bb
> > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.17.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> > rename to meta/recipes-devtools/go/go-crosssdk_1.17.bb
> > diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb
> b/meta/recipes-devtools/go/go-native_1.17.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-native_1.16.5.bb
> > rename to meta/recipes-devtools/go/go-native_1.17.bb
> > diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb
> b/meta/recipes-devtools/go/go-runtime_1.17.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
> > rename to meta/recipes-devtools/go/go-runtime_1.17.bb
> > diff --git a/meta/recipes-devtools/go/go_1.16.5.bb
> b/meta/recipes-devtools/go/go_1.17.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go_1.16.5.bb
> > rename to meta/recipes-devtools/go/go_1.17.bb
> >
> >
> >
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>
>

--00000000000042b17305ca66d741
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 25 Aug 2021 at 19:45, Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">&gt;<br>
&gt; bitbake core-image-full-cmdline &amp;&amp; bitbake core-image-full-cmd=
line -c testimage<br>
&gt;<br>
&gt; Result:<br>
&gt;<br>
&gt; World build passes without warnings/errors.<br>
&gt;<br>
&gt; All image tests passed<br>
<br>
But do any of those test images have anything more than go ptests ?<br>
They didn&#39;t last time I checked.<br></blockquote><div><br></div><div>Bu=
t Bruce, it is not reasonable to ask for testing with anything else than oe=
-core, especially if the submitter has no idea what layers exactly that wou=
ld be, and what kind of testing is supposed to be performed with them. <br>=
</div><div></div><div>If oe-core has testing gaps, then the gaps should be =
addressed, otherwise I think it&#39;s on you to cherry-pick the proposed up=
date into your builds and run the tests you may have with all those other l=
ayers. <br></div><div><br></div><div>That said, I agree that it&#39;s a bit=
 late to place this into oe-core now, and it&#39;s best to stash this until=
 the start of the next cycle.</div><div><br></div><div>Alex<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Sakib<br>
&gt;<br>
&gt; On 2021-08-25 1:20 p.m., Sakib Sajal wrote:<br>
&gt;<br>
&gt; go 1.17 includes small enhancements to the language.<br>
&gt; Release notes: <a href=3D"https://golang.org/doc/go1.17" rel=3D"norefe=
rrer" target=3D"_blank">https://golang.org/doc/go1.17</a><br>
&gt;<br>
&gt; Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver=
.com" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
&gt;=C2=A0 .../go/{go-1.16.5.inc =3D&gt; go-1.17.inc}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt;=C2=A0 ...ow-CC-and-CXX-to-have-multiple-words.patch | 10 ++-<br>
&gt;=C2=A0 ...ent-based-hash-generation-less-pedan.patch | 62 +++++++++++--=
-----<br>
&gt;=C2=A0 ...-to-be-overridden-in-the-environment.patch | 18 ++++--<br>
&gt;=C2=A0 ...4-ld-add-soname-to-shareable-objects.patch | 13 ++--<br>
&gt;=C2=A0 ...de-CC-when-building-dist-and-go_boot.patch | 15 +++--<br>
&gt;=C2=A0 ...dist-separate-host-and-target-builds.patch | 64 ++++++++++---=
------<br>
&gt;=C2=A0 ...d-go-make-GOROOT-precious-by-default.patch | 21 ++++--<br>
&gt;=C2=A0 ...008-use-GOBUILDMODE-to-set-buildmode.patch |=C2=A0 9 ++-<br>
&gt;=C2=A0 ...go-make-sure-CC-and-CXX-are-absolute.patch | 45 ++++++-------=
<br>
&gt;=C2=A0 ...<a href=3D"http://ive_1.16.5.bb" rel=3D"noreferrer" target=3D=
"_blank">ive_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.17.=
bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a>} |=C2=
=A0 4 +-<br>
&gt;=C2=A0 ...<a href=3D"http://an_1.16.5.bb" rel=3D"noreferrer" target=3D"=
_blank">an_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.17.b=
b" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.bb</a>} |=C2=
=A0 0<br>
&gt;=C2=A0 .../{<a href=3D"http://go-cross_1.16.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-cross_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-cross_1=
.17.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.17.bb</a>}=C2=A0 |=
=C2=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://crosssdk_1.16.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">crosssdk_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-crosssdk_=
1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.17.bb</a>} |=C2=
=A0 0<br>
&gt;=C2=A0 ...{<a href=3D"http://go-native_1.16.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-native_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-native=
_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.17.bb</a>} |=C2=
=A0 0<br>
&gt;=C2=A0 ...<a href=3D"http://o-runtime_1.16.5.bb" rel=3D"noreferrer" tar=
get=3D"_blank">o-runtime_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-runtime=
_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.17.bb</a>} |=C2=
=A0 0<br>
&gt;=C2=A0 .../go/{<a href=3D"http://go_1.16.5.bb" rel=3D"noreferrer" targe=
t=3D"_blank">go_1.16.5.bb</a> =3D&gt; <a href=3D"http://go_1.17.bb" rel=3D"=
noreferrer" target=3D"_blank">go_1.17.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 0<br>
&gt;=C2=A0 18 files changed, 163 insertions(+), 106 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16.5.inc =3D&gt; go-1.17.i=
nc} (85%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0001-a=
llow-CC-and-CXX-to-have-multiple-words.patch (80%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0002-c=
md-go-make-content-based-hash-generation-less-pedan.patch (80%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0003-a=
llow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (78%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0004-l=
d-add-soname-to-shareable-objects.patch (78%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0005-m=
ake.bash-override-CC-when-building-dist-and-go_boot.patch (76%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0006-c=
md-dist-separate-host-and-target-builds.patch (90%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0007-c=
md-go-make-GOROOT-precious-by-default.patch (78%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0008-u=
se-GOBUILDMODE-to-set-buildmode.patch (84%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0009-R=
evert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-nat=
ive_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5=
.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.17.bb" rel=3D"noreferr=
er" target=3D"_blank">go-binary-native_1.17.bb</a>} (83%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-cana=
dian_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16=
.5.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.17.bb" rel=3D"noref=
errer" target=3D"_blank">go-cross-canadian_1.17.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.16=
.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a> =3D&gt; =
<a href=3D"http://go-cross_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go=
-cross_1.17.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1=
.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a> =
=3D&gt; <a href=3D"http://go-crosssdk_1.17.bb" rel=3D"noreferrer" target=3D=
"_blank">go-crosssdk_1.17.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-native_1.1=
6.5.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a> =3D&gt=
; <a href=3D"http://go-native_1.17.bb" rel=3D"noreferrer" target=3D"_blank"=
>go-native_1.17.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.=
16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a> =3D&=
gt; <a href=3D"http://go-runtime_1.17.bb" rel=3D"noreferrer" target=3D"_bla=
nk">go-runtime_1.17.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go_1.16.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a> =3D&gt; <a href=3D"h=
ttp://go_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go_1.17.bb</a>} (100=
%)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc<br>
&gt; index 47f23f5c39..5b8a532943 100644<br>
&gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt; @@ -23,7 +23,7 @@ GDBVERSION ?=3D &quot;10.%&quot;<br>
&gt;=C2=A0 GLIBCVERSION ?=3D &quot;2.34&quot;<br>
&gt;=C2=A0 LINUXLIBCVERSION ?=3D &quot;5.13%&quot;<br>
&gt;=C2=A0 QEMUVERSION ?=3D &quot;6.0%&quot;<br>
&gt; -GOVERSION ?=3D &quot;1.16%&quot;<br>
&gt; +GOVERSION ?=3D &quot;1.17%&quot;<br>
&gt;=C2=A0 # This can not use wildcards like 8.0.% since it is also used in=
 mesa to denote<br>
&gt;=C2=A0 # llvm version being used, so always bump it with llvm recipe ve=
rsion bump<br>
&gt;=C2=A0 LLVMVERSION ?=3D &quot;12.0.1&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-dev=
tools/go/go-1.17.inc<br>
&gt; similarity index 85%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16.5.inc<br>
&gt; rename to meta/recipes-devtools/go/go-1.17.inc<br>
&gt; index 545aa0c828..6b412afe25 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16.5.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17.inc<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt;=C2=A0 require go-common.inc<br>
&gt;<br>
&gt; -GO_BASEVERSION =3D &quot;1.16&quot;<br>
&gt; -PV =3D &quot;1.16.5&quot;<br>
&gt; +GO_BASEVERSION =3D &quot;1.17&quot;<br>
&gt; +PV =3D &quot;1.17&quot;<br>
&gt;=C2=A0 FILESEXTRAPATHS:prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_BASEV=
ERSION}:&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b26d2c=
5e4e7b4e0dd74707&quot;<br>
&gt; @@ -17,4 +17,4 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0008-use-GOBUILDMODE-to-set-buildmode.patch=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are=
-absolute.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[main.sha256sum] =3D &quot;7bfa7e5908c7cc9e75da5ddf3066d7cbcf3=
fd9fa51945851325eebc17f50ba80&quot;<br>
&gt; +SRC_URI[main.sha256sum] =3D &quot;3a70e5055509f347c0fb831ca07a2bf3b53=
1068f349b14a3c652e9b5b67beb5d&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to=
-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.17/0001-allow-CC=
-and-CXX-to-have-multiple-words.patch<br>
&gt; similarity index 80%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-=
have-multiple-words.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-ha=
ve-multiple-words.patch<br>
&gt; index 5f4823be22..8a833e05d3 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-m=
ultiple-words.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-m=
ultiple-words.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 0e964d3ca3496beb4f3732abe501b50e262b6646 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:01:13 +0430<br>
&gt;=C2=A0 Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple w=
ords<br>
&gt; @@ -10,14 +10,15 @@ the meta/recipes-devtools/go tree by<br>
&gt;=C2=A0 Matt Madison &lt;matt@madison.systems&gt;.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.=
j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt; -<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/envcmd/env.go | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/=
envcmd/env.go<br>
&gt; +index 1553d26391..20d0587899 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/envcmd/env.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/envcmd/env.go<br>
&gt; -@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {<br>
&gt; +@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)<br>
&gt;=C2=A0 =C2=A0if env :=3D strings.Fields(cfg.Getenv(&quot;CC&quot;)); le=
n(env) &gt; 0 {<br>
&gt; @@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;AR&quot;, Value=
: envOr(&quot;AR&quot;, &quot;ar&quot;)})<br>
&gt;=C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;CC&quot;, Value=
: cc})<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content=
-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.17/=
0002-cmd-go-make-content-based-hash-generation-less-pedan.patch<br>
&gt; similarity index 80%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-=
based-hash-generation-less-pedan.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-ba=
sed-hash-generation-less-pedan.patch<br>
&gt; index 04d0e496c0..b78b6afa24 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-=
hash-generation-less-pedan.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-=
hash-generation-less-pedan.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:14:22 +0430<br>
&gt;=C2=A0 Subject: [PATCH 2/9] cmd/go: make content-based hash generation =
less pedantic<br>
&gt; @@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/work/exec.go=C2=A0 | 66 ++++++++++++++=
++++++++---------<br>
&gt;=C2=A0 =C2=A02 files changed, 49 insertions(+), 19 deletions(-)<br>
&gt;<br>
&gt; +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/=
envcmd/env.go<br>
&gt; +index 20d0587899..ff6f0d810a 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/envcmd/env.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/envcmd/env.go<br>
&gt; -@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {<br>
&gt; +@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {<br>
&gt;=C2=A0 =C2=A0func ExtraEnvVarsCostly() []cfg.EnvVar {<br>
&gt;=C2=A0 =C2=A0var b work.Builder<br>
&gt;=C2=A0 =C2=A0b.Init()<br>
&gt; @@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0if err !=3D nil {<br>
&gt;=C2=A0 =C2=A0// Should not happen - b.CFlags was given an empty package=
.<br>
&gt;=C2=A0 =C2=A0fmt.Fprintf(os.Stderr, &quot;go: invalid cflags: %v\n&quot=
;, err)<br>
&gt; +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/w=
ork/exec.go<br>
&gt; +index 5a225fb9f1..a37872e7c7 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/exec.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/exec.go<br>
&gt; -@@ -37,6 +37,8 @@ import (<br>
&gt; +@@ -38,6 +38,8 @@ import (<br>
&gt;=C2=A0 =C2=A0&quot;cmd/go/internal/trace&quot;<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;<br>
&gt; @@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0// actionList returns the list of actions in the dag roote=
d at root<br>
&gt;=C2=A0 =C2=A0// as visited in a depth-first post-order traversal.<br>
&gt;=C2=A0 =C2=A0func actionList(root *Action) []*Action {<br>
&gt; -@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio<br>
&gt; +@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action) cache.=
ActionID {<br>
&gt;=C2=A0 =C2=A0// Assume b.WorkDir is being trimmed properly.<br>
&gt;=C2=A0 =C2=A0// When -trimpath is used with a package built from the mo=
dule cache,<br>
&gt;=C2=A0 =C2=A0// use the module path and version instead of the director=
y.<br>
&gt; @@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0fmt.Fprintf(h, &quot;dir %s\n&quot;, p.Dir)<br>
&gt;=C2=A0 =C2=A0} else if cfg.BuildTrimpath &amp;&amp; p.Module !=3D nil {=
<br>
&gt;=C2=A0 =C2=A0fmt.Fprintf(h, &quot;module %s@%s\n&quot;, p.Module.Path, =
p.Module.Version)<br>
&gt; -@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio<br>
&gt; +@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action) cache.=
ActionID {<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; - if len(p.CgoFiles)+len(p.SwigFiles) &gt; 0 {<br>
&gt; + if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) &gt; 0 {<br>
&gt;=C2=A0 =C2=A0fmt.Fprintf(h, &quot;cgo %q\n&quot;, b.toolID(&quot;cgo&qu=
ot;))<br>
&gt;=C2=A0 - cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D b.CFlags(p=
)<br>
&gt; -- fmt.Fprintf(h, &quot;CC=3D%q %q %q %q\n&quot;, b.ccExe(), cppflags,=
 cflags, ldflags)<br>
&gt;=C2=A0 + cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D b.CFlags(p=
, true)<br>
&gt; -+ fmt.Fprintf(h, &quot;CC=3D%q %q %q %q\n&quot;, b.ccExe(true), cppfl=
ags, cflags, ldflags)<br>
&gt; - if len(p.CXXFiles)+len(p.SwigFiles) &gt; 0 {<br>
&gt; -- fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(), cxxflags)<br>
&gt; -+ fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(true), cxxflags)=
<br>
&gt; +<br>
&gt; +- ccExe :=3D b.ccExe()<br>
&gt; ++ ccExe :=3D b.ccExe(true)<br>
&gt; + fmt.Fprintf(h, &quot;CC=3D%q %q %q %q\n&quot;, ccExe, cppflags, cfla=
gs, ldflags)<br>
&gt; + // Include the C compiler tool ID so that if the C<br>
&gt; + // compiler changes we rebuild the package.<br>
&gt; +@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action) cach=
e.ActionID {<br>
&gt; + }<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; - if len(p.FFiles) &gt; 0 {<br>
&gt; -- fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(), fflags)<br>
&gt; -+ fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(true), fflags)<br>
&gt; + if len(p.CXXFiles)+len(p.SwigCXXFiles) &gt; 0 {<br>
&gt; +- cxxExe :=3D b.cxxExe()<br>
&gt; ++ cxxExe :=3D b.cxxExe(true)<br>
&gt; + fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, cxxExe, cxxflags)<br>
&gt; + if cxxID, err :=3D b.gccToolID(cxxExe[0], &quot;c++&quot;); err =3D=
=3D nil {<br>
&gt; + fmt.Fprintf(h, &quot;CXX ID=3D%q\n&quot;, cxxID)<br>
&gt; + }<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; - // TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/=
Objective-C compiler versions?<br>
&gt; - }<br>
&gt; -@@ -2401,33 +2403,48 @@ var (<br>
&gt; + if len(p.FFiles) &gt; 0 {<br>
&gt; +- fcExe :=3D b.fcExe()<br>
&gt; ++ fcExe :=3D b.fcExe(true)<br>
&gt; + fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, fcExe, fflags)<br>
&gt; + if fcID, err :=3D b.gccToolID(fcExe[0], &quot;f95&quot;); err =3D=3D=
 nil {<br>
&gt; + fmt.Fprintf(h, &quot;FC ID=3D%q\n&quot;, fcID)<br>
&gt; +@@ -2438,33 +2440,48 @@ var (<br>
&gt;=C2=A0 =C2=A0// gccCmd returns a gcc command line prefix<br>
&gt;=C2=A0 =C2=A0// defaultCC is defined in zdefaultcc.go, written by cmd/d=
ist.<br>
&gt;=C2=A0 =C2=A0func (b *Builder) GccCmd(incdir, workdir string) []string =
{<br>
&gt; @@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0// compilerExe returns the compiler to use given an<br>
&gt; -@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {<br>
&gt; +@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {<br>
&gt;=C2=A0 =C2=A0// of the compiler but can have additional arguments if th=
ey<br>
&gt;=C2=A0 =C2=A0// were present in the environment value.<br>
&gt;=C2=A0 =C2=A0// For example if CC=3D&quot;gcc -DGOPHER&quot; then the r=
esult is [&quot;gcc&quot;, &quot;-DGOPHER&quot;].<br>
&gt; @@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0return compiler<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {<br>
&gt; +@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0// CFlags returns the flags to use when invoking the C, C+=
+ or Fortran compilers, or cgo.<br>
&gt; @@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0defaults :=3D &quot;-g -O2&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0if cppflags, err =3D buildFlags(&quot;CPPFLAGS&quot;, &quo=
t;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err !=3D nil {<br>
&gt; -@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package<br>
&gt; +@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package) (cpp=
flags, cflags, cxxflags, fflags, l<br>
&gt;=C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; -@@ -2653,7 +2683,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
&gt; +@@ -2700,7 +2730,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0func (b *Builder) cgo(a *Action, cgoExe, objdir string, pc=
CFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (=
outGo, outObj []string, err error) {<br>
&gt;=C2=A0 =C2=A0p :=3D a.Package<br>
&gt; @@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0if err !=3D nil {<br>
&gt;=C2=A0 =C2=A0return nil, nil, err<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str<br>
&gt; +@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string) (i=
ntsize string, err error) {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0// Run SWIG on one SWIG input file.<br>
&gt;=C2=A0 =C2=A0func (b *Builder) swigOne(a *Action, p *load.Package, file=
, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, out=
C string, err error) {<br>
&gt; @@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0if err !=3D nil {<br>
&gt;=C2=A0 =C2=A0return &quot;&quot;, &quot;&quot;, err<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-=
be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.17/0=
003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch<br>
&gt; similarity index 78%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-b=
e-overridden-in-the-environment.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-=
overridden-in-the-environment.patch<br>
&gt; index 662c705471..e5d0ee90e2 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-over=
ridden-in-the-environment.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-over=
ridden-in-the-environment.patch<br>
&gt; @@ -1,7 +1,8 @@<br>
&gt; -From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:15:37 +0430<br>
&gt; -Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the =
environment<br>
&gt; +Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the<=
br>
&gt; + environment<br>
&gt;<br>
&gt;=C2=A0 to allow for split host/target build roots<br>
&gt;<br>
&gt; @@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/cfg/cfg.go | 6 +++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 8 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
&gt; +index bec17696f3..d82f612e75 100644<br>
&gt;=C2=A0 --- a/src/cmd/dist/build.go<br>
&gt;=C2=A0 +++ b/src/cmd/dist/build.go<br>
&gt; -@@ -246,7 +246,9 @@ func xinit() {<br>
&gt; - workdir =3D xworkdir()<br>
&gt; +@@ -248,7 +248,9 @@ func xinit() {<br>
&gt; + }<br>
&gt;=C2=A0 =C2=A0xatexit(rmworkdir)<br>
&gt;<br>
&gt;=C2=A0 - tooldir =3D pathf(&quot;%s/pkg/tool/%s_%s&quot;, goroot, gohos=
tos, gohostarch)<br>
&gt; @@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0// compilerEnv returns a map from &quot;goos/goarch&quot; =
to the<br>
&gt; +diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg=
/cfg.go<br>
&gt; +index 57a3c1ff6f..825d8c70f2 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/cfg/cfg.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/cfg/cfg.go<br>
&gt; -@@ -64,7 +64,11 @@ func defaultContext() build.Context {<br>
&gt; +@@ -67,7 +67,11 @@ func defaultContext() build.Context {<br>
&gt;=C2=A0 =C2=A0// variables. This matches the initialization of ToolDir i=
n<br>
&gt;=C2=A0 =C2=A0// go/build, except for using ctxt.GOROOT rather than<br>
&gt;=C2=A0 =C2=A0// runtime.GOROOT.<br>
&gt; @@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0ctxt.GOPATH =3D envOr(&quot;GOPATH&quot;, ctxt.GOPATH)<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-sh=
areable-objects.patch b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname=
-to-shareable-objects.patch<br>
&gt; similarity index 78%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-sha=
reable-objects.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-share=
able-objects.patch<br>
&gt; index cd875f1164..bc5cabeca0 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable=
-objects.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable=
-objects.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:16:32 +0430<br>
&gt;=C2=A0 Subject: [PATCH 4/9] ld: add soname to shareable objects<br>
&gt; @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/cmd/link/internal/ld/lib.go | 3 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; +diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/=
ld/lib.go<br>
&gt; +index 644faeb2fb..5b7e48636e 100644<br>
&gt;=C2=A0 --- a/src/cmd/link/internal/ld/lib.go<br>
&gt;=C2=A0 +++ b/src/cmd/link/internal/ld/lib.go<br>
&gt; -@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {<br>
&gt; +@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
&gt; @@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0if ctxt.HeadType =3D=3D objabi.Hwindows {<br>
&gt;=C2=A0 =C2=A0if *flagAslr {<br>
&gt;=C2=A0 =C2=A0argv =3D addASLRargs(argv)<br>
&gt; -@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {<br>
&gt; +@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
&gt; @@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0case BuildModePlugin:<br>
&gt;=C2=A0 =C2=A0if ctxt.HeadType =3D=3D objabi.Hdarwin {<br>
&gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-dynamiclib&quot;)<br>
&gt; -@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {<br>
&gt; +@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
&gt; @@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-=
CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.17/=
0005-make.bash-override-CC-when-building-dist-and-go_boot.patch<br>
&gt; similarity index 76%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0005-make.bash-override-C=
C-when-building-dist-and-go_boot.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-=
when-building-dist-and-go_boot.patch<br>
&gt; index 59c12d9546..a7d9932f4d 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when=
-building-dist-and-go_boot.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when=
-building-dist-and-go_boot.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:17:16 +0430<br>
&gt;=C2=A0 Subject: [PATCH 5/9] make.bash: override CC when building dist a=
nd<br>
&gt; @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/make.bash | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; +diff --git a/src/make.bash b/src/make.bash<br>
&gt; +index 7986125a06..dd67029700 100755<br>
&gt;=C2=A0 --- a/src/make.bash<br>
&gt;=C2=A0 +++ b/src/make.bash<br>
&gt; -@@ -178,7 +178,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOR=
OOT&quot; ];<br>
&gt; +@@ -181,7 +181,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOR=
OOT&quot; ]; then<br>
&gt;=C2=A0 =C2=A0exit 1<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0rm -f cmd/dist/dist<br>
&gt; @@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# -e doesn&#39;t propagate out of eval, so check success b=
y hand.<br>
&gt;=C2=A0 =C2=A0eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br>
&gt; -@@ -209,7 +209,7 @@ fi<br>
&gt; +@@ -206,7 +206,7 @@ fi<br>
&gt;=C2=A0 =C2=A0# Run dist bootstrap to complete make.bash.<br>
&gt;=C2=A0 =C2=A0# Bootstrap installs a proper cmd/dist, built with the new=
 toolchain.<br>
&gt;=C2=A0 =C2=A0# Throw ours, built with Go 1.4, away after bootstrap.<br>
&gt; --./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS &quot;$@&qu=
ot;<br>
&gt; -+CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap $build=
all $vflag $GO_DISTFLAGS &quot;$@&quot;<br>
&gt; +-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS &quot;$@&quot;<br>
&gt; ++CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap -a $vf=
lag $GO_DISTFLAGS &quot;$@&quot;<br>
&gt;=C2=A0 =C2=A0rm -f ./cmd/dist/dist<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# DO NOT ADD ANY NEW CODE HERE.<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-h=
ost-and-target-builds.patch b/meta/recipes-devtools/go/go-1.17/0006-cmd-dis=
t-separate-host-and-target-builds.patch<br>
&gt; similarity index 90%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-ho=
st-and-target-builds.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host=
-and-target-builds.patch<br>
&gt; index 7aee0bac43..e92cc9b28b 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and=
-target-builds.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and=
-target-builds.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:18:12 +0430<br>
&gt;=C2=A0 Subject: [PATCH 6/9] cmd/dist: separate host and target builds<b=
r>
&gt; @@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++=
------------<br>
&gt;=C2=A0 =C2=A01 file changed, 112 insertions(+), 43 deletions(-)<br>
&gt;<br>
&gt; +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
&gt; +index d82f612e75..af24e01198 100644<br>
&gt;=C2=A0 --- a/src/cmd/dist/build.go<br>
&gt;=C2=A0 +++ b/src/cmd/dist/build.go<br>
&gt; -@@ -41,6 +41,7 @@ var (<br>
&gt; - goldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
&gt; +@@ -43,6 +43,7 @@ var (<br>
&gt; + goexperiment=C2=A0 =C2=A0 =C2=A0string<br>
&gt;=C2=A0 =C2=A0workdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
&gt;=C2=A0 =C2=A0tooldir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
&gt;=C2=A0 + build_tooldir=C2=A0 =C2=A0 string<br>
&gt;=C2=A0 =C2=A0oldgoos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
&gt;=C2=A0 =C2=A0oldgoarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
&gt;=C2=A0 =C2=A0exe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string=
<br>
&gt; -@@ -53,6 +54,7 @@ var (<br>
&gt; +@@ -55,6 +56,7 @@ var (<br>
&gt;<br>
&gt;=C2=A0 =C2=A0rebuildall=C2=A0 =C2=A0bool<br>
&gt;=C2=A0 =C2=A0defaultclang bool<br>
&gt; @@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0vflag int // verbosity<br>
&gt;=C2=A0 =C2=A0)<br>
&gt; -@@ -249,6 +251,8 @@ func xinit() {<br>
&gt; +@@ -251,6 +253,8 @@ func xinit() {<br>
&gt;=C2=A0 =C2=A0if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;); tooldir =
=3D=3D &quot;&quot; {<br>
&gt;=C2=A0 =C2=A0tooldir =3D pathf(&quot;%s/pkg/tool/%s_%s&quot;, goroot, g=
ohostos, gohostarch)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0// compilerEnv returns a map from &quot;goos/goarch&quot; =
to the<br>
&gt; -@@ -480,8 +484,10 @@ func setup() {<br>
&gt; +@@ -496,8 +500,10 @@ func setup() {<br>
&gt;=C2=A0 =C2=A0p :=3D pathf(&quot;%s/pkg/%s_%s&quot;, goroot, gohostos, g=
ohostarch)<br>
&gt;=C2=A0 =C2=A0if rebuildall {<br>
&gt;=C2=A0 =C2=A0xremoveall(p)<br>
&gt; @@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0if goos !=3D gohostos || goarch !=3D gohostarch {<br>
&gt;=C2=A0 =C2=A0p :=3D pathf(&quot;%s/pkg/%s_%s&quot;, goroot, goos, goarc=
h)<br>
&gt; -@@ -1244,12 +1250,29 @@ func cmdbootstrap() {<br>
&gt; +@@ -1266,13 +1272,30 @@ func cmdbootstrap() {<br>
&gt; + defer timelog(&quot;end&quot;, &quot;dist bootstrap&quot;)<br>
&gt;<br>
&gt; - var noBanner bool<br>
&gt; - var debug bool<br>
&gt; + var noBanner, noClean bool<br>
&gt;=C2=A0 + var hostOnly bool<br>
&gt;=C2=A0 + var targetOnly bool<br>
&gt;=C2=A0 + var toBuild =3D []string{&quot;std&quot;, &quot;cmd&quot;}<br>
&gt; -+<br>
&gt; + var debug bool<br>
&gt;=C2=A0 =C2=A0flag.BoolVar(&amp;rebuildall, &quot;a&quot;, rebuildall, &=
quot;rebuild all&quot;)<br>
&gt;=C2=A0 =C2=A0flag.BoolVar(&amp;debug, &quot;d&quot;, debug, &quot;enabl=
e debugging of bootstrap process&quot;)<br>
&gt;=C2=A0 =C2=A0flag.BoolVar(&amp;noBanner, &quot;no-banner&quot;, noBanne=
r, &quot;do not print banner&quot;)<br>
&gt; + flag.BoolVar(&amp;noClean, &quot;no-clean&quot;, noClean, &quot;prin=
t deprecation warning&quot;)<br>
&gt;=C2=A0 + flag.BoolVar(&amp;hostOnly, &quot;host-only&quot;, hostOnly, &=
quot;build only host binaries, not target&quot;)<br>
&gt;=C2=A0 + flag.BoolVar(&amp;targetOnly, &quot;target-only&quot;, targetO=
nly, &quot;build only target binaries, not host&quot;)<br>
&gt;<br>
&gt;=C2=A0 - xflagparse(0)<br>
&gt;=C2=A0 + xflagparse(-1)<br>
&gt; -<br>
&gt; ++<br>
&gt;=C2=A0 + if hostOnly &amp;&amp; targetOnly {<br>
&gt;=C2=A0 + fatalf(&quot;specify only one of --host-only or --target-only\=
n&quot;)<br>
&gt;=C2=A0 + }<br>
&gt; @@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"m=
ailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.=
com</a>&gt;<br>
&gt;=C2=A0 + fatalf(&quot;package names not permitted without --host-only o=
r --target-only\n&quot;)<br>
&gt;=C2=A0 + }<br>
&gt;=C2=A0 + }<br>
&gt; - // Set GOPATH to an internal directory. We shouldn&#39;t actually<br=
>
&gt; - // need to store files here, since the toolchain won&#39;t<br>
&gt; - // depend on modules outside of vendor directories, but if<br>
&gt; -@@ -1303,8 +1326,13 @@ func cmdbootstrap() {<br>
&gt; +<br>
&gt; + if noClean {<br>
&gt; + xprintf(&quot;warning: --no-clean is deprecated and has no effect; u=
se &#39;go install std cmd&#39; instead\n&quot;)<br>
&gt; +@@ -1345,8 +1368,13 @@ func cmdbootstrap() {<br>
&gt;=C2=A0 =C2=A0xprintf(&quot;\n&quot;)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0goBootstrap :=3D pathf(&quot;%s/go_bootstrap&quot;, tooldi=
r)<br>
&gt;=C2=A0 =C2=A0cmdGo :=3D pathf(&quot;%s/go&quot;, gobin)<br>
&gt;=C2=A0 =C2=A0if debug {<br>
&gt; -@@ -1333,7 +1361,11 @@ func cmdbootstrap() {<br>
&gt; +@@ -1375,7 +1403,11 @@ func cmdbootstrap() {<br>
&gt;=C2=A0 =C2=A0xprintf(&quot;\n&quot;)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0xprintf(&quot;Building Go toolchain2 using go_bootstrap an=
d Go toolchain1.\n&quot;)<br>
&gt; @@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"m=
ailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.=
com</a>&gt;<br>
&gt;=C2=A0 + } else {<br>
&gt;=C2=A0 + os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, g=
oarch))<br>
&gt;=C2=A0 + }<br>
&gt; + // Now that cmd/go is in charge of the build process, enable GOEXPER=
IMENT.<br>
&gt; + os.Setenv(&quot;GOEXPERIMENT&quot;, goexperiment)<br>
&gt;=C2=A0 =C2=A0goInstall(goBootstrap, append([]string{&quot;-i&quot;}, to=
olchain...)...)<br>
&gt; - if debug {<br>
&gt; - run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;=
, tooldir), &quot;-V=3Dfull&quot;)<br>
&gt; -@@ -1370,50 +1402,84 @@ func cmdbootstrap() {<br>
&gt; +@@ -1414,50 +1446,84 @@ func cmdbootstrap() {<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0checkNotStale(goBootstrap, append(toolchain, &quot;runtime=
/internal/sys&quot;)...)<br>
&gt;<br>
&gt; @@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 - timelog(&quot;build&quot;, &quot;host toolchain&quot;)<br>
&gt;=C2=A0 - if vflag &gt; 0 {<br>
&gt;=C2=A0 - xprintf(&quot;\n&quot;)<br>
&gt; +- }<br>
&gt; +- xprintf(&quot;Building packages and commands for host, %s/%s.\n&quo=
t;, goos, goarch)<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 + if goos =3D=3D oldgoos &amp;&amp; goarch =3D=3D oldgoarch {<br=
>
&gt;=C2=A0 + // Common case - not setting up for cross-compilation.<br>
&gt; @@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 + os.Setenv(&quot;GOARCH&quot;, goarch)<br>
&gt;=C2=A0 + os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, g=
oarch))<br>
&gt;=C2=A0 + xprintf(&quot;Building packages and commands for target, %s/%s=
.\n&quot;, goos, goarch)<br>
&gt; - }<br>
&gt; -- xprintf(&quot;Building packages and commands for host, %s/%s.\n&quo=
t;, goos, goarch)<br>
&gt; ++ }<br>
&gt;=C2=A0 =C2=A0goInstall(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<b=
r>
&gt;=C2=A0 =C2=A0checkNotStale(goBootstrap, &quot;std&quot;, &quot;cmd&quot=
;)<br>
&gt;=C2=A0 =C2=A0checkNotStale(cmdGo, &quot;std&quot;, &quot;cmd&quot;)<br>
&gt; @@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"ma=
ilto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.c=
om</a>&gt;<br>
&gt;=C2=A0 - timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
&gt;=C2=A0 - if vflag &gt; 0 {<br>
&gt;=C2=A0 - xprintf(&quot;\n&quot;)<br>
&gt; -- }<br>
&gt; ++ if debug {<br>
&gt; ++ run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot=
;, tooldir), &quot;-V=3Dfull&quot;)<br>
&gt; ++ run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot=
;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot,=
 goos, goarch))<br>
&gt; ++ checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal=
/sys&quot;)...)<br>
&gt; ++ copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/co=
mpile&quot;, tooldir), writeExec)<br>
&gt; + }<br>
&gt;=C2=A0 - goos =3D oldgoos<br>
&gt;=C2=A0 - goarch =3D oldgoarch<br>
&gt;=C2=A0 - os.Setenv(&quot;GOOS&quot;, goos)<br>
&gt; @@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"m=
ailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.=
com</a>&gt;<br>
&gt;=C2=A0 - run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid=
&quot;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, go=
root, goos, goarch))<br>
&gt;=C2=A0 - checkNotStale(goBootstrap, append(toolchain, &quot;runtime/int=
ernal/sys&quot;)...)<br>
&gt;=C2=A0 - copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;=
%s/compile&quot;, tooldir), writeExec)<br>
&gt; -+ if debug {<br>
&gt; -+ run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot=
;, tooldir), &quot;-V=3Dfull&quot;)<br>
&gt; -+ run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot=
;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot,=
 goos, goarch))<br>
&gt; -+ checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal=
/sys&quot;)...)<br>
&gt; -+ copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/co=
mpile&quot;, tooldir), writeExec)<br>
&gt; -+ }<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0// Check that there are no new files in $GOROOT/bin other =
than<br>
&gt; -@@ -1430,8 +1496,11 @@ func cmdbootstrap() {<br>
&gt; +@@ -1474,8 +1540,11 @@ func cmdbootstrap() {<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0if goos =3D=3D &quot;android&quot; {<br>
&gt;=C2=A0 =C2=A0// Make sure the exec wrapper will sync a fresh $GOROOT to=
 the device.<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-=
precious-by-default.patch b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-ma=
ke-GOROOT-precious-by-default.patch<br>
&gt; similarity index 78%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-p=
recious-by-default.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-pre=
cious-by-default.patch<br>
&gt; index 4b4d0d4f3d..d522512699 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-preciou=
s-by-default.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-preciou=
s-by-default.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:18:56 +0430<br>
&gt;=C2=A0 Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default<br>
&gt; @@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/work/exec.go=C2=A0 =C2=A0| 25 ++++++++=
+++++++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 34 insertions(+)<br>
&gt;<br>
&gt; +diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal=
/work/action.go<br>
&gt; +index 69940cb001..b0c1667def 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/action.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/action.go<br>
&gt; -@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(<br>
&gt; +@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Ac=
tion, shlib string) {<br>
&gt;=C2=A0 =C2=A0if p1 =3D=3D nil || p1.Shlib =3D=3D &quot;&quot; || haveSh=
lib[filepath.Base(p1.Shlib)] {<br>
&gt;=C2=A0 =C2=A0continue<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0haveShlib[filepath.Base(p1.Shlib)] =3D true<br>
&gt;=C2=A0 =C2=A0// TODO(rsc): The use of ModeInstall here is suspect, but =
if we only do ModeBuild,<br>
&gt;=C2=A0 =C2=A0// we&#39;ll end up building an overall library or executa=
ble that depends at runtime<br>
&gt; +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/=
work/build.go<br>
&gt; +index 0ed2389cd5..c3f8a82880 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/build.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/build.go<br>
&gt; -@@ -167,6 +167,8 @@ See also: go install, go get, go clean.<br>
&gt; +@@ -189,6 +189,8 @@ See also: go install, go get, go clean.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0const concurrentGCBackendCompilationEnabledByDefault =3D t=
rue<br>
&gt;<br>
&gt; @@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0func init() {<br>
&gt;=C2=A0 =C2=A0// break init cycle<br>
&gt;=C2=A0 =C2=A0CmdBuild.Run =3D runBuild<br>
&gt; -@@ -179,6 +181,10 @@ func init() {<br>
&gt; +@@ -201,6 +203,10 @@ func init() {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0AddBuildFlags(CmdBuild, DefaultBuildFlags)<br>
&gt;=C2=A0 =C2=A0AddBuildFlags(CmdInstall, DefaultBuildFlags)<br>
&gt; @@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0// Note that flags consulted by other parts of the code<br=
>
&gt; +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/w=
ork/exec.go<br>
&gt; +index a37872e7c7..f4e83b97e2 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/exec.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/exec.go<br>
&gt; -@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err<br>
&gt; +@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Context, a *=
Action) (err error) {<br>
&gt;=C2=A0 =C2=A0return errors.New(&quot;binary-only packages are no longer=
 supported&quot;)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<br>
&gt;=C2=A0 =C2=A0return err<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act<br>
&gt; +@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx context.Conte=
xt, a *Action) (err error) {<br>
&gt;=C2=A0 =C2=A0return err<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<br>
&gt;=C2=A0 =C2=A0return err<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-=
set-buildmode.patch b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE=
-to-set-buildmode.patch<br>
&gt; similarity index 84%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-s=
et-buildmode.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set=
-buildmode.patch<br>
&gt; index 4e5d5021d6..9a1bce809c 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-bui=
ldmode.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-bui=
ldmode.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:19:26 +0430<br>
&gt;=C2=A0 Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode<br=
>
&gt; @@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mail=
to:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/work/build.go | 8 +++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/=
work/build.go<br>
&gt; +index c3f8a82880..23d1aa4836 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/build.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/build.go<br>
&gt; -@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma<br>
&gt; +@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, mask Build=
FlagMask) {<br>
&gt;<br>
&gt;=C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildAsmflags, &quot;asmflags&quot;=
, &quot;&quot;)<br>
&gt;=C2=A0 =C2=A0cmd.Flag.Var(buildCompiler{}, &quot;compiler&quot;, &quot;=
&quot;)<br>
&gt; @@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailt=
o:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com<=
/a>&gt;<br>
&gt;=C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGcflags, &quot;gcflags&quot;, =
&quot;&quot;)<br>
&gt;=C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGccgoflags, &quot;gccgoflags&q=
uot;, &quot;&quot;)<br>
&gt;=C2=A0 =C2=A0if mask&amp;OmitModFlag =3D=3D 0 {<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-=
sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.17/0009-=
Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch<br>
&gt; similarity index 75%<br>
&gt; rename from meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-s=
ure-CC-and-CXX-are-absolute.patch<br>
&gt; rename to meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sur=
e-CC-and-CXX-are-absolute.patch<br>
&gt; index dcbdf58752..f8bd491f93 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC=
-and-CXX-are-absolute.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC=
-and-CXX-are-absolute.patch<br>
&gt; @@ -1,7 +1,7 @@<br>
&gt; -From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From c5f3c1aa77753254586c0c8a6893862ae97eabe1 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 22 Feb 2021 17:54:01 -0800<br>
&gt; -Subject: [PATCH] Revert &quot;cmd/go: make sure CC and CXX are absolu=
te&quot;<br>
&gt; +Subject: [PATCH 9/9] Revert &quot;cmd/go: make sure CC and CXX are ab=
solute&quot;<br>
&gt;<br>
&gt;=C2=A0 OE uses CC/CXX values which consists of cmpiler and options toge=
ther,<br>
&gt;=C2=A0 secondly, the environment is canned so this check add little val=
ue to OE<br>
&gt; @@ -16,47 +16,44 @@ This reverts commit aa161e799df7e1eba99d2be10271e7=
6b6f758142.<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE-Specific]<br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - src/cmd/go/internal/envcmd/env.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 5 -----<br>
&gt; + src/cmd/go/internal/envcmd/env.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 2 +-<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/work/init.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 7 -------<br>
&gt;=C2=A0 =C2=A0src/cmd/go/testdata/script/env_write.txt | 24 ------------=
------------<br>
&gt; - 3 files changed, 36 deletions(-)<br>
&gt; + 3 files changed, 1 insertion(+), 32 deletions(-)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/inte=
rnal/envcmd/env.go<br>
&gt; -index 6937187522..29f9057c3f 100644<br>
&gt; +index ff6f0d810a..ca0494b5d4 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/envcmd/env.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/envcmd/env.go<br>
&gt; -@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {<br>
&gt; - if !filepath.IsAbs(val) &amp;&amp; val !=3D &quot;&quot; {<br>
&gt; +@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) error {<br>
&gt;=C2=A0 =C2=A0return fmt.Errorf(&quot;GOPATH entry is relative; must be =
absolute path: %q&quot;, val)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -- // Make sure CC and CXX are absolute paths<br>
&gt; -- case &quot;CC&quot;, &quot;CXX&quot;:<br>
&gt; -- if !filepath.IsAbs(val) &amp;&amp; val !=3D &quot;&quot; &amp;&amp;=
 val !=3D filepath.Base(val) {<br>
&gt; -- return fmt.Errorf(&quot;%s entry is relative; must be absolute path=
: %q&quot;, key, val)<br>
&gt; -- }<br>
&gt; - }<br>
&gt; -<br>
&gt; - if !utf8.ValidString(val) {<br>
&gt; + // Make sure CC and CXX are absolute paths<br>
&gt; +- case &quot;CC&quot;, &quot;CXX&quot;, &quot;GOMODCACHE&quot;:<br>
&gt; ++ case &quot;GOMODCACHE&quot;:<br>
&gt; + if !filepath.IsAbs(val) &amp;&amp; val !=3D &quot;&quot; &amp;&amp; =
val !=3D filepath.Base(val) {<br>
&gt; + return fmt.Errorf(&quot;%s entry is relative; must be absolute path:=
 %q&quot;, key, val)<br>
&gt; + }<br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/inter=
nal/work/init.go<br>
&gt; -index ba7c7c2fbb..3a6df5f758 100644<br>
&gt; +index 37a3e2d0ff..e529cc2917 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/init.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/init.go<br>
&gt; -@@ -41,13 +41,6 @@ func BuildInit() {<br>
&gt; +@@ -38,13 +38,6 @@ func BuildInit() {<br>
&gt; + }<br>
&gt;=C2=A0 =C2=A0cfg.BuildPkgdir =3D p<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; +-<br>
&gt;=C2=A0 - // Make sure CC and CXX are absolute paths<br>
&gt;=C2=A0 - for _, key :=3D range []string{&quot;CC&quot;, &quot;CXX&quot;=
} {<br>
&gt;=C2=A0 - if path :=3D cfg.Getenv(key); !filepath.IsAbs(path) &amp;&amp;=
 path !=3D &quot;&quot; &amp;&amp; path !=3D filepath.Base(path) {<br>
&gt;=C2=A0 - base.Fatalf(&quot;go %s: %s environment variable is relative; =
must be absolute path: %s\n&quot;, flag.Args()[0], key, path)<br>
&gt;=C2=A0 - }<br>
&gt;=C2=A0 - }<br>
&gt; --<br>
&gt; - // For each experiment that has been enabled in the toolchain, defin=
e a<br>
&gt; - // build tag with the same name but prefixed by &quot;goexperiment.&=
quot; which can be<br>
&gt; - // used for compiling alternative files for the experiment. This all=
ows<br>
&gt; + }<br>
&gt; +<br>
&gt; + func instrumentInit() {<br>
&gt;=C2=A0 diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/=
go/testdata/script/env_write.txt<br>
&gt; -index bda1e57826..c99aadb7f2 100644<br>
&gt; +index b5e9739167..566c876658 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/testdata/script/env_write.txt<br>
&gt;=C2=A0 +++ b/src/cmd/go/testdata/script/env_write.txt<br>
&gt;=C2=A0 @@ -129,30 +129,6 @@ go env -w GOTMPDIR=3D<br>
&gt; @@ -91,5 +88,5 @@ index bda1e57826..c99aadb7f2 100644<br>
&gt;=C2=A0 =C2=A0env GOOS=3D<br>
&gt;=C2=A0 =C2=A0env GOARCH=3D<br>
&gt;=C2=A0 --<br>
&gt; -2.30.1<br>
&gt; +2.25.1<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-nati=
ve_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.=
bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.17.b=
b" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a><br>
&gt; similarity index 83%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-nativ=
e_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.b=
b</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native_=
1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a><=
br>
&gt; index b3e2b6a60e..2b3db17d3b 100644<br>
&gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.16=
.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</a><=
br>
&gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.17=
.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a><br>
&gt; @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950=
ecb7b26d2c5e4e7b4e0dd74707&quot;<br>
&gt;=C2=A0 PROVIDES =3D &quot;go-native&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7=
D.$%7BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%=
7D" rel=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go${PV}.$=
{BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br=
>
&gt; -SRC_URI[go_linux_amd64.sha256sum] =3D &quot;b12c23023b68de22f74c0524f=
10b753e7b08b1504cb7e417eccebdd3fae49061&quot;<br>
&gt; -SRC_URI[go_linux_arm64.sha256sum] =3D &quot;d5446b46ef6f36fdffa852f73=
dfbbe78c1ddf010b99fa4964944b9ae8b4d6799&quot;<br>
&gt; +SRC_URI[go_linux_amd64.sha256sum] =3D &quot;6bf89fc4f5ad763871cf7eac8=
0a2d594492de7a818303283f1366a7f6a30372d&quot;<br>
&gt; +SRC_URI[go_linux_arm64.sha256sum] =3D &quot;01a9af009ada22122d3fcb981=
6049c1d21842524b38ef5d5a0e2ee4b26d7c3e7&quot;<br>
&gt;<br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/dl/" =
rel=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.li=
nux&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canad=
ian_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.=
5.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.1=
7.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.bb</a><br=
>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadi=
an_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.5=
.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian=
_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.bb</a=
><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.16.=
5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a> b/meta/re=
cipes-devtools/go/<a href=3D"http://go-cross_1.17.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-cross_1.17.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.16.5=
.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.17.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross_1.17.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.=
16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a> b/m=
eta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.17.bb" rel=3D"noref=
errer" target=3D"_blank">go-crosssdk_1.17.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.1=
6.5.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.17.=
bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.17.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.16=
.5.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a> b/meta/=
recipes-devtools/go/<a href=3D"http://go-native_1.17.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-native_1.17.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-native_1.16.=
5.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-native_1.17.bb=
" rel=3D"noreferrer" target=3D"_blank">go-native_1.17.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.1=
6.5.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a> b/met=
a/recipes-devtools/go/<a href=3D"http://go-runtime_1.17.bb" rel=3D"noreferr=
er" target=3D"_blank">go-runtime_1.17.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.16=
.5.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.17.b=
b" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.17.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.16.5.bb" =
rel=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a> b/meta/recipes-devtoo=
ls/go/<a href=3D"http://go_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go=
_1.17.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go_1.16.5.bb" r=
el=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go_1.17.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.17.bb</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000042b17305ca66d741--
