Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E32C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 15:52:43 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.12859.1648482762932958990
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 08:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l/jpeqxj;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id b189so11704812qkf.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1CpEEA+NlkJTwNE9xv4nD/XUFUnczOgleH/L8mS7CPs=;
        b=l/jpeqxjeT9ceuiy60ZtqvqH1WOEmvi6G3nJFpegKevRjBv+zT99Nvqmz47uAmoQfq
         XGA//Woeetai7UlMx6/ESJcrFS5pddKJ8KsaLtCzQDKlTyq8l3SYbm1BQLAOis5IvDM4
         tR9SePdKLQkyInz2xUKBfr88z/k3M1dfauX9Uvtc8SUh1pICYBGugrbd7gPBvhdgKEjU
         P07LxeSBrfV5SHK6oAhqih0rfzBZ05Bvy0VsqXrf1jphIw4pfV4dOW4V2MjeyAzOinoO
         9eBTwjpSc1P37yLWWfGBAAMgdpPF6G4I4BkTMLl47Mr5rP9WNg/R/88h90IJTVewBGGC
         pKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1CpEEA+NlkJTwNE9xv4nD/XUFUnczOgleH/L8mS7CPs=;
        b=MOPS/jg02kEyHfcjgx992A7D0UI7lNxHJeRNLMa6KusQKGRum4x/BnLDtTT+I83bNQ
         MwQnpRl9TYtnBx0kf3r70KamqTNJQBeYGlHku290dNGF8eANzM5vWMAMlRWn/Lgv/l1Z
         fpYhyYqQMjKu2UF2ZB/uKe4afV1NBBJ9mi3cVZDmKKv/BUMrbxPeaML5hc5BROGP6W/b
         PlcYmlMIYiuBq6QlvTMu+UkwNtqOnoh+mo8oAucd1VeZCXhhvY2D+rVnl9IGfPRG8DsX
         k1HEtr6/jujuu8Cp/p9iKAxfAuzjREWPgR00BSJFkw6FGbIsvGPfr59D+0OthN53HuBH
         0LKA==
X-Gm-Message-State: AOAM530Z4IEfvc6TU37p0L6gzyf2Q0Wnk/yU3kE9kl9IgnetYnXcDLUo
	AqbiQP7nz+u4tJrfge1XwskFqixVcx07bFZSBr4=
X-Google-Smtp-Source: 
 ABdhPJxBoVkWCoLE3xM2KhovohAQv+zGXz4nMct+tpZyOkw3iu/vhyQUM47M9pr6jkWwWkzRS9Aff2oBw6ysD6pMrBM=
X-Received: by 2002:a05:620a:29ce:b0:67e:d7be:3491 with SMTP id
 s14-20020a05620a29ce00b0067ed7be3491mr16308199qkp.463.1648482761363; Mon, 28
 Mar 2022 08:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220327190053.4002853-1-raj.khem@gmail.com>
 <YkF1KVzec9qpsrbz@piout.net>
 <CANNYZj_MHAHJBxmZcCBkvVjzAZqaZWuGgH7xROn46U7OseLhfQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_MHAHJBxmZcCBkvVjzAZqaZWuGgH7xROn46U7OseLhfQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Mar 2022 08:52:15 -0700
Message-ID: 
 <CAMKF1sqgLHcQHCAB2uVbvVYwehDqPyYAfcsqw+FOn4HzmfBjvg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] go: Upgrade to 1.18
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 15:52:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163714

On Mon, Mar 28, 2022 at 2:15 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> There should be additional information in log.do_compile that helps in
> finding out where the buildids start to diverge (given that there's a
> mass of blobs in the report, it's somewhere early in the build, or
> possibly even in native pieces).

looking at diffoscope output, the differences are in buildid hashes
and the hash does include compiler commandline
so perhaps getting that info out of go build system would reveal more,
I will try to see if I can get a reproducer locally.


>
> Alex
>
> On Mon, 28 Mar 2022 at 10:43, Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Hi Khem,
> >
> > This caused the following repro failure:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/584/=
steps/12/logs/stdio
> >
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220327-do=
nu6voi/packages/diff-html/
> >
> > On 27/03/2022 12:00:53-0700, Khem Raj wrote:
> > > 1.18 is a major release brings in long awaited new features e.g.
> > > generics, fuzzing
> > >
> > > Detailed list is here [1]
> > >
> > > Drop patches to manipulate multiword CC/CXX as go has fixed it
> > > differently [2]
> > >
> > > Drop patch to hack hash generation logic, either we should find a way=
 to
