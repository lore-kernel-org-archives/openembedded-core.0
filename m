Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EA30C433F5
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 18:15:50 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web08.17825.1634062548399703964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 11:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UIyK3alZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id g13so373655uaj.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Oct 2021 11:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ylaj8U+gIK2C7yOOO65SAcLmo3mtRb91sUUrgOGSwZE=;
        b=UIyK3alZjLtjy9/WonCLYB5lv2nVfPMX5q3JMLIzRRlGDQwYY2sIIO6NF3dZYzFx6v
         A068aQxLOp9C2+QMsz4MMJcoH3Sn1Q9WcmsNpXxecyC1gXQgUYVhM59H4WqYB2KEgH3T
         4liQMwbn9bhfzdLgwqlkvRAs6GBWd7pW91WFtr7qAQdfHgGcl+LPr78gjYxeVF5YWxbB
         g1Ar8Kq4OgxuERZLGpcBoA4eWlJCQ3JlL6ngn3Q84b9fewDp0iKPyA2aJ1luA5zRf/EY
         kfsxu9IB7iUjSUTYO7fLrC5u/bVD7yPBWQXVGtIDYZktWK3f9eqAMZ0REWlr8D5mxbqv
         n+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylaj8U+gIK2C7yOOO65SAcLmo3mtRb91sUUrgOGSwZE=;
        b=AjSM/1+b21kPHNVm1CANVl5MO2XDwlw9oQkQYS1+X0rAbnL02bxz5dGo+h853La5bd
         fWMOnNDuTFvnbDOjOT4cZ2/GBLD2N75dNTvhjTbt+sp6IbnMs5Sy1w4iLK/lo5xmM6L0
         Ih9Pbp1fR/cALoWSJYnXVc18cDulegwliZ6u7tzf5+1Y0JZAH45Wfvz2iYJfkTy3TrjJ
         j6OTHVxV6XSPXCnPY/hHtRxZF+WIpK8l7sp/wzzjOUKuIZ0p/TE5wku2eIbM+5y2uaoS
         4l5RGpRIXhP06Cmzy280y32EKROO6bTWBUGQEeoAY+ED3nNs4VDIGTa9tccH9d3STUUM
         4ieQ==
X-Gm-Message-State: AOAM532IDagFMRS3AdYRgeTnsLE90+jv0WiH/aEVW2mgmeBKlT0FI23N
	bw9qywU8UNlZSd9RQn95wLYypyE7jISpSwPJwuo=
X-Google-Smtp-Source: 
 ABdhPJzEeMafZv4l3SGiZEmjoGYRTRpVepLAttQ1/a6r1OUAfhLjo+W+ph8dgqDS2129oMRtfjrdzlA81dAoZCnWY/E=
X-Received: by 2002:a67:df18:: with SMTP id s24mr32601122vsk.40.1634062546958;
 Tue, 12 Oct 2021 11:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210825172051.10088-1-sakib.sajal@windriver.com>
In-Reply-To: <20210825172051.10088-1-sakib.sajal@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 12 Oct 2021 20:15:34 +0200
Message-ID: 
 <CANNYZj_-UFveGahstKEePb5dwm+V0OHMTQv2PEoDyHJ8XEaLUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: upgrade to 1.17 release
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a6fc7105ce2bd59f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 18:15:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156885

--000000000000a6fc7105ce2bd59f
Content-Type: text/plain; charset="UTF-8"

Hello Sakib,

can you rebase this to master and resend please?


Alex

