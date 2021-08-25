Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
 by mx.groups.io with SMTP id smtpd.web11.20129.1629918880216916370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 12:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eGfGC6up;
 spf=pass (domain: gmail.com, ip: 209.85.221.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f176.google.com with SMTP id j26so135664vkn.4
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 12:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=26VjR4Z5rqxXUMMz06kZr9xYAdMbCSYe15Lz8xGtXyg=;
        b=eGfGC6upaSXqd3CiJ0oczGz1HI3KrfybdFtwqdTm25d2x7SuvVekb1BXROsQizEZFS
         t3fBlFV3JUUn6LI53DCIxtaGoH6ZZV5/Ff/bgYbIQKfsLAuMgtHX2GVaQrMm6ZbZYdOD
         m94jKErWGHAa1cn4t2vKAGwcmznF+si2PeBQruppRg+Lo3VnnmL0+0wixEBjN04/BbfP
         p130weWudrtL6MvQ1jUzV3ucKCzrZgcBD9r+BmjxeUPVr9JusE1mVMqfQNZbexlBivgG
         vXbiK9jA7DQRA+bgWqeV3AWHm4AAMC8v6Ly6EQfDdPstPIxlEM6m473/54XKtR/sOQ9X
         HsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=26VjR4Z5rqxXUMMz06kZr9xYAdMbCSYe15Lz8xGtXyg=;
        b=YG/UI02jAA9pORbHk3sRVGYrPv1M+On0RGio96sbHsYYs7kMXnMbNm47EujD+33/2L
         l3+HVbDweaVFPeXcKmpdaJ7SXRu+WI6oTRVn5yUW3T1nk76gbxJRXYNyYlk/oKgqpq4i
         ADlmoO3ddNOz1R91g2wbbq8yCQky4hvTIc1WCDGFEOvnNKpW3Dcp+G/v+D7j7Gz24oh9
         KDcW8dmLkT4zRBea3FBrce92ie1xhHKKtB6Qh1B8yba0dVCr2afD6f5ra/i1u+B/gqyc
         pBopMkvfI1cUn81JNI3cPbbhHTm1uD1YDaK6xbehPWXU0ATxo9UNZgW+mNtHgHYcqYtX
         kvHA==
X-Gm-Message-State: AOAM531E5fL2jEP01pcvRpLwJCL91edOA1IRUKBj7ubglNhIQnGiPHLL
	K7RWfuBPTzk+FYy5nvvLUs/YC39an0uuzYlPWZ/cjTpb
X-Google-Smtp-Source: ABdhPJy6E8K7NaIXPuiZH/ZQG5b8V/1ohRuj3OMu2cJVrDqfhLHj8rpXZVmUHnYvn3GdnkruSksb/ea5Bo9jJvwP4Cg=
X-Received: by 2002:a1f:d247:: with SMTP id j68mr1801781vkg.7.1629918878994;
 Wed, 25 Aug 2021 12:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <169E9C6226DE3CC6.18091@lists.openembedded.org>
 <32b22790-eac9-9e8d-ab6c-661bb77e2fac@windriver.com> <CADkTA4M4O5kkPv2zhosT1XQZrtWXe0=arT=zPH4eTxd=WtVZpA@mail.gmail.com>
 <CANNYZj9dsOkd5w7n4o8oox732VNZMmR6FunbOn_R3=y0X4qHfQ@mail.gmail.com> <CADkTA4O2JWwy_Ft92aahvQ4iGBumyZ0UwoZr34NOw1PaXxm7bg@mail.gmail.com>
In-Reply-To: <CADkTA4O2JWwy_Ft92aahvQ4iGBumyZ0UwoZr34NOw1PaXxm7bg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 25 Aug 2021 21:14:27 +0200
Message-ID: <CANNYZj-puppF2z_p-fDjZ9uXKHCQbbbdTBfFvzhR9_tRX1k9Bg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: upgrade to 1.17 release
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Sakib Sajal <sakib.sajal@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cb950a05ca670fd6"

--000000000000cb950a05ca670fd6
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Aug 2021 at 21:05, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> Let's agree to disagree. Anyone doing toolchain work, needs to have an
> extra level of caution.
>
> I'm constantly dealing with kernel issues and tightly coupled
> applications in all layers that have nothing in core. I don't simply
> tell people "go test it yourself".
>

In that case, apologies, but you do need to be more clear in your request.
Specifically tell what layers should be taken into the build, and what kind
of testing, exactly, needs to be performed with them. Otherwise, you're
just going to scare oe-core contributors away.

Alex



>
> Cheers,
>
> Bruce
>
> > That said, I agree that it's a bit late to place this into oe-core now,
> and it's best to stash this until the start of the next cycle.
> >
> > Alex
> >
> >>
> >>
> >> Bruce
> >>
> >> >
> >> > Sakib
> >> >
> >> > On 2021-08-25 1:20 p.m., Sakib Sajal wrote:
> >> >
> >> > go 1.17 includes small enhancements to the language.
> >> > Release notes: https://golang.org/doc/go1.17
> >> >
> >> > Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> >> > ---
> >> >  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >> >  .../go/{go-1.16.5.inc => go-1.17.inc}         |  6 +-
> >> >  ...ow-CC-and-CXX-to-have-multiple-words.patch | 10 ++-
> >> >  ...ent-based-hash-generation-less-pedan.patch | 62 +++++++++++-------
> >> >  ...-to-be-overridden-in-the-environment.patch | 18 ++++--
> >> >  ...4-ld-add-soname-to-shareable-objects.patch | 13 ++--
> >> >  ...de-CC-when-building-dist-and-go_boot.patch | 15 +++--
> >> >  ...dist-separate-host-and-target-builds.patch | 64
> ++++++++++---------
> >> >  ...d-go-make-GOROOT-precious-by-default.patch | 21 ++++--
> >> >  ...008-use-GOBUILDMODE-to-set-buildmode.patch |  9 ++-
> >> >  ...go-make-sure-CC-and-CXX-are-absolute.patch | 45 ++++++-------
> >> >  ...ive_1.16.5.bb => go-binary-native_1.17.bb} |  4 +-
> >> >  ...an_1.16.5.bb => go-cross-canadian_1.17.bb} |  0
> >> >  .../{go-cross_1.16.5.bb => go-cross_1.17.bb}  |  0
> >> >  ...crosssdk_1.16.5.bb => go-crosssdk_1.17.bb} |  0
> >> >  ...{go-native_1.16.5.bb => go-native_1.17.bb} |  0
> >> >  ...o-runtime_1.16.5.bb => go-runtime_1.17.bb} |  0
> >> >  .../go/{go_1.16.5.bb => go_1.17.bb}           |  0
> >> >  18 files changed, 163 insertions(+), 106 deletions(-)
> >> >  rename meta/recipes-devtools/go/{go-1.16.5.inc => go-1.17.inc} (85%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (80%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> (80%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> (78%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0004-ld-add-soname-to-shareable-objects.patch (78%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> (76%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0006-cmd-dist-separate-host-and-target-builds.patch (90%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0007-cmd-go-make-GOROOT-precious-by-default.patch (78%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0008-use-GOBUILDMODE-to-set-buildmode.patch (84%)
> >> >  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)
> >> >  rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb =>
> go-binary-native_1.17.bb} (83%)
> >> >  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb =>
> go-cross-canadian_1.17.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go-cross_1.16.5.bb =>
> go-cross_1.17.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb =>
> go-crosssdk_1.17.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go-native_1.16.5.bb =>
> go-native_1.17.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb =>
> go-runtime_1.17.bb} (100%)
> >> >  rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.17.bb} (100%)
> >> >
> >> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> >> > index 47f23f5c39..5b8a532943 100644
> >> > --- a/meta/conf/distro/include/tcmode-default.inc
> >> > +++ b/meta/conf/distro/include/tcmode-default.inc
> >> > @@ -23,7 +23,7 @@ GDBVERSION ?= "10.%"
> >> >  GLIBCVERSION ?= "2.34"
> >> >  LINUXLIBCVERSION ?= "5.13%"
> >> >  QEMUVERSION ?= "6.0%"
> >> > -GOVERSION ?= "1.16%"
> >> > +GOVERSION ?= "1.17%"
> >> >  # This can not use wildcards like 8.0.% since it is also used in
> mesa to denote
> >> >  # llvm version being used, so always bump it with llvm recipe
> version bump
> >> >  LLVMVERSION ?= "12.0.1"
> >> > diff --git a/meta/recipes-devtools/go/go-1.16.5.inc
> b/meta/recipes-devtools/go/go-1.17.inc
> >> > similarity index 85%
> >> > rename from meta/recipes-devtools/go/go-1.16.5.inc
> >> > rename to meta/recipes-devtools/go/go-1.17.inc
> >> > index 545aa0c828..6b412afe25 100644
> >> > --- a/meta/recipes-devtools/go/go-1.16.5.inc
> >> > +++ b/meta/recipes-devtools/go/go-1.17.inc
> >> > @@ -1,7 +1,7 @@
> >> >  require go-common.inc
> >> >
> >> > -GO_BASEVERSION = "1.16"
> >> > -PV = "1.16.5"
> >> > +GO_BASEVERSION = "1.17"
> >> > +PV = "1.17"
> >> >  FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
> >> >
> >> >  LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> >> > @@ -17,4 +17,4 @@ SRC_URI += "\
> >> >      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> >> >
> file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
> >> >  "
> >> > -SRC_URI[main.sha256sum] =
> "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
> >> > +SRC_URI[main.sha256sum] =
> "3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d"
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> >> > similarity index 80%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> >> > index 5f4823be22..8a833e05d3 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00
> 2001
> >> > +From 0e964d3ca3496beb4f3732abe501b50e262b6646 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >> >  Date: Wed, 23 Oct 2019 21:01:13 +0430
> >> >  Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
> >> > @@ -10,14 +10,15 @@ the meta/recipes-devtools/go tree by
> >> >  Matt Madison <matt@madison.systems>.
> >> >
> >> >  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> >> > -
> >> >  ---
> >> >   src/cmd/go/internal/envcmd/env.go | 4 ++--
> >> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> >> > +index 1553d26391..20d0587899 100644
> >> >  --- a/src/cmd/go/internal/envcmd/env.go
> >> >  +++ b/src/cmd/go/internal/envcmd/env.go
> >> > -@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
> >> > +@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {
> >> >
> >> >   cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> >> >   if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
> >> > @@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   }
> >> >   env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
> >> >   env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> >> > similarity index 80%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> >> > index 04d0e496c0..b78b6afa24 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00
> 2001
> >> > +From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >> >  Date: Wed, 23 Oct 2019 21:14:22 +0430
> >> >  Subject: [PATCH 2/9] cmd/go: make content-based hash generation less
> pedantic
> >> > @@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   src/cmd/go/internal/work/exec.go  | 66
> ++++++++++++++++++++++---------
> >> >   2 files changed, 49 insertions(+), 19 deletions(-)
> >> >
> >> > +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> >> > +index 20d0587899..ff6f0d810a 100644
> >> >  --- a/src/cmd/go/internal/envcmd/env.go
> >> >  +++ b/src/cmd/go/internal/envcmd/env.go
> >> > -@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> >> > +@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> >> >   func ExtraEnvVarsCostly() []cfg.EnvVar {
> >> >   var b work.Builder
> >> >   b.Init()
> >> > @@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   if err != nil {
> >> >   // Should not happen - b.CFlags was given an empty package.
> >> >   fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> >> > +diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> >> > +index 5a225fb9f1..a37872e7c7 100644
> >> >  --- a/src/cmd/go/internal/work/exec.go
> >> >  +++ b/src/cmd/go/internal/work/exec.go
> >> > -@@ -37,6 +37,8 @@ import (
> >> > +@@ -38,6 +38,8 @@ import (
> >> >   "cmd/go/internal/trace"
> >> >   )
> >> >
> >> > @@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   // actionList returns the list of actions in the dag rooted at root
> >> >   // as visited in a depth-first post-order traversal.
> >> >   func actionList(root *Action) []*Action {
> >> > -@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio
> >> > +@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >> >   // Assume b.WorkDir is being trimmed properly.
> >> >   // When -trimpath is used with a package built from the module
> cache,
> >> >   // use the module path and version instead of the directory.
> >> > @@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   fmt.Fprintf(h, "dir %s\n", p.Dir)
> >> >   } else if cfg.BuildTrimpath && p.Module != nil {
> >> >   fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
> >> > -@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio
> >> > +@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >> >   }
> >> > - if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> >> > + if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
> >> >   fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> >> >  - cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
> >> > -- fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags,
> ldflags)
> >> >  + cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
> >> > -+ fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags,
> cflags, ldflags)
> >> > - if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> >> > -- fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> >> > -+ fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
> >> > +
> >> > +- ccExe := b.ccExe()
> >> > ++ ccExe := b.ccExe(true)
> >> > + fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
> >> > + // Include the C compiler tool ID so that if the C
> >> > + // compiler changes we rebuild the package.
> >> > +@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >> > + }
> >> >   }
> >> > - if len(p.FFiles) > 0 {
> >> > -- fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> >> > -+ fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> >> > + if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> >> > +- cxxExe := b.cxxExe()
> >> > ++ cxxExe := b.cxxExe(true)
> >> > + fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
> >> > + if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
> >> > + fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> >> > + }
> >> >   }
> >> > - // TODO(rsc): Should we include the SWIG version or
> Fortran/GCC/G++/Objective-C compiler versions?
> >> > - }
> >> > -@@ -2401,33 +2403,48 @@ var (
> >> > + if len(p.FFiles) > 0 {
> >> > +- fcExe := b.fcExe()
> >> > ++ fcExe := b.fcExe(true)
> >> > + fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
> >> > + if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
> >> > + fmt.Fprintf(h, "FC ID=%q\n", fcID)
> >> > +@@ -2438,33 +2440,48 @@ var (
> >> >   // gccCmd returns a gcc command line prefix
> >> >   // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> >> >   func (b *Builder) GccCmd(incdir, workdir string) []string {
> >> > @@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   }
> >> >
> >> >   // compilerExe returns the compiler to use given an
> >> > -@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {
> >> > +@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
> >> >   // of the compiler but can have additional arguments if they
> >> >   // were present in the environment value.
> >> >   // For example if CC="gcc -DGOPHER" then the result is ["gcc",
> "-DGOPHER"].
> >> > @@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   return compiler
> >> >   }
> >> >
> >> > -@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {
> >> > +@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
> >> >   }
> >> >
> >> >   // CFlags returns the flags to use when invoking the C, C++ or
> Fortran compilers, or cgo.
> >> > @@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   defaults := "-g -O2"
> >> >
> >> >   if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS,
> checkCompilerFlags); err != nil {
> >> > -@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package
> >> > +@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> >> >   return
> >> >   }
> >> >
> >> > @@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   return
> >> >   }
> >> >
> >> > -@@ -2653,7 +2683,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> >> > +@@ -2700,7 +2730,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> >> >
> >> >   func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo,
> outObj []string, err error) {
> >> >   p := a.Package
> >> > @@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   if err != nil {
> >> >   return nil, nil, err
> >> >   }
> >> > -@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str
> >> > +@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> >> >
> >> >   // Run SWIG on one SWIG input file.
> >> >   func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir
> string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string,
> err error) {
> >> > @@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   if err != nil {
> >> >   return "", "", err
> >> >   }
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> >> > similarity index 78%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> >> > index 662c705471..e5d0ee90e2 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> >> > @@ -1,7 +1,8 @@
> >> > -From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00
> 2001
> >> > +From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:00:00
> 2001
> >> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >> >  Date: Wed, 23 Oct 2019 21:15:37 +0430
> >> > -Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> environment
> >> > +Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> >> > + environment
> >> >
> >> >  to allow for split host/target build roots
> >> >
> >> > @@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   src/cmd/go/internal/cfg/cfg.go | 6 +++++-
> >> >   2 files changed, 8 insertions(+), 2 deletions(-)
> >> >
> >> > +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> >> > +index bec17696f3..d82f612e75 100644
> >> >  --- a/src/cmd/dist/build.go
> >> >  +++ b/src/cmd/dist/build.go
> >> > -@@ -246,7 +246,9 @@ func xinit() {
> >> > - workdir = xworkdir()
> >> > +@@ -248,7 +248,9 @@ func xinit() {
> >> > + }
> >> >   xatexit(rmworkdir)
> >> >
> >> >  - tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> >> > @@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   }
> >> >
> >> >   // compilerEnv returns a map from "goos/goarch" to the
> >> > +diff --git a/src/cmd/go/internal/cfg/cfg.go
> b/src/cmd/go/internal/cfg/cfg.go
> >> > +index 57a3c1ff6f..825d8c70f2 100644
> >> >  --- a/src/cmd/go/internal/cfg/cfg.go
> >> >  +++ b/src/cmd/go/internal/cfg/cfg.go
> >> > -@@ -64,7 +64,11 @@ func defaultContext() build.Context {
> >> > +@@ -67,7 +67,11 @@ func defaultContext() build.Context {
> >> >   // variables. This matches the initialization of ToolDir in
> >> >   // go/build, except for using ctxt.GOROOT rather than
> >> >   // runtime.GOROOT.
> >> > @@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   }
> >> >
> >> >   ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> >> > similarity index 78%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> >> > index cd875f1164..bc5cabeca0 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00
> 2001
> >> > +From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >> >  Date: Wed, 23 Oct 2019 21:16:32 +0430
> >> >  Subject: [PATCH 4/9] ld: add soname to shareable objects
> >> > @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   src/cmd/link/internal/ld/lib.go | 3 +++
> >> >   1 file changed, 3 insertions(+)
> >> >
> >> > +diff --git a/src/cmd/link/internal/ld/lib.go
> b/src/cmd/link/internal/ld/lib.go
> >> > +index 644faeb2fb..5b7e48636e 100644
> >> >  --- a/src/cmd/link/internal/ld/lib.go
> >> >  +++ b/src/cmd/link/internal/ld/lib.go
> >> > -@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
> >> > +@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {
> >> >   argv = append(argv, "-Wl,-z,relro")
> >> >   }
> >> >   argv = append(argv, "-shared")
> >> > @@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   if ctxt.HeadType == objabi.Hwindows {
> >> >   if *flagAslr {
> >> >   argv = addASLRargs(argv)
> >> > -@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
> >> > +@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {
> >> >   argv = append(argv, "-Wl,-z,relro")
> >> >   }
> >> >   argv = append(argv, "-shared")
> >> > @@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   case BuildModePlugin:
> >> >   if ctxt.HeadType == objabi.Hdarwin {
> >> >   argv = append(argv, "-dynamiclib")
> >> > -@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
> >> > +@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {
> >> >   argv = append(argv, "-Wl,-z,relro")
> >> >   }
> >> >   argv = append(argv, "-shared")
> >> > @@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   }
> >> >   }
> >> >
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> >> > similarity index 76%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> >> > index 59c12d9546..a7d9932f4d 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00
> 2001
> >> > +From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >> >  Date: Wed, 23 Oct 2019 21:17:16 +0430
> >> >  Subject: [PATCH 5/9] make.bash: override CC when building dist and
> >> > @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   src/make.bash | 4 ++--
> >> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > +diff --git a/src/make.bash b/src/make.bash
> >> > +index 7986125a06..dd67029700 100755
> >> >  --- a/src/make.bash
> >> >  +++ b/src/make.bash
> >> > -@@ -178,7 +178,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
> >> > +@@ -181,7 +181,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
> >> >   exit 1
> >> >   fi
> >> >   rm -f cmd/dist/dist
> >> > @@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >
> >> >   # -e doesn't propagate out of eval, so check success by hand.
> >> >   eval $(./cmd/dist/dist env -p || echo FAIL=true)
> >> > -@@ -209,7 +209,7 @@ fi
> >> > +@@ -206,7 +206,7 @@ fi
> >> >   # Run dist bootstrap to complete make.bash.
> >> >   # Bootstrap installs a proper cmd/dist, built with the new
> toolchain.
> >> >   # Throw ours, built with Go 1.4, away after bootstrap.
> >> > --./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> >> > -+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag
> $GO_DISTFLAGS "$@"
> >> > +-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
> >> > ++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap -a $vflag
> $GO_DISTFLAGS "$@"
> >> >   rm -f ./cmd/dist/dist
> >> >
> >> >   # DO NOT ADD ANY NEW CODE HERE.
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> >> > similarity index 90%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> >> > index 7aee0bac43..e92cc9b28b 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00
> 2001
> >> > +From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >> >  Date: Wed, 23 Oct 2019 21:18:12 +0430
> >> >  Subject: [PATCH 6/9] cmd/dist: separate host and target builds
> >> > @@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   src/cmd/dist/build.go | 155
> ++++++++++++++++++++++++++++++------------
> >> >   1 file changed, 112 insertions(+), 43 deletions(-)
> >> >
> >> > +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> >> > +index d82f612e75..af24e01198 100644
> >> >  --- a/src/cmd/dist/build.go
> >> >  +++ b/src/cmd/dist/build.go
> >> > -@@ -41,6 +41,7 @@ var (
> >> > - goldflags        string
> >> > +@@ -43,6 +43,7 @@ var (
> >> > + goexperiment     string
> >> >   workdir          string
> >> >   tooldir          string
> >> >  + build_tooldir    string
> >> >   oldgoos          string
> >> >   oldgoarch        string
> >> >   exe              string
> >> > -@@ -53,6 +54,7 @@ var (
> >> > +@@ -55,6 +56,7 @@ var (
> >> >
> >> >   rebuildall   bool
> >> >   defaultclang bool
> >> > @@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >
> >> >   vflag int // verbosity
> >> >   )
> >> > -@@ -249,6 +251,8 @@ func xinit() {
> >> > +@@ -251,6 +253,8 @@ func xinit() {
> >> >   if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
> >> >   tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> >> >   }
> >> > @@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   }
> >> >
> >> >   // compilerEnv returns a map from "goos/goarch" to the
> >> > -@@ -480,8 +484,10 @@ func setup() {
> >> > +@@ -496,8 +500,10 @@ func setup() {
> >> >   p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
> >> >   if rebuildall {
> >> >   xremoveall(p)
> >> > @@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >
> >> >   if goos != gohostos || goarch != gohostarch {
> >> >   p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
> >> > -@@ -1244,12 +1250,29 @@ func cmdbootstrap() {
> >> > +@@ -1266,13 +1272,30 @@ func cmdbootstrap() {
> >> > + defer timelog("end", "dist bootstrap")
> >> >
> >> > - var noBanner bool
> >> > - var debug bool
> >> > + var noBanner, noClean bool
> >> >  + var hostOnly bool
> >> >  + var targetOnly bool
> >> >  + var toBuild = []string{"std", "cmd"}
> >> > -+
> >> > + var debug bool
> >> >   flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> >> >   flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap
> process")
> >> >   flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print
> banner")
> >> > + flag.BoolVar(&noClean, "no-clean", noClean, "print deprecation
> warning")
> >> >  + flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host
> binaries, not target")
> >> >  + flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only
> target binaries, not host")
> >> >
> >> >  - xflagparse(0)
> >> >  + xflagparse(-1)
> >> > -
> >> > ++
> >> >  + if hostOnly && targetOnly {
> >> >  + fatalf("specify only one of --host-only or --target-only\n")
> >> >  + }
> >> > @@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >  + fatalf("package names not permitted without --host-only or
> --target-only\n")
> >> >  + }
> >> >  + }
> >> > - // Set GOPATH to an internal directory. We shouldn't actually
> >> > - // need to store files here, since the toolchain won't
> >> > - // depend on modules outside of vendor directories, but if
> >> > -@@ -1303,8 +1326,13 @@ func cmdbootstrap() {
> >> > +
> >> > + if noClean {
> >> > + xprintf("warning: --no-clean is deprecated and has no effect; use
> 'go install std cmd' instead\n")
> >> > +@@ -1345,8 +1368,13 @@ func cmdbootstrap() {
> >> >   xprintf("\n")
> >> >   }
> >> >
> >> > @@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   goBootstrap := pathf("%s/go_bootstrap", tooldir)
> >> >   cmdGo := pathf("%s/go", gobin)
> >> >   if debug {
> >> > -@@ -1333,7 +1361,11 @@ func cmdbootstrap() {
> >> > +@@ -1375,7 +1403,11 @@ func cmdbootstrap() {
> >> >   xprintf("\n")
> >> >   }
> >> >   xprintf("Building Go toolchain2 using go_bootstrap and Go
> toolchain1.\n")
> >> > @@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >  + } else {
> >> >  + os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> >> >  + }
> >> > + // Now that cmd/go is in charge of the build process, enable
> GOEXPERIMENT.
> >> > + os.Setenv("GOEXPERIMENT", goexperiment)
> >> >   goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> >> > - if debug {
> >> > - run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir),
> "-V=full")
> >> > -@@ -1370,50 +1402,84 @@ func cmdbootstrap() {
> >> > +@@ -1414,50 +1446,84 @@ func cmdbootstrap() {
> >> >   }
> >> >   checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> >> >
> >> > @@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >  - timelog("build", "host toolchain")
> >> >  - if vflag > 0 {
> >> >  - xprintf("\n")
> >> > +- }
> >> > +- xprintf("Building packages and commands for host, %s/%s.\n", goos,
> goarch)
> >> >  +
> >> >  + if goos == oldgoos && goarch == oldgoarch {
> >> >  + // Common case - not setting up for cross-compilation.
> >> > @@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >  + os.Setenv("GOARCH", goarch)
> >> >  + os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> >> >  + xprintf("Building packages and commands for target, %s/%s.\n",
> goos, goarch)
> >> > - }
> >> > -- xprintf("Building packages and commands for host, %s/%s.\n", goos,
> goarch)
> >> > ++ }
> >> >   goInstall(goBootstrap, "std", "cmd")
> >> >   checkNotStale(goBootstrap, "std", "cmd")
> >> >   checkNotStale(cmdGo, "std", "cmd")
> >> > @@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >  - timelog("build", "target toolchain")
> >> >  - if vflag > 0 {
> >> >  - xprintf("\n")
> >> > -- }
> >> > ++ if debug {
> >> > ++ run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir),
> "-V=full")
> >> > ++ run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir),
> pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> >> > ++ checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> >> > ++ copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile",
> tooldir), writeExec)
> >> > + }
> >> >  - goos = oldgoos
> >> >  - goarch = oldgoarch
> >> >  - os.Setenv("GOOS", goos)
> >> > @@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >  - run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir),
> pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> >> >  - checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> >> >  - copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile",
> tooldir), writeExec)
> >> > -+ if debug {
> >> > -+ run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir),
> "-V=full")
> >> > -+ run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir),
> pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> >> > -+ checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> >> > -+ copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile",
> tooldir), writeExec)
> >> > -+ }
> >> >   }
> >> >
> >> >   // Check that there are no new files in $GOROOT/bin other than
> >> > -@@ -1430,8 +1496,11 @@ func cmdbootstrap() {
> >> > +@@ -1474,8 +1540,11 @@ func cmdbootstrap() {
> >> >   }
> >> >   }
> >> >
> >> > @@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >
> >> >   if goos == "android" {
> >> >   // Make sure the exec wrapper will sync a fresh $GOROOT to the
> device.
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> >> > similarity index 78%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> >> > index 4b4d0d4f3d..d522512699 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00
> 2001
> >> > +From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >> >  Date: Wed, 23 Oct 2019 21:18:56 +0430
> >> >  Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
> >> > @@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
> >> >   3 files changed, 34 insertions(+)
> >> >
> >> > +diff --git a/src/cmd/go/internal/work/action.go
> b/src/cmd/go/internal/work/action.go
> >> > +index 69940cb001..b0c1667def 100644
> >> >  --- a/src/cmd/go/internal/work/action.go
> >> >  +++ b/src/cmd/go/internal/work/action.go
> >> > -@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
> >> > +@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1
> *Action, shlib string) {
> >> >   if p1 == nil || p1.Shlib == "" ||
> haveShlib[filepath.Base(p1.Shlib)] {
> >> >   continue
> >> >   }
> >> > @@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   haveShlib[filepath.Base(p1.Shlib)] = true
> >> >   // TODO(rsc): The use of ModeInstall here is suspect, but if we
> only do ModeBuild,
> >> >   // we'll end up building an overall library or executable that
> depends at runtime
> >> > +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> >> > +index 0ed2389cd5..c3f8a82880 100644
> >> >  --- a/src/cmd/go/internal/work/build.go
> >> >  +++ b/src/cmd/go/internal/work/build.go
> >> > -@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
> >> > +@@ -189,6 +189,8 @@ See also: go install, go get, go clean.
> >> >
> >> >   const concurrentGCBackendCompilationEnabledByDefault = true
> >> >
> >> > @@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   func init() {
> >> >   // break init cycle
> >> >   CmdBuild.Run = runBuild
> >> > -@@ -179,6 +181,10 @@ func init() {
> >> > +@@ -201,6 +203,10 @@ func init() {
> >> >
> >> >   AddBuildFlags(CmdBuild, DefaultBuildFlags)
> >> >   AddBuildFlags(CmdInstall, DefaultBuildFlags)
> >> > @@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   }
> >> >
> >> >   // Note that flags consulted by other parts of the code
> >> > +diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> >> > +index a37872e7c7..f4e83b97e2 100644
> >> >  --- a/src/cmd/go/internal/work/exec.go
> >> >  +++ b/src/cmd/go/internal/work/exec.go
> >> > -@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
> >> > +@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Context, a
> *Action) (err error) {
> >> >   return errors.New("binary-only packages are no longer supported")
> >> >   }
> >> >
> >> > @@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   if err := b.Mkdir(a.Objdir); err != nil {
> >> >   return err
> >> >   }
> >> > -@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
> >> > +@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx
> context.Context, a *Action) (err error) {
> >> >   return err
> >> >   }
> >> >
> >> > @@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   if err := b.Mkdir(a.Objdir); err != nil {
> >> >   return err
> >> >   }
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> >> > similarity index 84%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> >> > index 4e5d5021d6..9a1bce809c 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> >> > @@ -1,4 +1,4 @@
> >> > -From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00
> 2001
> >> > +From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:00:00
> 2001
> >> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >> >  Date: Wed, 23 Oct 2019 21:19:26 +0430
> >> >  Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
> >> > @@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   src/cmd/go/internal/work/build.go | 8 +++++++-
> >> >   1 file changed, 7 insertions(+), 1 deletion(-)
> >> >
> >> > +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> >> > +index c3f8a82880..23d1aa4836 100644
> >> >  --- a/src/cmd/go/internal/work/build.go
> >> >  +++ b/src/cmd/go/internal/work/build.go
> >> > -@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
> >> > +@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, mask
> BuildFlagMask) {
> >> >
> >> >   cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
> >> >   cmd.Flag.Var(buildCompiler{}, "compiler", "")
> >> > @@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >> >   cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
> >> >   cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
> >> >   if mask&OmitModFlag == 0 {
> >> > +--
> >> > +2.25.1
> >> > +
> >> > diff --git
> a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> >> > similarity index 75%
> >> > rename from
> meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> >> > rename to
> meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> >> > index dcbdf58752..f8bd491f93 100644
> >> > ---
> a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> >> > +++
> b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> >> > @@ -1,7 +1,7 @@
> >> > -From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00
> 2001
> >> > +From c5f3c1aa77753254586c0c8a6893862ae97eabe1 Mon Sep 17 00:00:00
> 2001
> >> >  From: Khem Raj <raj.khem@gmail.com>
> >> >  Date: Mon, 22 Feb 2021 17:54:01 -0800
> >> > -Subject: [PATCH] Revert "cmd/go: make sure CC and CXX are absolute"
> >> > +Subject: [PATCH 9/9] Revert "cmd/go: make sure CC and CXX are
> absolute"
> >> >
> >> >  OE uses CC/CXX values which consists of cmpiler and options together,
> >> >  secondly, the environment is canned so this check add little value
> to OE
> >> > @@ -16,47 +16,44 @@ This reverts commit
> aa161e799df7e1eba99d2be10271e76b6f758142.
> >> >  Upstream-Status: Inappropriate [OE-Specific]
> >> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >  ---
> >> > - src/cmd/go/internal/envcmd/env.go        |  5 -----
> >> > + src/cmd/go/internal/envcmd/env.go        |  2 +-
> >> >   src/cmd/go/internal/work/init.go         |  7 -------
> >> >   src/cmd/go/testdata/script/env_write.txt | 24
> ------------------------
> >> > - 3 files changed, 36 deletions(-)
> >> > + 3 files changed, 1 insertion(+), 32 deletions(-)
> >> >
> >> >  diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> >> > -index 6937187522..29f9057c3f 100644
> >> > +index ff6f0d810a..ca0494b5d4 100644
> >> >  --- a/src/cmd/go/internal/envcmd/env.go
> >> >  +++ b/src/cmd/go/internal/envcmd/env.go
> >> > -@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {
> >> > - if !filepath.IsAbs(val) && val != "" {
> >> > +@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) error {
> >> >   return fmt.Errorf("GOPATH entry is relative; must be absolute path:
> %q", val)
> >> >   }
> >> > -- // Make sure CC and CXX are absolute paths
> >> > -- case "CC", "CXX":
> >> > -- if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
> >> > -- return fmt.Errorf("%s entry is relative; must be absolute path:
> %q", key, val)
> >> > -- }
> >> > - }
> >> > -
> >> > - if !utf8.ValidString(val) {
> >> > + // Make sure CC and CXX are absolute paths
> >> > +- case "CC", "CXX", "GOMODCACHE":
> >> > ++ case "GOMODCACHE":
> >> > + if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
> >> > + return fmt.Errorf("%s entry is relative; must be absolute path:
> %q", key, val)
> >> > + }
> >> >  diff --git a/src/cmd/go/internal/work/init.go
> b/src/cmd/go/internal/work/init.go
> >> > -index ba7c7c2fbb..3a6df5f758 100644
> >> > +index 37a3e2d0ff..e529cc2917 100644
> >> >  --- a/src/cmd/go/internal/work/init.go
> >> >  +++ b/src/cmd/go/internal/work/init.go
> >> > -@@ -41,13 +41,6 @@ func BuildInit() {
> >> > +@@ -38,13 +38,6 @@ func BuildInit() {
> >> > + }
> >> >   cfg.BuildPkgdir = p
> >> >   }
> >> > -
> >> > +-
> >> >  - // Make sure CC and CXX are absolute paths
> >> >  - for _, key := range []string{"CC", "CXX"} {
> >> >  - if path := cfg.Getenv(key); !filepath.IsAbs(path) && path != "" &&
> path != filepath.Base(path) {
> >> >  - base.Fatalf("go %s: %s environment variable is relative; must be
> absolute path: %s\n", flag.Args()[0], key, path)
> >> >  - }
> >> >  - }
> >> > --
> >> > - // For each experiment that has been enabled in the toolchain,
> define a
> >> > - // build tag with the same name but prefixed by "goexperiment."
> which can be
> >> > - // used for compiling alternative files for the experiment. This
> allows
> >> > + }
> >> > +
> >> > + func instrumentInit() {
> >> >  diff --git a/src/cmd/go/testdata/script/env_write.txt
> b/src/cmd/go/testdata/script/env_write.txt
> >> > -index bda1e57826..c99aadb7f2 100644
> >> > +index b5e9739167..566c876658 100644
> >> >  --- a/src/cmd/go/testdata/script/env_write.txt
> >> >  +++ b/src/cmd/go/testdata/script/env_write.txt
> >> >  @@ -129,30 +129,6 @@ go env -w GOTMPDIR=
> >> > @@ -91,5 +88,5 @@ index bda1e57826..c99aadb7f2 100644
> >> >   env GOOS=
> >> >   env GOARCH=
> >> >  --
> >> > -2.30.1
> >> > +2.25.1
> >> >
> >> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> >> > similarity index 83%
> >> > rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> >> > rename to meta/recipes-devtools/go/go-binary-native_1.17.bb
> >> > index b3e2b6a60e..2b3db17d3b 100644
> >> > --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> >> > +++ b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> >> > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> >> >  PROVIDES = "go-native"
> >> >
> >> >  SRC_URI = "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}
> "
> >> > -SRC_URI[go_linux_amd64.sha256sum] =
> "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
> >> > -SRC_URI[go_linux_arm64.sha256sum] =
> "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
> >> > +SRC_URI[go_linux_amd64.sha256sum] =
> "6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d"
> >> > +SRC_URI[go_linux_arm64.sha256sum] =
> "01a9af009ada22122d3fcb9816049c1d21842524b38ef5d5a0e2ee4b26d7c3e7"
> >> >
> >> >  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
> >> >  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> >> > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> >> > rename to meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> >> > diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb
> b/meta/recipes-devtools/go/go-cross_1.17.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
> >> > rename to meta/recipes-devtools/go/go-cross_1.17.bb
> >> > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.17.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> >> > rename to meta/recipes-devtools/go/go-crosssdk_1.17.bb
> >> > diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb
> b/meta/recipes-devtools/go/go-native_1.17.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-native_1.16.5.bb
> >> > rename to meta/recipes-devtools/go/go-native_1.17.bb
> >> > diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb
> b/meta/recipes-devtools/go/go-runtime_1.17.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
> >> > rename to meta/recipes-devtools/go/go-runtime_1.17.bb
> >> > diff --git a/meta/recipes-devtools/go/go_1.16.5.bb
> b/meta/recipes-devtools/go/go_1.17.bb
> >> > similarity index 100%
> >> > rename from meta/recipes-devtools/go/go_1.16.5.bb
> >> > rename to meta/recipes-devtools/go/go_1.17.bb
> >> >
> >> >
> >> >
> >> >
> >> >
> >> >
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >>
> >> 
> >>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--000000000000cb950a05ca670fd6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 25 Aug 2021 at 21:05, Bruce Ashfield &lt;<a href=3D"mailto:b=
ruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Let&#39;s agree to disagre=
e. Anyone doing toolchain work, needs to have an<br>
extra level of caution.<br>
<br>
I&#39;m constantly dealing with kernel issues and tightly coupled<br>
applications in all layers that have nothing in core. I don&#39;t simply<br=
>
tell people &quot;go test it yourself&quot;.<br></blockquote><div><br></div=
><div>In that case, apologies, but you do need to be more clear in your req=
uest. Specifically tell what layers should be taken into the build, and wha=
t kind of testing, exactly, needs to be performed with them. Otherwise, you=
&#39;re just going to scare oe-core contributors away.</div><div><br></div>=
<div>Alex<br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt; That said, I agree that it&#39;s a bit late to place this into oe-core=
 now, and it&#39;s best to stash this until the start of the next cycle.<br=
>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Sakib<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 2021-08-25 1:20 p.m., Sakib Sajal wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; go 1.17 includes small enhancements to the language.<br>
&gt;&gt; &gt; Release notes: <a href=3D"https://golang.org/doc/go1.17" rel=
=3D"noreferrer" target=3D"_blank">https://golang.org/doc/go1.17</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@=
windriver.com" target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
&gt;&gt; &gt;=C2=A0 .../go/{go-1.16.5.inc =3D&gt; go-1.17.inc}=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
&gt;&gt; &gt;=C2=A0 ...ow-CC-and-CXX-to-have-multiple-words.patch | 10 ++-<=
br>
&gt;&gt; &gt;=C2=A0 ...ent-based-hash-generation-less-pedan.patch | 62 ++++=
+++++++-------<br>
&gt;&gt; &gt;=C2=A0 ...-to-be-overridden-in-the-environment.patch | 18 ++++=
--<br>
&gt;&gt; &gt;=C2=A0 ...4-ld-add-soname-to-shareable-objects.patch | 13 ++--=
<br>
&gt;&gt; &gt;=C2=A0 ...de-CC-when-building-dist-and-go_boot.patch | 15 +++-=
-<br>
&gt;&gt; &gt;=C2=A0 ...dist-separate-host-and-target-builds.patch | 64 ++++=
++++++---------<br>
&gt;&gt; &gt;=C2=A0 ...d-go-make-GOROOT-precious-by-default.patch | 21 ++++=
--<br>
&gt;&gt; &gt;=C2=A0 ...008-use-GOBUILDMODE-to-set-buildmode.patch |=C2=A0 9=
 ++-<br>
&gt;&gt; &gt;=C2=A0 ...go-make-sure-CC-and-CXX-are-absolute.patch | 45 ++++=
++-------<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://ive_1.16.5.bb" rel=3D"noreferrer" =
target=3D"_blank">ive_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-binary-nat=
ive_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb<=
/a>} |=C2=A0 4 +-<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://an_1.16.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">an_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-cross-canadi=
an_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.bb<=
/a>} |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 .../{<a href=3D"http://go-cross_1.16.5.bb" rel=3D"noref=
errer" target=3D"_blank">go-cross_1.16.5.bb</a> =3D&gt; <a href=3D"http://g=
o-cross_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.17.bb</a>}=
=C2=A0 |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://crosssdk_1.16.5.bb" rel=3D"norefer=
rer" target=3D"_blank">crosssdk_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-=
crosssdk_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.17.bb<=
/a>} |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 ...{<a href=3D"http://go-native_1.16.5.bb" rel=3D"noref=
errer" target=3D"_blank">go-native_1.16.5.bb</a> =3D&gt; <a href=3D"http://=
go-native_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.17.bb</=
a>} |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 ...<a href=3D"http://o-runtime_1.16.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">o-runtime_1.16.5.bb</a> =3D&gt; <a href=3D"http://g=
o-runtime_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.17.bb<=
/a>} |=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 .../go/{<a href=3D"http://go_1.16.5.bb" rel=3D"noreferr=
er" target=3D"_blank">go_1.16.5.bb</a> =3D&gt; <a href=3D"http://go_1.17.bb=
" rel=3D"noreferrer" target=3D"_blank">go_1.17.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 0<br>
&gt;&gt; &gt;=C2=A0 18 files changed, 163 insertions(+), 106 deletions(-)<b=
r>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16.5.inc =3D&gt; =
go-1.17.inc} (85%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (80%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (80%)<br=
>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (78%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0004-ld-add-soname-to-shareable-objects.patch (78%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (76%)<br=
>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0006-cmd-dist-separate-host-and-target-builds.patch (90%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0007-cmd-go-make-GOROOT-precious-by-default.patch (78%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0008-use-GOBUILDMODE-to-set-buildmode.patch (84%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.1=
7}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-b=
inary-native_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-nati=
ve_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.17.bb" rel=3D=
"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a>} (83%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-c=
ross-canadian_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-cana=
dian_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.17.bb" rel=
=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-c=
ross_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a>=
 =3D&gt; <a href=3D"http://go-cross_1.17.bb" rel=3D"noreferrer" target=3D"_=
blank">go-cross_1.17.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-c=
rosssdk_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.=
bb</a> =3D&gt; <a href=3D"http://go-crosssdk_1.17.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">go-crosssdk_1.17.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-n=
ative_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</=
a> =3D&gt; <a href=3D"http://go-native_1.17.bb" rel=3D"noreferrer" target=
=3D"_blank">go-native_1.17.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-r=
untime_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb=
</a> =3D&gt; <a href=3D"http://go-runtime_1.17.bb" rel=3D"noreferrer" targe=
t=3D"_blank">go-runtime_1.17.bb</a>} (100%)<br>
&gt;&gt; &gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go_1=
.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a> =3D&gt; <a =
href=3D"http://go_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go_1.17.bb<=
/a>} (100%)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/me=
ta/conf/distro/include/tcmode-default.inc<br>
&gt;&gt; &gt; index 47f23f5c39..5b8a532943 100644<br>
&gt;&gt; &gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt;&gt; &gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt;&gt; &gt; @@ -23,7 +23,7 @@ GDBVERSION ?=3D &quot;10.%&quot;<br>
&gt;&gt; &gt;=C2=A0 GLIBCVERSION ?=3D &quot;2.34&quot;<br>
&gt;&gt; &gt;=C2=A0 LINUXLIBCVERSION ?=3D &quot;5.13%&quot;<br>
&gt;&gt; &gt;=C2=A0 QEMUVERSION ?=3D &quot;6.0%&quot;<br>
&gt;&gt; &gt; -GOVERSION ?=3D &quot;1.16%&quot;<br>
&gt;&gt; &gt; +GOVERSION ?=3D &quot;1.17%&quot;<br>
&gt;&gt; &gt;=C2=A0 # This can not use wildcards like 8.0.% since it is als=
o used in mesa to denote<br>
&gt;&gt; &gt;=C2=A0 # llvm version being used, so always bump it with llvm =
recipe version bump<br>
&gt;&gt; &gt;=C2=A0 LLVMVERSION ?=3D &quot;12.0.1&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/re=
cipes-devtools/go/go-1.17.inc<br>
&gt;&gt; &gt; similarity index 85%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16.5.inc<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17.inc<br>
&gt;&gt; &gt; index 545aa0c828..6b412afe25 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16.5.inc<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17.inc<br>
&gt;&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt;&gt; &gt;=C2=A0 require go-common.inc<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -GO_BASEVERSION =3D &quot;1.16&quot;<br>
&gt;&gt; &gt; -PV =3D &quot;1.16.5&quot;<br>
&gt;&gt; &gt; +GO_BASEVERSION =3D &quot;1.17&quot;<br>
&gt;&gt; &gt; +PV =3D &quot;1.17&quot;<br>
&gt;&gt; &gt;=C2=A0 FILESEXTRAPATHS:prepend :=3D &quot;${FILE_DIRNAME}/go-$=
{GO_BASEVERSION}:&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950e=
cb7b26d2c5e4e7b4e0dd74707&quot;<br>
&gt;&gt; &gt; @@ -17,4 +17,4 @@ SRC_URI +=3D &quot;\<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://0008-use-GOBUILDMODE-to-set-buildm=
ode.patch \<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 file://0009-Revert-cmd-go-make-sure-CC-an=
d-CXX-are-absolute.patch \<br>
&gt;&gt; &gt;=C2=A0 &quot;<br>
&gt;&gt; &gt; -SRC_URI[main.sha256sum] =3D &quot;7bfa7e5908c7cc9e75da5ddf30=
66d7cbcf3fd9fa51945851325eebc17f50ba80&quot;<br>
&gt;&gt; &gt; +SRC_URI[main.sha256sum] =3D &quot;3a70e5055509f347c0fb831ca0=
7a2bf3b531068f349b14a3c652e9b5b67beb5d&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-a=
nd-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.17/0001=
-allow-CC-and-CXX-to-have-multiple-words.patch<br>
&gt;&gt; &gt; similarity index 80%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0001-allow-CC-an=
d-CXX-to-have-multiple-words.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-=
CXX-to-have-multiple-words.patch<br>
&gt;&gt; &gt; index 5f4823be22..8a833e05d3 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-=
to-have-multiple-words.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-=
to-have-multiple-words.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From 0e964d3ca3496beb4f3732abe501b50e262b6646 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Wed, 23 Oct 2019 21:01:13 +0430<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have m=
ultiple words<br>
&gt;&gt; &gt; @@ -10,14 +10,15 @@ the meta/recipes-devtools/go tree by<br>
&gt;&gt; &gt;=C2=A0 Matt Madison &lt;matt@madison.systems&gt;.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt;=C2=A0 ---<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/go/internal/envcmd/env.go | 4 ++--<br>
&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/=
internal/envcmd/env.go<br>
&gt;&gt; &gt; +index 1553d26391..20d0587899 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/envcmd/env.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/envcmd/env.go<br>
&gt;&gt; &gt; -@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {<br>
&gt;&gt; &gt; +@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if env :=3D strings.Fields(cfg.Getenv(&quot;CC&qu=
ot;)); len(env) &gt; 0 {<br>
&gt;&gt; &gt; @@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;AR&quo=
t;, Value: envOr(&quot;AR&quot;, &quot;ar&quot;)})<br>
&gt;&gt; &gt;=C2=A0 =C2=A0env =3D append(env, cfg.EnvVar{Name: &quot;CC&quo=
t;, Value: cc})<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-mak=
e-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go=
/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch<br=
>
&gt;&gt; &gt; similarity index 80%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0002-cmd-go-make=
-content-based-hash-generation-less-pedan.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-c=
ontent-based-hash-generation-less-pedan.patch<br>
&gt;&gt; &gt; index 04d0e496c0..b78b6afa24 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-conte=
nt-based-hash-generation-less-pedan.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-conte=
nt-based-hash-generation-less-pedan.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Wed, 23 Oct 2019 21:14:22 +0430<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH 2/9] cmd/go: make content-based hash ge=
neration less pedantic<br>
&gt;&gt; &gt; @@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/go/internal/work/exec.go=C2=A0 | 66 +++++=
+++++++++++++++++---------<br>
&gt;&gt; &gt;=C2=A0 =C2=A02 files changed, 49 insertions(+), 19 deletions(-=
)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/=
internal/envcmd/env.go<br>
&gt;&gt; &gt; +index 20d0587899..ff6f0d810a 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/envcmd/env.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/envcmd/env.go<br>
&gt;&gt; &gt; -@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {<br>
&gt;&gt; &gt; +@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0func ExtraEnvVarsCostly() []cfg.EnvVar {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0var b work.Builder<br>
&gt;&gt; &gt;=C2=A0 =C2=A0b.Init()<br>
&gt;&gt; &gt; @@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if err !=3D nil {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// Should not happen - b.CFlags was given an empt=
y package.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0fmt.Fprintf(os.Stderr, &quot;go: invalid cflags: =
%v\n&quot;, err)<br>
&gt;&gt; &gt; +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/i=
nternal/work/exec.go<br>
&gt;&gt; &gt; +index 5a225fb9f1..a37872e7c7 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/work/exec.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/work/exec.go<br>
&gt;&gt; &gt; -@@ -37,6 +37,8 @@ import (<br>
&gt;&gt; &gt; +@@ -38,6 +38,8 @@ import (<br>
&gt;&gt; &gt;=C2=A0 =C2=A0&quot;cmd/go/internal/trace&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// actionList returns the list of actions in the =
dag rooted at root<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// as visited in a depth-first post-order travers=
al.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0func actionList(root *Action) []*Action {<br>
&gt;&gt; &gt; -@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio=
<br>
&gt;&gt; &gt; +@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Actio=
n) cache.ActionID {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// Assume b.WorkDir is being trimmed properly.<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A0// When -trimpath is used with a package built fr=
om the module cache,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// use the module path and version instead of the=
 directory.<br>
&gt;&gt; &gt; @@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0fmt.Fprintf(h, &quot;dir %s\n&quot;, p.Dir)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0} else if cfg.BuildTrimpath &amp;&amp; p.Module !=
=3D nil {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0fmt.Fprintf(h, &quot;module %s@%s\n&quot;, p.Modu=
le.Path, p.Module.Version)<br>
&gt;&gt; &gt; -@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Act=
io<br>
&gt;&gt; &gt; +@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Actio=
n) cache.ActionID {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - if len(p.CgoFiles)+len(p.SwigFiles) &gt; 0 {<br>
&gt;&gt; &gt; + if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) &gt=
; 0 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0fmt.Fprintf(h, &quot;cgo %q\n&quot;, b.toolID(&qu=
ot;cgo&quot;))<br>
&gt;&gt; &gt;=C2=A0 - cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D b=
.CFlags(p)<br>
&gt;&gt; &gt; -- fmt.Fprintf(h, &quot;CC=3D%q %q %q %q\n&quot;, b.ccExe(), =
cppflags, cflags, ldflags)<br>
&gt;&gt; &gt;=C2=A0 + cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D b=
.CFlags(p, true)<br>
&gt;&gt; &gt; -+ fmt.Fprintf(h, &quot;CC=3D%q %q %q %q\n&quot;, b.ccExe(tru=
e), cppflags, cflags, ldflags)<br>
&gt;&gt; &gt; - if len(p.CXXFiles)+len(p.SwigFiles) &gt; 0 {<br>
&gt;&gt; &gt; -- fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(), cxxf=
lags)<br>
&gt;&gt; &gt; -+ fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(true), =
cxxflags)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +- ccExe :=3D b.ccExe()<br>
&gt;&gt; &gt; ++ ccExe :=3D b.ccExe(true)<br>
&gt;&gt; &gt; + fmt.Fprintf(h, &quot;CC=3D%q %q %q %q\n&quot;, ccExe, cppfl=
ags, cflags, ldflags)<br>
&gt;&gt; &gt; + // Include the C compiler tool ID so that if the C<br>
&gt;&gt; &gt; + // compiler changes we rebuild the package.<br>
&gt;&gt; &gt; +@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Act=
ion) cache.ActionID {<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - if len(p.FFiles) &gt; 0 {<br>
&gt;&gt; &gt; -- fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(), fflags=
)<br>
&gt;&gt; &gt; -+ fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(true), ff=
lags)<br>
&gt;&gt; &gt; + if len(p.CXXFiles)+len(p.SwigCXXFiles) &gt; 0 {<br>
&gt;&gt; &gt; +- cxxExe :=3D b.cxxExe()<br>
&gt;&gt; &gt; ++ cxxExe :=3D b.cxxExe(true)<br>
&gt;&gt; &gt; + fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, cxxExe, cxxflags)=
<br>
&gt;&gt; &gt; + if cxxID, err :=3D b.gccToolID(cxxExe[0], &quot;c++&quot;);=
 err =3D=3D nil {<br>
&gt;&gt; &gt; + fmt.Fprintf(h, &quot;CXX ID=3D%q\n&quot;, cxxID)<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; - // TODO(rsc): Should we include the SWIG version or Fortran=
/GCC/G++/Objective-C compiler versions?<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -@@ -2401,33 +2403,48 @@ var (<br>
&gt;&gt; &gt; + if len(p.FFiles) &gt; 0 {<br>
&gt;&gt; &gt; +- fcExe :=3D b.fcExe()<br>
&gt;&gt; &gt; ++ fcExe :=3D b.fcExe(true)<br>
&gt;&gt; &gt; + fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, fcExe, fflags)<br>
&gt;&gt; &gt; + if fcID, err :=3D b.gccToolID(fcExe[0], &quot;f95&quot;); e=
rr =3D=3D nil {<br>
&gt;&gt; &gt; + fmt.Fprintf(h, &quot;FC ID=3D%q\n&quot;, fcID)<br>
&gt;&gt; &gt; +@@ -2438,33 +2440,48 @@ var (<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// gccCmd returns a gcc command line prefix<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// defaultCC is defined in zdefaultcc.go, written=
 by cmd/dist.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0func (b *Builder) GccCmd(incdir, workdir string) =
[]string {<br>
&gt;&gt; &gt; @@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// compilerExe returns the compiler to use given =
an<br>
&gt;&gt; &gt; -@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {=
<br>
&gt;&gt; &gt; +@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// of the compiler but can have additional argume=
nts if they<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// were present in the environment value.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// For example if CC=3D&quot;gcc -DGOPHER&quot; t=
hen the result is [&quot;gcc&quot;, &quot;-DGOPHER&quot;].<br>
&gt;&gt; &gt; @@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return compiler<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -@@ -2620,7 +2642,7 @@ func envList(key, def string) []string=
 {<br>
&gt;&gt; &gt; +@@ -2667,7 +2689,7 @@ func envList(key, def string) []string=
 {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// CFlags returns the flags to use when invoking =
the C, C++ or Fortran compilers, or cgo.<br>
&gt;&gt; &gt; @@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0defaults :=3D &quot;-g -O2&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if cppflags, err =3D buildFlags(&quot;CPPFLAGS&qu=
ot;, &quot;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err !=3D nil {<br>
&gt;&gt; &gt; -@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Pack=
age<br>
&gt;&gt; &gt; +@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Pack=
age) (cppflags, cflags, cxxflags, fflags, l<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -@@ -2653,7 +2683,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)=
<br>
&gt;&gt; &gt; +@@ -2700,7 +2730,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0func (b *Builder) cgo(a *Action, cgoExe, objdir s=
tring, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []=
string) (outGo, outObj []string, err error) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0p :=3D a.Package<br>
&gt;&gt; &gt; @@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if err !=3D nil {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return nil, nil, err<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir s=
tr<br>
&gt;&gt; &gt; +@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir s=
tring) (intsize string, err error) {<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// Run SWIG on one SWIG input file.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0func (b *Builder) swigOne(a *Action, p *load.Pack=
age, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (o=
utGo, outC string, err error) {<br>
&gt;&gt; &gt; @@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if err !=3D nil {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return &quot;&quot;, &quot;&quot;, err<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTO=
OLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/=
go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch<br>
&gt;&gt; &gt; similarity index 78%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0003-allow-GOTOO=
LDIR-to-be-overridden-in-the-environment.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLD=
IR-to-be-overridden-in-the-environment.patch<br>
&gt;&gt; &gt; index 662c705471..e5d0ee90e2 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-t=
o-be-overridden-in-the-environment.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-t=
o-be-overridden-in-the-environment.patch<br>
&gt;&gt; &gt; @@ -1,7 +1,8 @@<br>
&gt;&gt; &gt; -From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Wed, 23 Oct 2019 21:15:37 +0430<br>
&gt;&gt; &gt; -Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridde=
n in the environment<br>
&gt;&gt; &gt; +Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridde=
n in the<br>
&gt;&gt; &gt; + environment<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 to allow for split host/target build roots<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/go/internal/cfg/cfg.go | 6 +++++-<br>
&gt;&gt; &gt;=C2=A0 =C2=A02 files changed, 8 insertions(+), 2 deletions(-)<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<b=
r>
&gt;&gt; &gt; +index bec17696f3..d82f612e75 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/dist/build.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/dist/build.go<br>
&gt;&gt; &gt; -@@ -246,7 +246,9 @@ func xinit() {<br>
&gt;&gt; &gt; - workdir =3D xworkdir()<br>
&gt;&gt; &gt; +@@ -248,7 +248,9 @@ func xinit() {<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0xatexit(rmworkdir)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 - tooldir =3D pathf(&quot;%s/pkg/tool/%s_%s&quot;, goro=
ot, gohostos, gohostarch)<br>
&gt;&gt; &gt; @@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// compilerEnv returns a map from &quot;goos/goar=
ch&quot; to the<br>
&gt;&gt; &gt; +diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/int=
ernal/cfg/cfg.go<br>
&gt;&gt; &gt; +index 57a3c1ff6f..825d8c70f2 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/cfg/cfg.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/cfg/cfg.go<br>
&gt;&gt; &gt; -@@ -64,7 +64,11 @@ func defaultContext() build.Context {<br>
&gt;&gt; &gt; +@@ -67,7 +67,11 @@ func defaultContext() build.Context {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// variables. This matches the initialization of =
ToolDir in<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// go/build, except for using ctxt.GOROOT rather =
than<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// runtime.GOROOT.<br>
&gt;&gt; &gt; @@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ctxt.GOPATH =3D envOr(&quot;GOPATH&quot;, ctxt.GO=
PATH)<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0004-ld-add-son=
ame-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.17/0004-ld-a=
dd-soname-to-shareable-objects.patch<br>
&gt;&gt; &gt; similarity index 78%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0004-ld-add-sona=
me-to-shareable-objects.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0004-ld-add-soname=
-to-shareable-objects.patch<br>
&gt;&gt; &gt; index cd875f1164..bc5cabeca0 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-=
shareable-objects.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-=
shareable-objects.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Wed, 23 Oct 2019 21:16:32 +0430<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH 4/9] ld: add soname to shareable object=
s<br>
&gt;&gt; &gt; @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/link/internal/ld/lib.go | 3 +++<br>
&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/=
internal/ld/lib.go<br>
&gt;&gt; &gt; +index 644faeb2fb..5b7e48636e 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/link/internal/ld/lib.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/link/internal/ld/lib.go<br>
&gt;&gt; &gt; -@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;&gt; &gt; +@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
&gt;&gt; &gt; @@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if ctxt.HeadType =3D=3D objabi.Hwindows {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if *flagAslr {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0argv =3D addASLRargs(argv)<br>
&gt;&gt; &gt; -@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;&gt; &gt; +@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
&gt;&gt; &gt; @@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0case BuildModePlugin:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if ctxt.HeadType =3D=3D objabi.Hdarwin {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-dynamiclib&quot;)<br=
>
&gt;&gt; &gt; -@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;&gt; &gt; +@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<b=
r>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
&gt;&gt; &gt; @@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0005-make.bash-=
override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go=
/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch<br=
>
&gt;&gt; &gt; similarity index 76%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0005-make.bash-o=
verride-CC-when-building-dist-and-go_boot.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0005-make.bash-ove=
rride-CC-when-building-dist-and-go_boot.patch<br>
&gt;&gt; &gt; index 59c12d9546..a7d9932f4d 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0005-make.bash-overrid=
e-CC-when-building-dist-and-go_boot.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0005-make.bash-overrid=
e-CC-when-building-dist-and-go_boot.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Wed, 23 Oct 2019 21:17:16 +0430<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH 5/9] make.bash: override CC when buildi=
ng dist and<br>
&gt;&gt; &gt; @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/make.bash | 4 ++--<br>
&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<b=
r>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +diff --git a/src/make.bash b/src/make.bash<br>
&gt;&gt; &gt; +index 7986125a06..dd67029700 100755<br>
&gt;&gt; &gt;=C2=A0 --- a/src/make.bash<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/make.bash<br>
&gt;&gt; &gt; -@@ -178,7 +178,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &=
quot;$GOROOT&quot; ];<br>
&gt;&gt; &gt; +@@ -181,7 +181,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &=
quot;$GOROOT&quot; ]; then<br>
&gt;&gt; &gt;=C2=A0 =C2=A0exit 1<br>
&gt;&gt; &gt;=C2=A0 =C2=A0fi<br>
&gt;&gt; &gt;=C2=A0 =C2=A0rm -f cmd/dist/dist<br>
&gt;&gt; &gt; @@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0# -e doesn&#39;t propagate out of eval, so check =
success by hand.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue=
)<br>
&gt;&gt; &gt; -@@ -209,7 +209,7 @@ fi<br>
&gt;&gt; &gt; +@@ -206,7 +206,7 @@ fi<br>
&gt;&gt; &gt;=C2=A0 =C2=A0# Run dist bootstrap to complete make.bash.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0# Bootstrap installs a proper cmd/dist, built wit=
h the new toolchain.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0# Throw ours, built with Go 1.4, away after boots=
trap.<br>
&gt;&gt; &gt; --./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS &q=
uot;$@&quot;<br>
&gt;&gt; &gt; -+CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstr=
ap $buildall $vflag $GO_DISTFLAGS &quot;$@&quot;<br>
&gt;&gt; &gt; +-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS &quot;$@&=
quot;<br>
&gt;&gt; &gt; ++CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstr=
ap -a $vflag $GO_DISTFLAGS &quot;$@&quot;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0rm -f ./cmd/dist/dist<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0# DO NOT ADD ANY NEW CODE HERE.<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-s=
eparate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.17/000=
6-cmd-dist-separate-host-and-target-builds.patch<br>
&gt;&gt; &gt; similarity index 90%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0006-cmd-dist-se=
parate-host-and-target-builds.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0006-cmd-dist-sepa=
rate-host-and-target-builds.patch<br>
&gt;&gt; &gt; index 7aee0bac43..e92cc9b28b 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate=
-host-and-target-builds.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate=
-host-and-target-builds.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Wed, 23 Oct 2019 21:18:12 +0430<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH 6/9] cmd/dist: separate host and target=
 builds<br>
&gt;&gt; &gt; @@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/dist/build.go | 155 +++++++++++++++++++++=
+++++++++------------<br>
&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 112 insertions(+), 43 deletions(-=
)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<b=
r>
&gt;&gt; &gt; +index d82f612e75..af24e01198 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/dist/build.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/dist/build.go<br>
&gt;&gt; &gt; -@@ -41,6 +41,7 @@ var (<br>
&gt;&gt; &gt; - goldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
&gt;&gt; &gt; +@@ -43,6 +43,7 @@ var (<br>
&gt;&gt; &gt; + goexperiment=C2=A0 =C2=A0 =C2=A0string<br>
&gt;&gt; &gt;=C2=A0 =C2=A0workdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0tooldir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string<=
br>
&gt;&gt; &gt;=C2=A0 + build_tooldir=C2=A0 =C2=A0 string<br>
&gt;&gt; &gt;=C2=A0 =C2=A0oldgoos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 string<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0oldgoarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
&gt;&gt; &gt;=C2=A0 =C2=A0exe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string<br>
&gt;&gt; &gt; -@@ -53,6 +54,7 @@ var (<br>
&gt;&gt; &gt; +@@ -55,6 +56,7 @@ var (<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0rebuildall=C2=A0 =C2=A0bool<br>
&gt;&gt; &gt;=C2=A0 =C2=A0defaultclang bool<br>
&gt;&gt; &gt; @@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0vflag int // verbosity<br>
&gt;&gt; &gt;=C2=A0 =C2=A0)<br>
&gt;&gt; &gt; -@@ -249,6 +251,8 @@ func xinit() {<br>
&gt;&gt; &gt; +@@ -251,6 +253,8 @@ func xinit() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;); =
tooldir =3D=3D &quot;&quot; {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0tooldir =3D pathf(&quot;%s/pkg/tool/%s_%s&quot;, =
goroot, gohostos, gohostarch)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; @@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// compilerEnv returns a map from &quot;goos/goar=
ch&quot; to the<br>
&gt;&gt; &gt; -@@ -480,8 +484,10 @@ func setup() {<br>
&gt;&gt; &gt; +@@ -496,8 +500,10 @@ func setup() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0p :=3D pathf(&quot;%s/pkg/%s_%s&quot;, goroot, go=
hostos, gohostarch)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if rebuildall {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0xremoveall(p)<br>
&gt;&gt; &gt; @@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if goos !=3D gohostos || goarch !=3D gohostarch {=
<br>
&gt;&gt; &gt;=C2=A0 =C2=A0p :=3D pathf(&quot;%s/pkg/%s_%s&quot;, goroot, go=
os, goarch)<br>
&gt;&gt; &gt; -@@ -1244,12 +1250,29 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt; +@@ -1266,13 +1272,30 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt; + defer timelog(&quot;end&quot;, &quot;dist bootstrap&quot;)<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - var noBanner bool<br>
&gt;&gt; &gt; - var debug bool<br>
&gt;&gt; &gt; + var noBanner, noClean bool<br>
&gt;&gt; &gt;=C2=A0 + var hostOnly bool<br>
&gt;&gt; &gt;=C2=A0 + var targetOnly bool<br>
&gt;&gt; &gt;=C2=A0 + var toBuild =3D []string{&quot;std&quot;, &quot;cmd&q=
uot;}<br>
&gt;&gt; &gt; -+<br>
&gt;&gt; &gt; + var debug bool<br>
&gt;&gt; &gt;=C2=A0 =C2=A0flag.BoolVar(&amp;rebuildall, &quot;a&quot;, rebu=
ildall, &quot;rebuild all&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0flag.BoolVar(&amp;debug, &quot;d&quot;, debug, &q=
uot;enable debugging of bootstrap process&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0flag.BoolVar(&amp;noBanner, &quot;no-banner&quot;=
, noBanner, &quot;do not print banner&quot;)<br>
&gt;&gt; &gt; + flag.BoolVar(&amp;noClean, &quot;no-clean&quot;, noClean, &=
quot;print deprecation warning&quot;)<br>
&gt;&gt; &gt;=C2=A0 + flag.BoolVar(&amp;hostOnly, &quot;host-only&quot;, ho=
stOnly, &quot;build only host binaries, not target&quot;)<br>
&gt;&gt; &gt;=C2=A0 + flag.BoolVar(&amp;targetOnly, &quot;target-only&quot;=
, targetOnly, &quot;build only target binaries, not host&quot;)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 - xflagparse(0)<br>
&gt;&gt; &gt;=C2=A0 + xflagparse(-1)<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; ++<br>
&gt;&gt; &gt;=C2=A0 + if hostOnly &amp;&amp; targetOnly {<br>
&gt;&gt; &gt;=C2=A0 + fatalf(&quot;specify only one of --host-only or --tar=
get-only\n&quot;)<br>
&gt;&gt; &gt;=C2=A0 + }<br>
&gt;&gt; &gt; @@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube &lt;<a =
href=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.ku=
be@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 + fatalf(&quot;package names not permitted without --ho=
st-only or --target-only\n&quot;)<br>
&gt;&gt; &gt;=C2=A0 + }<br>
&gt;&gt; &gt;=C2=A0 + }<br>
&gt;&gt; &gt; - // Set GOPATH to an internal directory. We shouldn&#39;t ac=
tually<br>
&gt;&gt; &gt; - // need to store files here, since the toolchain won&#39;t<=
br>
&gt;&gt; &gt; - // depend on modules outside of vendor directories, but if<=
br>
&gt;&gt; &gt; -@@ -1303,8 +1326,13 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + if noClean {<br>
&gt;&gt; &gt; + xprintf(&quot;warning: --no-clean is deprecated and has no =
effect; use &#39;go install std cmd&#39; instead\n&quot;)<br>
&gt;&gt; &gt; +@@ -1345,8 +1368,13 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0xprintf(&quot;\n&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0goBootstrap :=3D pathf(&quot;%s/go_bootstrap&quot=
;, tooldir)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0cmdGo :=3D pathf(&quot;%s/go&quot;, gobin)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if debug {<br>
&gt;&gt; &gt; -@@ -1333,7 +1361,11 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt; +@@ -1375,7 +1403,11 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0xprintf(&quot;\n&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0xprintf(&quot;Building Go toolchain2 using go_boo=
tstrap and Go toolchain1.\n&quot;)<br>
&gt;&gt; &gt; @@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube &lt;<a =
href=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.ku=
be@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 + } else {<br>
&gt;&gt; &gt;=C2=A0 + os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc=
, goos, goarch))<br>
&gt;&gt; &gt;=C2=A0 + }<br>
&gt;&gt; &gt; + // Now that cmd/go is in charge of the build process, enabl=
e GOEXPERIMENT.<br>
&gt;&gt; &gt; + os.Setenv(&quot;GOEXPERIMENT&quot;, goexperiment)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0goInstall(goBootstrap, append([]string{&quot;-i&q=
uot;}, toolchain...)...)<br>
&gt;&gt; &gt; - if debug {<br>
&gt;&gt; &gt; - run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/comp=
ile&quot;, tooldir), &quot;-V=3Dfull&quot;)<br>
&gt;&gt; &gt; -@@ -1370,50 +1402,84 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt; +@@ -1414,50 +1446,84 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0checkNotStale(goBootstrap, append(toolchain, &quo=
t;runtime/internal/sys&quot;)...)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 - timelog(&quot;build&quot;, &quot;host toolchain&quot;=
)<br>
&gt;&gt; &gt;=C2=A0 - if vflag &gt; 0 {<br>
&gt;&gt; &gt;=C2=A0 - xprintf(&quot;\n&quot;)<br>
&gt;&gt; &gt; +- }<br>
&gt;&gt; &gt; +- xprintf(&quot;Building packages and commands for host, %s/=
%s.\n&quot;, goos, goarch)<br>
&gt;&gt; &gt;=C2=A0 +<br>
&gt;&gt; &gt;=C2=A0 + if goos =3D=3D oldgoos &amp;&amp; goarch =3D=3D oldgo=
arch {<br>
&gt;&gt; &gt;=C2=A0 + // Common case - not setting up for cross-compilation=
.<br>
&gt;&gt; &gt; @@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 + os.Setenv(&quot;GOARCH&quot;, goarch)<br>
&gt;&gt; &gt;=C2=A0 + os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc=
, goos, goarch))<br>
&gt;&gt; &gt;=C2=A0 + xprintf(&quot;Building packages and commands for targ=
et, %s/%s.\n&quot;, goos, goarch)<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -- xprintf(&quot;Building packages and commands for host, %s/=
%s.\n&quot;, goos, goarch)<br>
&gt;&gt; &gt; ++ }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0goInstall(goBootstrap, &quot;std&quot;, &quot;cmd=
&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0checkNotStale(goBootstrap, &quot;std&quot;, &quot=
;cmd&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0checkNotStale(cmdGo, &quot;std&quot;, &quot;cmd&q=
uot;)<br>
&gt;&gt; &gt; @@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube &lt;<a h=
ref=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kub=
e@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 - timelog(&quot;build&quot;, &quot;target toolchain&quo=
t;)<br>
&gt;&gt; &gt;=C2=A0 - if vflag &gt; 0 {<br>
&gt;&gt; &gt;=C2=A0 - xprintf(&quot;\n&quot;)<br>
&gt;&gt; &gt; -- }<br>
&gt;&gt; &gt; ++ if debug {<br>
&gt;&gt; &gt; ++ run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/com=
pile&quot;, tooldir), &quot;-V=3Dfull&quot;)<br>
&gt;&gt; &gt; ++ run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/bui=
ldid&quot;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;=
, goroot, goos, goarch))<br>
&gt;&gt; &gt; ++ checkNotStale(goBootstrap, append(toolchain, &quot;runtime=
/internal/sys&quot;)...)<br>
&gt;&gt; &gt; ++ copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&q=
uot;%s/compile&quot;, tooldir), writeExec)<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt;=C2=A0 - goos =3D oldgoos<br>
&gt;&gt; &gt;=C2=A0 - goarch =3D oldgoarch<br>
&gt;&gt; &gt;=C2=A0 - os.Setenv(&quot;GOOS&quot;, goos)<br>
&gt;&gt; &gt; @@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube &lt;<a =
href=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.ku=
be@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 - run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%=
s/buildid&quot;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&=
quot;, goroot, goos, goarch))<br>
&gt;&gt; &gt;=C2=A0 - checkNotStale(goBootstrap, append(toolchain, &quot;ru=
ntime/internal/sys&quot;)...)<br>
&gt;&gt; &gt;=C2=A0 - copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pat=
hf(&quot;%s/compile&quot;, tooldir), writeExec)<br>
&gt;&gt; &gt; -+ if debug {<br>
&gt;&gt; &gt; -+ run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/com=
pile&quot;, tooldir), &quot;-V=3Dfull&quot;)<br>
&gt;&gt; &gt; -+ run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/bui=
ldid&quot;, tooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;=
, goroot, goos, goarch))<br>
&gt;&gt; &gt; -+ checkNotStale(goBootstrap, append(toolchain, &quot;runtime=
/internal/sys&quot;)...)<br>
&gt;&gt; &gt; -+ copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&q=
uot;%s/compile&quot;, tooldir), writeExec)<br>
&gt;&gt; &gt; -+ }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// Check that there are no new files in $GOROOT/b=
in other than<br>
&gt;&gt; &gt; -@@ -1430,8 +1496,11 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt; +@@ -1474,8 +1540,11 @@ func cmdbootstrap() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if goos =3D=3D &quot;android&quot; {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// Make sure the exec wrapper will sync a fresh $=
GOROOT to the device.<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-mak=
e-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.17/0007-=
cmd-go-make-GOROOT-precious-by-default.patch<br>
&gt;&gt; &gt; similarity index 78%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0007-cmd-go-make=
-GOROOT-precious-by-default.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-G=
OROOT-precious-by-default.patch<br>
&gt;&gt; &gt; index 4b4d0d4f3d..d522512699 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROO=
T-precious-by-default.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROO=
T-precious-by-default.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Wed, 23 Oct 2019 21:18:56 +0430<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH 7/9] cmd/go: make GOROOT precious by de=
fault<br>
&gt;&gt; &gt; @@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/go/internal/work/exec.go=C2=A0 =C2=A0| 25=
 +++++++++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 =C2=A03 files changed, 34 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go=
/internal/work/action.go<br>
&gt;&gt; &gt; +index 69940cb001..b0c1667def 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/work/action.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/work/action.go<br>
&gt;&gt; &gt; -@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(=
<br>
&gt;&gt; &gt; +@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(=
a, a1 *Action, shlib string) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if p1 =3D=3D nil || p1.Shlib =3D=3D &quot;&quot; =
|| haveShlib[filepath.Base(p1.Shlib)] {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0continue<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; @@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0haveShlib[filepath.Base(p1.Shlib)] =3D true<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// TODO(rsc): The use of ModeInstall here is susp=
ect, but if we only do ModeBuild,<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// we&#39;ll end up building an overall library o=
r executable that depends at runtime<br>
&gt;&gt; &gt; +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/=
internal/work/build.go<br>
&gt;&gt; &gt; +index 0ed2389cd5..c3f8a82880 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/work/build.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/work/build.go<br>
&gt;&gt; &gt; -@@ -167,6 +167,8 @@ See also: go install, go get, go clean.<=
br>
&gt;&gt; &gt; +@@ -189,6 +189,8 @@ See also: go install, go get, go clean.<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0const concurrentGCBackendCompilationEnabledByDefa=
ult =3D true<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0func init() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// break init cycle<br>
&gt;&gt; &gt;=C2=A0 =C2=A0CmdBuild.Run =3D runBuild<br>
&gt;&gt; &gt; -@@ -179,6 +181,10 @@ func init() {<br>
&gt;&gt; &gt; +@@ -201,6 +203,10 @@ func init() {<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0AddBuildFlags(CmdBuild, DefaultBuildFlags)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0AddBuildFlags(CmdInstall, DefaultBuildFlags)<br>
&gt;&gt; &gt; @@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0// Note that flags consulted by other parts of th=
e code<br>
&gt;&gt; &gt; +diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/i=
nternal/work/exec.go<br>
&gt;&gt; &gt; +index a37872e7c7..f4e83b97e2 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/work/exec.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/work/exec.go<br>
&gt;&gt; &gt; -@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err=
<br>
&gt;&gt; &gt; +@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Con=
text, a *Action) (err error) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return errors.New(&quot;binary-only packages are =
no longer supported&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return err<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *=
Act<br>
&gt;&gt; &gt; +@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx cont=
ext.Context, a *Action) (err error) {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return err<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; @@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube &lt;<a hr=
ef=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube=
@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return err<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUIL=
DMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.17/0008-use-GO=
BUILDMODE-to-set-buildmode.patch<br>
&gt;&gt; &gt; similarity index 84%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0008-use-GOBUILD=
MODE-to-set-buildmode.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMO=
DE-to-set-buildmode.patch<br>
&gt;&gt; &gt; index 4e5d5021d6..9a1bce809c 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-t=
o-set-buildmode.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-t=
o-set-buildmode.patch<br>
&gt;&gt; &gt; @@ -1,4 +1,4 @@<br>
&gt;&gt; &gt; -From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Wed, 23 Oct 2019 21:19:26 +0430<br>
&gt;&gt; &gt;=C2=A0 Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set bui=
ldmode<br>
&gt;&gt; &gt; @@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube &lt;<a hre=
f=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@=
gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/go/internal/work/build.go | 8 +++++++-<br=
>
&gt;&gt; &gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/=
internal/work/build.go<br>
&gt;&gt; &gt; +index c3f8a82880..23d1aa4836 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/work/build.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/work/build.go<br>
&gt;&gt; &gt; -@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, m=
a<br>
&gt;&gt; &gt; +@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, m=
ask BuildFlagMask) {<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildAsmflags, &quot;asmfl=
ags&quot;, &quot;&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0cmd.Flag.Var(buildCompiler{}, &quot;compiler&quot=
;, &quot;&quot;)<br>
&gt;&gt; &gt; @@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=
=3D"mailto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@g=
mail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGcflags, &quot;gcflag=
s&quot;, &quot;&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0cmd.Flag.Var(&amp;load.BuildGccgoflags, &quot;gcc=
goflags&quot;, &quot;&quot;)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0if mask&amp;OmitModFlag =3D=3D 0 {<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd=
-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1=
.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch<br>
&gt;&gt; &gt; similarity index 75%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-=
go-make-sure-CC-and-CXX-are-absolute.patch<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go=
-make-sure-CC-and-CXX-are-absolute.patch<br>
&gt;&gt; &gt; index dcbdf58752..f8bd491f93 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-mak=
e-sure-CC-and-CXX-are-absolute.patch<br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-mak=
e-sure-CC-and-CXX-are-absolute.patch<br>
&gt;&gt; &gt; @@ -1,7 +1,7 @@<br>
&gt;&gt; &gt; -From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt; +From c5f3c1aa77753254586c0c8a6893862ae97eabe1 Mon Sep 17 00:=
00:00 2001<br>
&gt;&gt; &gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 Date: Mon, 22 Feb 2021 17:54:01 -0800<br>
&gt;&gt; &gt; -Subject: [PATCH] Revert &quot;cmd/go: make sure CC and CXX a=
re absolute&quot;<br>
&gt;&gt; &gt; +Subject: [PATCH 9/9] Revert &quot;cmd/go: make sure CC and C=
XX are absolute&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 OE uses CC/CXX values which consists of cmpiler and opt=
ions together,<br>
&gt;&gt; &gt;=C2=A0 secondly, the environment is canned so this check add l=
ittle value to OE<br>
&gt;&gt; &gt; @@ -16,47 +16,44 @@ This reverts commit aa161e799df7e1eba99d2=
be10271e76b6f758142.<br>
&gt;&gt; &gt;=C2=A0 Upstream-Status: Inappropriate [OE-Specific]<br>
&gt;&gt; &gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; &gt;=C2=A0 ---<br>
&gt;&gt; &gt; - src/cmd/go/internal/envcmd/env.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 5 -----<br>
&gt;&gt; &gt; + src/cmd/go/internal/envcmd/env.go=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 2 +-<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/go/internal/work/init.go=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 7 -------<br>
&gt;&gt; &gt;=C2=A0 =C2=A0src/cmd/go/testdata/script/env_write.txt | 24 ---=
---------------------<br>
&gt;&gt; &gt; - 3 files changed, 36 deletions(-)<br>
&gt;&gt; &gt; + 3 files changed, 1 insertion(+), 32 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cm=
d/go/internal/envcmd/env.go<br>
&gt;&gt; &gt; -index 6937187522..29f9057c3f 100644<br>
&gt;&gt; &gt; +index ff6f0d810a..ca0494b5d4 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/envcmd/env.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/envcmd/env.go<br>
&gt;&gt; &gt; -@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) err=
or {<br>
&gt;&gt; &gt; - if !filepath.IsAbs(val) &amp;&amp; val !=3D &quot;&quot; {<=
br>
&gt;&gt; &gt; +@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) erro=
r {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0return fmt.Errorf(&quot;GOPATH entry is relative;=
 must be absolute path: %q&quot;, val)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -- // Make sure CC and CXX are absolute paths<br>
&gt;&gt; &gt; -- case &quot;CC&quot;, &quot;CXX&quot;:<br>
&gt;&gt; &gt; -- if !filepath.IsAbs(val) &amp;&amp; val !=3D &quot;&quot; &=
amp;&amp; val !=3D filepath.Base(val) {<br>
&gt;&gt; &gt; -- return fmt.Errorf(&quot;%s entry is relative; must be abso=
lute path: %q&quot;, key, val)<br>
&gt;&gt; &gt; -- }<br>
&gt;&gt; &gt; - }<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; - if !utf8.ValidString(val) {<br>
&gt;&gt; &gt; + // Make sure CC and CXX are absolute paths<br>
&gt;&gt; &gt; +- case &quot;CC&quot;, &quot;CXX&quot;, &quot;GOMODCACHE&quo=
t;:<br>
&gt;&gt; &gt; ++ case &quot;GOMODCACHE&quot;:<br>
&gt;&gt; &gt; + if !filepath.IsAbs(val) &amp;&amp; val !=3D &quot;&quot; &a=
mp;&amp; val !=3D filepath.Base(val) {<br>
&gt;&gt; &gt; + return fmt.Errorf(&quot;%s entry is relative; must be absol=
ute path: %q&quot;, key, val)<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt;=C2=A0 diff --git a/src/cmd/go/internal/work/init.go b/src/cmd=
/go/internal/work/init.go<br>
&gt;&gt; &gt; -index ba7c7c2fbb..3a6df5f758 100644<br>
&gt;&gt; &gt; +index 37a3e2d0ff..e529cc2917 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/internal/work/init.go<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/internal/work/init.go<br>
&gt;&gt; &gt; -@@ -41,13 +41,6 @@ func BuildInit() {<br>
&gt;&gt; &gt; +@@ -38,13 +38,6 @@ func BuildInit() {<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt;=C2=A0 =C2=A0cfg.BuildPkgdir =3D p<br>
&gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; -<br>
&gt;&gt; &gt; +-<br>
&gt;&gt; &gt;=C2=A0 - // Make sure CC and CXX are absolute paths<br>
&gt;&gt; &gt;=C2=A0 - for _, key :=3D range []string{&quot;CC&quot;, &quot;=
CXX&quot;} {<br>
&gt;&gt; &gt;=C2=A0 - if path :=3D cfg.Getenv(key); !filepath.IsAbs(path) &=
amp;&amp; path !=3D &quot;&quot; &amp;&amp; path !=3D filepath.Base(path) {=
<br>
&gt;&gt; &gt;=C2=A0 - base.Fatalf(&quot;go %s: %s environment variable is r=
elative; must be absolute path: %s\n&quot;, flag.Args()[0], key, path)<br>
&gt;&gt; &gt;=C2=A0 - }<br>
&gt;&gt; &gt;=C2=A0 - }<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; - // For each experiment that has been enabled in the toolcha=
in, define a<br>
&gt;&gt; &gt; - // build tag with the same name but prefixed by &quot;goexp=
eriment.&quot; which can be<br>
&gt;&gt; &gt; - // used for compiling alternative files for the experiment.=
 This allows<br>
&gt;&gt; &gt; + }<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; + func instrumentInit() {<br>
&gt;&gt; &gt;=C2=A0 diff --git a/src/cmd/go/testdata/script/env_write.txt b=
/src/cmd/go/testdata/script/env_write.txt<br>
&gt;&gt; &gt; -index bda1e57826..c99aadb7f2 100644<br>
&gt;&gt; &gt; +index b5e9739167..566c876658 100644<br>
&gt;&gt; &gt;=C2=A0 --- a/src/cmd/go/testdata/script/env_write.txt<br>
&gt;&gt; &gt;=C2=A0 +++ b/src/cmd/go/testdata/script/env_write.txt<br>
&gt;&gt; &gt;=C2=A0 @@ -129,30 +129,6 @@ go env -w GOTMPDIR=3D<br>
&gt;&gt; &gt; @@ -91,5 +88,5 @@ index bda1e57826..c99aadb7f2 100644<br>
&gt;&gt; &gt;=C2=A0 =C2=A0env GOOS=3D<br>
&gt;&gt; &gt;=C2=A0 =C2=A0env GOARCH=3D<br>
&gt;&gt; &gt;=C2=A0 --<br>
&gt;&gt; &gt; -2.30.1<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-bi=
nary-native_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-nativ=
e_1.16.5.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-nati=
ve_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</=
a><br>
&gt;&gt; &gt; similarity index 83%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-bin=
ary-native_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native=
_1.16.5.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-binar=
y-native_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.1=
7.bb</a><br>
&gt;&gt; &gt; index b3e2b6a60e..2b3db17d3b 100644<br>
&gt;&gt; &gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-na=
tive_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.=
5.bb</a><br>
&gt;&gt; &gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-na=
tive_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb=
</a><br>
&gt;&gt; &gt; @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=
=3D5d4950ecb7b26d2c5e4e7b4e0dd74707&quot;<br>
&gt;&gt; &gt;=C2=A0 PROVIDES =3D &quot;go-native&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/g=
o$%7BPV%7D.$%7BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD=
_GOTUPLE%7D" rel=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/=
go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>=
&quot;<br>
&gt;&gt; &gt; -SRC_URI[go_linux_amd64.sha256sum] =3D &quot;b12c23023b68de22=
f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061&quot;<br>
&gt;&gt; &gt; -SRC_URI[go_linux_arm64.sha256sum] =3D &quot;d5446b46ef6f36fd=
ffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799&quot;<br>
&gt;&gt; &gt; +SRC_URI[go_linux_amd64.sha256sum] =3D &quot;6bf89fc4f5ad7638=
71cf7eac80a2d594492de7a818303283f1366a7f6a30372d&quot;<br>
&gt;&gt; &gt; +SRC_URI[go_linux_arm64.sha256sum] =3D &quot;01a9af009ada2212=
2d3fcb9816049c1d21842524b38ef5d5a0e2ee4b26d7c3e7&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.=
org/dl/" rel=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&qu=
ot;<br>
&gt;&gt; &gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\=
d+)+)\.linux&quot;<br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cr=
oss-canadian_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canad=
ian_1.16.5.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-can=
adian_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.=
bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cro=
ss-canadian_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadi=
an_1.16.5.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross=
-canadian_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1=
.17.bb</a><br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cr=
oss_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a> =
b/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.17.bb" rel=3D"noref=
errer" target=3D"_blank">go-cross_1.17.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cro=
ss_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a><b=
r>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross=
_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.17.bb</a><br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cr=
osssdk_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.b=
b</a> b/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.17.bb" rel=
=3D"noreferrer" target=3D"_blank">go-crosssdk_1.17.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cro=
sssdk_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb=
</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross=
sdk_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.17.bb</a><b=
r>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-na=
tive_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a=
> b/meta/recipes-devtools/go/<a href=3D"http://go-native_1.17.bb" rel=3D"no=
referrer" target=3D"_blank">go-native_1.17.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-nat=
ive_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a>=
<br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-nativ=
e_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.17.bb</a><br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-ru=
ntime_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb<=
/a> b/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.17.bb" rel=3D=
"noreferrer" target=3D"_blank">go-runtime_1.17.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-run=
time_1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</=
a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-runti=
me_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.17.bb</a><br>
&gt;&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.=
16.5.bb" rel=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a> b/meta/recip=
es-devtools/go/<a href=3D"http://go_1.17.bb" rel=3D"noreferrer" target=3D"_=
blank">go_1.17.bb</a><br>
&gt;&gt; &gt; similarity index 100%<br>
&gt;&gt; &gt; rename from meta/recipes-devtools/go/<a href=3D"http://go_1.1=
6.5.bb" rel=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a><br>
&gt;&gt; &gt; rename to meta/recipes-devtools/go/<a href=3D"http://go_1.17.=
bb" rel=3D"noreferrer" target=3D"_blank">go_1.17.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div></div>

--000000000000cb950a05ca670fd6--