> > > not use it or redo it, in current form its not upstreamable and its
> > > altering core features of go compiler, it can not be maintained as is
> > >
> > > Drop ignoring CVE-2021-29923 its already addressed in go >=3D 1.17
> > >
> > > [1] https://go.dev/doc/go1.18
> > > [2] https://groups.google.com/g/golang-codereviews/c/fUhCbpYG7HE
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/conf/distro/include/tcmode-default.inc   |   2 +-
> > >  .../go/{go-1.17.8.inc =3D> go-1.18.inc}         |  10 +-
> > >  ...ow-CC-and-CXX-to-have-multiple-words.patch |  33 ---
> > >  ...not-write-linker-flags-into-buildids.patch |   9 +-
> > >  ...ldgo.go-do-not-hardcode-host-compile.patch |   2 -
> > >  ...ent-based-hash-generation-less-pedan.patch | 237 ----------------=
--
> > >  ...-to-be-overridden-in-the-environment.patch |  10 +-
> > >  ...4-ld-add-soname-to-shareable-objects.patch |   6 +-
> > >  ...de-CC-when-building-dist-and-go_boot.patch |   6 +-
> > >  ...dist-separate-host-and-target-builds.patch |  38 ++-
> > >  ...d-go-make-GOROOT-precious-by-default.patch |  10 +-
> > >  ...008-use-GOBUILDMODE-to-set-buildmode.patch |   2 +-
> > >  ...go-make-sure-CC-and-CXX-are-absolute.patch |  94 -------
> > >  ...ive_1.17.8.bb =3D> go-binary-native_1.18.bb} |   4 +-
> > >  ...an_1.17.8.bb =3D> go-cross-canadian_1.18.bb} |   0
> > >  .../{go-cross_1.17.8.bb =3D> go-cross_1.18.bb}  |   0
> > >  ...crosssdk_1.17.8.bb =3D> go-crosssdk_1.18.bb} |   0
> > >  ...{go-native_1.17.8.bb =3D> go-native_1.18.bb} |   0
> > >  ...o-runtime_1.17.8.bb =3D> go-runtime_1.18.bb} |   0
> > >  .../go/{go_1.17.8.bb =3D> go_1.18.bb}           |   0
> > >  20 files changed, 38 insertions(+), 425 deletions(-)
> > >  rename meta/recipes-devtools/go/{go-1.17.8.inc =3D> go-1.18.inc} (57=
%)
> > >  delete mode 100644 meta/recipes-devtools/go/go-1.18/0001-allow-CC-an=
d-CXX-to-have-multiple-words.patch
> > >  delete mode 100644 meta/recipes-devtools/go/go-1.18/0002-cmd-go-make=
-content-based-hash-generation-less-pedan.patch
> > >  delete mode 100644 meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-=
go-make-sure-CC-and-CXX-are-absolute.patch
> > >  rename meta/recipes-devtools/go/{go-binary-native_1.17.8.bb =3D> go-=
binary-native_1.18.bb} (83%)
> > >  rename meta/recipes-devtools/go/{go-cross-canadian_1.17.8.bb =3D> go=
-cross-canadian_1.18.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-cross_1.17.8.bb =3D> go-cross_1.=
18.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-crosssdk_1.17.8.bb =3D> go-cross=
sdk_1.18.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-native_1.17.8.bb =3D> go-native_=
1.18.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-runtime_1.17.8.bb =3D> go-runtim=
e_1.18.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go_1.17.8.bb =3D> go_1.18.bb} (100%=
)
> > >
> > > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/=
distro/include/tcmode-default.inc
> > > index d362bd76c6f..cc542db7364 100644
> > > --- a/meta/conf/distro/include/tcmode-default.inc
> > > +++ b/meta/conf/distro/include/tcmode-default.inc
> > > @@ -23,7 +23,7 @@ GDBVERSION ?=3D "11.%"
> > >  GLIBCVERSION ?=3D "2.35"
> > >  LINUXLIBCVERSION ?=3D "5.16%"
> > >  QEMUVERSION ?=3D "6.2%"
> > > -GOVERSION ?=3D "1.17%"
> > > +GOVERSION ?=3D "1.18%"
> > >  # This can not use wildcards like 8.0.% since it is also used in mes=
a to denote
> > >  # llvm version being used, so always bump it with llvm recipe versio=
n bump
> > >  LLVMVERSION ?=3D "13.0.1"
> > > diff --git a/meta/recipes-devtools/go/go-1.17.8.inc b/meta/recipes-de=
vtools/go/go-1.18.inc
> > > similarity index 57%
> > > rename from meta/recipes-devtools/go/go-1.17.8.inc
> > > rename to meta/recipes-devtools/go/go-1.18.inc
> > > index 649c09ec1d0..c8cc2796ea9 100644
> > > --- a/meta/recipes-devtools/go/go-1.17.8.inc
> > > +++ b/meta/recipes-devtools/go/go-1.18.inc
> > > @@ -5,21 +5,13 @@ FILESEXTRAPATHS:prepend :=3D "${FILE_DIRNAME}/go-1.=
18:"
> > >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0=
dd74707"
> > >
> > >  SRC_URI +=3D "\
> > > -    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
> > > -    file://0002-cmd-go-make-content-based-hash-generation-less-pedan=
.patch \
> > >      file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.=
patch \
> > >      file://0004-ld-add-soname-to-shareable-objects.patch \
> > >      file://0005-make.bash-override-CC-when-building-dist-and-go_boot=
.patch \
> > >      file://0006-cmd-dist-separate-host-and-target-builds.patch \
> > >      file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
> > >      file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
> > > -    file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patc=
h \
> > >      file://0001-exec.go-do-not-write-linker-flags-into-buildids.patc=
h \
> > >      file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile=
.patch \
> > >  "
> > > -SRC_URI[main.sha256sum] =3D "2effcd898140da79a061f3784ca4f8d8b13d811=
fb2abe9dad2404442dabbdf7a"
> > > -
> > > -# Upstream don't believe it is a signifiant real world issue and wil=
l only
> > > -# fix in 1.17 onwards where we can drop this.
> > > -# https://github.com/golang/go/issues/30999#issuecomment-910470358
> > > -CVE_CHECK_IGNORE +=3D "CVE-2021-29923"
> > > +SRC_URI[main.sha256sum] =3D "38f423db4cc834883f2b52344282fa7a39fbb93=
650dc62a11fdf0be6409bdad6"
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-allow-CC-and-CXX-t=
o-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.18/0001-allow-C=
C-and-CXX-to-have-multiple-words.patch
> > > deleted file mode 100644
> > > index 5f4823be22b..00000000000
> > > --- a/meta/recipes-devtools/go/go-1.18/0001-allow-CC-and-CXX-to-have-=
multiple-words.patch
> > > +++ /dev/null
> > > @@ -1,33 +0,0 @@
> > > -From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 20=
01
> > > -From: Alex Kube <alexander.j.kube@gmail.com>
> > > -Date: Wed, 23 Oct 2019 21:01:13 +0430
> > > -Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
> > > -
> > > -Upstream-Status: Inappropriate [OE specific]
> > > -
> > > -Adapted to Go 1.13 from patches originally submitted to
> > > -the meta/recipes-devtools/go tree by
> > > -Matt Madison <matt@madison.systems>.
> > > -
> > > -Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> > > -
> > > ----
> > > - src/cmd/go/internal/envcmd/env.go | 4 ++--
> > > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > > -
> > > ---- a/src/cmd/go/internal/envcmd/env.go
> > > -+++ b/src/cmd/go/internal/envcmd/env.go
> > > -@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
> > > -
> > > -     cc :=3D cfg.DefaultCC(cfg.Goos, cfg.Goarch)
> > > -     if env :=3D strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
> > > --            cc =3D env[0]
> > > -+            cc =3D strings.Join(env, " ")
> > > -     }
> > > -     cxx :=3D cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
> > > -     if env :=3D strings.Fields(cfg.Getenv("CXX")); len(env) > 0 {
> > > --            cxx =3D env[0]
> > > -+            cxx =3D strings.Join(env, " ")
> > > -     }
> > > -     env =3D append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "=
ar")})
> > > -     env =3D append(env, cfg.EnvVar{Name: "CC", Value: cc})
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-wri=
te-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go-1.18/0001=
-exec.go-do-not-write-linker-flags-into-buildids.patch
> > > index 20b6636f659..f117152f2a3 100644
> > > --- a/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-link=
er-flags-into-buildids.patch
> > > +++ b/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-link=
er-flags-into-buildids.patch
> > > @@ -14,11 +14,9 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gma=
il.com>
> > >   src/cmd/go/internal/work/exec.go | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > -diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/=
work/exec.go
> > > -index 696db23..727d40b 100644
> > >  --- a/src/cmd/go/internal/work/exec.go
> > >  +++ b/src/cmd/go/internal/work/exec.go
> > > -@@ -1136,7 +1136,7 @@ func (b *Builder) linkActionID(a *Action) cach=
e.ActionID {
> > > +@@ -1274,7 +1274,7 @@ func (b *Builder) linkActionID(a *Action
> > >       }
> > >
> > >       // Toolchain-dependent configuration, shared with b.linkSharedA=
ctionID.
> > > @@ -27,7 +25,7 @@ index 696db23..727d40b 100644
> > >
> > >       // Input files.
> > >       for _, a1 :=3D range a.Deps {
> > > -@@ -1418,7 +1418,7 @@ func (b *Builder) linkSharedActionID(a *Action=
) cache.ActionID {
> > > +@@ -1568,7 +1568,7 @@ func (b *Builder) linkSharedActionID(a *
> > >       fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
> > >
> > >       // Toolchain-dependent configuration, shared with b.linkActionI=
D.
> > > @@ -36,6 +34,3 @@ index 696db23..727d40b 100644
> > >
> > >       // Input files.
> > >       for _, a1 :=3D range a.Deps {
> > > ---
> > > -2.17.1
> > > -
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-build=
go.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go-1.18=
/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
> > > index 257454a67d8..ef1cc6716a9 100644
> > > --- a/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-d=
o-not-hardcode-host-compile.patch
> > > +++ b/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-d=
o-not-hardcode-host-compile.patch
> > > @@ -13,8 +13,6 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmai=
l.com>
> > >   src/cmd/dist/buildgo.go | 8 ++++----
> > >   1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > -diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
> > > -index caafc13..4eb1c96 100644
> > >  --- a/src/cmd/dist/buildgo.go
> > >  +++ b/src/cmd/dist/buildgo.go
> > >  @@ -34,8 +34,8 @@ func mkzdefaultcc(dir, file string) {
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0002-cmd-go-make-conten=
t-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.18=
/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > deleted file mode 100644
> > > index 42cd568ef98..00000000000
> > > --- a/meta/recipes-devtools/go/go-1.18/0002-cmd-go-make-content-based=
-hash-generation-less-pedan.patch
> > > +++ /dev/null
> > > @@ -1,237 +0,0 @@
> > > -From c403b45995c5daa6747ac4d95b39bc9a6feb2cda Mon Sep 17 00:00:00 20=
01
> > > -From: Alex Kube <alexander.j.kube@gmail.com>
> > > -Date: Wed, 23 Oct 2019 21:14:22 +0430
> > > -Subject: [PATCH] cmd/go: make content-based hash generation less ped=
antic
> > > -
> > > -Upstream-Status: Inappropriate [OE specific]
> > > -
> > > -Go 1.10's build tool now uses content-based hashes to
> > > -determine when something should be built or re-built.
> > > -This same mechanism is used to maintain a built-artifact
> > > -cache for speeding up builds.
> > > -
> > > -However, the hashes it generates include information that
> > > -doesn't work well with OE, nor with using a shared runtime
> > > -library.
> > > -
> > > -First, it embeds path names to source files, unless
> > > -building within GOROOT.  This prevents the building
> > > -of a package in GOPATH for later staging into GOROOT.
> > > -
> > > -This patch adds support for the environment variable
> > > -GOPATH_OMIT_IN_ACTIONID.  If present, path name
> > > -embedding is disabled.
> > > -
> > > -Second, if cgo is enabled, the build ID for cgo-related
> > > -packages will include the current value of the environment
> > > -variables for invoking the compiler (CC, CXX, FC) and
> > > -any CGO_xxFLAGS variables.  Only if the settings used
> > > -during a compilation exactly match, character for character,
> > > -the values used for compiling runtime/cgo or any other
> > > -cgo-enabled package being imported, will the tool
> > > -decide that the imported package is up-to-date.
> > > -
> > > -This is done to help ensure correctness, but is overly
> > > -simplistic and effectively prevents the reuse of built
> > > -artifacts that use cgo (or shared runtime, which includes
> > > -runtime/cgo).
> > > -
> > > -This patch filters out all compiler flags except those
> > > -beginning with '-m'.  The default behavior can be restored
> > > -by setting the CGO_PEDANTIC environment variable.
> > > -
> > > -Adapted to Go 1.13 from patches originally submitted to
> > > -the meta/recipes-devtools/go tree by
> > > -Matt Madison <matt@madison.systems>.
> > > -
> > > -Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> > > ----
> > > - src/cmd/go/internal/envcmd/env.go |  2 +-
> > > - src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++------=
---
> > > - 2 files changed, 49 insertions(+), 19 deletions(-)
> > > -
> > > -diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal=
/envcmd/env.go
> > > -index 20d0587..ff6f0d8 100644
> > > ---- a/src/cmd/go/internal/envcmd/env.go
> > > -+++ b/src/cmd/go/internal/envcmd/env.go
> > > -@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
> > > - func ExtraEnvVarsCostly() []cfg.EnvVar {
> > > -     var b work.Builder
> > > -     b.Init()
> > > --    cppflags, cflags, cxxflags, fflags, ldflags, err :=3D b.CFlags(=
&load.Package{})
> > > -+    cppflags, cflags, cxxflags, fflags, ldflags, err :=3D b.CFlags(=
&load.Package{}, false)
> > > -     if err !=3D nil {
> > > -             // Should not happen - b.CFlags was given an empty pack=
age.
> > > -             fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> > > -diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/=
work/exec.go
> > > -index 5a225fb..a37872e 100644
> > > ---- a/src/cmd/go/internal/work/exec.go
> > > -+++ b/src/cmd/go/internal/work/exec.go
> > > -@@ -38,6 +38,8 @@ import (
> > > -     "cmd/go/internal/trace"
> > > - )
> > > -
> > > -+var omitGopath =3D os.Getenv("GOPATH_OMIT_IN_ACTIONID") !=3D ""
> > > -+
> > > - // actionList returns the list of actions in the dag rooted at root
> > > - // as visited in a depth-first post-order traversal.
> > > - func actionList(root *Action) []*Action {
> > > -@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action) cache=
.ActionID {
> > > -     // Assume b.WorkDir is being trimmed properly.
> > > -     // When -trimpath is used with a package built from the module =
cache,
> > > -     // use the module path and version instead of the directory.
> > > --    if !p.Goroot && !cfg.BuildTrimpath && !strings.HasPrefix(p.Dir,=
 b.WorkDir) {
> > > -+    if !p.Goroot && !omitGopath && !cfg.BuildTrimpath && !strings.H=
asPrefix(p.Dir, b.WorkDir) {
> > > -             fmt.Fprintf(h, "dir %s\n", p.Dir)
> > > -     } else if cfg.BuildTrimpath && p.Module !=3D nil {
> > > -             fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Modul=
e.Version)
> > > -@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action) cache=
.ActionID {
> > > -     }
> > > -     if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
> > > -             fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> > > --            cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D b.C=
Flags(p)
> > > -+            cppflags, cflags, cxxflags, fflags, ldflags, _ :=3D b.C=
Flags(p, true)
> > > -
> > > --            ccExe :=3D b.ccExe()
> > > -+            ccExe :=3D b.ccExe(true)
> > > -             fmt.Fprintf(h, "CC=3D%q %q %q %q\n", ccExe, cppflags, c=
flags, ldflags)
> > > -             // Include the C compiler tool ID so that if the C
> > > -             // compiler changes we rebuild the package.
> > > -@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action) cac=
he.ActionID {
> > > -                     }
> > > -             }
> > > -             if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> > > --                    cxxExe :=3D b.cxxExe()
> > > -+                    cxxExe :=3D b.cxxExe(true)
> > > -                     fmt.Fprintf(h, "CXX=3D%q %q\n", cxxExe, cxxflag=
s)
> > > -                     if cxxID, err :=3D b.gccToolID(cxxExe[0], "c++"=
); err =3D=3D nil {
> > > -                             fmt.Fprintf(h, "CXX ID=3D%q\n", cxxID)
> > > -                     }
> > > -             }
> > > -             if len(p.FFiles) > 0 {
> > > --                    fcExe :=3D b.fcExe()
> > > -+                    fcExe :=3D b.fcExe(true)
> > > -                     fmt.Fprintf(h, "FC=3D%q %q\n", fcExe, fflags)
> > > -                     if fcID, err :=3D b.gccToolID(fcExe[0], "f95");=
 err =3D=3D nil {
> > > -                             fmt.Fprintf(h, "FC ID=3D%q\n", fcID)
> > > -@@ -2438,33 +2440,48 @@ var (
> > > - // gccCmd returns a gcc command line prefix
> > > - // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
> > > - func (b *Builder) GccCmd(incdir, workdir string) []string {
> > > --    return b.compilerCmd(b.ccExe(), incdir, workdir)
> > > -+    return b.compilerCmd(b.ccExe(false), incdir, workdir)
> > > - }
> > > -
> > > - // gxxCmd returns a g++ command line prefix
> > > - // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
> > > - func (b *Builder) GxxCmd(incdir, workdir string) []string {
> > > --    return b.compilerCmd(b.cxxExe(), incdir, workdir)
> > > -+    return b.compilerCmd(b.cxxExe(false), incdir, workdir)
> > > - }
> > > -
> > > - // gfortranCmd returns a gfortran command line prefix.
> > > - func (b *Builder) gfortranCmd(incdir, workdir string) []string {
> > > --    return b.compilerCmd(b.fcExe(), incdir, workdir)
> > > -+    return b.compilerCmd(b.fcExe(false), incdir, workdir)
> > > - }
> > > -
> > > - // ccExe returns the CC compiler setting without all the extra flag=
s we add implicitly.
> > > --func (b *Builder) ccExe() []string {
> > > --    return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch=
))
> > > -+func (b *Builder) ccExe(filtered bool) []string {
> > > -+    return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch=
), filtered)
> > > - }
> > > -
> > > - // cxxExe returns the CXX compiler setting without all the extra fl=
ags we add implicitly.
> > > --func (b *Builder) cxxExe() []string {
> > > --    return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goar=
ch))
> > > -+func (b *Builder) cxxExe(filtered bool) []string {
> > > -+    return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goar=
ch), filtered)
> > > - }
> > > -
> > > - // fcExe returns the FC compiler setting without all the extra flag=
s we add implicitly.
> > > --func (b *Builder) fcExe() []string {
> > > --    return b.compilerExe(cfg.Getenv("FC"), "gfortran")
> > > -+func (b *Builder) fcExe(filtered bool) []string {
> > > -+    return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
> > > -+}
> > > -+
> > > -+var filterFlags =3D os.Getenv("CGO_PEDANTIC") =3D=3D ""
> > > -+
> > > -+func filterCompilerFlags(flags []string) []string {
> > > -+    var newflags []string
> > > -+    if !filterFlags {
> > > -+            return flags
> > > -+    }
> > > -+    for _, flag :=3D range flags {
> > > -+            if strings.HasPrefix(flag, "-m") {
> > > -+                    newflags =3D append(newflags, flag)
> > > -+            }
> > > -+    }
> > > -+    return newflags
> > > - }
> > > -
> > > - // compilerExe returns the compiler to use given an
> > > -@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
> > > - // of the compiler but can have additional arguments if they
> > > - // were present in the environment value.
> > > - // For example if CC=3D"gcc -DGOPHER" then the result is ["gcc", "-=
DGOPHER"].
> > > --func (b *Builder) compilerExe(envValue string, def string) []string=
 {
> > > -+func (b *Builder) compilerExe(envValue string, def string, filtered=
 bool) []string {
> > > -     compiler :=3D strings.Fields(envValue)
> > > -     if len(compiler) =3D=3D 0 {
> > > -             compiler =3D strings.Fields(def)
> > > -     }
> > > -+
> > > -+    if filtered {
> > > -+            return append(compiler[0:1], filterCompilerFlags(compil=
er[1:])...)
> > > -+    }
> > > -+
> > > -     return compiler
> > > - }
> > > -
> > > -@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
> > > - }
> > > -
> > > - // CFlags returns the flags to use when invoking the C, C++ or Fort=
ran compilers, or cgo.
> > > --func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxfla=
gs, fflags, ldflags []string, err error) {
> > > -+func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags,=
 cflags, cxxflags, fflags, ldflags []string, err error) {
> > > -     defaults :=3D "-g -O2"
> > > -
> > > -     if cppflags, err =3D buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, =
checkCompilerFlags); err !=3D nil {
> > > -@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package) (cp=
pflags, cflags, cxxflags, fflags, l
> > > -             return
> > > -     }
> > > -
> > > -+    if filtered {
> > > -+            cppflags =3D filterCompilerFlags(cppflags)
> > > -+            cflags =3D filterCompilerFlags(cflags)
> > > -+            cxxflags =3D filterCompilerFlags(cxxflags)
> > > -+            fflags =3D filterCompilerFlags(fflags)
> > > -+            ldflags =3D filterCompilerFlags(ldflags)
> > > -+    }
> > > -+
> > > -     return
> > > - }
> > > -
> > > -@@ -2700,7 +2730,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)
> > > -
> > > - func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, p=
cLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, ou=
tObj []string, err error) {
> > > -     p :=3D a.Package
> > > --    cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err=
 :=3D b.CFlags(p)
> > > -+    cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err=
 :=3D b.CFlags(p, false)
> > > -     if err !=3D nil {
> > > -             return nil, nil, err
> > > -     }
> > > -@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string) (=
intsize string, err error) {
> > > -
> > > - // Run SWIG on one SWIG input file.
> > > - func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir =
string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string,=
 err error) {
> > > --    cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D b.CFlags(p)
> > > -+    cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err :=3D b.CFlags(p,=
 false)
> > > -     if err !=3D nil {
> > > -             return "", "", err
> > > -     }
> > > ---
> > > -2.20.1
> > > -
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to=
-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.18/=
0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > > index 2a86bdccf30..c3ccffc3e95 100644
> > > --- a/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-ove=
rridden-in-the-environment.patch
> > > +++ b/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-ove=
rridden-in-the-environment.patch
> > > @@ -18,11 +18,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@=
gmail.com>
> > >   src/cmd/go/internal/cfg/cfg.go | 6 +++++-
> > >   2 files changed, 8 insertions(+), 2 deletions(-)
> > >
> > > -diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> > > -index bec1769..d82f612 100644
> > >  --- a/src/cmd/dist/build.go
> > >  +++ b/src/cmd/dist/build.go
> > > -@@ -248,7 +248,9 @@ func xinit() {
> > > +@@ -251,7 +251,9 @@ func xinit() {
> > >       }
> > >       xatexit(rmworkdir)
> > >
> > > @@ -33,11 +31,9 @@ index bec1769..d82f612 100644
> > >   }
> > >
> > >   // compilerEnv returns a map from "goos/goarch" to the
> > > -diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cf=
g/cfg.go
> > > -index 57a3c1f..825d8c7 100644
> > >  --- a/src/cmd/go/internal/cfg/cfg.go
> > >  +++ b/src/cmd/go/internal/cfg/cfg.go
> > > -@@ -67,7 +67,11 @@ func defaultContext() build.Context {
> > > +@@ -76,7 +76,11 @@ func defaultContext() build.Context {
> > >               // variables. This matches the initialization of ToolDi=
r in
> > >               // go/build, except for using ctxt.GOROOT rather than
> > >               // runtime.GOROOT.
> > > @@ -49,4 +45,4 @@ index 57a3c1f..825d8c7 100644
> > >  +            }
> > >       }
> > >
> > > -     ctxt.GOPATH =3D envOr("GOPATH", ctxt.GOPATH)
> > > +     ctxt.GOPATH =3D envOr("GOPATH", gopath(ctxt))
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-s=
hareable-objects.patch b/meta/recipes-devtools/go/go-1.18/0004-ld-add-sonam=
e-to-shareable-objects.patch
> > > index cd875f1164d..058fa64225a 100644
> > > --- a/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareabl=
e-objects.patch
> > > +++ b/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareabl=
e-objects.patch
> > > @@ -19,7 +19,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >
> > >  --- a/src/cmd/link/internal/ld/lib.go
> > >  +++ b/src/cmd/link/internal/ld/lib.go
> > > -@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
> > > +@@ -1347,6 +1347,7 @@ func (ctxt *Link) hostlink() {
> > >                               argv =3D append(argv, "-Wl,-z,relro")
> > >                       }
> > >                       argv =3D append(argv, "-shared")
> > > @@ -27,7 +27,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >                       if ctxt.HeadType =3D=3D objabi.Hwindows {
> > >                               if *flagAslr {
> > >                                       argv =3D addASLRargs(argv)
> > > -@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
> > > +@@ -1364,6 +1365,7 @@ func (ctxt *Link) hostlink() {
> > >                       argv =3D append(argv, "-Wl,-z,relro")
> > >               }
> > >               argv =3D append(argv, "-shared")
> > > @@ -35,7 +35,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >       case BuildModePlugin:
> > >               if ctxt.HeadType =3D=3D objabi.Hdarwin {
> > >                       argv =3D append(argv, "-dynamiclib")
> > > -@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
> > > +@@ -1372,6 +1374,7 @@ func (ctxt *Link) hostlink() {
> > >                               argv =3D append(argv, "-Wl,-z,relro")
> > >                       }
> > >                       argv =3D append(argv, "-shared")
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0005-make.bash-override=
-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.18=
/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > > index 2845d21382e..a6937672f58 100644
> > > --- a/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-whe=
n-building-dist-and-go_boot.patch
> > > +++ b/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-whe=
n-building-dist-and-go_boot.patch
> > > @@ -17,11 +17,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@=
gmail.com>
> > >   src/make.bash | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > -diff --git a/src/make.bash b/src/make.bash
> > > -index 7986125..dd67029 100755
> > >  --- a/src/make.bash
> > >  +++ b/src/make.bash
> > > -@@ -181,7 +181,7 @@ if [ "$GOROOT_BOOTSTRAP" =3D "$GOROOT" ]; then
> > > +@@ -195,7 +195,7 @@ if [ "$GOROOT_BOOTSTRAP" =3D "$GOROOT" ];
> > >       exit 1
> > >   fi
> > >   rm -f cmd/dist/dist
> > > @@ -30,7 +28,7 @@ index 7986125..dd67029 100755
> > >
> > >   # -e doesn't propagate out of eval, so check success by hand.
> > >   eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)
> > > -@@ -206,7 +206,7 @@ fi
> > > +@@ -220,7 +220,7 @@ fi
> > >   # Run dist bootstrap to complete make.bash.
> > >   # Bootstrap installs a proper cmd/dist, built with the new toolchai=
n.
> > >   # Throw ours, built with Go 1.4, away after bootstrap.
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-=
host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.18/0006-cmd-di=
st-separate-host-and-target-builds.patch
> > > index 68e8efc1d2c..ee743ab9900 100644
> > > --- a/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-an=
d-target-builds.patch
> > > +++ b/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-an=
d-target-builds.patch
> > > @@ -39,11 +39,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@=
gmail.com>
> > >   src/cmd/dist/build.go | 156 ++++++++++++++++++++++++++++++---------=
---
> > >   1 file changed, 113 insertions(+), 43 deletions(-)
> > >
> > > -diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> > > -index d82f612..5c8459c 100644
> > >  --- a/src/cmd/dist/build.go
> > >  +++ b/src/cmd/dist/build.go
> > > -@@ -43,6 +43,7 @@ var (
> > > +@@ -44,6 +44,7 @@ var (
> > >       goexperiment     string
> > >       workdir          string
> > >       tooldir          string
> > > @@ -51,7 +49,7 @@ index d82f612..5c8459c 100644
> > >       oldgoos          string
> > >       oldgoarch        string
> > >       exe              string
> > > -@@ -55,6 +56,7 @@ var (
> > > +@@ -54,6 +55,7 @@ var (
> > >
> > >       rebuildall   bool
> > >       defaultclang bool
> > > @@ -59,7 +57,7 @@ index d82f612..5c8459c 100644
> > >
> > >       vflag int // verbosity
> > >   )
> > > -@@ -251,6 +253,8 @@ func xinit() {
> > > +@@ -254,6 +256,8 @@ func xinit() {
> > >       if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {
> > >               tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos=
, gohostarch)
> > >       }
> > > @@ -68,7 +66,7 @@ index d82f612..5c8459c 100644
> > >   }
> > >
> > >   // compilerEnv returns a map from "goos/goarch" to the
> > > -@@ -496,8 +500,10 @@ func setup() {
> > > +@@ -499,8 +503,10 @@ func setup() {
> > >       p :=3D pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
> > >       if rebuildall {
> > >               xremoveall(p)
> > > @@ -79,7 +77,7 @@ index d82f612..5c8459c 100644
> > >
> > >       if goos !=3D gohostos || goarch !=3D gohostarch {
> > >               p :=3D pathf("%s/pkg/%s_%s", goroot, goos, goarch)
> > > -@@ -1267,17 +1273,35 @@ func cmdbootstrap() {
> > > +@@ -1252,17 +1258,35 @@ func cmdbootstrap() {
> > >
> > >       var noBanner, noClean bool
> > >       var debug bool
> > > @@ -116,7 +114,7 @@ index d82f612..5c8459c 100644
> > >       // Set GOPATH to an internal directory. We shouldn't actually
> > >       // need to store files here, since the toolchain won't
> > >       // depend on modules outside of vendor directories, but if
> > > -@@ -1345,8 +1369,13 @@ func cmdbootstrap() {
> > > +@@ -1330,8 +1354,13 @@ func cmdbootstrap() {
> > >               xprintf("\n")
> > >       }
> > >
> > > @@ -132,7 +130,7 @@ index d82f612..5c8459c 100644
> > >       goBootstrap :=3D pathf("%s/go_bootstrap", tooldir)
> > >       cmdGo :=3D pathf("%s/go", gobin)
> > >       if debug {
> > > -@@ -1375,7 +1404,11 @@ func cmdbootstrap() {
> > > +@@ -1360,7 +1389,11 @@ func cmdbootstrap() {
> > >               xprintf("\n")
> > >       }
> > >       xprintf("Building Go toolchain2 using go_bootstrap and Go toolc=
hain1.\n")
> > > @@ -145,7 +143,7 @@ index d82f612..5c8459c 100644
> > >       // Now that cmd/go is in charge of the build process, enable GO=
EXPERIMENT.
> > >       os.Setenv("GOEXPERIMENT", goexperiment)
> > >       goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
> > > -@@ -1414,50 +1447,84 @@ func cmdbootstrap() {
> > > +@@ -1399,50 +1432,84 @@ func cmdbootstrap() {
> > >       }
> > >       checkNotStale(goBootstrap, append(toolchain, "runtime/internal/=
sys")...)
> > >
> > > @@ -197,8 +195,6 @@ index d82f612..5c8459c 100644
> > >  -            timelog("build", "host toolchain")
> > >  -            if vflag > 0 {
> > >  -                    xprintf("\n")
> > > --            }
> > > --            xprintf("Building packages and commands for host, %s/%s=
.\n", goos, goarch)
> > >  +
> > >  +            if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> > >  +                    // Common case - not setting up for cross-compi=
lation.
> > > @@ -230,7 +226,8 @@ index d82f612..5c8459c 100644
> > >  +                    os.Setenv("GOARCH", goarch)
> > >  +                    os.Setenv("CC", compilerEnvLookup(defaultcc, go=
os, goarch))
> > >  +                    xprintf("Building packages and commands for tar=
get, %s/%s.\n", goos, goarch)
> > > -+            }
> > > +             }
> > > +-            xprintf("Building packages and commands for host, %s/%s=
.\n", goos, goarch)
> > >               goInstall(goBootstrap, "std", "cmd")
> > >               checkNotStale(goBootstrap, "std", "cmd")
> > >               checkNotStale(cmdGo, "std", "cmd")
> > > @@ -238,12 +235,7 @@ index d82f612..5c8459c 100644
> > >  -            timelog("build", "target toolchain")
> > >  -            if vflag > 0 {
> > >  -                    xprintf("\n")
> > > -+            if debug {
> > > -+                    run("", ShowOutput|CheckExit, pathf("%s/compile=
", tooldir), "-V=3Dfull")
> > > -+                    run("", ShowOutput|CheckExit, pathf("%s/buildid=
", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goa=
rch))
> > > -+                    checkNotStale(goBootstrap, append(toolchain, "r=
untime/internal/sys")...)
> > > -+                    copyfile(pathf("%s/compile4", tooldir), pathf("=
%s/compile", tooldir), writeExec)
> > > -             }
> > > +-            }
> > >  -            goos =3D oldgoos
> > >  -            goarch =3D oldgoarch
> > >  -            os.Setenv("GOOS", goos)
> > > @@ -264,10 +256,16 @@ index d82f612..5c8459c 100644
> > >  -            run("", ShowOutput|CheckExit, pathf("%s/buildid", toold=
ir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
> > >  -            checkNotStale(goBootstrap, append(toolchain, "runtime/i=
nternal/sys")...)
> > >  -            copyfile(pathf("%s/compile4", tooldir), pathf("%s/compi=
le", tooldir), writeExec)
> > > ++            if debug {
> > > ++                    run("", ShowOutput|CheckExit, pathf("%s/compile=
", tooldir), "-V=3Dfull")
> > > ++                    run("", ShowOutput|CheckExit, pathf("%s/buildid=
", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goa=
rch))
> > > ++                    checkNotStale(goBootstrap, append(toolchain, "r=
untime/internal/sys")...)
> > > ++                    copyfile(pathf("%s/compile4", tooldir), pathf("=
%s/compile", tooldir), writeExec)
> > > ++            }
> > >       }
> > >
> > >       // Check that there are no new files in $GOROOT/bin other than
> > > -@@ -1474,8 +1541,11 @@ func cmdbootstrap() {
> > > +@@ -1459,8 +1526,11 @@ func cmdbootstrap() {
> > >               }
> > >       }
> > >
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT=
-precious-by-default.patch b/meta/recipes-devtools/go/go-1.18/0007-cmd-go-m=
ake-GOROOT-precious-by-default.patch
> > > index 4b4d0d4f3da..534d4310456 100644
> > > --- a/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precio=
us-by-default.patch
> > > +++ b/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precio=
us-by-default.patch
> > > @@ -29,7 +29,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >
> > >  --- a/src/cmd/go/internal/work/action.go
> > >  +++ b/src/cmd/go/internal/work/action.go
> > > -@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
> > > +@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(
> > >                       if p1 =3D=3D nil || p1.Shlib =3D=3D "" || haveS=
hlib[filepath.Base(p1.Shlib)] {
> > >                               continue
> > >                       }
> > > @@ -41,7 +41,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >                       // we'll end up building an overall library or =
executable that depends at runtime
> > >  --- a/src/cmd/go/internal/work/build.go
> > >  +++ b/src/cmd/go/internal/work/build.go
> > > -@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
> > > +@@ -197,6 +197,8 @@ See also: go install, go get, go clean.
> > >
> > >   const concurrentGCBackendCompilationEnabledByDefault =3D true
> > >
> > > @@ -50,7 +50,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >   func init() {
> > >       // break init cycle
> > >       CmdBuild.Run =3D runBuild
> > > -@@ -179,6 +181,10 @@ func init() {
> > > +@@ -209,6 +211,10 @@ func init() {
> > >
> > >       AddBuildFlags(CmdBuild, DefaultBuildFlags)
> > >       AddBuildFlags(CmdInstall, DefaultBuildFlags)
> > > @@ -63,7 +63,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >   // Note that flags consulted by other parts of the code
> > >  --- a/src/cmd/go/internal/work/exec.go
> > >  +++ b/src/cmd/go/internal/work/exec.go
> > > -@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
> > > +@@ -535,6 +535,23 @@ func (b *Builder) build(ctx context.Cont
> > >               return errors.New("binary-only packages are no longer s=
upported")
> > >       }
> > >
> > > @@ -87,7 +87,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >       if err :=3D b.Mkdir(a.Objdir); err !=3D nil {
> > >               return err
> > >       }
> > > -@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
> > > +@@ -1585,6 +1602,14 @@ func (b *Builder) linkShared(ctx context
> > >               return err
> > >       }
> > >
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to=
-set-buildmode.patch b/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMOD=
E-to-set-buildmode.patch
> > > index 4e5d5021d64..0ede623af97 100644
> > > --- a/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-bu=
ildmode.patch
> > > +++ b/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-bu=
ildmode.patch
> > > @@ -25,7 +25,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@g=
mail.com>
> > >
> > >  --- a/src/cmd/go/internal/work/build.go
> > >  +++ b/src/cmd/go/internal/work/build.go
> > > -@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
> > > +@@ -283,7 +283,13 @@ func AddBuildFlags(cmd *base.Command, ma
> > >
> > >       cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
> > >       cmd.Flag.Var(buildCompiler{}, "compiler", "")
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-go-make=
-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.18/0009=
-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
> > > deleted file mode 100644
> > > index f857b722347..00000000000
> > > --- a/meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-go-make-sure-C=
C-and-CXX-are-absolute.patch
> > > +++ /dev/null
> > > @@ -1,94 +0,0 @@
> > > -From 66a45dae3af140662e17ef85c2e6fe40270a2553 Mon Sep 17 00:00:00 20=
01
> > > -From: Khem Raj <raj.khem@gmail.com>
> > > -Date: Mon, 22 Feb 2021 17:54:01 -0800
> > > -Subject: [PATCH] Revert "cmd/go: make sure CC and CXX are absolute"
> > > -
> > > -OE uses CC/CXX values which consists of cmpiler and options together=
,
> > > -secondly, the environment is canned so this check add little value t=
o OE
> > > -based builds
> > > -
> > > -Fixes go-runtime build issues
> > > -
> > > -go install: CXX environment variable is relative; must be absolute p=
ath: powerpc64le-yoe-linux-musl-g++ -mlittle-endian -mhard-float -m64 -mabi=
=3Delfv2 -mcpu=3Dpower9 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 =
-Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/mnt/b/yoe=
/master/build/tmp/work/ppc64p9le-yoe-linux-musl/go/1.16-r0/recipe-sysroot
> > > -
> > > -This reverts commit aa161e799df7e1eba99d2be10271e76b6f758142.
> > > -
> > > -Upstream-Status: Inappropriate [OE-Specific]
> > > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ----
> > > - src/cmd/go/internal/envcmd/env.go        |  5 -----
> > > - src/cmd/go/internal/work/init.go         |  6 ------
> > > - src/cmd/go/testdata/script/env_write.txt | 24 ---------------------=
---
> > > - 3 files changed, 35 deletions(-)
> > > -
> > > -diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal=
/envcmd/env.go
> > > -index ff6f0d8..43b94e7 100644
> > > ---- a/src/cmd/go/internal/envcmd/env.go
> > > -+++ b/src/cmd/go/internal/envcmd/env.go
> > > -@@ -457,11 +457,6 @@ func checkEnvWrite(key, val string) error {
> > > -             if !filepath.IsAbs(val) && val !=3D "" {
> > > -                     return fmt.Errorf("GOPATH entry is relative; mu=
st be absolute path: %q", val)
> > > -             }
> > > --    // Make sure CC and CXX are absolute paths
> > > --    case "CC", "CXX", "GOMODCACHE":
> > > --            if !filepath.IsAbs(val) && val !=3D "" && val !=3D file=
path.Base(val) {
> > > --                    return fmt.Errorf("%s entry is relative; must b=
e absolute path: %q", key, val)
> > > --            }
> > > -     }
> > > -
> > > -     if !utf8.ValidString(val) {
> > > -diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/internal/=
work/init.go
> > > -index 37a3e2d..316b0cf 100644
> > > ---- a/src/cmd/go/internal/work/init.go
> > > -+++ b/src/cmd/go/internal/work/init.go
> > > -@@ -39,12 +39,6 @@ func BuildInit() {
> > > -             cfg.BuildPkgdir =3D p
> > > -     }
> > > -
> > > --    // Make sure CC and CXX are absolute paths
> > > --    for _, key :=3D range []string{"CC", "CXX"} {
> > > --            if path :=3D cfg.Getenv(key); !filepath.IsAbs(path) && =
path !=3D "" && path !=3D filepath.Base(path) {
> > > --                    base.Fatalf("go %s: %s environment variable is =
relative; must be absolute path: %s\n", flag.Args()[0], key, path)
> > > --            }
> > > --    }
> > > - }
> > > -
> > > - func instrumentInit() {
> > > -diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/go/t=
estdata/script/env_write.txt
> > > -index b5e9739..566c876 100644
> > > ---- a/src/cmd/go/testdata/script/env_write.txt
> > > -+++ b/src/cmd/go/testdata/script/env_write.txt
> > > -@@ -129,30 +129,6 @@ go env -w GOTMPDIR=3D
> > > - go env GOTMPDIR
> > > - stdout ^$
> > > -
> > > --# go env -w rejects relative CC values
> > > --[!windows] go env -w CC=3D/usr/bin/clang
> > > --go env -w CC=3Dclang
> > > --[!windows] ! go env -w CC=3D./clang
> > > --[!windows] ! go env -w CC=3Dbin/clang
> > > --[!windows] stderr 'go env -w: CC entry is relative; must be absolut=
e path'
> > > --
> > > --[windows] go env -w CC=3D$WORK\bin\clang
> > > --[windows] ! go env -w CC=3D.\clang
> > > --[windows] ! go env -w CC=3Dbin\clang
> > > --[windows] stderr 'go env -w: CC entry is relative; must be absolute=
 path'
> > > --
> > > --# go env -w rejects relative CXX values
> > > --[!windows] go env -w CC=3D/usr/bin/cpp
> > > --go env -w CXX=3Dcpp
> > > --[!windows] ! go env -w CXX=3D./cpp
> > > --[!windows] ! go env -w CXX=3Dbin/cpp
> > > --[!windows] stderr 'go env -w: CXX entry is relative; must be absolu=
te path'
> > > --
> > > --[windows] go env -w CXX=3D$WORK\bin\cpp
> > > --[windows] ! go env -w CXX=3D.\cpp
> > > --[windows] ! go env -w CXX=3Dbin\cpp
> > > --[windows] stderr 'go env -w: CXX entry is relative; must be absolut=
e path'
> > > --
> > > - # go env -w/-u checks validity of GOOS/ARCH combinations
> > > - env GOOS=3D
> > > - env GOARCH=3D
> > > ---
> > > -2.20.1
> > > -
> > > diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.8.bb b/me=
ta/recipes-devtools/go/go-binary-native_1.18.bb
> > > similarity index 83%
> > > rename from meta/recipes-devtools/go/go-binary-native_1.17.8.bb
> > > rename to meta/recipes-devtools/go/go-binary-native_1.18.bb
> > > index 1b85cd50d61..500bb4ddcc0 100644
> > > --- a/meta/recipes-devtools/go/go-binary-native_1.17.8.bb
> > > +++ b/meta/recipes-devtools/go/go-binary-native_1.18.bb
> > > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7=
b26d2c5e4e7b4e0dd74707"
> > >  PROVIDES =3D "go-native"
> > >
> > >  SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_=
GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"
> > > -SRC_URI[go_linux_amd64.sha256sum] =3D "980e65a863377e69fd9b67df9d839=
5fd8e93858e7a24c9f55803421e453f4f99"
> > > -SRC_URI[go_linux_arm64.sha256sum] =3D "57a9171682e297df1a5bd287be056=
ed0280195ad079af90af16dcad4f64710cb"
> > > +SRC_URI[go_linux_amd64.sha256sum] =3D "e85278e98f57cdb150fe8409e6e5d=
f5343ecb13cebf03a5d5ff12bd55a80264f"
> > > +SRC_URI[go_linux_arm64.sha256sum] =3D "7ac7b396a691e588c5fb57687759e=
6c4db84a2a3bbebb0765f4b38e5b1c5b00e"
> > >
> > >  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
> > >  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
> > > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb b/m=
eta/recipes-devtools/go/go-cross-canadian_1.18.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb
> > > rename to meta/recipes-devtools/go/go-cross-canadian_1.18.bb
> > > diff --git a/meta/recipes-devtools/go/go-cross_1.17.8.bb b/meta/recip=
es-devtools/go/go-cross_1.18.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-cross_1.17.8.bb
> > > rename to meta/recipes-devtools/go/go-cross_1.18.bb
> > > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.8.bb b/meta/re=
cipes-devtools/go/go-crosssdk_1.18.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-crosssdk_1.17.8.bb
> > > rename to meta/recipes-devtools/go/go-crosssdk_1.18.bb
> > > diff --git a/meta/recipes-devtools/go/go-native_1.17.8.bb b/meta/reci=
pes-devtools/go/go-native_1.18.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-native_1.17.8.bb
> > > rename to meta/recipes-devtools/go/go-native_1.18.bb
> > > diff --git a/meta/recipes-devtools/go/go-runtime_1.17.8.bb b/meta/rec=
ipes-devtools/go/go-runtime_1.18.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-runtime_1.17.8.bb
> > > rename to meta/recipes-devtools/go/go-runtime_1.18.bb
> > > diff --git a/meta/recipes-devtools/go/go_1.17.8.bb b/meta/recipes-dev=
tools/go/go_1.18.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go_1.17.8.bb
> > > rename to meta/recipes-devtools/go/go_1.18.bb
> > > --
> > > 2.35.1
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#163687): https://lists.openembedded.org/g/openembed=
ded-core/message/163687
> > Mute This Topic: https://lists.openembedded.org/mt/90069419/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