On Wed, 25 Aug 2021 at 19:21, Sakib Sajal <sakib.sajal@windriver.com> wrote:

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
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (80%)
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> (80%)
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> (78%)
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0004-ld-add-soname-to-shareable-objects.patch (78%)
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> (76%)
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0006-cmd-dist-separate-host-and-target-builds.patch (90%)
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0007-cmd-go-make-GOROOT-precious-by-default.patch (78%)
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0008-use-GOBUILDMODE-to-set-buildmode.patch (84%)
>  rename meta/recipes-devtools/go/{go-1.16 =>
> go-1.17}/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.16.5.bb =>
> go-binary-native_1.17.bb} (83%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.16.5.bb =>
> go-cross-canadian_1.17.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.16.5.bb => go-cross_1.17.bb}
> (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.16.5.bb =>
> go-crosssdk_1.17.bb} (100%)
>  rename meta/recipes-devtools/go/{go-native_1.16.5.bb => go-native_1.17.bb}
> (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.16.5.bb =>
> go-runtime_1.17.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.16.5.bb => go_1.17.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 47f23f5c39..5b8a532943 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -23,7 +23,7 @@ GDBVERSION ?= "10.%"
>  GLIBCVERSION ?= "2.34"
>  LINUXLIBCVERSION ?= "5.13%"
>  QEMUVERSION ?= "6.0%"
> -GOVERSION ?= "1.16%"
> +GOVERSION ?= "1.17%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to
> denote
>  # llvm version being used, so always bump it with llvm recipe version bump
>  LLVMVERSION ?= "12.0.1"
> diff --git a/meta/recipes-devtools/go/go-1.16.5.inc
> b/meta/recipes-devtools/go/go-1.17.inc
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
> -SRC_URI[main.sha256sum] =
> "7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa51945851325eebc17f50ba80"
> +SRC_URI[main.sha256sum] =
> "3a70e5055509f347c0fb831ca07a2bf3b531068f349b14a3c652e9b5b67beb5d"
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> similarity index 80%
> rename from
> meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> index 5f4823be22..8a833e05d3 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multiple-words.patch
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
> +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> +index 1553d26391..20d0587899 100644
>  --- a/src/cmd/go/internal/envcmd/env.go
>  +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
> +@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {
>
>         cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
>         if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
> @@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         }
>         env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
>         env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> similarity index 80%
> rename from
> meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> index 04d0e496c0..b78b6afa24 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> @@ -1,4 +1,4 @@
> -From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001
> +From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:14:22 +0430
>  Subject: [PATCH 2/9] cmd/go: make content-based hash generation less
> pedantic
> @@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
>   2 files changed, 49 insertions(+), 19 deletions(-)
>
> +diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> +index 20d0587899..ff6f0d810a 100644
>  --- a/src/cmd/go/internal/envcmd/env.go
>  +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> +@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
>   func ExtraEnvVarsCostly() []cfg.EnvVar {
>         var b work.Builder
>         b.Init()
> @@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         if err != nil {
>                 // Should not happen - b.CFlags was given an empty package.
>                 fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> +diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> +index 5a225fb9f1..a37872e7c7 100644
>  --- a/src/cmd/go/internal/work/exec.go
>  +++ b/src/cmd/go/internal/work/exec.go
> -@@ -37,6 +37,8 @@ import (
> +@@ -38,6 +38,8 @@ import (
>         "cmd/go/internal/trace"
>   )
>
> @@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   // actionList returns the list of actions in the dag rooted at root
>   // as visited in a depth-first post-order traversal.
>   func actionList(root *Action) []*Action {
> -@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio
> +@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
>         // Assume b.WorkDir is being trimmed properly.
>         // When -trimpath is used with a package built from the module
> cache,
>         // use the module path and version instead of the directory.
> @@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>                 fmt.Fprintf(h, "dir %s\n", p.Dir)
>         } else if cfg.BuildTrimpath && p.Module != nil {
>                 fmt.Fprintf(h, "module %s@%s\n", p.Module.Path,
> p.Module.Version)
> -@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio
> +@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
>         }
> -       if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
> +       if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
>                 fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
>  -              cppflags, cflags, cxxflags, fflags, ldflags, _ :=
> b.CFlags(p)
> --              fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags,
> cflags, ldflags)
>  +              cppflags, cflags, cxxflags, fflags, ldflags, _ :=
> b.CFlags(p, true)
> -+              fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true),
> cppflags, cflags, ldflags)
> -               if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
> --                      fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
> -+                      fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true),
> cxxflags)
> +
> +-              ccExe := b.ccExe()
> ++              ccExe := b.ccExe(true)
> +               fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags,
> cflags, ldflags)
> +               // Include the C compiler tool ID so that if the C
> +               // compiler changes we rebuild the package.
> +@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> +                       }
>                 }
> -               if len(p.FFiles) > 0 {
> --                      fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
> -+                      fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
> +               if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> +-                      cxxExe := b.cxxExe()
> ++                      cxxExe := b.cxxExe(true)
> +                       fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
> +                       if cxxID, err := b.gccToolID(cxxExe[0], "c++");
> err == nil {
> +                               fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
> +                       }
>                 }
> -               // TODO(rsc): Should we include the SWIG version or
> Fortran/GCC/G++/Objective-C compiler versions?
> -       }
> -@@ -2401,33 +2403,48 @@ var (
> +               if len(p.FFiles) > 0 {
> +-                      fcExe := b.fcExe()
> ++                      fcExe := b.fcExe(true)
> +                       fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
> +                       if fcID, err := b.gccToolID(fcExe[0], "f95"); err
> == nil {
> +                               fmt.Fprintf(h, "FC ID=%q\n", fcID)
> +@@ -2438,33 +2440,48 @@ var (
>   // gccCmd returns a gcc command line prefix
>   // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
>   func (b *Builder) GccCmd(incdir, workdir string) []string {
> @@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   }
>
>   // compilerExe returns the compiler to use given an
> -@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {
> +@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
>   // of the compiler but can have additional arguments if they
>   // were present in the environment value.
>   // For example if CC="gcc -DGOPHER" then the result is ["gcc",
> "-DGOPHER"].
> @@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         return compiler
>   }
>
> -@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {
> +@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
>   }
>
>   // CFlags returns the flags to use when invoking the C, C++ or Fortran
> compilers, or cgo.
> @@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         defaults := "-g -O2"
>
>         if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS,
> checkCompilerFlags); err != nil {
> -@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package
> +@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
>                 return
>         }
>
> @@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         return
>   }
>
> -@@ -2653,7 +2683,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
> +@@ -2700,7 +2730,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
>
>   func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo,
> outObj []string, err error) {
>         p := a.Package
> @@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         if err != nil {
>                 return nil, nil, err
>         }
> -@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str
> +@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
>
>   // Run SWIG on one SWIG input file.
>   func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir
> string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string,
> err error) {
> @@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         if err != nil {
>                 return "", "", err
>         }
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> similarity index 78%
> rename from
> meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> index 662c705471..e5d0ee90e2 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> @@ -1,7 +1,8 @@
> -From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001
> +From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:15:37 +0430
> -Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> environment
> +Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> + environment
>
>  to allow for split host/target build roots
>
> @@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   src/cmd/go/internal/cfg/cfg.go | 6 +++++-
>   2 files changed, 8 insertions(+), 2 deletions(-)
>
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index bec17696f3..d82f612e75 100644
>  --- a/src/cmd/dist/build.go
>  +++ b/src/cmd/dist/build.go
> -@@ -246,7 +246,9 @@ func xinit() {
> -       workdir = xworkdir()
> +@@ -248,7 +248,9 @@ func xinit() {
> +       }
>         xatexit(rmworkdir)
>
>  -      tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
> @@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   }
>
>   // compilerEnv returns a map from "goos/goarch" to the
> +diff --git a/src/cmd/go/internal/cfg/cfg.go
> b/src/cmd/go/internal/cfg/cfg.go
> +index 57a3c1ff6f..825d8c70f2 100644
>  --- a/src/cmd/go/internal/cfg/cfg.go
>  +++ b/src/cmd/go/internal/cfg/cfg.go
> -@@ -64,7 +64,11 @@ func defaultContext() build.Context {
> +@@ -67,7 +67,11 @@ func defaultContext() build.Context {
>                 // variables. This matches the initialization of ToolDir in
>                 // go/build, except for using ctxt.GOROOT rather than
>                 // runtime.GOROOT.
> @@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         }
>
>         ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> similarity index 78%
> rename from
> meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> index cd875f1164..bc5cabeca0 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-objects.patch
> @@ -1,4 +1,4 @@
> -From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001
> +From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:16:32 +0430
>  Subject: [PATCH 4/9] ld: add soname to shareable objects
> @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   src/cmd/link/internal/ld/lib.go | 3 +++
>   1 file changed, 3 insertions(+)
>
> +diff --git a/src/cmd/link/internal/ld/lib.go
> b/src/cmd/link/internal/ld/lib.go
> +index 644faeb2fb..5b7e48636e 100644
>  --- a/src/cmd/link/internal/ld/lib.go
>  +++ b/src/cmd/link/internal/ld/lib.go
> -@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {
>                                 argv = append(argv, "-Wl,-z,relro")
>                         }
>                         argv = append(argv, "-shared")
> @@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>                         if ctxt.HeadType == objabi.Hwindows {
>                                 if *flagAslr {
>                                         argv = addASLRargs(argv)
> -@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {
>                         argv = append(argv, "-Wl,-z,relro")
>                 }
>                 argv = append(argv, "-shared")
> @@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         case BuildModePlugin:
>                 if ctxt.HeadType == objabi.Hdarwin {
>                         argv = append(argv, "-dynamiclib")
> -@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
> +@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {
>                                 argv = append(argv, "-Wl,-z,relro")
>                         }
>                         argv = append(argv, "-shared")
> @@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>                 }
>         }
>
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> similarity index 76%
> rename from
> meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> index 59c12d9546..a7d9932f4d 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> @@ -1,4 +1,4 @@
> -From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001
> +From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:17:16 +0430
>  Subject: [PATCH 5/9] make.bash: override CC when building dist and
> @@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   src/make.bash | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> +diff --git a/src/make.bash b/src/make.bash
> +index 7986125a06..dd67029700 100755
>  --- a/src/make.bash
>  +++ b/src/make.bash
> -@@ -178,7 +178,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
> +@@ -181,7 +181,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
>         exit 1
>   fi
>   rm -f cmd/dist/dist
> @@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>
>   # -e doesn't propagate out of eval, so check success by hand.
>   eval $(./cmd/dist/dist env -p || echo FAIL=true)
> -@@ -209,7 +209,7 @@ fi
> +@@ -206,7 +206,7 @@ fi
>   # Run dist bootstrap to complete make.bash.
>   # Bootstrap installs a proper cmd/dist, built with the new toolchain.
>   # Throw ours, built with Go 1.4, away after bootstrap.
> --./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
> -+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag
> $GO_DISTFLAGS "$@"
> +-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
> ++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap -a $vflag
> $GO_DISTFLAGS "$@"
>   rm -f ./cmd/dist/dist
>
>   # DO NOT ADD ANY NEW CODE HERE.
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> similarity index 90%
> rename from
> meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> index 7aee0bac43..e92cc9b28b 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-target-builds.patch
> @@ -1,4 +1,4 @@
> -From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001
> +From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:18:12 +0430
>  Subject: [PATCH 6/9] cmd/dist: separate host and target builds
> @@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
>   1 file changed, 112 insertions(+), 43 deletions(-)
>
> +diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> +index d82f612e75..af24e01198 100644
>  --- a/src/cmd/dist/build.go
>  +++ b/src/cmd/dist/build.go
> -@@ -41,6 +41,7 @@ var (
> -       goldflags        string
> +@@ -43,6 +43,7 @@ var (
> +       goexperiment     string
>         workdir          string
>         tooldir          string
>  +      build_tooldir    string
>         oldgoos          string
>         oldgoarch        string
>         exe              string
> -@@ -53,6 +54,7 @@ var (
> +@@ -55,6 +56,7 @@ var (
>
>         rebuildall   bool
>         defaultclang bool
> @@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>
>         vflag int // verbosity
>   )
> -@@ -249,6 +251,8 @@ func xinit() {
> +@@ -251,6 +253,8 @@ func xinit() {
>         if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
>                 tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
>         }
> @@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   }
>
>   // compilerEnv returns a map from "goos/goarch" to the
> -@@ -480,8 +484,10 @@ func setup() {
> +@@ -496,8 +500,10 @@ func setup() {
>         p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
>         if rebuildall {
>                 xremoveall(p)
> @@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>
>         if goos != gohostos || goarch != gohostarch {
>                 p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
> -@@ -1244,12 +1250,29 @@ func cmdbootstrap() {
> +@@ -1266,13 +1272,30 @@ func cmdbootstrap() {
> +       defer timelog("end", "dist bootstrap")
>
> -       var noBanner bool
> -       var debug bool
> +       var noBanner, noClean bool
>  +      var hostOnly bool
>  +      var targetOnly bool
>  +      var toBuild = []string{"std", "cmd"}
> -+
> +       var debug bool
>         flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
>         flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap
> process")
>         flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print
> banner")
> +       flag.BoolVar(&noClean, "no-clean", noClean, "print deprecation
> warning")
>  +      flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host
> binaries, not target")
>  +      flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only
> target binaries, not host")
>
>  -      xflagparse(0)
>  +      xflagparse(-1)
> -
> ++
>  +      if hostOnly && targetOnly {
>  +              fatalf("specify only one of --host-only or
> --target-only\n")
>  +      }
> @@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>  +                      fatalf("package names not permitted without
> --host-only or --target-only\n")
>  +              }
>  +      }
> -       // Set GOPATH to an internal directory. We shouldn't actually
> -       // need to store files here, since the toolchain won't
> -       // depend on modules outside of vendor directories, but if
> -@@ -1303,8 +1326,13 @@ func cmdbootstrap() {
> +
> +       if noClean {
> +               xprintf("warning: --no-clean is deprecated and has no
> effect; use 'go install std cmd' instead\n")
> +@@ -1345,8 +1368,13 @@ func cmdbootstrap() {
>                 xprintf("\n")
>         }
>
> @@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         goBootstrap := pathf("%s/go_bootstrap", tooldir)
>         cmdGo := pathf("%s/go", gobin)
>         if debug {
> -@@ -1333,7 +1361,11 @@ func cmdbootstrap() {
> +@@ -1375,7 +1403,11 @@ func cmdbootstrap() {
>                 xprintf("\n")
>         }
>         xprintf("Building Go toolchain2 using go_bootstrap and Go
> toolchain1.\n")
> @@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>  +      } else {
>  +              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
>  +      }
> +       // Now that cmd/go is in charge of the build process, enable
> GOEXPERIMENT.
> +       os.Setenv("GOEXPERIMENT", goexperiment)
>         goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> -       if debug {
> -               run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> -@@ -1370,50 +1402,84 @@ func cmdbootstrap() {
> +@@ -1414,50 +1446,84 @@ func cmdbootstrap() {
>         }
>         checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
>
> @@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>  -              timelog("build", "host toolchain")
>  -              if vflag > 0 {
>  -                      xprintf("\n")
> +-              }
> +-              xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
>  +
>  +              if goos == oldgoos && goarch == oldgoarch {
>  +                      // Common case - not setting up for
> cross-compilation.
> @@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>  +                      os.Setenv("GOARCH", goarch)
>  +                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos,
> goarch))
>  +                      xprintf("Building packages and commands for
> target, %s/%s.\n", goos, goarch)
> -               }
> --              xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> ++              }
>                 goInstall(goBootstrap, "std", "cmd")
>                 checkNotStale(goBootstrap, "std", "cmd")
>                 checkNotStale(cmdGo, "std", "cmd")
> @@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>  -              timelog("build", "target toolchain")
>  -              if vflag > 0 {
>  -                      xprintf("\n")
> --              }
> ++              if debug {
> ++                      run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> ++                      run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> ++                      checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> ++                      copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> +               }
>  -              goos = oldgoos
>  -              goarch = oldgoarch
>  -              os.Setenv("GOOS", goos)
> @@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>  -              run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
>  -              checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
>  -              copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> -+              if debug {
> -+                      run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=full")
> -+                      run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> -+                      checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> -+                      copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> -+              }
>         }
>
>         // Check that there are no new files in $GOROOT/bin other than
> -@@ -1430,8 +1496,11 @@ func cmdbootstrap() {
> +@@ -1474,8 +1540,11 @@ func cmdbootstrap() {
>                 }
>         }
>
> @@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>
>         if goos == "android" {
>                 // Make sure the exec wrapper will sync a fresh $GOROOT to
> the device.
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> similarity index 78%
> rename from
> meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> index 4b4d0d4f3d..d522512699 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-default.patch
> @@ -1,4 +1,4 @@
> -From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001
> +From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:18:56 +0430
>  Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
> @@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
>   3 files changed, 34 insertions(+)
>
> +diff --git a/src/cmd/go/internal/work/action.go
> b/src/cmd/go/internal/work/action.go
> +index 69940cb001..b0c1667def 100644
>  --- a/src/cmd/go/internal/work/action.go
>  +++ b/src/cmd/go/internal/work/action.go
> -@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
> +@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1
> *Action, shlib string) {
>                         if p1 == nil || p1.Shlib == "" ||
> haveShlib[filepath.Base(p1.Shlib)] {
>                                 continue
>                         }
> @@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>                         haveShlib[filepath.Base(p1.Shlib)] = true
>                         // TODO(rsc): The use of ModeInstall here is
> suspect, but if we only do ModeBuild,
>                         // we'll end up building an overall library or
> executable that depends at runtime
> +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> +index 0ed2389cd5..c3f8a82880 100644
>  --- a/src/cmd/go/internal/work/build.go
>  +++ b/src/cmd/go/internal/work/build.go
> -@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
> +@@ -189,6 +189,8 @@ See also: go install, go get, go clean.
>
>   const concurrentGCBackendCompilationEnabledByDefault = true
>
> @@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   func init() {
>         // break init cycle
>         CmdBuild.Run = runBuild
> -@@ -179,6 +181,10 @@ func init() {
> +@@ -201,6 +203,10 @@ func init() {
>
>         AddBuildFlags(CmdBuild, DefaultBuildFlags)
>         AddBuildFlags(CmdInstall, DefaultBuildFlags)
> @@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   }
>
>   // Note that flags consulted by other parts of the code
> +diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> +index a37872e7c7..f4e83b97e2 100644
>  --- a/src/cmd/go/internal/work/exec.go
>  +++ b/src/cmd/go/internal/work/exec.go
> -@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
> +@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Context, a
> *Action) (err error) {
>                 return errors.New("binary-only packages are no longer
> supported")
>         }
>
> @@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         if err := b.Mkdir(a.Objdir); err != nil {
>                 return err
>         }
> -@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
> +@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx context.Context,
> a *Action) (err error) {
>                 return err
>         }
>
> @@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         if err := b.Mkdir(a.Objdir); err != nil {
>                 return err
>         }
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> similarity index 84%
> rename from
> meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> index 4e5d5021d6..9a1bce809c 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmode.patch
> @@ -1,4 +1,4 @@
> -From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001
> +From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:00:00 2001
>  From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:19:26 +0430
>  Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
> @@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>   src/cmd/go/internal/work/build.go | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> +diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> +index c3f8a82880..23d1aa4836 100644
>  --- a/src/cmd/go/internal/work/build.go
>  +++ b/src/cmd/go/internal/work/build.go
> -@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
> +@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, mask
> BuildFlagMask) {
>
>         cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
>         cmd.Flag.Var(buildCompiler{}, "compiler", "")
> @@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
>         cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
>         cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
>         if mask&OmitModFlag == 0 {
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> similarity index 75%
> rename from
> meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> rename to
> meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> index dcbdf58752..f8bd491f93 100644
> ---
> a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> +++
> b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
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
> @@ -16,47 +16,44 @@ This reverts commit
> aa161e799df7e1eba99d2be10271e76b6f758142.
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
>  diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> -index 6937187522..29f9057c3f 100644
> +index ff6f0d810a..ca0494b5d4 100644
>  --- a/src/cmd/go/internal/envcmd/env.go
>  +++ b/src/cmd/go/internal/envcmd/env.go
> -@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {
> -               if !filepath.IsAbs(val) && val != "" {
> +@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) error {
>                         return fmt.Errorf("GOPATH entry is relative; must
> be absolute path: %q", val)
>                 }
> --      // Make sure CC and CXX are absolute paths
> --      case "CC", "CXX":
> --              if !filepath.IsAbs(val) && val != "" && val !=
> filepath.Base(val) {
> --                      return fmt.Errorf("%s entry is relative; must be
> absolute path: %q", key, val)
> --              }
> -       }
> -
> -       if !utf8.ValidString(val) {
> +       // Make sure CC and CXX are absolute paths
> +-      case "CC", "CXX", "GOMODCACHE":
> ++      case "GOMODCACHE":
> +               if !filepath.IsAbs(val) && val != "" && val !=
> filepath.Base(val) {
> +                       return fmt.Errorf("%s entry is relative; must be
> absolute path: %q", key, val)
> +               }
>  diff --git a/src/cmd/go/internal/work/init.go
> b/src/cmd/go/internal/work/init.go
> -index ba7c7c2fbb..3a6df5f758 100644
> +index 37a3e2d0ff..e529cc2917 100644
>  --- a/src/cmd/go/internal/work/init.go
>  +++ b/src/cmd/go/internal/work/init.go
> -@@ -41,13 +41,6 @@ func BuildInit() {
> +@@ -38,13 +38,6 @@ func BuildInit() {
> +               }
>                 cfg.BuildPkgdir = p
>         }
> -
> +-
>  -      // Make sure CC and CXX are absolute paths
>  -      for _, key := range []string{"CC", "CXX"} {
>  -              if path := cfg.Getenv(key); !filepath.IsAbs(path) && path
> != "" && path != filepath.Base(path) {
>  -                      base.Fatalf("go %s: %s environment variable is
> relative; must be absolute path: %s\n", flag.Args()[0], key, path)
>  -              }
>  -      }
> --
> -       // For each experiment that has been enabled in the toolchain,
> define a
> -       // build tag with the same name but prefixed by "goexperiment."
> which can be
> -       // used for compiling alternative files for the experiment. This
> allows
> + }
> +
> + func instrumentInit() {
>  diff --git a/src/cmd/go/testdata/script/env_write.txt
> b/src/cmd/go/testdata/script/env_write.txt
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
> diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> similarity index 83%
> rename from meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> rename to meta/recipes-devtools/go/go-binary-native_1.17.bb
> index b3e2b6a60e..2b3db17d3b 100644
> --- a/meta/recipes-devtools/go/go-binary-native_1.16.5.bb
> +++ b/meta/recipes-devtools/go/go-binary-native_1.17.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
>  PROVIDES = "go-native"
>
>  SRC_URI = "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}
> "
> -SRC_URI[go_linux_amd64.sha256sum] =
> "b12c23023b68de22f74c0524f10b753e7b08b1504cb7e417eccebdd3fae49061"
> -SRC_URI[go_linux_arm64.sha256sum] =
> "d5446b46ef6f36fdffa852f73dfbbe78c1ddf010b99fa4964944b9ae8b4d6799"
> +SRC_URI[go_linux_amd64.sha256sum] =
> "6bf89fc4f5ad763871cf7eac80a2d594492de7a818303283f1366a7f6a30372d"
> +SRC_URI[go_linux_arm64.sha256sum] =
> "01a9af009ada22122d3fcb9816049c1d21842524b38ef5d5a0e2ee4b26d7c3e7"
>
>  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
>  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross-canadian_1.16.5.bb
> rename to meta/recipes-devtools/go/go-cross-canadian_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-cross_1.16.5.bb
> b/meta/recipes-devtools/go/go-cross_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-cross_1.16.5.bb
> rename to meta/recipes-devtools/go/go-cross_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-crosssdk_1.16.5.bb
> rename to meta/recipes-devtools/go/go-crosssdk_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-native_1.16.5.bb
> b/meta/recipes-devtools/go/go-native_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-native_1.16.5.bb
> rename to meta/recipes-devtools/go/go-native_1.17.bb
> diff --git a/meta/recipes-devtools/go/go-runtime_1.16.5.bb
> b/meta/recipes-devtools/go/go-runtime_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go-runtime_1.16.5.bb
> rename to meta/recipes-devtools/go/go-runtime_1.17.bb
> diff --git a/meta/recipes-devtools/go/go_1.16.5.bb
> b/meta/recipes-devtools/go/go_1.17.bb
> similarity index 100%
> rename from meta/recipes-devtools/go/go_1.16.5.bb
> rename to meta/recipes-devtools/go/go_1.17.bb
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#155312):
> https://lists.openembedded.org/g/openembedded-core/message/155312
> Mute This Topic: https://lists.openembedded.org/mt/85141060/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000a6fc7105ce2bd59f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Sakib,</div><div><br></div><div>can you rebase =
this to master and resend please?</div><div><br></div><div><br></div><div>A=
lex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, 25 Aug 2021 at 19:21, Sakib Sajal &lt;<a href=3D"mailt=
o:sakib.sajal@windriver.com">sakib.sajal@windriver.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">go 1.17 includes smal=
l enhancements to the language.<br>
Release notes: <a href=3D"https://golang.org/doc/go1.17" rel=3D"noreferrer"=
 target=3D"_blank">https://golang.org/doc/go1.17</a><br>
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com"=
 target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 2 +-<=
br>
=C2=A0.../go/{go-1.16.5.inc =3D&gt; go-1.17.inc}=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 6 +-<br>
=C2=A0...ow-CC-and-CXX-to-have-multiple-words.patch | 10 ++-<br>
=C2=A0...ent-based-hash-generation-less-pedan.patch | 62 +++++++++++-------=
<br>
=C2=A0...-to-be-overridden-in-the-environment.patch | 18 ++++--<br>
=C2=A0...4-ld-add-soname-to-shareable-objects.patch | 13 ++--<br>
=C2=A0...de-CC-when-building-dist-and-go_boot.patch | 15 +++--<br>
=C2=A0...dist-separate-host-and-target-builds.patch | 64 ++++++++++--------=
-<br>
=C2=A0...d-go-make-GOROOT-precious-by-default.patch | 21 ++++--<br>
=C2=A0...008-use-GOBUILDMODE-to-set-buildmode.patch |=C2=A0 9 ++-<br>
=C2=A0...go-make-sure-CC-and-CXX-are-absolute.patch | 45 ++++++-------<br>
=C2=A0...<a href=3D"http://ive_1.16.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ive_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.17.bb" r=
el=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a>} |=C2=A0 4=
 +-<br>
=C2=A0...<a href=3D"http://an_1.16.5.bb" rel=3D"noreferrer" target=3D"_blan=
k">an_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.17.bb" re=
l=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.bb</a>} |=C2=A0 0=
<br>
=C2=A0.../{<a href=3D"http://go-cross_1.16.5.bb" rel=3D"noreferrer" target=
=3D"_blank">go-cross_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-cross_1.17.=
bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.17.bb</a>}=C2=A0 |=C2=
=A0 0<br>
=C2=A0...<a href=3D"http://crosssdk_1.16.5.bb" rel=3D"noreferrer" target=3D=
"_blank">crosssdk_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-crosssdk_1.17.=
bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.17.bb</a>} |=C2=A0 0=
<br>
=C2=A0...{<a href=3D"http://go-native_1.16.5.bb" rel=3D"noreferrer" target=
=3D"_blank">go-native_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-native_1.1=
7.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.17.bb</a>} |=C2=A0 0=
<br>
=C2=A0...<a href=3D"http://o-runtime_1.16.5.bb" rel=3D"noreferrer" target=
=3D"_blank">o-runtime_1.16.5.bb</a> =3D&gt; <a href=3D"http://go-runtime_1.=
17.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.17.bb</a>} |=C2=A0=
 0<br>
=C2=A0.../go/{<a href=3D"http://go_1.16.5.bb" rel=3D"noreferrer" target=3D"=
_blank">go_1.16.5.bb</a> =3D&gt; <a href=3D"http://go_1.17.bb" rel=3D"noref=
errer" target=3D"_blank">go_1.17.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 0<br>
=C2=A018 files changed, 163 insertions(+), 106 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16.5.inc =3D&gt; go-1.17.inc} (=
85%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0001-allow-=
CC-and-CXX-to-have-multiple-words.patch (80%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0002-cmd-go=
-make-content-based-hash-generation-less-pedan.patch (80%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0003-allow-=
GOTOOLDIR-to-be-overridden-in-the-environment.patch (78%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0004-ld-add=
-soname-to-shareable-objects.patch (78%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0005-make.b=
ash-override-CC-when-building-dist-and-go_boot.patch (76%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0006-cmd-di=
st-separate-host-and-target-builds.patch (90%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0007-cmd-go=
-make-GOROOT-precious-by-default.patch (78%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0008-use-GO=
BUILDMODE-to-set-buildmode.patch (84%)<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.16 =3D&gt; go-1.17}/0009-Revert=
-cmd-go-make-sure-CC-and-CXX-are-absolute.patch (75%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-native_1=
.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</=
a> =3D&gt; <a href=3D"http://go-binary-native_1.17.bb" rel=3D"noreferrer" t=
arget=3D"_blank">go-binary-native_1.17.bb</a>} (83%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-canadian_=
1.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.5.bb=
</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.17.bb" rel=3D"noreferrer=
" target=3D"_blank">go-cross-canadian_1.17.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a> =3D&gt; <a hr=
ef=3D"http://go-cross_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-cros=
s_1.17.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1.16.5=
.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a> =3D&gt;=
 <a href=3D"http://go-crosssdk_1.17.bb" rel=3D"noreferrer" target=3D"_blank=
">go-crosssdk_1.17.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-native_1.16.5.b=
b" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a> =3D&gt; <a =
href=3D"http://go-native_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go-n=
ative_1.17.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.16.5.=
bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a> =3D&gt; <=
a href=3D"http://go-runtime_1.17.bb" rel=3D"noreferrer" target=3D"_blank">g=
o-runtime_1.17.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go_1.16.5.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a> =3D&gt; <a href=3D"http:=
//go_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go_1.17.bb</a>} (100%)<b=
r>
<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index 47f23f5c39..5b8a532943 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -23,7 +23,7 @@ GDBVERSION ?=3D &quot;10.%&quot;<br>
=C2=A0GLIBCVERSION ?=3D &quot;2.34&quot;<br>
=C2=A0LINUXLIBCVERSION ?=3D &quot;5.13%&quot;<br>
=C2=A0QEMUVERSION ?=3D &quot;6.0%&quot;<br>
-GOVERSION ?=3D &quot;1.16%&quot;<br>
+GOVERSION ?=3D &quot;1.17%&quot;<br>
=C2=A0# This can not use wildcards like 8.0.% since it is also used in mesa=
 to denote<br>
=C2=A0# llvm version being used, so always bump it with llvm recipe version=
 bump<br>
=C2=A0LLVMVERSION ?=3D &quot;12.0.1&quot;<br>
diff --git a/meta/recipes-devtools/go/go-1.16.5.inc b/meta/recipes-devtools=
/go/go-1.17.inc<br>
similarity index 85%<br>
rename from meta/recipes-devtools/go/go-1.16.5.inc<br>
rename to meta/recipes-devtools/go/go-1.17.inc<br>
index 545aa0c828..6b412afe25 100644<br>
--- a/meta/recipes-devtools/go/go-1.16.5.inc<br>
+++ b/meta/recipes-devtools/go/go-1.17.inc<br>
@@ -1,7 +1,7 @@<br>
=C2=A0require go-common.inc<br>
<br>
-GO_BASEVERSION =3D &quot;1.16&quot;<br>
-PV =3D &quot;1.16.5&quot;<br>
+GO_BASEVERSION =3D &quot;1.17&quot;<br>
+PV =3D &quot;1.17&quot;<br>
=C2=A0FILESEXTRAPATHS:prepend :=3D &quot;${FILE_DIRNAME}/go-${GO_BASEVERSIO=
N}:&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7=
b4e0dd74707&quot;<br>
@@ -17,4 +17,4 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0008-use-GOBUILDMODE-to-set-buildmode.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-abso=
lute.patch \<br>
=C2=A0&quot;<br>
-SRC_URI[main.sha256sum] =3D &quot;7bfa7e5908c7cc9e75da5ddf3066d7cbcf3fd9fa=
51945851325eebc17f50ba80&quot;<br>
+SRC_URI[main.sha256sum] =3D &quot;3a70e5055509f347c0fb831ca07a2bf3b531068f=
349b14a3c652e9b5b67beb5d&quot;<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have=
-multiple-words.patch b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-=
CXX-to-have-multiple-words.patch<br>
similarity index 80%<br>
rename from meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-=
multiple-words.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-mu=
ltiple-words.patch<br>
index 5f4823be22..8a833e05d3 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multip=
le-words.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0001-allow-CC-and-CXX-to-have-multip=
le-words.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001<br>
+From 0e964d3ca3496beb4f3732abe501b50e262b6646 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" tar=
get=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 23 Oct 2019 21:01:13 +0430<br>
=C2=A0Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words<=
br>
@@ -10,14 +10,15 @@ the meta/recipes-devtools/go tree by<br>
=C2=A0Matt Madison &lt;matt@madison.systems&gt;.<br>
<br>
=C2=A0Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.j.kub=
e@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
-<br>
=C2=A0---<br>
=C2=A0 src/cmd/go/internal/envcmd/env.go | 4 ++--<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcm=
d/env.go<br>
+index 1553d26391..20d0587899 100644<br>
=C2=A0--- a/src/cmd/go/internal/envcmd/env.go<br>
=C2=A0+++ b/src/cmd/go/internal/envcmd/env.go<br>
-@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {<br>
+@@ -106,11 +106,11 @@ func MkEnv() []cfg.EnvVar {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if env :=3D strings.Fields(cfg.Getenv(&quot;CC&=
quot;)); len(env) &gt; 0 {<br>
@@ -31,3 +32,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D append(env, cfg.EnvVar{Name: &quot;AR&q=
uot;, Value: envOr(&quot;AR&quot;, &quot;ar&quot;)})<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D append(env, cfg.EnvVar{Name: &quot;CC&q=
uot;, Value: cc})<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-base=
d-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.17/0002-=
cmd-go-make-content-based-hash-generation-less-pedan.patch<br>
similarity index 80%<br>
rename from meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based=
-hash-generation-less-pedan.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-h=
ash-generation-less-pedan.patch<br>
index 04d0e496c0..b78b6afa24 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0002-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br>
@@ -1,4 +1,4 @@<br>
-From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001<br>
+From e3628e0bd22caa339652435e166c7144f417c977 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" tar=
get=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 23 Oct 2019 21:14:22 +0430<br>
=C2=A0Subject: [PATCH 2/9] cmd/go: make content-based hash generation less =
pedantic<br>
@@ -50,9 +50,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 src/cmd/go/internal/work/exec.go=C2=A0 | 66 ++++++++++++++++++++++--=
-------<br>
=C2=A0 2 files changed, 49 insertions(+), 19 deletions(-)<br>
<br>
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcm=
d/env.go<br>
+index 20d0587899..ff6f0d810a 100644<br>
=C2=A0--- a/src/cmd/go/internal/envcmd/env.go<br>
=C2=A0+++ b/src/cmd/go/internal/envcmd/env.go<br>
-@@ -157,7 +157,7 @@ func ExtraEnvVars() []cfg.EnvVar {<br>
+@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {<br>
=C2=A0 func ExtraEnvVarsCostly() []cfg.EnvVar {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 var b work.Builder<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 b.Init()<br>
@@ -61,9 +63,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Should not happe=
n - b.CFlags was given an empty package.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(os.Stde=
rr, &quot;go: invalid cflags: %v\n&quot;, err)<br>
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/e=
xec.go<br>
+index 5a225fb9f1..a37872e7c7 100644<br>
=C2=A0--- a/src/cmd/go/internal/work/exec.go<br>
=C2=A0+++ b/src/cmd/go/internal/work/exec.go<br>
-@@ -37,6 +37,8 @@ import (<br>
+@@ -38,6 +38,8 @@ import (<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cmd/go/internal/trace&quot;<br>
=C2=A0 )<br>
<br>
@@ -72,7 +76,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 // actionList returns the list of actions in the dag rooted at root<=
br>
=C2=A0 // as visited in a depth-first post-order traversal.<br>
=C2=A0 func actionList(root *Action) []*Action {<br>
-@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio<br>
+@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action) cache.Actio=
nID {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Assume b.WorkDir is being trimmed properly.<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // When -trimpath is used with a package built =
from the module cache,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // use the module path and version instead of t=
he directory.<br>
@@ -81,25 +85,36 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quo=
t;dir %s\n&quot;, p.Dir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if cfg.BuildTrimpath &amp;&amp; p.Module=
 !=3D nil {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quo=
t;module %s@%s\n&quot;, p.Module.Path, p.Module.Version)<br>
-@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio<br>
+@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action) cache.Actio=
nID {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CgoFiles)+len(p.SwigFiles) &gt; 0 {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigC=
XXFiles) &gt; 0 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quo=
t;cgo %q\n&quot;, b.toolID(&quot;cgo&quot;))<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags, cflags, c=
xxflags, fflags, ldflags, _ :=3D b.CFlags(p)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;CC=
=3D%q %q %q %q\n&quot;, b.ccExe(), cppflags, cflags, ldflags)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cppflags, cflags, c=
xxflags, fflags, ldflags, _ :=3D b.CFlags(p, true)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;CC=
=3D%q %q %q %q\n&quot;, b.ccExe(true), cppflags, cflags, ldflags)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CXXFiles)+=
len(p.SwigFiles) &gt; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(), cxxflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, b.cxxExe(true), cxxflags)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ccExe :=3D b.ccExe()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ccExe :=3D b.ccExe(true)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quo=
t;CC=3D%q %q %q %q\n&quot;, ccExe, cppflags, cflags, ldflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Include the C co=
mpiler tool ID so that if the C<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// compiler changes=
 we rebuild the package.<br>
+@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action) cache.Act=
ionID {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.FFiles) &g=
t; 0 {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(), fflags)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, b.fcExe(true), fflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CXXFiles)+=
len(p.SwigCXXFiles) &gt; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cxxExe :=3D b.cxxExe()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 cxxExe :=3D b.cxxExe(true)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fmt.Fprintf(h, &quot;CXX=3D%q %q\n&quot;, cxxExe, cxxflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if cxxID, err :=3D b.gccToolID(cxxExe[0], &quot;c++&quot;); err =
=3D=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;CXX ID=3D%q\n&qu=
ot;, cxxID)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// TODO(rsc): Shoul=
d we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versi=
ons?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -2401,33 +2403,48 @@ var (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.FFiles) &g=
t; 0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fcExe :=3D b.fcExe()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fcExe :=3D b.fcExe(true)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, fcExe, fflags)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if fcID, err :=3D b.gccToolID(fcExe[0], &quot;f95&quot;); err =3D=
=3D nil {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;FC ID=3D%q\n&quo=
t;, fcID)<br>
+@@ -2438,33 +2440,48 @@ var (<br>
=C2=A0 // gccCmd returns a gcc command line prefix<br>
=C2=A0 // defaultCC is defined in zdefaultcc.go, written by cmd/dist.<br>
=C2=A0 func (b *Builder) GccCmd(incdir, workdir string) []string {<br>
@@ -157,7 +172,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 }<br>
<br>
=C2=A0 // compilerExe returns the compiler to use given an<br>
-@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {<br>
+@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {<br>
=C2=A0 // of the compiler but can have additional arguments if they<br>
=C2=A0 // were present in the environment value.<br>
=C2=A0 // For example if CC=3D&quot;gcc -DGOPHER&quot; then the result is [=
&quot;gcc&quot;, &quot;-DGOPHER&quot;].<br>
@@ -175,7 +190,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return compiler<br>
=C2=A0 }<br>
<br>
-@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {<br>
+@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {<br>
=C2=A0 }<br>
<br>
=C2=A0 // CFlags returns the flags to use when invoking the C, C++ or Fortr=
an compilers, or cgo.<br>
@@ -184,7 +199,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 defaults :=3D &quot;-g -O2&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if cppflags, err =3D buildFlags(&quot;CPPFLAGS&=
quot;, &quot;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err !=3D nil {<br>
-@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package<br>
+@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags=
, cflags, cxxflags, fflags, l<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -199,7 +214,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 }<br>
<br>
-@@ -2653,7 +2683,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
+@@ -2700,7 +2730,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
<br>
=C2=A0 func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pc=
LDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, out=
Obj []string, err error) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 p :=3D a.Package<br>
@@ -208,7 +223,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nil, nil, er=
r<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str<br>
+@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string) (intsiz=
e string, err error) {<br>
<br>
=C2=A0 // Run SWIG on one SWIG input file.<br>
=C2=A0 func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir s=
tring, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, =
err error) {<br>
@@ -217,3 +232,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D nil {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &quot;&quot;=
, &quot;&quot;, err<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-ov=
erridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.17/0003-a=
llow-GOTOOLDIR-to-be-overridden-in-the-environment.patch<br>
similarity index 78%<br>
rename from meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-ove=
rridden-in-the-environment.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overr=
idden-in-the-environment.patch<br>
index 662c705471..e5d0ee90e2 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridde=
n-in-the-environment.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0003-allow-GOTOOLDIR-to-be-overridde=
n-in-the-environment.patch<br>
@@ -1,7 +1,8 @@<br>
-From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001<br>
+From f7b2347869941b751b6db1dfa8461195d2a5888b Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" tar=
get=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 23 Oct 2019 21:15:37 +0430<br>
-Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the envir=
onment<br>
+Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the<br>
+ environment<br>
<br>
=C2=A0to allow for split host/target build roots<br>
<br>
@@ -17,10 +18,12 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 src/cmd/go/internal/cfg/cfg.go | 6 +++++-<br>
=C2=A0 2 files changed, 8 insertions(+), 2 deletions(-)<br>
<br>
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
+index bec17696f3..d82f612e75 100644<br>
=C2=A0--- a/src/cmd/dist/build.go<br>
=C2=A0+++ b/src/cmd/dist/build.go<br>
-@@ -246,7 +246,9 @@ func xinit() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D xworkdir()<br>
+@@ -248,7 +248,9 @@ func xinit() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xatexit(rmworkdir)<br>
<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&quot;%s/pkg/tool/%s_%s&quot;=
, goroot, gohostos, gohostarch)<br>
@@ -30,9 +33,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 }<br>
<br>
=C2=A0 // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
+diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.=
go<br>
+index 57a3c1ff6f..825d8c70f2 100644<br>
=C2=A0--- a/src/cmd/go/internal/cfg/cfg.go<br>
=C2=A0+++ b/src/cmd/go/internal/cfg/cfg.go<br>
-@@ -64,7 +64,11 @@ func defaultContext() build.Context {<br>
+@@ -67,7 +67,11 @@ func defaultContext() build.Context {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // variables. This =
matches the initialization of ToolDir in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // go/build, except=
 for using ctxt.GOROOT rather than<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // runtime.GOROOT.<=
br>
@@ -45,3 +50,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt.GOPATH =3D envOr(&quot;GOPATH&quot;, ctxt.=
GOPATH)<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareab=
le-objects.patch b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-s=
hareable-objects.patch<br>
similarity index 78%<br>
rename from meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareabl=
e-objects.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-=
objects.patch<br>
index cd875f1164..bc5cabeca0 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-obje=
cts.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0004-ld-add-soname-to-shareable-obje=
cts.patch<br>
@@ -1,4 +1,4 @@<br>
-From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001<br>
+From 751ab1c94df250475a8e0c6fe0272c60560a38b3 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" tar=
get=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 23 Oct 2019 21:16:32 +0430<br>
=C2=A0Subject: [PATCH 4/9] ld: add soname to shareable objects<br>
@@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 src/cmd/link/internal/ld/lib.go | 3 +++<br>
=C2=A0 1 file changed, 3 insertions(+)<br>
<br>
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/li=
b.go<br>
+index 644faeb2fb..5b7e48636e 100644<br>
=C2=A0--- a/src/cmd/link/internal/ld/lib.go<br>
=C2=A0+++ b/src/cmd/link/internal/ld/lib.go<br>
-@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {<br>
+@@ -1342,6 +1342,7 @@ func (ctxt *Link) hostlink() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv =3D append(argv, &quot;-Wl,-z,r=
elro&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 argv =3D append(argv, &quot;-shared&quot;)<br>
@@ -27,7 +29,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ctxt.HeadType =3D=3D objabi.Hwindows {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if *flagAslr {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv =3D=
 addASLRargs(argv)<br>
-@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {<br>
+@@ -1359,6 +1360,7 @@ func (ctxt *Link) hostlink() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv =3D append(arg=
v, &quot;-shared&quot;)<br>
@@ -35,7 +37,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case BuildModePlugin:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ctxt.HeadType =
=3D=3D objabi.Hdarwin {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 argv =3D append(argv, &quot;-dynamiclib&quot;)<br>
-@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {<br>
+@@ -1367,6 +1369,7 @@ func (ctxt *Link) hostlink() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv =3D append(argv, &quot;-Wl,-z,r=
elro&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 argv =3D append(argv, &quot;-shared&quot;)<br>
@@ -43,3 +45,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-wh=
en-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.17/0005-=
make.bash-override-CC-when-building-dist-and-go_boot.patch<br>
similarity index 76%<br>
rename from meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-whe=
n-building-dist-and-go_boot.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-=
building-dist-and-go_boot.patch<br>
index 59c12d9546..a7d9932f4d 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-buil=
ding-dist-and-go_boot.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0005-make.bash-override-CC-when-buil=
ding-dist-and-go_boot.patch<br>
@@ -1,4 +1,4 @@<br>
-From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001<br>
+From 4a3a4c0b51618cab8e41dc307404c8b40146a8c4 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" tar=
get=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 23 Oct 2019 21:17:16 +0430<br>
=C2=A0Subject: [PATCH 5/9] make.bash: override CC when building dist and<br=
>
@@ -17,9 +17,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 src/make.bash | 4 ++--<br>
=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
+diff --git a/src/make.bash b/src/make.bash<br>
+index 7986125a06..dd67029700 100755<br>
=C2=A0--- a/src/make.bash<br>
=C2=A0+++ b/src/make.bash<br>
-@@ -178,7 +178,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOROOT&q=
uot; ];<br>
+@@ -181,7 +181,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOROOT&q=
uot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit 1<br>
=C2=A0 fi<br>
=C2=A0 rm -f cmd/dist/dist<br>
@@ -28,12 +30,15 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
<br>
=C2=A0 # -e doesn&#39;t propagate out of eval, so check success by hand.<br=
>
=C2=A0 eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br>
-@@ -209,7 +209,7 @@ fi<br>
+@@ -206,7 +206,7 @@ fi<br>
=C2=A0 # Run dist bootstrap to complete make.bash.<br>
=C2=A0 # Bootstrap installs a proper cmd/dist, built with the new toolchain=
.<br>
=C2=A0 # Throw ours, built with Go 1.4, away after bootstrap.<br>
--./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS &quot;$@&quot;<b=
r>
-+CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap $buildall $=
vflag $GO_DISTFLAGS &quot;$@&quot;<br>
+-./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS &quot;$@&quot;<br>
++CC=3D&quot;${BUILD_CC:-${CC}}&quot; ./cmd/dist/dist bootstrap -a $vflag $=
GO_DISTFLAGS &quot;$@&quot;<br>
=C2=A0 rm -f ./cmd/dist/dist<br>
<br>
=C2=A0 # DO NOT ADD ANY NEW CODE HERE.<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-a=
nd-target-builds.patch b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-sep=
arate-host-and-target-builds.patch<br>
similarity index 90%<br>
rename from meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-an=
d-target-builds.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-=
target-builds.patch<br>
index 7aee0bac43..e92cc9b28b 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-targ=
et-builds.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0006-cmd-dist-separate-host-and-targ=
et-builds.patch<br>
@@ -1,4 +1,4 @@<br>
-From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001<br>
+From fdbb0770a7e5190368c7e15ffcc2ce25fe7344e7 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" tar=
get=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 23 Oct 2019 21:18:12 +0430<br>
=C2=A0Subject: [PATCH 6/9] cmd/dist: separate host and target builds<br>
@@ -38,17 +38,19 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++----------=
--<br>
=C2=A0 1 file changed, 112 insertions(+), 43 deletions(-)<br>
<br>
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
+index d82f612e75..af24e01198 100644<br>
=C2=A0--- a/src/cmd/dist/build.go<br>
=C2=A0+++ b/src/cmd/dist/build.go<br>
-@@ -41,6 +41,7 @@ var (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0goldflags=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
+@@ -43,6 +43,7 @@ var (<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0goexperiment=C2=A0 =C2=A0 =C2=A0string<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 workdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tooldir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 build_tooldir=C2=A0 =C2=A0 string<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldgoos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strin=
g<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oldgoarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 exe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 string<br>
-@@ -53,6 +54,7 @@ var (<br>
+@@ -55,6 +56,7 @@ var (<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rebuildall=C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 defaultclang bool<br>
@@ -56,7 +58,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 vflag int // verbosity<br>
=C2=A0 )<br>
-@@ -249,6 +251,8 @@ func xinit() {<br>
+@@ -251,6 +253,8 @@ func xinit() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;)=
; tooldir =3D=3D &quot;&quot; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&=
quot;%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -65,7 +67,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 }<br>
<br>
=C2=A0 // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
-@@ -480,8 +484,10 @@ func setup() {<br>
+@@ -496,8 +500,10 @@ func setup() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 p :=3D pathf(&quot;%s/pkg/%s_%s&quot;, goroot, =
gohostos, gohostarch)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if rebuildall {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xremoveall(p)<br>
@@ -76,23 +78,24 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if goos !=3D gohostos || goarch !=3D gohostarch=
 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p :=3D pathf(&quot;=
%s/pkg/%s_%s&quot;, goroot, goos, goarch)<br>
-@@ -1244,12 +1250,29 @@ func cmdbootstrap() {<br>
+@@ -1266,13 +1272,30 @@ func cmdbootstrap() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0defer timelog(&quot;end&quot;, &quot;dist boots=
trap&quot;)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0var noBanner bool<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0var debug bool<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var noBanner, noClean bool<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 var hostOnly bool<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 var targetOnly bool<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 var toBuild =3D []string{&quot;std&quot;, &quot=
;cmd&quot;}<br>
-+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0var debug bool<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;rebuildall, &quot;a&quot;, re=
buildall, &quot;rebuild all&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;debug, &quot;d&quot;, debug, =
&quot;enable debugging of bootstrap process&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;noBanner, &quot;no-banner&quo=
t;, noBanner, &quot;do not print banner&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;noClean, &quot;no-clean&quot;=
, noClean, &quot;print deprecation warning&quot;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;hostOnly, &quot;host-only&quo=
t;, hostOnly, &quot;build only host binaries, not target&quot;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 flag.BoolVar(&amp;targetOnly, &quot;target-only=
&quot;, targetOnly, &quot;build only target binaries, not host&quot;)<br>
<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 xflagparse(0)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 xflagparse(-1)<br>
- <br>
++<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 if hostOnly &amp;&amp; targetOnly {<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fatalf(&quot;specif=
y only one of --host-only or --target-only\n&quot;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 }<br>
@@ -104,10 +107,10 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto=
:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</=
a>&gt;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fatalf(&quot;package names not permitted without --host-only or =
--target-only\n&quot;)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// Set GOPATH to an internal directory. We shou=
ldn&#39;t actually<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// need to store files here, since the toolchai=
n won&#39;t<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// depend on modules outside of vendor director=
ies, but if<br>
-@@ -1303,8 +1326,13 @@ func cmdbootstrap() {<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if noClean {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;warni=
ng: --no-clean is deprecated and has no effect; use &#39;go install std cmd=
&#39; instead\n&quot;)<br>
+@@ -1345,8 +1368,13 @@ func cmdbootstrap() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&qu=
ot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -123,7 +126,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goBootstrap :=3D pathf(&quot;%s/go_bootstrap&qu=
ot;, tooldir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmdGo :=3D pathf(&quot;%s/go&quot;, gobin)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if debug {<br>
-@@ -1333,7 +1361,11 @@ func cmdbootstrap() {<br>
+@@ -1375,7 +1403,11 @@ func cmdbootstrap() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&qu=
ot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building Go toolchain2 using go_b=
ootstrap and Go toolchain1.\n&quot;)<br>
@@ -133,10 +136,10 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto=
:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</=
a>&gt;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&=
quot;, compilerEnvLookup(defaultcc, goos, goarch))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Now that cmd/go is in charge of the build pr=
ocess, enable GOEXPERIMENT.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0os.Setenv(&quot;GOEXPERIMENT&quot;, goexperimen=
t)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 goInstall(goBootstrap, append([]string{&quot;-i=
&quot;}, toolchain...)...)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run(&quot;&quot;, S=
howOutput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dful=
l&quot;)<br>
-@@ -1370,50 +1402,84 @@ func cmdbootstrap() {<br>
+@@ -1414,50 +1446,84 @@ func cmdbootstrap() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 checkNotStale(goBootstrap, append(toolchain, &q=
uot;runtime/internal/sys&quot;)...)<br>
<br>
@@ -188,6 +191,8 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build=
&quot;, &quot;host toolchain&quot;)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<b=
r>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for host, %s/%s.\n&quot;, goos, goarch)<br>
=C2=A0+<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if goos =3D=3D oldg=
oos &amp;&amp; goarch =3D=3D oldgoarch {<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // Common case - not setting up for cross-compilation.<br>
@@ -219,8 +224,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goa=
rch))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xprintf(&quot;Building packages and commands for target, %s/%s.\=
n&quot;, goos, goarch)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building p=
ackages and commands for host, %s/%s.\n&quot;, goos, goarch)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goInstall(goBootstr=
ap, &quot;std&quot;, &quot;cmd&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkNotStale(goBoo=
tstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkNotStale(cmdGo=
, &quot;std&quot;, &quot;cmd&quot;)<br>
@@ -228,7 +232,12 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:=
alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a=
>&gt;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build=
&quot;, &quot;target toolchain&quot;)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<b=
r>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if debug {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, t=
ooldir), &quot;-V=3Dfull&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, t=
ooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goo=
s, goarch))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys=
&quot;)...)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compil=
e&quot;, tooldir), writeExec)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goos =3D oldgoos<br=
>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goarch =3D oldgoarc=
h<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOO=
S&quot;, goos)<br>
@@ -249,16 +258,10 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto=
:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</=
a>&gt;<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run(&quot;&quot;, S=
howOutput|CheckExit, pathf(&quot;%s/buildid&quot;, tooldir), pathf(&quot;%s=
/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goos, goarch))<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkNotStale(goBoo=
tstrap, append(toolchain, &quot;runtime/internal/sys&quot;)...)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copyfile(pathf(&quo=
t;%s/compile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writ=
eExec)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if debug {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, t=
ooldir), &quot;-V=3Dfull&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, t=
ooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goo=
s, goarch))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys=
&quot;)...)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compil=
e&quot;, tooldir), writeExec)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // Check that there are no new files in $GOROOT=
/bin other than<br>
-@@ -1430,8 +1496,11 @@ func cmdbootstrap() {<br>
+@@ -1474,8 +1540,11 @@ func cmdbootstrap() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -272,3 +275,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if goos =3D=3D &quot;android&quot; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Make sure the ex=
ec wrapper will sync a fresh $GOROOT to the device.<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-preci=
ous-by-default.patch b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GO=
ROOT-precious-by-default.patch<br>
similarity index 78%<br>
rename from meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precio=
us-by-default.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious=
-by-default.patch<br>
index 4b4d0d4f3d..d522512699 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-=
default.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0007-cmd-go-make-GOROOT-precious-by-=
default.patch<br>
@@ -1,4 +1,4 @@<br>
-From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001<br>
+From f65315faeacf0acb8a5dbbc754136e33381200f5 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" tar=
get=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 23 Oct 2019 21:18:56 +0430<br>
=C2=A0Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default<br>
@@ -27,9 +27,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 src/cmd/go/internal/work/exec.go=C2=A0 =C2=A0| 25 ++++++++++++++++++=
+++++++<br>
=C2=A0 3 files changed, 34 insertions(+)<br>
<br>
+diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work=
/action.go<br>
+index 69940cb001..b0c1667def 100644<br>
=C2=A0--- a/src/cmd/go/internal/work/action.go<br>
=C2=A0+++ b/src/cmd/go/internal/work/action.go<br>
-@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(<br>
+@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action,=
 shlib string) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if p1 =3D=3D nil || p1.Shlib =3D=3D &quot;&quot; || haveShlib[fi=
lepath.Base(p1.Shlib)] {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
@@ -39,9 +41,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 haveShlib[filepath.Base(p1.Shlib)] =3D true<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // TODO(rsc): The use of ModeInstall here is suspect, but if we =
only do ModeBuild,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 // we&#39;ll end up building an overall library or executable th=
at depends at runtime<br>
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/=
build.go<br>
+index 0ed2389cd5..c3f8a82880 100644<br>
=C2=A0--- a/src/cmd/go/internal/work/build.go<br>
=C2=A0+++ b/src/cmd/go/internal/work/build.go<br>
-@@ -167,6 +167,8 @@ See also: go install, go get, go clean.<br>
+@@ -189,6 +189,8 @@ See also: go install, go get, go clean.<br>
<br>
=C2=A0 const concurrentGCBackendCompilationEnabledByDefault =3D true<br>
<br>
@@ -50,7 +54,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 func init() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 // break init cycle<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CmdBuild.Run =3D runBuild<br>
-@@ -179,6 +181,10 @@ func init() {<br>
+@@ -201,6 +203,10 @@ func init() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AddBuildFlags(CmdBuild, DefaultBuildFlags)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AddBuildFlags(CmdInstall, DefaultBuildFlags)<br=
>
@@ -61,9 +65,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 }<br>
<br>
=C2=A0 // Note that flags consulted by other parts of the code<br>
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/e=
xec.go<br>
+index a37872e7c7..f4e83b97e2 100644<br>
=C2=A0--- a/src/cmd/go/internal/work/exec.go<br>
=C2=A0+++ b/src/cmd/go/internal/work/exec.go<br>
-@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err<br>
+@@ -514,6 +514,23 @@ func (b *Builder) build(ctx context.Context, a *Actio=
n) (err error) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return errors.New(&=
quot;binary-only packages are no longer supported&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -87,7 +93,7 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act<br>
+@@ -1558,6 +1575,14 @@ func (b *Builder) linkShared(ctx context.Context, a=
 *Action) (err error) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -102,3 +108,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:a=
lexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>=
&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if err :=3D b.Mkdir(a.Objdir); err !=3D nil {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-b=
uildmode.patch b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-s=
et-buildmode.patch<br>
similarity index 84%<br>
rename from meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-bu=
ildmode.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buil=
dmode.patch<br>
index 4e5d5021d6..9a1bce809c 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmod=
e.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0008-use-GOBUILDMODE-to-set-buildmod=
e.patch<br>
@@ -1,4 +1,4 @@<br>
-From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001<br>
+From 1446c2c3cc6b1c66d9ef9507eb596c5bfed3dc47 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com" tar=
get=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
=C2=A0Date: Wed, 23 Oct 2019 21:19:26 +0430<br>
=C2=A0Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode<br>
@@ -23,9 +23,11 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:al=
exander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&=
gt;<br>
=C2=A0 src/cmd/go/internal/work/build.go | 8 +++++++-<br>
=C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)<br>
<br>
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/=
build.go<br>
+index c3f8a82880..23d1aa4836 100644<br>
=C2=A0--- a/src/cmd/go/internal/work/build.go<br>
=C2=A0+++ b/src/cmd/go/internal/work/build.go<br>
-@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma<br>
+@@ -275,7 +275,13 @@ func AddBuildFlags(cmd *base.Command, mask BuildFlagM=
ask) {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.Var(&amp;load.BuildAsmflags, &quot;asm=
flags&quot;, &quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.Var(buildCompiler{}, &quot;compiler&qu=
ot;, &quot;&quot;)<br>
@@ -40,3 +42,6 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:ale=
xander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&g=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.Var(&amp;load.BuildGcflags, &quot;gcfl=
ags&quot;, &quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd.Flag.Var(&amp;load.BuildGccgoflags, &quot;g=
ccgoflags&quot;, &quot;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if mask&amp;OmitModFlag =3D=3D 0 {<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-=
CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.17/0009-Rever=
t-cmd-go-make-sure-CC-and-CXX-are-absolute.patch<br>
similarity index 75%<br>
rename from meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-C=
C-and-CXX-are-absolute.patch<br>
rename to meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-=
and-CXX-are-absolute.patch<br>
index dcbdf58752..f8bd491f93 100644<br>
--- a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-=
CXX-are-absolute.patch<br>
+++ b/meta/recipes-devtools/go/go-1.17/0009-Revert-cmd-go-make-sure-CC-and-=
CXX-are-absolute.patch<br>
@@ -1,7 +1,7 @@<br>
-From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00 2001<br>
+From c5f3c1aa77753254586c0c8a6893862ae97eabe1 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 22 Feb 2021 17:54:01 -0800<br>
-Subject: [PATCH] Revert &quot;cmd/go: make sure CC and CXX are absolute&qu=
ot;<br>
+Subject: [PATCH 9/9] Revert &quot;cmd/go: make sure CC and CXX are absolut=
e&quot;<br>
<br>
=C2=A0OE uses CC/CXX values which consists of cmpiler and options together,=
<br>
=C2=A0secondly, the environment is canned so this check add little value to=
 OE<br>
@@ -16,47 +16,44 @@ This reverts commit aa161e799df7e1eba99d2be10271e76b6f7=
58142.<br>
=C2=A0Upstream-Status: Inappropriate [OE-Specific]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
- src/cmd/go/internal/envcmd/env.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 --=
---<br>
+ src/cmd/go/internal/envcmd/env.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-=
<br>
=C2=A0 src/cmd/go/internal/work/init.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 7 -------<br>
=C2=A0 src/cmd/go/testdata/script/env_write.txt | 24 ----------------------=
--<br>
- 3 files changed, 36 deletions(-)<br>
+ 3 files changed, 1 insertion(+), 32 deletions(-)<br>
<br>
=C2=A0diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/=
envcmd/env.go<br>
-index 6937187522..29f9057c3f 100644<br>
+index ff6f0d810a..ca0494b5d4 100644<br>
=C2=A0--- a/src/cmd/go/internal/envcmd/env.go<br>
=C2=A0+++ b/src/cmd/go/internal/envcmd/env.go<br>
-@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if !filepath.IsAbs(=
val) &amp;&amp; val !=3D &quot;&quot; {<br>
+@@ -458,7 +458,7 @@ func checkEnvWrite(key, val string) error {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return fmt.Errorf(&quot;GOPATH entry is relative; must be absolu=
te path: %q&quot;, val)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 // Make sure CC and CXX are absolute paths<br>
--=C2=A0 =C2=A0 =C2=A0 case &quot;CC&quot;, &quot;CXX&quot;:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if !filepath.IsAbs(val) =
&amp;&amp; val !=3D &quot;&quot; &amp;&amp; val !=3D filepath.Base(val) {<b=
r>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return fmt.Errorf(&quot;%s entry is relative; must be absolute path: %q=
&quot;, key, val)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if !utf8.ValidString(val) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// Make sure CC and CXX are absolute paths<br>
+-=C2=A0 =C2=A0 =C2=A0 case &quot;CC&quot;, &quot;CXX&quot;, &quot;GOMODCAC=
HE&quot;:<br>
++=C2=A0 =C2=A0 =C2=A0 case &quot;GOMODCACHE&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if !filepath.IsAbs(=
val) &amp;&amp; val !=3D &quot;&quot; &amp;&amp; val !=3D filepath.Base(val=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return fmt.Errorf(&quot;%s entry is relative; must be absolute pa=
th: %q&quot;, key, val)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/internal/w=
ork/init.go<br>
-index ba7c7c2fbb..3a6df5f758 100644<br>
+index 37a3e2d0ff..e529cc2917 100644<br>
=C2=A0--- a/src/cmd/go/internal/work/init.go<br>
=C2=A0+++ b/src/cmd/go/internal/work/init.go<br>
-@@ -41,13 +41,6 @@ func BuildInit() {<br>
+@@ -38,13 +38,6 @@ func BuildInit() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cfg.BuildPkgdir =3D=
 p<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
+-<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 // Make sure CC and CXX are absolute paths<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 for _, key :=3D range []string{&quot;CC&quot;, =
&quot;CXX&quot;} {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if path :=3D cfg.Ge=
tenv(key); !filepath.IsAbs(path) &amp;&amp; path !=3D &quot;&quot; &amp;&am=
p; path !=3D filepath.Base(path) {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 base.Fatalf(&quot;go %s: %s environment variable is relative; mu=
st be absolute path: %s\n&quot;, flag.Args()[0], key, path)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// For each experiment that has been enabled in=
 the toolchain, define a<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// build tag with the same name but prefixed by=
 &quot;goexperiment.&quot; which can be<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0// used for compiling alternative files for the=
 experiment. This allows<br>
+ }<br>
+ <br>
+ func instrumentInit() {<br>
=C2=A0diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/go/te=
stdata/script/env_write.txt<br>
-index bda1e57826..c99aadb7f2 100644<br>
+index b5e9739167..566c876658 100644<br>
=C2=A0--- a/src/cmd/go/testdata/script/env_write.txt<br>
=C2=A0+++ b/src/cmd/go/testdata/script/env_write.txt<br>
=C2=A0@@ -129,30 +129,6 @@ go env -w GOTMPDIR=3D<br>
@@ -91,5 +88,5 @@ index bda1e57826..c99aadb7f2 100644<br>
=C2=A0 env GOOS=3D<br>
=C2=A0 env GOARCH=3D<br>
=C2=A0-- <br>
-2.30.1<br>
+2.25.1<br>
<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.=
16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</a=
> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.17.bb" re=
l=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a><br>
similarity index 83%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.1=
6.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</a>=
<br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.17.=
bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a><br>
index b3e2b6a60e..2b3db17d3b 100644<br>
--- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.16.5.bb</a><br>
+++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.17.bb" =
rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.17.bb</a><br>
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5d4950ecb7b=
26d2c5e4e7b4e0dd74707&quot;<br>
=C2=A0PROVIDES =3D &quot;go-native&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7D.$%7=
BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%7D" r=
el=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go${PV}.${BUIL=
D_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br>
-SRC_URI[go_linux_amd64.sha256sum] =3D &quot;b12c23023b68de22f74c0524f10b75=
3e7b08b1504cb7e417eccebdd3fae49061&quot;<br>
-SRC_URI[go_linux_arm64.sha256sum] =3D &quot;d5446b46ef6f36fdffa852f73dfbbe=
78c1ddf010b99fa4964944b9ae8b4d6799&quot;<br>
+SRC_URI[go_linux_amd64.sha256sum] =3D &quot;6bf89fc4f5ad763871cf7eac80a2d5=
94492de7a818303283f1366a7f6a30372d&quot;<br>
+SRC_URI[go_linux_arm64.sha256sum] =3D &quot;01a9af009ada22122d3fcb9816049c=
1d21842524b38ef5d5a0e2ee4b26d7c3e7&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/dl/" rel=
=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.linux&q=
uot;<br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.5.bb<=
/a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.17.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.=
16.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.16.5.bb</=
a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1.17=
.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.17.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.16.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a> b/meta/recipes=
-devtools/go/<a href=3D"http://go-cross_1.17.bb" rel=3D"noreferrer" target=
=3D"_blank">go-cross_1.17.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.16.5.bb" =
rel=3D"noreferrer" target=3D"_blank">go-cross_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.17.bb" rel=
=3D"noreferrer" target=3D"_blank">go-cross_1.17.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.16.5.=
bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a> b/meta/r=
ecipes-devtools/go/<a href=3D"http://go-crosssdk_1.17.bb" rel=3D"noreferrer=
" target=3D"_blank">go-crosssdk_1.17.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.16.5.b=
b" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.17.bb" r=
el=3D"noreferrer" target=3D"_blank">go-crosssdk_1.17.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a> b/meta/recip=
es-devtools/go/<a href=3D"http://go-native_1.17.bb" rel=3D"noreferrer" targ=
et=3D"_blank">go-native_1.17.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-native_1.16.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-native_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-native_1.17.bb" rel=
=3D"noreferrer" target=3D"_blank">go-native_1.17.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.16.5.b=
b" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a> b/meta/rec=
ipes-devtools/go/<a href=3D"http://go-runtime_1.17.bb" rel=3D"noreferrer" t=
arget=3D"_blank">go-runtime_1.17.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.17.bb" re=
l=3D"noreferrer" target=3D"_blank">go-runtime_1.17.bb</a><br>
diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.16.5.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.16.5.bb</a> b/meta/recipes-devtools/=
go/<a href=3D"http://go_1.17.bb" rel=3D"noreferrer" target=3D"_blank">go_1.=
17.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-devtools/go/<a href=3D"http://go_1.16.5.bb" rel=3D=
"noreferrer" target=3D"_blank">go_1.16.5.bb</a><br>
rename to meta/recipes-devtools/go/<a href=3D"http://go_1.17.bb" rel=3D"nor=
eferrer" target=3D"_blank">go_1.17.bb</a><br>
-- <br>
2.32.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#155312): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/155312" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/155312</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/85141060/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/85141060/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a6fc7105ce2bd59f--

