Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECEBC10F07
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:02:02 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.5090.1702288915016525161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B8dZJhCj;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7c5cb5eeab1so1434581241.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 02:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702288914; x=1702893714; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hZANUKvYqr8bapXfXBcgUpjGonfnFaDl5Ctb7KZw0w8=;
        b=B8dZJhCjN4u9xpenO0cmHLAA/vgTsNeRx03/Tu0TFuUpn5+uvAyQxyuaIV86bSYVlR
         EjgAAtXfliTy5JNTE289oruZPKcQUir1jRQrc1FJRjkDwkA77RP92jxefPta5G4wv1Nv
         5FECrBk2BIxF+oAiALs8Ul0FukKpivAbp3uqDtRiCleNosAttZmwj4UJ1RiO1g/ASiqI
         BSNf2FAjSm0fMZ8GxxPIEJKaoJRMIq/zrIH0dS8J/8HIIMl68Gw+k4gW+y/++sZfkcgN
         +6KoNwDToldlMixsIUoFrGVFhnP2I3ZrgbqXpIxfuUMHGAfSCMpxXDs5M2Wny69CS341
         LHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702288914; x=1702893714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZANUKvYqr8bapXfXBcgUpjGonfnFaDl5Ctb7KZw0w8=;
        b=fXMMr36kXAQZoq8HInsUqdJWm88M6Q9SSdZPlwWd1DYGhTcQkOvt+YrR5kQyCIFTsP
         pzx/pJGibOwIYy4NJagCuzbSAF57yHE0pjXUr0AXQrR79JXRF875eDwVF8ifWH48Er15
         FJIWMLcbbwyWS6EtbUiw3SG0DisPLQdG+STl7MvkyJAQAzlYoU5lEJnBiIQEyZC4kDjm
         IQBR0E0FDfl21zpurVjpznzuyGvbyZUr3+PuZDyXvcNe7+57ISk8J5n0ca5US+ObA9Mu
         xRjZliHCe0nahmIFsQd6Kaar0/V8ZH+cElLhwQGneUqKT38aBeNmcooljgHq8MDZ/Dyt
         9NTA==
X-Gm-Message-State: AOJu0YxP10pgaRcLQVJJ0+GffGui8cA6ZcuocMTAX14nVUSjV3DRd62T
	gXrsH6lDo2E2mOvgYDt2RqPIZvVZO+nycYxpvL8=
X-Google-Smtp-Source: AGHT+IH/R0d7Hu/N5ZccFObhxYHgoHxnJ1BlQs/4EN+ROZTL8gub7h7V1WbX71yZXqMDZD45whvKn5VicN76n3o8D0M=
X-Received: by 2002:a05:6102:2921:b0:464:50a1:7053 with SMTP id
 cz33-20020a056102292100b0046450a17053mr2463224vsb.28.1702288912920; Mon, 11
 Dec 2023 02:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20231207100712.67076-1-jose.quaresma@foundries.io> <202312072323535c934507@mail.local>
In-Reply-To: <202312072323535c934507@mail.local>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 11 Dec 2023 10:01:41 +0000
Message-ID: <CANPvuRn=gf0yuxn+ajNabWFe-CfEwS=-ph6OYgzPKDJWQwWUNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] go: bump 1.21.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000f5b48a060c39058c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192154

--000000000000f5b48a060c39058c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

I will investigate and try to address all the issues.
Thanks for reporting.

Jose

Alexandre Belloni <alexandre.belloni@bootlin.com> escreveu no dia quinta,
7/12/2023 =C3=A0(s) 23:23:

> Hello Jose,
>
> go.GoHelloworldTest.test_gohelloworld fails after this series:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8211/st=
eps/13/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6104/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6154/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6169/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/8256/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/7125/s=
teps/13/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/131/builds/3614/s=
teps/13/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8186/st=
eps/13/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/8193/st=
eps/13/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/109/builds/7085/s=
teps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6998/s=
teps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6159/st=
eps/14/logs/stdio
>
>
> On 07/12/2023 10:07:11+0000, Jose Quaresma wrote:
> > Go 1.21 Release Notes
> > https://go.dev/doc/go1.21
> >
> > Rework the patch 0005-cmd-dist-separate-host-and-target-builds.patch
> > to avoid identation, it's more hard to read but easy to rebase.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc   |   2 +-
> >  .../go/{go-1.20.12.inc =3D> go-1.21.0.inc}      |   2 +-
> >  ..._1.20.12.bb =3D> go-binary-native_1.21.0.bb} |   6 +-
> >  ...1.20.12.bb =3D> go-cross-canadian_1.21.0.bb} |   0
> >  ...go-cross_1.20.12.bb =3D> go-cross_1.21.0.bb} |   0
> >  ...sssdk_1.20.12.bb =3D> go-crosssdk_1.21.0.bb} |   0
> >  ...-native_1.20.12.bb =3D> go-native_1.21.0.bb} |   0
> >  ...untime_1.20.12.bb =3D> go-runtime_1.21.0.bb} |   0
> >  ...ent-based-hash-generation-less-pedan.patch |  35 ++--
> >  ...OOLDIR-to-be-overridden-in-the-envir.patch |  17 +-
> >  ...3-ld-add-soname-to-shareable-objects.patch |  13 +-
> >  ...de-CC-when-building-dist-and-go_boot.patch |  15 +-
> >  ...dist-separate-host-and-target-builds.patch | 192 ++++++------------
> >  ...d-go-make-GOROOT-precious-by-default.patch |  27 +--
> >  ...not-write-linker-flags-into-buildids.patch |  12 +-
> >  ...ldgo.go-do-not-hardcode-host-compile.patch |  12 +-
> >  ...uild-paths-on-staticly-linked-arches.patch |  23 ++-
> >  .../go/{go_1.20.12.bb =3D> go_1.21.0.bb}        |   0
> >  18 files changed, 152 insertions(+), 204 deletions(-)
> >  rename meta/recipes-devtools/go/{go-1.20.12.inc =3D> go-1.21.0.inc} (8=
9%)
> >  rename meta/recipes-devtools/go/{go-binary-native_1.20.12.bb =3D>
> go-binary-native_1.21.0.bb} (78%)
> >  rename meta/recipes-devtools/go/{go-cross-canadian_1.20.12.bb =3D>
> go-cross-canadian_1.21.0.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-cross_1.20.12.bb =3D>
> go-cross_1.21.0.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-crosssdk_1.20.12.bb =3D>
> go-crosssdk_1.21.0.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-native_1.20.12.bb =3D>
> go-native_1.21.0.bb} (100%)
> >  rename meta/recipes-devtools/go/{go-runtime_1.20.12.bb =3D>
> go-runtime_1.21.0.bb} (100%)
> >  rename meta/recipes-devtools/go/{go_1.20.12.bb =3D> go_1.21.0.bb} (100=
%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > index 707402e6eb..feebe5d30e 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -23,7 +23,7 @@ GDBVERSION ?=3D "13.%"
> >  GLIBCVERSION ?=3D "2.38%"
> >  LINUXLIBCVERSION ?=3D "6.5%"
> >  QEMUVERSION ?=3D "8.1%"
> > -GOVERSION ?=3D "1.20%"
> > +GOVERSION ?=3D "1.21%"
> >  LLVMVERSION ?=3D "17.%"
> >  RUSTVERSION ?=3D "1.70%"
> >
> > diff --git a/meta/recipes-devtools/go/go-1.20.12.inc
> b/meta/recipes-devtools/go/go-1.21.0.inc
> > similarity index 89%
> > rename from meta/recipes-devtools/go/go-1.20.12.inc
> > rename to meta/recipes-devtools/go/go-1.21.0.inc
> > index 9be56c6707..2933793b8b 100644
> > --- a/meta/recipes-devtools/go/go-1.20.12.inc
> > +++ b/meta/recipes-devtools/go/go-1.21.0.inc
> > @@ -15,4 +15,4 @@ SRC_URI +=3D "\
> >
> file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
> >      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch =
\
> >  "
> > -SRC_URI[main.sha256sum] =3D
> "c5bf934751d31c315c1d0bb5fb02296545fa6d08923566f7a5afec81f2ed27d6"
> > +SRC_URI[main.sha256sum] =3D
> "818d46ede85682dd551ad378ef37a4d247006f12ec59b5b755601d2ce114369a"
> > diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> b/meta/recipes-devtools/go/go-binary-native_1.21.0.bb
> > similarity index 78%
> > rename from meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-binary-native_1.21.0.bb
> > index e555412a19..0b8086e7b9 100644
> > --- a/meta/recipes-devtools/go/go-binary-native_1.20.12.bb
> > +++ b/meta/recipes-devtools/go/go-binary-native_1.21.0.bb
> > @@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
> >
> >  # Checksums available at https://go.dev/dl/
> >  SRC_URI =3D "
> https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;nam=
e=3Dgo_${BUILD_GOTUPLE}
> "
> > -SRC_URI[go_linux_amd64.sha256sum] =3D
> "9c5d48c54dd8b0a3b2ef91b0f92a1190aa01f11d26e98033efa64c46a30bba7b"
> > -SRC_URI[go_linux_arm64.sha256sum] =3D
> "8afe8e3fb6972eaa2179ef0a71678c67f26509fab4f0f67c4b00f4cdfa92dc87"
> > -SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "2ae0ec3736216dfbd7b01ff679842dc1bed365e53a024d522645bcffd01c7328"
> > +SRC_URI[go_linux_amd64.sha256sum] =3D
> "d0398903a16ba2232b389fb31032ddf57cac34efda306a0eebac34f0965a0742"
> > +SRC_URI[go_linux_arm64.sha256sum] =3D
> "f3d4548edf9b22f26bbd49720350bbfe59d75b7090a1a2bff1afad8214febaf3"
> > +SRC_URI[go_linux_ppc64le.sha256sum] =3D
> "e938ffc81d8ebe5efc179240960ba22da6a841ff05d5cab7ce2547112b14a47f"
> >
> >  UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
> >  UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
> > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
> b/meta/recipes-devtools/go/go-cross-canadian_1.21.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-cross-canadian_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-cross-canadian_1.21.0.bb
> > diff --git a/meta/recipes-devtools/go/go-cross_1.20.12.bb
> b/meta/recipes-devtools/go/go-cross_1.21.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-cross_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-cross_1.21.0.bb
> > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
> b/meta/recipes-devtools/go/go-crosssdk_1.21.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-crosssdk_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-crosssdk_1.21.0.bb
> > diff --git a/meta/recipes-devtools/go/go-native_1.20.12.bb
> b/meta/recipes-devtools/go/go-native_1.21.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-native_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-native_1.21.0.bb
> > diff --git a/meta/recipes-devtools/go/go-runtime_1.20.12.bb
> b/meta/recipes-devtools/go/go-runtime_1.21.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go-runtime_1.20.12.bb
> > rename to meta/recipes-devtools/go/go-runtime_1.21.0.bb
> > diff --git
> a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generat=
ion-less-pedan.patch
> b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generat=
ion-less-pedan.patch
> > index 9a2551031a..3bd756449e 100644
> > ---
> a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generat=
ion-less-pedan.patch
> > +++
> b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generat=
ion-less-pedan.patch
> > @@ -1,4 +1,4 @@
> > -From 10766ca6f4007b96e3f6bf4fb496e5df74397eb9 Mon Sep 17 00:00:00 2001
> > +From 9a6c5040cbcd88b10ceb8ceaebc8d6158c086670 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Mon, 28 Mar 2022 10:59:03 -0700
> >  Subject: [PATCH 1/9] cmd/go: make content-based hash generation less
> pedantic
> > @@ -25,16 +25,17 @@ Upstream-Status: Inappropriate [OE specific]
> >  Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
> >  Signed-off-by: Matt Madison <matt@madison.systems>
> >  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   src/cmd/go/internal/envcmd/env.go |  2 +-
> >   src/cmd/go/internal/work/exec.go  | 44 ++++++++++++++++++++++++------=
-
> >   2 files changed, 36 insertions(+), 10 deletions(-)
> >
> >  diff --git a/src/cmd/go/internal/envcmd/env.go
> b/src/cmd/go/internal/envcmd/env.go
> > -index 66ef5ce..fb7448a 100644
> > +index c7c2e83..4a90d9d 100644
> >  --- a/src/cmd/go/internal/envcmd/env.go
> >  +++ b/src/cmd/go/internal/envcmd/env.go
> > -@@ -183,7 +183,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
> > +@@ -189,7 +189,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
> >               }
> >       }()
> >
> > @@ -44,10 +45,10 @@ index 66ef5ce..fb7448a 100644
> >               // Should not happen - b.CFlags was given an empty packag=
e.
> >               fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
> >  diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> > -index 67d1193..62e1774 100644
> > +index 13d2a78..e3dd486 100644
> >  --- a/src/cmd/go/internal/work/exec.go
> >  +++ b/src/cmd/go/internal/work/exec.go
> > -@@ -223,6 +223,8 @@ func (b *Builder) Do(ctx context.Context, root
> *Action) {
> > +@@ -231,6 +231,8 @@ func (b *Builder) Do(ctx context.Context, root
> *Action) {
> >       writeActionGraph()
> >   }
> >
> > @@ -56,7 +57,7 @@ index 67d1193..62e1774 100644
> >   // buildActionID computes the action ID for a build action.
> >   func (b *Builder) buildActionID(a *Action) cache.ActionID {
> >       p :=3D a.Package
> > -@@ -244,7 +246,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> > +@@ -252,7 +254,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >               if p.Module !=3D nil {
> >                       fmt.Fprintf(h, "module %s@%s\n", p.Module.Path,
> p.Module.Version)
> >               }
> > @@ -65,7 +66,7 @@ index 67d1193..62e1774 100644
> >               // The Go compiler always hides the exact value of $GOROO=
T
> >               // when building things in GOROOT.
> >               //
> > -@@ -276,9 +278,9 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> > +@@ -284,9 +286,9 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >       }
> >       if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
> >               fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
> > @@ -77,7 +78,7 @@ index 67d1193..62e1774 100644
> >               fmt.Fprintf(h, "CC=3D%q %q %q %q\n", ccExe, cppflags,
> cflags, ldflags)
> >               // Include the C compiler tool ID so that if the C
> >               // compiler changes we rebuild the package.
> > -@@ -286,14 +288,14 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> > +@@ -294,14 +296,14 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >                       fmt.Fprintf(h, "CC ID=3D%q\n", ccID)
> >               }
> >               if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
> > @@ -94,16 +95,16 @@ index 67d1193..62e1774 100644
> >                       fmt.Fprintf(h, "FC=3D%q %q\n", fcExe, fflags)
> >                       if fcID, _, err :=3D b.gccToolID(fcExe[0], "f95")=
;
> err =3D=3D nil {
> >                               fmt.Fprintf(h, "FC ID=3D%q\n", fcID)
> > -@@ -310,7 +312,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> > +@@ -318,7 +320,7 @@ func (b *Builder) buildActionID(a *Action)
> cache.ActionID {
> >               }
> >       }
> > -     if p.Internal.BuildInfo !=3D "" {
> > --            fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
> > -+            //fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
> > +     if p.Internal.BuildInfo !=3D nil {
> > +-            fmt.Fprintf(h, "modinfo %q\n",
> p.Internal.BuildInfo.String())
> > ++            //fmt.Fprintf(h, "modinfo %q\n",
> p.Internal.BuildInfo.String())
> >       }
> >
> >       // Configuration specific to compiler toolchain.
> > -@@ -2989,8 +2991,25 @@ func envList(key, def string) []string {
> > +@@ -3137,8 +3139,25 @@ func envList(key, def string) []string {
> >       return args
> >   }
> >
> > @@ -130,7 +131,7 @@ index 67d1193..62e1774 100644
> >       if cppflags, err =3D buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS,
> checkCompilerFlags); err !=3D nil {
> >               return
> >       }
> > -@@ -3006,6 +3025,13 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> > +@@ -3154,6 +3173,13 @@ func (b *Builder) CFlags(p *load.Package)
> (cppflags, cflags, cxxflags, fflags, l
> >       if ldflags, err =3D buildFlags("LDFLAGS", defaultCFlags,
> p.CgoLDFLAGS, checkLinkerFlags); err !=3D nil {
> >               return
> >       }
> > @@ -144,7 +145,7 @@ index 67d1193..62e1774 100644
> >
> >       return
> >   }
> > -@@ -3021,7 +3047,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)
> > +@@ -3169,7 +3195,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)
> >
> >   func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS,
> pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo,
> outObj []string, err error) {
> >       p :=3D a.Package
> > @@ -153,7 +154,7 @@ index 67d1193..62e1774 100644
> >       if err !=3D nil {
> >               return nil, nil, err
> >       }
> > -@@ -3577,7 +3603,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> > +@@ -3725,7 +3751,7 @@ func (b *Builder) swigIntSize(objdir string)
> (intsize string, err error) {
> >
> >   // Run SWIG on one SWIG input file.
> >   func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir
> string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC strin=
g,
> err error) {
> > @@ -163,5 +164,5 @@ index 67d1193..62e1774 100644
> >               return "", "", err
> >       }
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridde=
n-in-the-envir.patch
> b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridde=
n-in-the-envir.patch
> > index 6abd424733..cf7ad02f86 100644
> > ---
> a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridde=
n-in-the-envir.patch
> > +++
> b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridde=
n-in-the-envir.patch
> > @@ -1,4 +1,4 @@
> > -From 5cca2fa5997292a87302bdc7e7ed3231371e98bd Mon Sep 17 00:00:00 2001
> > +From e3f9a8a69d3a340c1a1d0bba566e71f20f635a43 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:15:37 +0430
> >  Subject: [PATCH 2/9] cmd/go: Allow GOTOOLDIR to be overridden in the
> > @@ -13,16 +13,17 @@ Matt Madison <matt@madison.systems>.
> >  Upstream-Status: Inappropriate [OE specific]
> >
> >  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   src/cmd/dist/build.go          | 4 +++-
> >   src/cmd/go/internal/cfg/cfg.go | 6 +++++-
> >   2 files changed, 8 insertions(+), 2 deletions(-)
> >
> >  diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> > -index c36a12e..5d31718 100644
> > +index 8973a87..adc9fd2 100644
> >  --- a/src/cmd/dist/build.go
> >  +++ b/src/cmd/dist/build.go
> > -@@ -264,7 +264,9 @@ func xinit() {
> > +@@ -259,7 +259,9 @@ func xinit() {
> >       }
> >       xatexit(rmworkdir)
> >
> > @@ -30,14 +31,14 @@ index c36a12e..5d31718 100644
> >  +    if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {
> >  +            tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
> >  +    }
> > - }
> >
> > - // compilerEnv returns a map from "goos/goarch" to the
> > +     goversion :=3D findgoversion()
> > +     isRelease =3D strings.HasPrefix(goversion, "release.") ||
> strings.HasPrefix(goversion, "go")
> >  diff --git a/src/cmd/go/internal/cfg/cfg.go
> b/src/cmd/go/internal/cfg/cfg.go
> > -index 3257140..bb46253 100644
> > +index 8a82e55..1141fc2 100644
> >  --- a/src/cmd/go/internal/cfg/cfg.go
> >  +++ b/src/cmd/go/internal/cfg/cfg.go
> > -@@ -229,7 +229,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
> > +@@ -231,7 +231,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
> >                       // This matches the initialization of ToolDir in
> go/build, except for
> >                       // using ctxt.GOROOT and the installed GOOS and
> GOARCH rather than the
> >                       // GOROOT, GOOS, and GOARCH reported by the
> runtime package.
> > @@ -51,5 +52,5 @@ index 3257140..bb46253 100644
> >       }
> >   }
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.pat=
ch
> b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.pat=
ch
> > index ced0be1998..8afa28aab0 100644
> > ---
> a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.pat=
ch
> > +++
> b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.pat=
ch
> > @@ -1,4 +1,4 @@
> > -From c7536a820f713013ab1d4acef74a4c8bd970bf8f Mon Sep 17 00:00:00 2001
> > +From 7dde77b3ce8138314dd2736604b1b110dbcc0ac1 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:16:32 +0430
> >  Subject: [PATCH 3/9] ld: add soname to shareable objects
> > @@ -13,15 +13,16 @@ Matt Madison <matt@madison.systems>.
> >  Upstream-Status: Inappropriate [OE specific]
> >
> >  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   src/cmd/link/internal/ld/lib.go | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> >  diff --git a/src/cmd/link/internal/ld/lib.go
> b/src/cmd/link/internal/ld/lib.go
> > -index 03b9f11..e91c92f 100644
> > +index 91e2d51..e98b912 100644
> >  --- a/src/cmd/link/internal/ld/lib.go
> >  +++ b/src/cmd/link/internal/ld/lib.go
> > -@@ -1504,6 +1504,7 @@ func (ctxt *Link) hostlink() {
> > +@@ -1554,6 +1554,7 @@ func (ctxt *Link) hostlink() {
> >                               argv =3D append(argv, "-Wl,-z,relro")
> >                       }
> >                       argv =3D append(argv, "-shared")
> > @@ -29,7 +30,7 @@ index 03b9f11..e91c92f 100644
> >                       if ctxt.HeadType =3D=3D objabi.Hwindows {
> >                               argv =3D addASLRargs(argv, *flagAslr)
> >                       } else {
> > -@@ -1519,6 +1520,7 @@ func (ctxt *Link) hostlink() {
> > +@@ -1569,6 +1570,7 @@ func (ctxt *Link) hostlink() {
> >                       argv =3D append(argv, "-Wl,-z,relro")
> >               }
> >               argv =3D append(argv, "-shared")
> > @@ -37,7 +38,7 @@ index 03b9f11..e91c92f 100644
> >       case BuildModePlugin:
> >               if ctxt.HeadType =3D=3D objabi.Hdarwin {
> >                       argv =3D append(argv, "-dynamiclib")
> > -@@ -1527,6 +1529,7 @@ func (ctxt *Link) hostlink() {
> > +@@ -1577,6 +1579,7 @@ func (ctxt *Link) hostlink() {
> >                               argv =3D append(argv, "-Wl,-z,relro")
> >                       }
> >                       argv =3D append(argv, "-shared")
> > @@ -46,5 +47,5 @@ index 03b9f11..e91c92f 100644
> >       }
> >
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-di=
st-and-go_boot.patch
> b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-di=
st-and-go_boot.patch
> > index 85e42f7660..5dd2621adc 100644
> > ---
> a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-di=
st-and-go_boot.patch
> > +++
> b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-di=
st-and-go_boot.patch
> > @@ -1,4 +1,4 @@
> > -From 31ff609cc3d3bfcc2f2257fda1dbaafaec31eb0b Mon Sep 17 00:00:00 2001
> > +From 9f59e46991074d3e3c4d00f3971e62bfcd707167 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:17:16 +0430
> >  Subject: [PATCH 4/9] make.bash: override CC when building dist and
> > @@ -13,24 +13,25 @@ Matt Madison <matt@madison.systems>.
> >  Upstream-Status: Inappropriate [OE specific]
> >
> >  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   src/make.bash | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/src/make.bash b/src/make.bash
> > -index c07f39b..6ca7242 100755
> > +index 755b3b0..eddfc3c 100755
> >  --- a/src/make.bash
> >  +++ b/src/make.bash
> > -@@ -194,7 +194,7 @@ if [ "$GOROOT_BOOTSTRAP" =3D "$GOROOT" ]; then
> > +@@ -198,7 +198,7 @@ if [ "$GOROOT_BOOTSTRAP" =3D "$GOROOT" ]; then
> >       exit 1
> >   fi
> >   rm -f cmd/dist/dist
> > --GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" GOARCH=3D"" GO111MODULE=3Doff
> GOEXPERIMENT=3D"" GOENV=3Doff GOFLAGS=3D"" "$GOROOT_BOOTSTRAP/bin/go" bui=
ld -o
> cmd/dist/dist ./cmd/dist
> > -+CC=3D"${BUILD_CC:-${CC}}" GOROOT=3D"$GOROOT_BOOTSTRAP" GOOS=3D"" GOAR=
CH=3D""
> GO111MODULE=3Doff GOEXPERIMENT=3D"" GOENV=3Doff GOFLAGS=3D""
> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> > +-GOROOT=3D"$GOROOT_BOOTSTRAP" nogoenv "$GOROOT_BOOTSTRAP/bin/go" build=
 -o
> cmd/dist/dist ./cmd/dist
> > ++CC=3D"${BUILD_CC:-${CC}}" GOROOT=3D"$GOROOT_BOOTSTRAP" nogoenv
> "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
> >
> >   # -e doesn't propagate out of eval, so check success by hand.
> >   eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)
> > -@@ -219,7 +219,7 @@ fi
> > +@@ -223,7 +223,7 @@ fi
> >   # Run dist bootstrap to complete make.bash.
> >   # Bootstrap installs a proper cmd/dist, built with the new toolchain.
> >   # Throw ours, built with the bootstrap toolchain, away after bootstra=
p.
> > @@ -40,5 +41,5 @@ index c07f39b..6ca7242 100755
> >
> >   # DO NOT ADD ANY NEW CODE HERE.
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-buil=
ds.patch
> b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-buil=
ds.patch
> > index 29598449da..f8dca65ed4 100644
> > ---
> a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-buil=
ds.patch
> > +++
> b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-buil=
ds.patch
> > @@ -1,10 +1,8 @@
> > -From 7a191e5191c8b813e929caedb3f3918bb08692a1 Mon Sep 17 00:00:00 2001
> > +From 6dda78d528e60993a4688cd9d49440a726378ac8 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:18:12 +0430
> >  Subject: [PATCH 5/9] cmd/dist: separate host and target builds
> >
> > -Upstream-Status: Inappropriate [OE specific]
> > -
> >  Change the dist tool to allow for OE-style cross-
> >  and cross-canadian builds:
> >
> > @@ -33,41 +31,48 @@ Adapted to Go 1.13 from patches originally submitte=
d
> to
> >  the meta/recipes-devtools/go tree by
> >  Matt Madison <matt@madison.systems>.
> >
> > +Rework the patch to avoid identation, it's more hard to read but
> > +easy to rebase.
> > +Jose Quaresma <jose.quaresma@foundries.io>
> > +
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> >  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> > - src/cmd/dist/build.go | 152 +++++++++++++++++++++++++++++++----------=
-
> > - 1 file changed, 113 insertions(+), 39 deletions(-)
> > + src/cmd/dist/build.go | 76 ++++++++++++++++++++++++++++++++++++++++++=
-
> > + 1 file changed, 75 insertions(+), 1 deletion(-)
> >
> >  diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> > -index 5d31718..1c7f308 100644
> > +index adc9fd2..5fff592 100644
> >  --- a/src/cmd/dist/build.go
> >  +++ b/src/cmd/dist/build.go
> > -@@ -44,6 +44,7 @@ var (
> > +@@ -46,6 +46,7 @@ var (
> >       goexperiment     string
> >       workdir          string
> >       tooldir          string
> >  +    build_tooldir    string
> >       oldgoos          string
> >       oldgoarch        string
> > -     exe              string
> > -@@ -55,6 +56,7 @@ var (
> > -     rebuildall   bool
> > -     defaultclang bool
> > -     noOpt        bool
> > -+    crossBuild   bool
> > +     oldgocache       string
> > +@@ -58,6 +59,7 @@ var (
> > +     rebuildall bool
> > +     noOpt      bool
> > +     isRelease  bool
> > ++    crossBuild bool
> >
> >       vflag int // verbosity
> >   )
> > -@@ -267,6 +269,8 @@ func xinit() {
> > -     if tooldir =3D os.Getenv("GOTOOLDIR"); tooldir =3D=3D "" {
> > -             tooldir =3D pathf("%s/pkg/tool/%s_%s", goroot, gohostos,
> gohostarch)
> > -     }
> > +@@ -265,6 +267,8 @@ func xinit() {
> > +
> > +     goversion :=3D findgoversion()
> > +     isRelease =3D strings.HasPrefix(goversion, "release.") ||
> strings.HasPrefix(goversion, "go")
> >  +
> >  +    build_tooldir =3D pathf("%s/pkg/tool/native_native", goroot)
> >   }
> >
> >   // compilerEnv returns a map from "goos/goarch" to the
> > -@@ -468,8 +472,10 @@ func setup() {
> > +@@ -499,8 +503,10 @@ func setup() {
> >       goosGoarch :=3D pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarc=
h)
> >       if rebuildall {
> >               xremoveall(goosGoarch)
> > @@ -78,16 +83,18 @@ index 5d31718..1c7f308 100644
> >       xatexit(func() {
> >               if files :=3D xreaddir(goosGoarch); len(files) =3D=3D 0 {
> >                       xremove(goosGoarch)
> > -@@ -1276,17 +1282,35 @@ func cmdbootstrap() {
> > +@@ -1344,14 +1350,20 @@ func cmdbootstrap() {
> > +     defer timelog("end", "dist bootstrap")
> >
> > -     var noBanner, noClean bool
> > -     var debug bool
> > +     var debug, distpack, force, noBanner, noClean bool
> >  +    var hostOnly bool
> >  +    var targetOnly bool
> >  +    var toBuild =3D []string{"std", "cmd"}
> >  +
> >       flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
> >       flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap
> process")
> > +     flag.BoolVar(&distpack, "distpack", distpack, "write distribution
> files to pkg/distpack")
> > +     flag.BoolVar(&force, "force", force, "build even if the port is
> marked as broken")
> >       flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print
> banner")
> >       flag.BoolVar(&noClean, "no-clean", noClean, "print deprecation
> warning")
> >  +    flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host
> binaries, not target")
> > @@ -98,6 +105,8 @@ index 5d31718..1c7f308 100644
> >
> >       if noClean {
> >               xprintf("warning: --no-clean is deprecated and has no
> effect; use 'go install std cmd' instead\n")
> > +@@ -1363,6 +1375,18 @@ func cmdbootstrap() {
> > +                     "Use the -force flag to build anyway.\n", goos,
> goarch)
> >       }
> >
> >  +    if hostOnly && targetOnly {
> > @@ -115,47 +124,46 @@ index 5d31718..1c7f308 100644
> >       // Set GOPATH to an internal directory. We shouldn't actually
> >       // need to store files here, since the toolchain won't
> >       // depend on modules outside of vendor directories, but if
> > -@@ -1354,9 +1378,14 @@ func cmdbootstrap() {
> > +@@ -1440,9 +1464,14 @@ func cmdbootstrap() {
> >               xprintf("\n")
> >       }
> >
> > --    gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> > --    setNoOpt()
> > --    goldflags =3D os.Getenv("GO_LDFLAGS") // we were using
> $BOOT_GO_LDFLAGS until now
> >  +    // For split host/target cross/cross-canadian builds, we don't
> >  +    // want to be setting these flags until after we have compiled
> >  +    // the toolchain that runs on the build host.
> >  +    if !crossBuild {
> > -+            gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> > -+            setNoOpt()
> > -+            goldflags =3D os.Getenv("GO_LDFLAGS") // we were using
> $BOOT_GO_LDFLAGS until now
> > -+    }
> > +     gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using
> $BOOT_GO_GCFLAGS until now
> > +     setNoOpt()
> > +     goldflags =3D os.Getenv("GO_LDFLAGS") // we were using
> $BOOT_GO_LDFLAGS until now
> > ++}
> >       goBootstrap :=3D pathf("%s/go_bootstrap", tooldir)
> > -     cmdGo :=3D pathf("%s/go", gorootBin)
> >       if debug {
> > -@@ -1385,7 +1414,11 @@ func cmdbootstrap() {
> > +             run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=3Dfull")
> > +@@ -1470,7 +1499,11 @@ func cmdbootstrap() {
> >               xprintf("\n")
> >       }
> >       xprintf("Building Go toolchain2 using go_bootstrap and Go
> toolchain1.\n")
> > --    os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> > -+    if crossBuild {
> > ++    if !crossBuild {
> > +     os.Setenv("CC", compilerEnvLookup("CC", defaultcc, goos, goarch))
> > ++} else {
> >  +            os.Setenv("CC", defaultcc[""])
> > -+    } else {
> > -+            os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch=
))
> >  +    }
> >       // Now that cmd/go is in charge of the build process, enable
> GOEXPERIMENT.
> >       os.Setenv("GOEXPERIMENT", goexperiment)
> > -     goInstall(goBootstrap, toolchain...)
> > -@@ -1421,46 +1454,84 @@ func cmdbootstrap() {
> > -             copyfile(pathf("%s/compile3", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> > +     // No need to enable PGO for toolchain2.
> > +@@ -1523,6 +1556,7 @@ func cmdbootstrap() {
> > +             os.Setenv("GOCACHE", oldgocache)
> >       }
> >
> > --    if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> > --            // Common case - not setting up for cross-compilation.
> > --            timelog("build", "toolchain")
> > --            if vflag > 0 {
> > --                    xprintf("\n")
> > -+    if crossBuild {
> > ++    if !crossBuild {
> > +     if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> > +             // Common case - not setting up for cross-compilation.
> > +             timelog("build", "toolchain")
> > +@@ -1566,6 +1600,42 @@ func cmdbootstrap() {
> > +             checkNotStale(toolenv(), goBootstrap, toolchain...)
> > +             copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> > +     }
> > ++} else {
> >  +            gogcflags =3D os.Getenv("GO_GCFLAGS")
> >  +            goldflags =3D os.Getenv("GO_LDFLAGS")
> >  +            tool_files, _ :=3D filepath.Glob(pathf("%s/*", tooldir))
> > @@ -171,8 +179,8 @@ index 5d31718..1c7f308 100644
> >  +                            xprintf("\n")
> >  +                    }
> >  +                    xprintf("Building %s for host, %s/%s.\n",
> strings.Join(toBuild, ","), goos, goarch)
> > -+                    goInstall(goBootstrap, toBuild...)
> > -+                    checkNotStale(goBootstrap, toBuild...)
> > ++                    goInstall(toolenv(), goBootstrap, toBuild...)
> > ++                    checkNotStale(toolenv(), goBootstrap, toBuild...)
> >  +                    // Skip cmdGo staleness checks here, since we
> can't necessarily run the cmdGo binary
> >  +
> >  +                    timelog("build", "target toolchain")
> > @@ -184,99 +192,29 @@ index 5d31718..1c7f308 100644
> >  +                    goarch =3D oldgoarch
> >  +                    os.Setenv("GOOS", goos)
> >  +                    os.Setenv("GOARCH", goarch)
> > -+                    os.Setenv("CC", compilerEnvLookup(defaultcc, goos=
,
> goarch))
> > ++                    os.Setenv("CC", compilerEnvLookup("CC", defaultcc=
,
> goos, goarch))
> >  +                    xprintf("Building %s for target, %s/%s.\n",
> strings.Join(toBuild, ","), goos, goarch)
> > -+                    goInstall(goBootstrap, toBuild...)
> > -+                    checkNotStale(goBootstrap, toBuild...)
> > ++                    goInstall(toolenv(), goBootstrap, toBuild...)
> > ++                    checkNotStale(toolenv(), goBootstrap, toBuild...)
> >  +                    // Skip cmdGo staleness checks here, since we
> can't run the target's cmdGo binary
> > -             }
> > --            xprintf("Building packages and commands for %s/%s.\n",
> goos, goarch)
> > -     } else {
> > --            // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> > --            // Finish GOHOSTOS/GOHOSTARCH installation and then
> > --            // run GOOS/GOARCH installation.
> > --            timelog("build", "host toolchain")
> > --            if vflag > 0 {
> > --                    xprintf("\n")
> > -+
> > -+            if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> > -+                    // Common case - not setting up for
> cross-compilation.
> > -+                    timelog("build", "toolchain")
> > -+                    if vflag > 0 {
> > -+                            xprintf("\n")
> > -+                    }
> > -+                    xprintf("Building packages and commands for
> %s/%s.\n", goos, goarch)
> > -+            } else {
> > -+                    // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH=
.
> > -+                    // Finish GOHOSTOS/GOHOSTARCH installation and th=
en
> > -+                    // run GOOS/GOARCH installation.
> > -+                    timelog("build", "host toolchain")
> > -+                    if vflag > 0 {
> > -+                            xprintf("\n")
> > -+                    }
> > -+                    xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> > -+                    goInstall(goBootstrap, "std", "cmd")
> > -+                    checkNotStale(goBootstrap, "std", "cmd")
> > -+                    checkNotStale(cmdGo, "std", "cmd")
> > -+
> > -+                    timelog("build", "target toolchain")
> > -+                    if vflag > 0 {
> > -+                            xprintf("\n")
> > -+                    }
> > -+                    goos =3D oldgoos
> > -+                    goarch =3D oldgoarch
> > -+                    os.Setenv("GOOS", goos)
> > -+                    os.Setenv("GOARCH", goarch)
> > -+                    os.Setenv("CC", compilerEnvLookup(defaultcc, goos=
,
> goarch))
> > -+                    xprintf("Building packages and commands for
> target, %s/%s.\n", goos, goarch)
> > -             }
> > --            xprintf("Building packages and commands for host,
> %s/%s.\n", goos, goarch)
> > -             goInstall(goBootstrap, "std", "cmd")
> > -             checkNotStale(goBootstrap, "std", "cmd")
> > -             checkNotStale(cmdGo, "std", "cmd")
> > -
> > --            timelog("build", "target toolchain")
> > --            if vflag > 0 {
> > --                    xprintf("\n")
> > -+            if debug {
> > -+                    run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=3Dfull")
> > -+                    run("", ShowOutput|CheckExit, pathf("%s/buildid",
> tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos,
> goarch))
> > -+                    checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> > -+                    copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> > -             }
> > --            goos =3D oldgoos
> > --            goarch =3D oldgoarch
> > --            os.Setenv("GOOS", goos)
> > --            os.Setenv("GOARCH", goarch)
> > --            os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch=
))
> > --            xprintf("Building packages and commands for target,
> %s/%s.\n", goos, goarch)
> > --    }
> > --    targets :=3D []string{"std", "cmd"}
> > --    goInstall(goBootstrap, targets...)
> > --    checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> > --    checkNotStale(goBootstrap, targets...)
> > --    checkNotStale(cmdGo, targets...)
> > --    if debug {
> > --            run("", ShowOutput|CheckExit, pathf("%s/compile",
> tooldir), "-V=3Dfull")
> > --            checkNotStale(goBootstrap, append(toolchain,
> "runtime/internal/sys")...)
> > --            copyfile(pathf("%s/compile4", tooldir),
> pathf("%s/compile", tooldir), writeExec)
> > -     }
> > ++            }
> > ++    }
> >
> >       // Check that there are no new files in $GOROOT/bin other than
> > -@@ -1477,8 +1548,11 @@ func cmdbootstrap() {
> > +     // go and gofmt and $GOOS_$GOARCH (target bin when
> cross-compiling).
> > +@@ -1585,8 +1655,12 @@ func cmdbootstrap() {
> >               }
> >       }
> >
> > --    // Remove go_bootstrap now that we're done.
> > --    xremove(pathf("%s/go_bootstrap", tooldir))
> >  +    // Except that for split host/target cross-builds, we need to
> >  +    // keep it.
> >  +    if !crossBuild {
> > -+            xremove(pathf("%s/go_bootstrap", tooldir))
> > -+    }
> > +     // Remove go_bootstrap now that we're done.
> > +     xremove(pathf("%s/go_bootstrap"+exe, tooldir))
> > ++}
> >
> >       if goos =3D=3D "android" {
> >               // Make sure the exec wrapper will sync a fresh $GOROOT t=
o
> the device.
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default=
.patch
> b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default=
.patch
> > index 520e41da86..d118e726c6 100644
> > ---
> a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default=
.patch
> > +++
> b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default=
.patch
> > @@ -1,10 +1,8 @@
> > -From efab470498bb0a30ee2d00455a0c8c10459f6347 Mon Sep 17 00:00:00 2001
> > +From aff5a740d6286c04beb0593fc68b0aea5a95ad39 Mon Sep 17 00:00:00 2001
> >  From: Alex Kube <alexander.j.kube@gmail.com>
> >  Date: Wed, 23 Oct 2019 21:18:56 +0430
> >  Subject: [PATCH 6/9] cmd/go: make GOROOT precious by default
> >
> > -Upstream-Status: Inappropriate [OE specific]
> > -
> >  The go build tool normally rebuilds whatever it detects is
> >  stale.  This can be a problem when GOROOT is intended to
> >  be read-only and the go runtime has been built as a shared
> > @@ -20,7 +18,10 @@ Adapted to Go 1.13 from patches originally submitted
> to
> >  the meta/recipes-devtools/go tree by
> >  Matt Madison <matt@madison.systems>.
> >
> > +Upstream-Status: Inappropriate [OE specific]
> > +
> >  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   src/cmd/go/internal/work/action.go |  3 +++
> >   src/cmd/go/internal/work/build.go  |  6 ++++++
> > @@ -28,10 +29,10 @@ Signed-off-by: Alexander J Kube <
> alexander.j.kube@gmail.com>
> >   3 files changed, 34 insertions(+)
> >
> >  diff --git a/src/cmd/go/internal/work/action.go
> b/src/cmd/go/internal/work/action.go
> > -index 8beb134..68a8cfe 100644
> > +index d4d0a71..42149d2 100644
> >  --- a/src/cmd/go/internal/work/action.go
> >  +++ b/src/cmd/go/internal/work/action.go
> > -@@ -718,6 +718,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1
> *Action, shlib string) {
> > +@@ -730,6 +730,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1
> *Action, shlib string) {
> >                       if p1 =3D=3D nil || p1.Shlib =3D=3D "" ||
> haveShlib[filepath.Base(p1.Shlib)] {
> >                               continue
> >                       }
> > @@ -42,10 +43,10 @@ index 8beb134..68a8cfe 100644
> >                       // TODO(rsc): The use of ModeInstall here is
> suspect, but if we only do ModeBuild,
> >                       // we'll end up building an overall library or
> executable that depends at runtime
> >  diff --git a/src/cmd/go/internal/work/build.go
> b/src/cmd/go/internal/work/build.go
> > -index 2f2860a..8cc6166 100644
> > +index e2e0e07..1c84137 100644
> >  --- a/src/cmd/go/internal/work/build.go
> >  +++ b/src/cmd/go/internal/work/build.go
> > -@@ -217,6 +217,8 @@ See also: go install, go get, go clean.
> > +@@ -228,6 +228,8 @@ See also: go install, go get, go clean.
> >
> >   const concurrentGCBackendCompilationEnabledByDefault =3D true
> >
> > @@ -54,7 +55,7 @@ index 2f2860a..8cc6166 100644
> >   func init() {
> >       // break init cycle
> >       CmdBuild.Run =3D runBuild
> > -@@ -230,6 +232,10 @@ func init() {
> > +@@ -241,6 +243,10 @@ func init() {
> >               AddCoverFlags(CmdBuild, nil)
> >               AddCoverFlags(CmdInstall, nil)
> >       }
> > @@ -66,11 +67,11 @@ index 2f2860a..8cc6166 100644
> >
> >   // Note that flags consulted by other parts of the code
> >  diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> > -index 62e1774..cde867b 100644
> > +index e3dd486..0ea5316 100644
> >  --- a/src/cmd/go/internal/work/exec.go
> >  +++ b/src/cmd/go/internal/work/exec.go
> > -@@ -546,6 +546,23 @@ func (b *Builder) build(ctx context.Context, a
> *Action) (err error) {
> > -             return errors.New("cannot compile Go " +
> p.Module.GoVersion + " code")
> > +@@ -539,6 +539,23 @@ func (b *Builder) build(ctx context.Context, a
> *Action) (err error) {
> > +             return err
> >       }
> >
> >  +    if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
> > @@ -93,7 +94,7 @@ index 62e1774..cde867b 100644
> >       if err :=3D b.Mkdir(a.Objdir); err !=3D nil {
> >               return err
> >       }
> > -@@ -1643,6 +1660,14 @@ func (b *Builder) linkShared(ctx
> context.Context, a *Action) (err error) {
> > +@@ -1722,6 +1739,14 @@ func (b *Builder) linkShared(ctx
> context.Context, a *Action) (err error) {
> >               return err
> >       }
> >
> > @@ -109,5 +110,5 @@ index 62e1774..cde867b 100644
> >               return err
> >       }
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into=
-buildids.patch
> b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into=
-buildids.patch
> > index 7d9869b536..3e0ba35d81 100644
> > ---
> a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into=
-buildids.patch
> > +++
> b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into=
-buildids.patch
> > @@ -1,4 +1,4 @@
> > -From 0ba747e6a4b251a0d9eed0cfd8f8c491bb508040 Mon Sep 17 00:00:00 2001
> > +From 619991feab04f331d081a91243434ccd859f611d Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Mon, 23 Nov 2020 19:22:04 +0000
> >  Subject: [PATCH 7/9] exec.go: do not write linker flags into buildids
> > @@ -9,16 +9,18 @@ To make this acceptable to upstream, we probably need
> to trim the flags,
> >  removing those known to be buildhost-specific.
> >
> >  Upstream-Status: Inappropriate [needs upstream discussion]
> > +
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   src/cmd/go/internal/work/exec.go | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/src/cmd/go/internal/work/exec.go
> b/src/cmd/go/internal/work/exec.go
> > -index cde867b..5cb1812 100644
> > +index 0ea5316..d7e2d51 100644
> >  --- a/src/cmd/go/internal/work/exec.go
> >  +++ b/src/cmd/go/internal/work/exec.go
> > -@@ -1331,7 +1331,7 @@ func (b *Builder) linkActionID(a *Action)
> cache.ActionID {
> > +@@ -1357,7 +1357,7 @@ func (b *Builder) linkActionID(a *Action)
> cache.ActionID {
> >       }
> >
> >       // Toolchain-dependent configuration, shared with
> b.linkSharedActionID.
> > @@ -27,7 +29,7 @@ index cde867b..5cb1812 100644
> >
> >       // Input files.
> >       for _, a1 :=3D range a.Deps {
> > -@@ -1626,7 +1626,7 @@ func (b *Builder) linkSharedActionID(a *Action)
> cache.ActionID {
> > +@@ -1705,7 +1705,7 @@ func (b *Builder) linkSharedActionID(a *Action)
> cache.ActionID {
> >       fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
> >
> >       // Toolchain-dependent configuration, shared with b.linkActionID.
> > @@ -37,5 +39,5 @@ index cde867b..5cb1812 100644
> >       // Input files.
> >       for _, a1 :=3D range a.Deps {
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcod=
e-host-compile.patch
> b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcod=
e-host-compile.patch
> > index fe830ce35c..58512207a8 100644
> > ---
> a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcod=
e-host-compile.patch
> > +++
> b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcod=
e-host-compile.patch
> > @@ -1,4 +1,4 @@
> > -From 1cbb416538a9c7c3fbedcb23f4d90d5c48becca8 Mon Sep 17 00:00:00 2001
> > +From e0999902687e2e394499f7153db8d62440c4dab0 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Tue, 10 Nov 2020 16:33:27 +0000
> >  Subject: [PATCH 8/9] src/cmd/dist/buildgo.go: do not hardcode host
> compilers
> > @@ -8,16 +8,18 @@ These come from $CC/$CXX on the build host and are no=
t
> useful on targets;
> >  additionally as they contain host specific paths, this helps
> reproducibility.
> >
> >  Upstream-Status: Inappropriate [needs upstream discussion]
> > +
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   src/cmd/dist/buildgo.go | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> >  diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
> > -index 29b0167..63a49f0 100644
> > +index 884e9d7..2f52eda 100644
> >  --- a/src/cmd/dist/buildgo.go
> >  +++ b/src/cmd/dist/buildgo.go
> > -@@ -33,8 +33,8 @@ func mkzdefaultcc(dir, file string) {
> > +@@ -51,8 +51,8 @@ func mkzdefaultcc(dir, file string) {
> >               fmt.Fprintf(&buf, "package cfg\n")
> >               fmt.Fprintln(&buf)
> >               fmt.Fprintf(&buf, "const DefaultPkgConfig =3D `%s`\n",
> defaultpkgconfig)
> > @@ -28,7 +30,7 @@ index 29b0167..63a49f0 100644
> >               writefile(buf.String(), file, writeSkipSame)
> >               return
> >       }
> > -@@ -45,8 +45,8 @@ func mkzdefaultcc(dir, file string) {
> > +@@ -62,8 +62,8 @@ func mkzdefaultcc(dir, file string) {
> >       fmt.Fprintf(&buf, "package main\n")
> >       fmt.Fprintln(&buf)
> >       fmt.Fprintf(&buf, "const defaultPkgConfig =3D `%s`\n",
> defaultpkgconfig)
> > @@ -40,5 +42,5 @@ index 29b0167..63a49f0 100644
> >   }
> >
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git
> a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-link=
ed-arches.patch
> b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-link=
ed-arches.patch
> > index 49da5f6297..597a4e2104 100644
> > ---
> a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-link=
ed-arches.patch
> > +++
> b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-link=
ed-arches.patch
> > @@ -1,4 +1,4 @@
> > -From 18011f72125bbea273d07ee5d792ac0ce6059572 Mon Sep 17 00:00:00 2001
> > +From 6c2438f187ca912c54a71b4ac65ab98999a019d2 Mon Sep 17 00:00:00 2001
> >  From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >  Date: Sat, 2 Jul 2022 23:08:13 +0100
> >  Subject: [PATCH 9/9] go: Filter build paths on staticly linked arches
> > @@ -11,17 +11,18 @@ on mips/ppc.
> >  Upstream-Status: Submitted [https://github.com/golang/go/pull/56410]
> >
> >  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> >  ---
> >   src/cmd/go/internal/load/pkg.go | 15 +++++++++++++--
> >   1 file changed, 13 insertions(+), 2 deletions(-)
> >
> >  diff --git a/src/cmd/go/internal/load/pkg.go
> b/src/cmd/go/internal/load/pkg.go
> > -index f427e29..6d6dc4e 100644
> > +index c0e6265..b199fee 100644
> >  --- a/src/cmd/go/internal/load/pkg.go
> >  +++ b/src/cmd/go/internal/load/pkg.go
> > -@@ -2270,6 +2270,17 @@ func (p *Package) collectDeps() {
> > - // to their VCS information (vcsStatusError).
> > - var vcsStatusCache par.Cache
> > +@@ -2269,6 +2269,17 @@ func appendBuildSetting(info *debug.BuildInfo,
> key, value string) {
> > +     info.Settings =3D append(info.Settings, debug.BuildSetting{Key: k=
ey,
> Value: value})
> > + }
> >
> >  +func filterCompilerFlags(flags string) string {
> >  +    var newflags []string
> > @@ -34,10 +35,10 @@ index f427e29..6d6dc4e 100644
> >  +    return strings.Join(newflags, " ")
> >  +}
> >  +
> > - // setBuildInfo gathers build information, formats it as a string to =
be
> > - // embedded in the binary, then sets p.Internal.BuildInfo to that
> string.
> > - // setBuildInfo should only be called on a main package with no error=
s.
> > -@@ -2376,7 +2387,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
> > + // setBuildInfo gathers build information and sets it into
> > + // p.Internal.BuildInfo, which will later be formatted as a string an=
d
> embedded
> > + // in the binary. setBuildInfo should only be called on a main packag=
e
> with no
> > +@@ -2376,7 +2387,7 @@ func (p *Package) setBuildInfo(ctx
> context.Context, autoVCS bool) {
> >       if gcflags :=3D BuildGcflags.String(); gcflags !=3D "" &&
> cfg.BuildContext.Compiler =3D=3D "gc" {
> >               appendSetting("-gcflags", gcflags)
> >       }
> > @@ -46,7 +47,7 @@ index f427e29..6d6dc4e 100644
> >               // https://go.dev/issue/52372: only include ldflags if
> -trimpath is not set,
> >               // since it can include system paths through various
> linker flags (notably
> >               // -extar, -extld, and -extldflags).
> > -@@ -2422,7 +2433,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {
> > +@@ -2419,7 +2430,7 @@ func (p *Package) setBuildInfo(ctx
> context.Context, autoVCS bool) {
> >       // subset of flags that are known not to be paths?
> >       if cfg.BuildContext.CgoEnabled && !cfg.BuildTrimpath {
> >               for _, name :=3D range []string{"CGO_CFLAGS",
> "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
> > @@ -56,5 +57,5 @@ index f427e29..6d6dc4e 100644
> >       }
> >       appendSetting("GOARCH", cfg.BuildContext.GOARCH)
> >  --
> > -2.30.2
> > +2.43.0
> >
> > diff --git a/meta/recipes-devtools/go/go_1.20.12.bb
> b/meta/recipes-devtools/go/go_1.21.0.bb
> > similarity index 100%
> > rename from meta/recipes-devtools/go/go_1.20.12.bb
> > rename to meta/recipes-devtools/go/go_1.21.0.bb
> > --
> > 2.43.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191943):
> https://lists.openembedded.org/g/openembedded-core/message/191943
> > Mute This Topic: https://lists.openembedded.org/mt/103031554/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f5b48a060c39058c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexandre,<br><br>I will investigate and try to ad=
dress=C2=A0all the issues.=C2=A0</div>Thanks=C2=A0for reporting.<br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div di=
r=3D"ltr" class=3D"gmail_attr">Jose<br><br>Alexandre Belloni &lt;<a href=3D=
"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</a>&gt=
; escreveu no dia quinta, 7/12/2023 =C3=A0(s) 23:23:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Hello Jose,<br>
<br>
go.GoHelloworldTest.test_gohelloworld fails after this series:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/76/build=
s/8211/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/76/builds/8211/steps/13/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/6104/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6104/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/6154/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6154/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/build=
s/6169/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6169/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/53/build=
s/8256/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/53/builds/8256/steps/14/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/110/buil=
ds/7125/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/110/builds/7125/steps/13/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/131/buil=
ds/3614/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/131/builds/3614/steps/13/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/59/build=
s/8186/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/59/builds/8186/steps/13/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/73/build=
s/8193/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/73/builds/8193/steps/13/logs/=
stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/109/buil=
ds/7085/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/109/builds/7085/steps/14/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/101/buil=
ds/6998/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/101/builds/6998/steps/14/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/86/build=
s/6159/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6159/steps/14/logs/=
stdio</a><br>
<br>
<br>
On 07/12/2023 10:07:11+0000, Jose Quaresma wrote:<br>
&gt; Go 1.21 Release Notes<br>
&gt; <a href=3D"https://go.dev/doc/go1.21" rel=3D"noreferrer" target=3D"_bl=
ank">https://go.dev/doc/go1.21</a><br>
&gt; <br>
&gt; Rework the patch 0005-cmd-dist-separate-host-and-target-builds.patch<b=
r>
&gt; to avoid identation, it&#39;s more hard to read but easy to rebase.<br=
>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
&gt;=C2=A0 .../go/{go-1.20.12.inc =3D&gt; go-1.21.0.inc}=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 ..._<a href=3D"http://1.20.12.bb" rel=3D"noreferrer" target=3D"_=
blank">1.20.12.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.21.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.21.0.bb</a>} |=C2=
=A0 =C2=A06 +-<br>
&gt;=C2=A0 ...<a href=3D"http://1.20.12.bb" rel=3D"noreferrer" target=3D"_b=
lank">1.20.12.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.21.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.21.0.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://go-cross_1.20.12.bb" rel=3D"noreferrer" tar=
get=3D"_blank">go-cross_1.20.12.bb</a> =3D&gt; <a href=3D"http://go-cross_1=
.21.0.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.21.0.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://sssdk_1.20.12.bb" rel=3D"noreferrer" target=
=3D"_blank">sssdk_1.20.12.bb</a> =3D&gt; <a href=3D"http://go-crosssdk_1.21=
.0.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.21.0.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 ...-<a href=3D"http://native_1.20.12.bb" rel=3D"noreferrer" targ=
et=3D"_blank">native_1.20.12.bb</a> =3D&gt; <a href=3D"http://go-native_1.2=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.21.0.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 ...<a href=3D"http://untime_1.20.12.bb" rel=3D"noreferrer" targe=
t=3D"_blank">untime_1.20.12.bb</a> =3D&gt; <a href=3D"http://go-runtime_1.2=
1.0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.21.0.bb</a>} |=C2=
=A0 =C2=A00<br>
&gt;=C2=A0 ...ent-based-hash-generation-less-pedan.patch |=C2=A0 35 ++--<br=
>
&gt;=C2=A0 ...OOLDIR-to-be-overridden-in-the-envir.patch |=C2=A0 17 +-<br>
&gt;=C2=A0 ...3-ld-add-soname-to-shareable-objects.patch |=C2=A0 13 +-<br>
&gt;=C2=A0 ...de-CC-when-building-dist-and-go_boot.patch |=C2=A0 15 +-<br>
&gt;=C2=A0 ...dist-separate-host-and-target-builds.patch | 192 ++++++------=
------<br>
&gt;=C2=A0 ...d-go-make-GOROOT-precious-by-default.patch |=C2=A0 27 +--<br>
&gt;=C2=A0 ...not-write-linker-flags-into-buildids.patch |=C2=A0 12 +-<br>
&gt;=C2=A0 ...ldgo.go-do-not-hardcode-host-compile.patch |=C2=A0 12 +-<br>
&gt;=C2=A0 ...uild-paths-on-staticly-linked-arches.patch |=C2=A0 23 ++-<br>
&gt;=C2=A0 .../go/{<a href=3D"http://go_1.20.12.bb" rel=3D"noreferrer" targ=
et=3D"_blank">go_1.20.12.bb</a> =3D&gt; <a href=3D"http://go_1.21.0.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.21.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A00<br>
&gt;=C2=A0 18 files changed, 152 insertions(+), 204 deletions(-)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{go-1.20.12.inc =3D&gt; go-1.21.=
0.inc} (89%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-nat=
ive_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.=
12.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.21.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-binary-native_1.21.0.bb</a>} (78%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-cana=
dian_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.2=
0.12.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.21.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-cross-canadian_1.21.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.20=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</a> =3D&gt=
; <a href=3D"http://go-cross_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank=
">go-cross_1.21.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1=
.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12.bb</a> =
=3D&gt; <a href=3D"http://go-crosssdk_1.21.0.bb" rel=3D"noreferrer" target=
=3D"_blank">go-crosssdk_1.21.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-native_1.2=
0.12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb</a> =3D&=
gt; <a href=3D"http://go-native_1.21.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">go-native_1.21.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.=
20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.bb</a> =
=3D&gt; <a href=3D"http://go-runtime_1.21.0.bb" rel=3D"noreferrer" target=
=3D"_blank">go-runtime_1.21.0.bb</a>} (100%)<br>
&gt;=C2=A0 rename meta/recipes-devtools/go/{<a href=3D"http://go_1.20.12.bb=
" rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a> =3D&gt; <a href=3D=
"http://go_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">go_1.21.0.bb</a>=
} (100%)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc<br>
&gt; index 707402e6eb..feebe5d30e 100644<br>
&gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt; @@ -23,7 +23,7 @@ GDBVERSION ?=3D &quot;13.%&quot;<br>
&gt;=C2=A0 GLIBCVERSION ?=3D &quot;2.38%&quot;<br>
&gt;=C2=A0 LINUXLIBCVERSION ?=3D &quot;6.5%&quot;<br>
&gt;=C2=A0 QEMUVERSION ?=3D &quot;8.1%&quot;<br>
&gt; -GOVERSION ?=3D &quot;1.20%&quot;<br>
&gt; +GOVERSION ?=3D &quot;1.21%&quot;<br>
&gt;=C2=A0 LLVMVERSION ?=3D &quot;17.%&quot;<br>
&gt;=C2=A0 RUSTVERSION ?=3D &quot;1.70%&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go-1.20.12.inc b/meta/recipes-de=
vtools/go/go-1.21.0.inc<br>
&gt; similarity index 89%<br>
&gt; rename from meta/recipes-devtools/go/go-1.20.12.inc<br>
&gt; rename to meta/recipes-devtools/go/go-1.21.0.inc<br>
&gt; index 9be56c6707..2933793b8b 100644<br>
&gt; --- a/meta/recipes-devtools/go/go-1.20.12.inc<br>
&gt; +++ b/meta/recipes-devtools/go/go-1.21.0.inc<br>
&gt; @@ -15,4 +15,4 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0008-src-cmd-dist-buildgo.go-do-not-hardcod=
e-host-compile.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0009-go-Filter-build-paths-on-staticly-link=
ed-arches.patch \<br>
&gt;=C2=A0 &quot;<br>
&gt; -SRC_URI[main.sha256sum] =3D &quot;c5bf934751d31c315c1d0bb5fb02296545f=
a6d08923566f7a5afec81f2ed27d6&quot;<br>
&gt; +SRC_URI[main.sha256sum] =3D &quot;818d46ede85682dd551ad378ef37a4d2470=
06f12ec59b5b755601d2ce114369a&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-binary-nati=
ve_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.1=
2.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.21=
.0.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.21.0.bb</a><=
br>
&gt; similarity index 78%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-binary-nativ=
e_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.12=
.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-binary-native_=
1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.21.0.bb<=
/a><br>
&gt; index e555412a19..0b8086e7b9 100644<br>
&gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.20=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.20.12.bb</a=
><br>
&gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-binary-native_1.21=
.0.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.21.0.bb</a><=
br>
&gt; @@ -9,9 +9,9 @@ PROVIDES =3D &quot;go-native&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Checksums available at <a href=3D"https://go.dev/dl/" rel=3D"n=
oreferrer" target=3D"_blank">https://go.dev/dl/</a><br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://dl.google.com/go/go$%7BPV%7=
D.$%7BBUILD_GOOS%7D-$%7BBUILD_GOARCH%7D.tar.gz;name=3Dgo_$%7BBUILD_GOTUPLE%=
7D" rel=3D"noreferrer" target=3D"_blank">https://dl.google.com/go/go${PV}.$=
{BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}</a>&quot;<br=
>
&gt; -SRC_URI[go_linux_amd64.sha256sum] =3D &quot;9c5d48c54dd8b0a3b2ef91b0f=
92a1190aa01f11d26e98033efa64c46a30bba7b&quot;<br>
&gt; -SRC_URI[go_linux_arm64.sha256sum] =3D &quot;8afe8e3fb6972eaa2179ef0a7=
1678c67f26509fab4f0f67c4b00f4cdfa92dc87&quot;<br>
&gt; -SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;2ae0ec3736216dfbd7b01ff=
679842dc1bed365e53a024d522645bcffd01c7328&quot;<br>
&gt; +SRC_URI[go_linux_amd64.sha256sum] =3D &quot;d0398903a16ba2232b389fb31=
032ddf57cac34efda306a0eebac34f0965a0742&quot;<br>
&gt; +SRC_URI[go_linux_arm64.sha256sum] =3D &quot;f3d4548edf9b22f26bbd49720=
350bbfe59d75b7090a1a2bff1afad8214febaf3&quot;<br>
&gt; +SRC_URI[go_linux_ppc64le.sha256sum] =3D &quot;e938ffc81d8ebe5efc17924=
0960ba22da6a841ff05d5cab7ce2547112b14a47f&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://golang.org/dl/" =
rel=3D"noreferrer" target=3D"_blank">https://golang.org/dl/</a>&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;go(?P&lt;pver&gt;\d+(\.\d+)+)\.li=
nux&quot;<br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross-canad=
ian_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20=
.12.bb</a> b/meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian_1=
.21.0.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.21.0.bb<=
/a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cross-canadi=
an_1.20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.20.=
12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross-canadian=
_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.21.0.b=
b</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.=
12.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</a> b/meta/=
recipes-devtools/go/<a href=3D"http://go-cross_1.21.0.bb" rel=3D"noreferrer=
" target=3D"_blank">go-cross_1.21.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-cross_1.20.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.20.12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-cross_1.21.0.b=
b" rel=3D"noreferrer" target=3D"_blank">go-cross_1.21.0.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.=
20.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12.bb</a> b=
/meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.21.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">go-crosssdk_1.21.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.2=
0.12.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.20.12.bb</a><br=
>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-crosssdk_1.21.=
0.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.21.0.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-native_1.20=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb</a> b/met=
a/recipes-devtools/go/<a href=3D"http://go-native_1.21.0.bb" rel=3D"norefer=
rer" target=3D"_blank">go-native_1.21.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-native_1.20.=
12.bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.20.12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-native_1.21.0.=
bb" rel=3D"noreferrer" target=3D"_blank">go-native_1.21.0.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.2=
0.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.bb</a> b/m=
eta/recipes-devtools/go/<a href=3D"http://go-runtime_1.21.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">go-runtime_1.21.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.20=
.12.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.20.12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.21.0=
.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.21.0.bb</a><br>
&gt; diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-base=
d-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-g=
o-make-content-based-hash-generation-less-pedan.patch<br>
&gt; index 9a2551031a..3bd756449e 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-=
generation-less-pedan.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 10766ca6f4007b96e3f6bf4fb496e5df74397eb9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 9a6c5040cbcd88b10ceb8ceaebc8d6158c086670 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 28 Mar 2022 10:59:03 -0700<br>
&gt;=C2=A0 Subject: [PATCH 1/9] cmd/go: make content-based hash generation =
less pedantic<br>
&gt; @@ -25,16 +25,17 @@ Upstream-Status: Inappropriate [OE specific]<br>
&gt;=C2=A0 Signed-off-by: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@=
gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Matt Madison &lt;matt@madison.systems&gt;<br>
&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/envcmd/env.go |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/work/exec.go=C2=A0 | 44 ++++++++++++++=
++++++++++-------<br>
&gt;=C2=A0 =C2=A02 files changed, 36 insertions(+), 10 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/inte=
rnal/envcmd/env.go<br>
&gt; -index 66ef5ce..fb7448a 100644<br>
&gt; +index c7c2e83..4a90d9d 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/envcmd/env.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/envcmd/env.go<br>
&gt; -@@ -183,7 +183,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {<br>
&gt; +@@ -189,7 +189,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}()<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -44,10 +45,10 @@ index 66ef5ce..fb7448a 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Should not ha=
ppen - b.CFlags was given an empty package.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(os.S=
tderr, &quot;go: invalid cflags: %v\n&quot;, err)<br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/inter=
nal/work/exec.go<br>
&gt; -index 67d1193..62e1774 100644<br>
&gt; +index 13d2a78..e3dd486 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/exec.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/exec.go<br>
&gt; -@@ -223,6 +223,8 @@ func (b *Builder) Do(ctx context.Context, root *A=
ction) {<br>
&gt; +@@ -231,6 +231,8 @@ func (b *Builder) Do(ctx context.Context, root *A=
ction) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0writeActionGraph()<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -56,7 +57,7 @@ index 67d1193..62e1774 100644<br>
&gt;=C2=A0 =C2=A0// buildActionID computes the action ID for a build action=
.<br>
&gt;=C2=A0 =C2=A0func (b *Builder) buildActionID(a *Action) cache.ActionID =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D a.Package<br>
&gt; -@@ -244,7 +246,7 @@ func (b *Builder) buildActionID(a *Action) cache.=
ActionID {<br>
&gt; +@@ -252,7 +254,7 @@ func (b *Builder) buildActionID(a *Action) cache.=
ActionID {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if p.Module !=3D=
 nil {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fmt.Fprintf(h, &quot;module %s@%s\n&quot;, p.Module.Path, p.Mo=
dule.Version)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -65,7 +66,7 @@ index 67d1193..62e1774 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// The Go compil=
er always hides the exact value of $GOROOT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// when building=
 things in GOROOT.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0//<br>
&gt; -@@ -276,9 +278,9 @@ func (b *Builder) buildActionID(a *Action) cache.=
ActionID {<br>
&gt; +@@ -284,9 +286,9 @@ func (b *Builder) buildActionID(a *Action) cache.=
ActionID {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CgoFiles)+len(p.SwigFiles)+len(p.Sw=
igCXXFiles) &gt; 0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &=
quot;cgo %q\n&quot;, b.toolID(&quot;cgo&quot;))<br>
&gt; @@ -77,7 +78,7 @@ index 67d1193..62e1774 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &=
quot;CC=3D%q %q %q %q\n&quot;, ccExe, cppflags, cflags, ldflags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Include the C=
 compiler tool ID so that if the C<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// compiler chan=
ges we rebuild the package.<br>
&gt; -@@ -286,14 +288,14 @@ func (b *Builder) buildActionID(a *Action) cach=
e.ActionID {<br>
&gt; +@@ -294,14 +296,14 @@ func (b *Builder) buildActionID(a *Action) cach=
e.ActionID {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fmt.Fprintf(h, &quot;CC ID=3D%q\n&quot;, ccID)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(p.CXXFile=
s)+len(p.SwigCXXFiles) &gt; 0 {<br>
&gt; @@ -94,16 +95,16 @@ index 67d1193..62e1774 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0fmt.Fprintf(h, &quot;FC=3D%q %q\n&quot;, fcExe, fflags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if fcID, _, err :=3D b.gccToolID(fcExe[0], &quot;f95&quot;); e=
rr =3D=3D nil {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;FC ID=3D%q\n&=
quot;, fcID)<br>
&gt; -@@ -310,7 +312,7 @@ func (b *Builder) buildActionID(a *Action) cache.=
ActionID {<br>
&gt; +@@ -318,7 +320,7 @@ func (b *Builder) buildActionID(a *Action) cache.=
ActionID {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if p.Internal.BuildInfo !=3D &quot;&quot; {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;modin=
fo %q\n&quot;, p.Internal.BuildInfo)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //fmt.Fprintf(h, &quot;mod=
info %q\n&quot;, p.Internal.BuildInfo)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if p.Internal.BuildInfo !=3D nil {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt.Fprintf(h, &quot;modin=
fo %q\n&quot;, p.Internal.BuildInfo.String())<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 //fmt.Fprintf(h, &quot;mod=
info %q\n&quot;, p.Internal.BuildInfo.String())<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Configuration specific to compiler toolch=
ain.<br>
&gt; -@@ -2989,8 +2991,25 @@ func envList(key, def string) []string {<br>
&gt; +@@ -3137,8 +3139,25 @@ func envList(key, def string) []string {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return args<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -130,7 +131,7 @@ index 67d1193..62e1774 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if cppflags, err =3D buildFlags(&quot;CPPFLA=
GS&quot;, &quot;&quot;, p.CgoCPPFLAGS, checkCompilerFlags); err !=3D nil {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -3006,6 +3025,13 @@ func (b *Builder) CFlags(p *load.Package) (cpp=
flags, cflags, cxxflags, fflags, l<br>
&gt; +@@ -3154,6 +3173,13 @@ func (b *Builder) CFlags(p *load.Package) (cpp=
flags, cflags, cxxflags, fflags, l<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if ldflags, err =3D buildFlags(&quot;LDFLAGS=
&quot;, defaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err !=3D nil {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -144,7 +145,7 @@ index 67d1193..62e1774 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; -@@ -3021,7 +3047,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
&gt; +@@ -3169,7 +3195,7 @@ var cgoRe =3D lazyregexp.New(`[/\\:]`)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0func (b *Builder) cgo(a *Action, cgoExe, objdir string, pc=
CFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (=
outGo, outObj []string, err error) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0p :=3D a.Package<br>
&gt; @@ -153,7 +154,7 @@ index 67d1193..62e1774 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if err !=3D nil {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nil, nil,=
 err<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -3577,7 +3603,7 @@ func (b *Builder) swigIntSize(objdir string) (i=
ntsize string, err error) {<br>
&gt; +@@ -3725,7 +3751,7 @@ func (b *Builder) swigIntSize(objdir string) (i=
ntsize string, err error) {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0// Run SWIG on one SWIG input file.<br>
&gt;=C2=A0 =C2=A0func (b *Builder) swigOne(a *Action, p *load.Package, file=
, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, out=
C string, err error) {<br>
&gt; @@ -163,5 +164,5 @@ index 67d1193..62e1774 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;&qu=
ot;, &quot;&quot;, err<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-t=
o-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go/0002-cmd-g=
o-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch<br>
&gt; index 6abd424733..cf7ad02f86 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-ov=
erridden-in-the-envir.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-ov=
erridden-in-the-envir.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 5cca2fa5997292a87302bdc7e7ed3231371e98bd Mon Sep 17 00:00:00 200=
1<br>
&gt; +From e3f9a8a69d3a340c1a1d0bba566e71f20f635a43 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:15:37 +0430<br>
&gt;=C2=A0 Subject: [PATCH 2/9] cmd/go: Allow GOTOOLDIR to be overridden in=
 the<br>
&gt; @@ -13,16 +13,17 @@ Matt Madison &lt;matt@madison.systems&gt;.<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE specific]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.=
j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/cmd/dist/build.go=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
4 +++-<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/cfg/cfg.go | 6 +++++-<br>
&gt;=C2=A0 =C2=A02 files changed, 8 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
&gt; -index c36a12e..5d31718 100644<br>
&gt; +index 8973a87..adc9fd2 100644<br>
&gt;=C2=A0 --- a/src/cmd/dist/build.go<br>
&gt;=C2=A0 +++ b/src/cmd/dist/build.go<br>
&gt; -@@ -264,7 +264,9 @@ func xinit() {<br>
&gt; +@@ -259,7 +259,9 @@ func xinit() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xatexit(rmworkdir)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -30,14 +31,14 @@ index c36a12e..5d31718 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;); =
tooldir =3D=3D &quot;&quot; {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tooldir =3D pathf(&qu=
ot;%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 }<br>
&gt; - }<br>
&gt;=C2=A0 =C2=A0<br>
&gt; - // compilerEnv returns a map from &quot;goos/goarch&quot; to the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goversion :=3D findgoversion()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0isRelease =3D strings.HasPrefix(goversion, &quot;=
release.&quot;) || strings.HasPrefix(goversion, &quot;go&quot;)<br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/interna=
l/cfg/cfg.go<br>
&gt; -index 3257140..bb46253 100644<br>
&gt; +index 8a82e55..1141fc2 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/cfg/cfg.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/cfg/cfg.go<br>
&gt; -@@ -229,7 +229,11 @@ func SetGOROOT(goroot string, isTestGo bool) {<b=
r>
&gt; +@@ -231,7 +231,11 @@ func SetGOROOT(goroot string, isTestGo bool) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0// This matches the initialization of ToolDir in go/build, exc=
ept for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0// using ctxt.GOROOT and the installed GOOS and GOARCH rather =
than the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0// GOROOT, GOOS, and GOARCH reported by the runtime package.<b=
r>
&gt; @@ -51,5 +52,5 @@ index 3257140..bb46253 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareab=
le-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-sharea=
ble-objects.patch<br>
&gt; index ced0be1998..8afa28aab0 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-obje=
cts.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-obje=
cts.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From c7536a820f713013ab1d4acef74a4c8bd970bf8f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 7dde77b3ce8138314dd2736604b1b110dbcc0ac1 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:16:32 +0430<br>
&gt;=C2=A0 Subject: [PATCH 3/9] ld: add soname to shareable objects<br>
&gt; @@ -13,15 +13,16 @@ Matt Madison &lt;matt@madison.systems&gt;.<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE specific]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.=
j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/cmd/link/internal/ld/lib.go | 3 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/inte=
rnal/ld/lib.go<br>
&gt; -index 03b9f11..e91c92f 100644<br>
&gt; +index 91e2d51..e98b912 100644<br>
&gt;=C2=A0 --- a/src/cmd/link/internal/ld/lib.go<br>
&gt;=C2=A0 +++ b/src/cmd/link/internal/ld/lib.go<br>
&gt; -@@ -1504,6 +1504,7 @@ func (ctxt *Link) hostlink() {<br>
&gt; +@@ -1554,6 +1554,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z=
,relro&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
&gt; @@ -29,7 +30,7 @@ index 03b9f11..e91c92f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if ctxt.HeadType =3D=3D objabi.Hwindows {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D addASLRargs(argv, *flagAs=
lr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0} else {<br>
&gt; -@@ -1519,6 +1520,7 @@ func (ctxt *Link) hostlink() {<br>
&gt; +@@ -1569,6 +1570,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z,relro&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(=
argv, &quot;-shared&quot;)<br>
&gt; @@ -37,7 +38,7 @@ index 03b9f11..e91c92f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case BuildModePlugin:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ctxt.HeadType=
 =3D=3D objabi.Hdarwin {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0argv =3D append(argv, &quot;-dynamiclib&quot;)<br>
&gt; -@@ -1527,6 +1529,7 @@ func (ctxt *Link) hostlink() {<br>
&gt; +@@ -1577,6 +1579,7 @@ func (ctxt *Link) hostlink() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0argv =3D append(argv, &quot;-Wl,-z=
,relro&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0argv =3D append(argv, &quot;-shared&quot;)<br>
&gt; @@ -46,5 +47,5 @@ index 03b9f11..e91c92f 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-wh=
en-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0004-make.=
bash-override-CC-when-building-dist-and-go_boot.patch<br>
&gt; index 85e42f7660..5dd2621adc 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-buil=
ding-dist-and-go_boot.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-buil=
ding-dist-and-go_boot.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 31ff609cc3d3bfcc2f2257fda1dbaafaec31eb0b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 9f59e46991074d3e3c4d00f3971e62bfcd707167 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:17:16 +0430<br>
&gt;=C2=A0 Subject: [PATCH 4/9] make.bash: override CC when building dist a=
nd<br>
&gt; @@ -13,24 +13,25 @@ Matt Madison &lt;matt@madison.systems&gt;.<br>
&gt;=C2=A0 Upstream-Status: Inappropriate [OE specific]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.=
j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/make.bash | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/make.bash b/src/make.bash<br>
&gt; -index c07f39b..6ca7242 100755<br>
&gt; +index 755b3b0..eddfc3c 100755<br>
&gt;=C2=A0 --- a/src/make.bash<br>
&gt;=C2=A0 +++ b/src/make.bash<br>
&gt; -@@ -194,7 +194,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOR=
OOT&quot; ]; then<br>
&gt; +@@ -198,7 +198,7 @@ if [ &quot;$GOROOT_BOOTSTRAP&quot; =3D &quot;$GOR=
OOT&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0rm -f cmd/dist/dist<br>
&gt; --GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; GOOS=3D&quot;&quot; GOARCH=3D=
&quot;&quot; GO111MODULE=3Doff GOEXPERIMENT=3D&quot;&quot; GOENV=3Doff GOFL=
AGS=3D&quot;&quot; &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd/dist/d=
ist ./cmd/dist<br>
&gt; -+CC=3D&quot;${BUILD_CC:-${CC}}&quot; GOROOT=3D&quot;$GOROOT_BOOTSTRAP=
&quot; GOOS=3D&quot;&quot; GOARCH=3D&quot;&quot; GO111MODULE=3Doff GOEXPERI=
MENT=3D&quot;&quot; GOENV=3Doff GOFLAGS=3D&quot;&quot; &quot;$GOROOT_BOOTST=
RAP/bin/go&quot; build -o cmd/dist/dist ./cmd/dist<br>
&gt; +-GOROOT=3D&quot;$GOROOT_BOOTSTRAP&quot; nogoenv &quot;$GOROOT_BOOTSTR=
AP/bin/go&quot; build -o cmd/dist/dist ./cmd/dist<br>
&gt; ++CC=3D&quot;${BUILD_CC:-${CC}}&quot; GOROOT=3D&quot;$GOROOT_BOOTSTRAP=
&quot; nogoenv &quot;$GOROOT_BOOTSTRAP/bin/go&quot; build -o cmd/dist/dist =
./cmd/dist<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# -e doesn&#39;t propagate out of eval, so check success b=
y hand.<br>
&gt;=C2=A0 =C2=A0eval $(./cmd/dist/dist env -p || echo FAIL=3Dtrue)<br>
&gt; -@@ -219,7 +219,7 @@ fi<br>
&gt; +@@ -223,7 +223,7 @@ fi<br>
&gt;=C2=A0 =C2=A0# Run dist bootstrap to complete make.bash.<br>
&gt;=C2=A0 =C2=A0# Bootstrap installs a proper cmd/dist, built with the new=
 toolchain.<br>
&gt;=C2=A0 =C2=A0# Throw ours, built with the bootstrap toolchain, away aft=
er bootstrap.<br>
&gt; @@ -40,5 +41,5 @@ index c07f39b..6ca7242 100755<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# DO NOT ADD ANY NEW CODE HERE.<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-a=
nd-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate=
-host-and-target-builds.patch<br>
&gt; index 29598449da..f8dca65ed4 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-targ=
et-builds.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-targ=
et-builds.patch<br>
&gt; @@ -1,10 +1,8 @@<br>
&gt; -From 7a191e5191c8b813e929caedb3f3918bb08692a1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 6dda78d528e60993a4688cd9d49440a726378ac8 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:18:12 +0430<br>
&gt;=C2=A0 Subject: [PATCH 5/9] cmd/dist: separate host and target builds<b=
r>
&gt;=C2=A0 <br>
&gt; -Upstream-Status: Inappropriate [OE specific]<br>
&gt; -<br>
&gt;=C2=A0 Change the dist tool to allow for OE-style cross-<br>
&gt;=C2=A0 and cross-canadian builds:<br>
&gt;=C2=A0 <br>
&gt; @@ -33,41 +31,48 @@ Adapted to Go 1.13 from patches originally submitt=
ed to<br>
&gt;=C2=A0 the meta/recipes-devtools/go tree by<br>
&gt;=C2=A0 Matt Madison &lt;matt@madison.systems&gt;.<br>
&gt;=C2=A0 <br>
&gt; +Rework the patch to avoid identation, it&#39;s more hard to read but<=
br>
&gt; +easy to rebase.<br>
&gt; +Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foundries.io" targe=
t=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE specific]<br>
&gt; +<br>
&gt;=C2=A0 Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.=
j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - src/cmd/dist/build.go | 152 +++++++++++++++++++++++++++++++---------=
--<br>
&gt; - 1 file changed, 113 insertions(+), 39 deletions(-)<br>
&gt; + src/cmd/dist/build.go | 76 +++++++++++++++++++++++++++++++++++++++++=
+-<br>
&gt; + 1 file changed, 75 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go<br>
&gt; -index 5d31718..1c7f308 100644<br>
&gt; +index adc9fd2..5fff592 100644<br>
&gt;=C2=A0 --- a/src/cmd/dist/build.go<br>
&gt;=C2=A0 +++ b/src/cmd/dist/build.go<br>
&gt; -@@ -44,6 +44,7 @@ var (<br>
&gt; +@@ -46,6 +46,7 @@ var (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0goexperiment=C2=A0 =C2=A0 =C2=A0string<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0workdir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st=
ring<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tooldir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st=
ring<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 build_tooldir=C2=A0 =C2=A0 string<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oldgoos=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 st=
ring<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oldgoarch=C2=A0 =C2=A0 =C2=A0 =C2=A0 string<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0exe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 string<br>
&gt; -@@ -55,6 +56,7 @@ var (<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rebuildall=C2=A0 =C2=A0bool<br>
&gt; -=C2=A0 =C2=A0 =C2=A0defaultclang bool<br>
&gt; -=C2=A0 =C2=A0 =C2=A0noOpt=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; -+=C2=A0 =C2=A0 crossBuild=C2=A0 =C2=A0bool<br>
&gt; +=C2=A0 =C2=A0 =C2=A0oldgocache=C2=A0 =C2=A0 =C2=A0 =C2=A0string<br>
&gt; +@@ -58,6 +59,7 @@ var (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rebuildall bool<br>
&gt; +=C2=A0 =C2=A0 =C2=A0noOpt=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; +=C2=A0 =C2=A0 =C2=A0isRelease=C2=A0 bool<br>
&gt; ++=C2=A0 =C2=A0 crossBuild bool<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vflag int // verbosity<br>
&gt;=C2=A0 =C2=A0)<br>
&gt; -@@ -267,6 +269,8 @@ func xinit() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if tooldir =3D os.Getenv(&quot;GOTOOLDIR&quot;); =
tooldir =3D=3D &quot;&quot; {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tooldir =3D pathf(&qu=
ot;%s/pkg/tool/%s_%s&quot;, goroot, gohostos, gohostarch)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -265,6 +267,8 @@ func xinit() {<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0goversion :=3D findgoversion()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0isRelease =3D strings.HasPrefix(goversion, &quot;=
release.&quot;) || strings.HasPrefix(goversion, &quot;go&quot;)<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 build_tooldir =3D pathf(&quot;%s/pkg/tool/native_=
native&quot;, goroot)<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0// compilerEnv returns a map from &quot;goos/goarch&quot; =
to the<br>
&gt; -@@ -468,8 +472,10 @@ func setup() {<br>
&gt; +@@ -499,8 +503,10 @@ func setup() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0goosGoarch :=3D pathf(&quot;%s/pkg/%s_%s&quo=
t;, goroot, gohostos, gohostarch)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if rebuildall {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xremoveall(goosG=
oarch)<br>
&gt; @@ -78,16 +83,18 @@ index 5d31718..1c7f308 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xatexit(func() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if files :=3D xr=
eaddir(goosGoarch); len(files) =3D=3D 0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0xremove(goosGoarch)<br>
&gt; -@@ -1276,17 +1282,35 @@ func cmdbootstrap() {<br>
&gt; +@@ -1344,14 +1350,20 @@ func cmdbootstrap() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0defer timelog(&quot;end&quot;, &quot;dist bootstr=
ap&quot;)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 =C2=A0var noBanner, noClean bool<br>
&gt; -=C2=A0 =C2=A0 =C2=A0var debug bool<br>
&gt; +=C2=A0 =C2=A0 =C2=A0var debug, distpack, force, noBanner, noClean boo=
l<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 var hostOnly bool<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 var targetOnly bool<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 var toBuild =3D []string{&quot;std&quot;, &quot;c=
md&quot;}<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;rebuildall, &quot;a&quot;,=
 rebuildall, &quot;rebuild all&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;debug, &quot;d&quot;, debu=
g, &quot;enable debugging of bootstrap process&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;distpack, &quot;distpack&quot;,=
 distpack, &quot;write distribution files to pkg/distpack&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;force, &quot;force&quot;, force=
, &quot;build even if the port is marked as broken&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;noBanner, &quot;no-banner&=
quot;, noBanner, &quot;do not print banner&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0flag.BoolVar(&amp;noClean, &quot;no-clean&qu=
ot;, noClean, &quot;print deprecation warning&quot;)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 flag.BoolVar(&amp;hostOnly, &quot;host-only&quot;=
, hostOnly, &quot;build only host binaries, not target&quot;)<br>
&gt; @@ -98,6 +105,8 @@ index 5d31718..1c7f308 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if noClean {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;wa=
rning: --no-clean is deprecated and has no effect; use &#39;go install std =
cmd&#39; instead\n&quot;)<br>
&gt; +@@ -1363,6 +1375,18 @@ func cmdbootstrap() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Use the -force flag to build anyway.\n&quot;, goos, goarch)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if hostOnly &amp;&amp; targetOnly {<br>
&gt; @@ -115,47 +124,46 @@ index 5d31718..1c7f308 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Set GOPATH to an internal directory. We s=
houldn&#39;t actually<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// need to store files here, since the toolc=
hain won&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// depend on modules outside of vendor direc=
tories, but if<br>
&gt; -@@ -1354,9 +1378,14 @@ func cmdbootstrap() {<br>
&gt; +@@ -1440,9 +1464,14 @@ func cmdbootstrap() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;\n=
&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; --=C2=A0 =C2=A0 gogcflags =3D os.Getenv(&quot;GO_GCFLAGS&quot;) // we =
were using $BOOT_GO_GCFLAGS until now<br>
&gt; --=C2=A0 =C2=A0 setNoOpt()<br>
&gt; --=C2=A0 =C2=A0 goldflags =3D os.Getenv(&quot;GO_LDFLAGS&quot;) // we =
were using $BOOT_GO_LDFLAGS until now<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 // For split host/target cross/cross-canadian bui=
lds, we don&#39;t<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 // want to be setting these flags until after we =
have compiled<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 // the toolchain that runs on the build host.<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if !crossBuild {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Getenv(&q=
uot;GO_GCFLAGS&quot;) // we were using $BOOT_GO_GCFLAGS until now<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 setNoOpt()<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Getenv(&q=
uot;GO_LDFLAGS&quot;) // we were using $BOOT_GO_LDFLAGS until now<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gogcflags =3D os.Getenv(&quot;GO_GCFLAGS&quot;) /=
/ we were using $BOOT_GO_GCFLAGS until now<br>
&gt; +=C2=A0 =C2=A0 =C2=A0setNoOpt()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goldflags =3D os.Getenv(&quot;GO_LDFLAGS&quot;) /=
/ we were using $BOOT_GO_LDFLAGS until now<br>
&gt; ++}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0goBootstrap :=3D pathf(&quot;%s/go_bootstrap=
&quot;, tooldir)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cmdGo :=3D pathf(&quot;%s/go&quot;, gorootBin)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if debug {<br>
&gt; -@@ -1385,7 +1414,11 @@ func cmdbootstrap() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0run(&quot;&quot;, Sho=
wOutput|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dfull&=
quot;)<br>
&gt; +@@ -1470,7 +1499,11 @@ func cmdbootstrap() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;\n=
&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0xprintf(&quot;Building Go toolchain2 using g=
o_bootstrap and Go toolchain1.\n&quot;)<br>
&gt; --=C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc,=
 goos, goarch))<br>
&gt; -+=C2=A0 =C2=A0 if crossBuild {<br>
&gt; ++=C2=A0 =C2=A0 if !crossBuild {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0os.Setenv(&quot;CC&quot;, compilerEnvLookup(&quot=
;CC&quot;, defaultcc, goos, goarch))<br>
&gt; ++} else {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&qu=
ot;, defaultcc[&quot;&quot;])<br>
&gt; -+=C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;, =
compilerEnvLookup(defaultcc, goos, goarch))<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Now that cmd/go is in charge of the build=
 process, enable GOEXPERIMENT.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0os.Setenv(&quot;GOEXPERIMENT&quot;, goexperi=
ment)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0goInstall(goBootstrap, toolchain...)<br>
&gt; -@@ -1421,46 +1454,84 @@ func cmdbootstrap() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copyfile(pathf(&quot;=
%s/compile3&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeE=
xec)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// No need to enable PGO for toolchain2.<br>
&gt; +@@ -1523,6 +1556,7 @@ func cmdbootstrap() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.Setenv(&quot;GOCAC=
HE&quot;, oldgocache)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; --=C2=A0 =C2=A0 if goos =3D=3D oldgoos &amp;&amp; goarch =3D=3D oldgoa=
rch {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Common case - not setti=
ng up for cross-compilation.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot;,=
 &quot;toolchain&quot;)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
&gt; -+=C2=A0 =C2=A0 if crossBuild {<br>
&gt; ++=C2=A0 =C2=A0 if !crossBuild {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if goos =3D=3D oldgoos &amp;&amp; goarch =3D=3D o=
ldgoarch {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Common case - not =
setting up for cross-compilation.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timelog(&quot;build&q=
uot;, &quot;toolchain&quot;)<br>
&gt; +@@ -1566,6 +1600,42 @@ func cmdbootstrap() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(toolenv=
(), goBootstrap, toolchain...)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0copyfile(pathf(&quot;=
%s/compile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeE=
xec)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++} else {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gogcflags =3D os.Gete=
nv(&quot;GO_GCFLAGS&quot;)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goldflags =3D os.Gete=
nv(&quot;GO_LDFLAGS&quot;)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tool_files, _ :=3D fi=
lepath.Glob(pathf(&quot;%s/*&quot;, tooldir))<br>
&gt; @@ -171,8 +179,8 @@ index 5d31718..1c7f308 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 xprintf(&quot;Building %s for host, %s/%s.\n&quot;, strings.Join(toB=
uild, &quot;,&quot;), goos, goarch)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, toBuild...)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, toBuild...)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(toolenv(), goBootstrap, toBuild...)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(toolenv(), goBootstrap, toBuild...)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 // Skip cmdGo staleness checks here, since we can&#39;t necessarily =
run the cmdGo binary<br>
&gt;=C2=A0 +<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
&gt; @@ -184,99 +192,29 @@ index 5d31718..1c7f308 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 goarch =3D oldgoarch<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.Setenv(&quot;GOOS&quot;, goos)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(&quot;CC&quot;, defaultcc, =
goos, goarch))<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 xprintf(&quot;Building %s for target, %s/%s.\n&quot;, strings.Join(t=
oBuild, &quot;,&quot;), goos, goarch)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, toBuild...)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, toBuild...)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(toolenv(), goBootstrap, toBuild...)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(toolenv(), goBootstrap, toBuild...)<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 // Skip cmdGo staleness checks here, since we can&#39;t run the targ=
et&#39;s cmdGo binary<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building pac=
kages and commands for %s/%s.\n&quot;, goos, goarch)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // GOOS/GOARCH does not ma=
tch GOHOSTOS/GOHOSTARCH.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // Finish GOHOSTOS/GOHOSTA=
RCH installation and then<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // run GOOS/GOARCH install=
ation.<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot;,=
 &quot;host toolchain&quot;)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if goos =3D=3D oldgoos &am=
p;&amp; goarch =3D=3D oldgoarch {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Common case - not setting up for cross-compilation.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;toolchain&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for %s/%s.\n&quot;, goos, =
goarch)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // Finish GOHOSTOS/GOHOSTARCH installation and then<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 // run GOOS/GOARCH installation.<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;host toolchain&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for host, %s/%s.\n&quot;, =
goos, goarch)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goInstall(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, &quot;std&quot;, &quot;cmd&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(cmdGo, &quot;std&quot;, &quot;cmd&quot;)<br>
&gt; -+<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 timelog(&quot;build&quot;, &quot;target toolchain&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if vflag &gt; 0 {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;\n&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goos =3D oldgoos<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goarch =3D oldgoarch<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOOS&quot;, goos)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;GOARCH&quot;, goarch)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 os.Setenv(&quot;CC&quot;, compilerEnvLookup(defaultcc, goos, goarch))<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;Building packages and commands for target, %s/%s.\n&quot;=
, goos, goarch)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building pac=
kages and commands for host, %s/%s.\n&quot;, goos, goarch)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goInstall(goBootstrap=
, &quot;std&quot;, &quot;cmd&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(goBoots=
trap, &quot;std&quot;, &quot;cmd&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0checkNotStale(cmdGo, =
&quot;std&quot;, &quot;cmd&quot;)<br>
&gt; - <br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timelog(&quot;build&quot;,=
 &quot;target toolchain&quot;)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if vflag &gt; 0 {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 xprintf(&quot;\n&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if debug {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/compile&quot;, t=
ooldir), &quot;-V=3Dfull&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 run(&quot;&quot;, ShowOutput|CheckExit, pathf(&quot;%s/buildid&quot;, t=
ooldir), pathf(&quot;%s/pkg/%s_%s/runtime/internal/sys.a&quot;, goroot, goo=
s, goarch))<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 checkNotStale(goBootstrap, append(toolchain, &quot;runtime/internal/sys=
&quot;)...)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 copyfile(pathf(&quot;%s/compile4&quot;, tooldir), pathf(&quot;%s/compil=
e&quot;, tooldir), writeExec)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goos =3D oldgoos<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goarch =3D oldgoarch<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOOS&quot;=
, goos)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;GOARCH&quo=
t;, goarch)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.Setenv(&quot;CC&quot;, =
compilerEnvLookup(defaultcc, goos, goarch))<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xprintf(&quot;Building pac=
kages and commands for target, %s/%s.\n&quot;, goos, goarch)<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --=C2=A0 =C2=A0 targets :=3D []string{&quot;std&quot;, &quot;cmd&quot;=
}<br>
&gt; --=C2=A0 =C2=A0 goInstall(goBootstrap, targets...)<br>
&gt; --=C2=A0 =C2=A0 checkNotStale(goBootstrap, append(toolchain, &quot;run=
time/internal/sys&quot;)...)<br>
&gt; --=C2=A0 =C2=A0 checkNotStale(goBootstrap, targets...)<br>
&gt; --=C2=A0 =C2=A0 checkNotStale(cmdGo, targets...)<br>
&gt; --=C2=A0 =C2=A0 if debug {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 run(&quot;&quot;, ShowOutp=
ut|CheckExit, pathf(&quot;%s/compile&quot;, tooldir), &quot;-V=3Dfull&quot;=
)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 checkNotStale(goBootstrap,=
 append(toolchain, &quot;runtime/internal/sys&quot;)...)<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 copyfile(pathf(&quot;%s/co=
mpile4&quot;, tooldir), pathf(&quot;%s/compile&quot;, tooldir), writeExec)<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Check that there are no new files in $GOR=
OOT/bin other than<br>
&gt; -@@ -1477,8 +1548,11 @@ func cmdbootstrap() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// go and gofmt and $GOOS_$GOARCH (target bin whe=
n cross-compiling).<br>
&gt; +@@ -1585,8 +1655,12 @@ func cmdbootstrap() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; --=C2=A0 =C2=A0 // Remove go_bootstrap now that we&#39;re done.<br>
&gt; --=C2=A0 =C2=A0 xremove(pathf(&quot;%s/go_bootstrap&quot;, tooldir))<b=
r>
&gt;=C2=A0 +=C2=A0 =C2=A0 // Except that for split host/target cross-builds=
, we need to<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 // keep it.<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if !crossBuild {<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xremove(pathf(&quot;%s/go_=
bootstrap&quot;, tooldir))<br>
&gt; -+=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Remove go_bootstrap now that we&#39;re done.<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0xremove(pathf(&quot;%s/go_bootstrap&quot;+exe, to=
oldir))<br>
&gt; ++}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if goos =3D=3D &quot;android&quot; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// Make sure the=
 exec wrapper will sync a fresh $GOROOT to the device.<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-preci=
ous-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-=
precious-by-default.patch<br>
&gt; index 520e41da86..d118e726c6 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-=
default.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-=
default.patch<br>
&gt; @@ -1,10 +1,8 @@<br>
&gt; -From efab470498bb0a30ee2d00455a0c8c10459f6347 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From aff5a740d6286c04beb0593fc68b0aea5a95ad39 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alex Kube &lt;<a href=3D"mailto:alexander.j.kube@gmail.com=
" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Wed, 23 Oct 2019 21:18:56 +0430<br>
&gt;=C2=A0 Subject: [PATCH 6/9] cmd/go: make GOROOT precious by default<br>
&gt;=C2=A0 <br>
&gt; -Upstream-Status: Inappropriate [OE specific]<br>
&gt; -<br>
&gt;=C2=A0 The go build tool normally rebuilds whatever it detects is<br>
&gt;=C2=A0 stale.=C2=A0 This can be a problem when GOROOT is intended to<br=
>
&gt;=C2=A0 be read-only and the go runtime has been built as a shared<br>
&gt; @@ -20,7 +18,10 @@ Adapted to Go 1.13 from patches originally submitte=
d to<br>
&gt;=C2=A0 the meta/recipes-devtools/go tree by<br>
&gt;=C2=A0 Matt Madison &lt;matt@madison.systems&gt;.<br>
&gt;=C2=A0 <br>
&gt; +Upstream-Status: Inappropriate [OE specific]<br>
&gt; +<br>
&gt;=C2=A0 Signed-off-by: Alexander J Kube &lt;<a href=3D"mailto:alexander.=
j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/work/action.go |=C2=A0 3 +++<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/work/build.go=C2=A0 |=C2=A0 6 ++++++<b=
r>
&gt; @@ -28,10 +29,10 @@ Signed-off-by: Alexander J Kube &lt;<a href=3D"mai=
lto:alexander.j.kube@gmail.com" target=3D"_blank">alexander.j.kube@gmail.co=
m</a>&gt;<br>
&gt;=C2=A0 =C2=A03 files changed, 34 insertions(+)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/int=
ernal/work/action.go<br>
&gt; -index 8beb134..68a8cfe 100644<br>
&gt; +index d4d0a71..42149d2 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/action.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/action.go<br>
&gt; -@@ -718,6 +718,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Ac=
tion, shlib string) {<br>
&gt; +@@ -730,6 +730,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Ac=
tion, shlib string) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if p1 =3D=3D nil || p1.Shlib =3D=3D &quot;&quot; || haveShlib[=
filepath.Base(p1.Shlib)] {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; @@ -42,10 +43,10 @@ index 8beb134..68a8cfe 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0// TODO(rsc): The use of ModeInstall here is suspect, but if w=
e only do ModeBuild,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0// we&#39;ll end up building an overall library or executable =
that depends at runtime<br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/inte=
rnal/work/build.go<br>
&gt; -index 2f2860a..8cc6166 100644<br>
&gt; +index e2e0e07..1c84137 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/build.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/build.go<br>
&gt; -@@ -217,6 +217,8 @@ See also: go install, go get, go clean.<br>
&gt; +@@ -228,6 +228,8 @@ See also: go install, go get, go clean.<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0const concurrentGCBackendCompilationEnabledByDefault =3D t=
rue<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -54,7 +55,7 @@ index 2f2860a..8cc6166 100644<br>
&gt;=C2=A0 =C2=A0func init() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// break init cycle<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CmdBuild.Run =3D runBuild<br>
&gt; -@@ -230,6 +232,10 @@ func init() {<br>
&gt; +@@ -241,6 +243,10 @@ func init() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AddCoverFlags(Cm=
dBuild, nil)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AddCoverFlags(Cm=
dInstall, nil)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -66,11 +67,11 @@ index 2f2860a..8cc6166 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0// Note that flags consulted by other parts of the code<br=
>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/inter=
nal/work/exec.go<br>
&gt; -index 62e1774..cde867b 100644<br>
&gt; +index e3dd486..0ea5316 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/exec.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/exec.go<br>
&gt; -@@ -546,6 +546,23 @@ func (b *Builder) build(ctx context.Context, a *=
Action) (err error) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return errors.New(&qu=
ot;cannot compile Go &quot; + p.Module.GoVersion + &quot; code&quot;)<br>
&gt; +@@ -539,6 +539,23 @@ func (b *Builder) build(ctx context.Context, a *=
Action) (err error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if goRootPrecious &amp;&amp; (a.Package.Standard =
|| a.Package.Goroot) {<br>
&gt; @@ -93,7 +94,7 @@ index 62e1774..cde867b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if err :=3D b.Mkdir(a.Objdir); err !=3D nil =
{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -1643,6 +1660,14 @@ func (b *Builder) linkShared(ctx context.Conte=
xt, a *Action) (err error) {<br>
&gt; +@@ -1722,6 +1739,14 @@ func (b *Builder) linkShared(ctx context.Conte=
xt, a *Action) (err error) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -109,5 +110,5 @@ index 62e1774..cde867b 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return err<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-lin=
ker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0007-exec.go-do=
-not-write-linker-flags-into-buildids.patch<br>
&gt; index 7d9869b536..3e0ba35d81 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-fla=
gs-into-buildids.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-fla=
gs-into-buildids.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 0ba747e6a4b251a0d9eed0cfd8f8c491bb508040 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 619991feab04f331d081a91243434ccd859f611d Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Mon, 23 Nov 2020 19:22:04 +0000<br>
&gt;=C2=A0 Subject: [PATCH 7/9] exec.go: do not write linker flags into bui=
ldids<br>
&gt; @@ -9,16 +9,18 @@ To make this acceptable to upstream, we probably nee=
d to trim the flags,<br>
&gt;=C2=A0 removing those known to be buildhost-specific.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Upstream-Status: Inappropriate [needs upstream discussion]<br>
&gt; +<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/work/exec.go | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/inter=
nal/work/exec.go<br>
&gt; -index cde867b..5cb1812 100644<br>
&gt; +index 0ea5316..d7e2d51 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/work/exec.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/work/exec.go<br>
&gt; -@@ -1331,7 +1331,7 @@ func (b *Builder) linkActionID(a *Action) cache=
.ActionID {<br>
&gt; +@@ -1357,7 +1357,7 @@ func (b *Builder) linkActionID(a *Action) cache=
.ActionID {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Toolchain-dependent configuration, shared=
 with b.linkSharedActionID.<br>
&gt; @@ -27,7 +29,7 @@ index cde867b..5cb1812 100644<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Input files.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, a1 :=3D range a.Deps {<br>
&gt; -@@ -1626,7 +1626,7 @@ func (b *Builder) linkSharedActionID(a *Action)=
 cache.ActionID {<br>
&gt; +@@ -1705,7 +1705,7 @@ func (b *Builder) linkSharedActionID(a *Action)=
 cache.ActionID {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(h, &quot;goos %s goarch %s\n&quo=
t;, cfg.Goos, cfg.Goarch)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Toolchain-dependent configuration, shared=
 with b.linkActionID.<br>
&gt; @@ -37,5 +39,5 @@ index cde867b..5cb1812 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// Input files.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0for _, a1 :=3D range a.Deps {<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-=
do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-c=
md-dist-buildgo.go-do-not-hardcode-host-compile.patch<br>
&gt; index fe830ce35c..58512207a8 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-=
hardcode-host-compile.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-=
hardcode-host-compile.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 1cbb416538a9c7c3fbedcb23f4d90d5c48becca8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From e0999902687e2e394499f7153db8d62440c4dab0 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail=
.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;=C2=A0 Date: Tue, 10 Nov 2020 16:33:27 +0000<br>
&gt;=C2=A0 Subject: [PATCH 8/9] src/cmd/dist/buildgo.go: do not hardcode ho=
st compilers<br>
&gt; @@ -8,16 +8,18 @@ These come from $CC/$CXX on the build host and are n=
ot useful on targets;<br>
&gt;=C2=A0 additionally as they contain host specific paths, this helps rep=
roducibility.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Upstream-Status: Inappropriate [needs upstream discussion]<br>
&gt; +<br>
&gt;=C2=A0 Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kana=
vin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/cmd/dist/buildgo.go | 8 ++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go<b=
r>
&gt; -index 29b0167..63a49f0 100644<br>
&gt; +index 884e9d7..2f52eda 100644<br>
&gt;=C2=A0 --- a/src/cmd/dist/buildgo.go<br>
&gt;=C2=A0 +++ b/src/cmd/dist/buildgo.go<br>
&gt; -@@ -33,8 +33,8 @@ func mkzdefaultcc(dir, file string) {<br>
&gt; +@@ -51,8 +51,8 @@ func mkzdefaultcc(dir, file string) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(&amp=
;buf, &quot;package cfg\n&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintln(&am=
p;buf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(&amp=
;buf, &quot;const DefaultPkgConfig =3D `%s`\n&quot;, defaultpkgconfig)<br>
&gt; @@ -28,7 +30,7 @@ index 29b0167..63a49f0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0writefile(buf.St=
ring(), file, writeSkipSame)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -@@ -45,8 +45,8 @@ func mkzdefaultcc(dir, file string) {<br>
&gt; +@@ -62,8 +62,8 @@ func mkzdefaultcc(dir, file string) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(&amp;buf, &quot;package main\n&q=
uot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintln(&amp;buf)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fmt.Fprintf(&amp;buf, &quot;const defaultPkg=
Config =3D `%s`\n&quot;, defaultpkgconfig)<br>
&gt; @@ -40,5 +42,5 @@ index 29b0167..63a49f0 100644<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on=
-staticly-linked-arches.patch b/meta/recipes-devtools/go/go/0009-go-Filter-=
build-paths-on-staticly-linked-arches.patch<br>
&gt; index 49da5f6297..597a4e2104 100644<br>
&gt; --- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-static=
ly-linked-arches.patch<br>
&gt; +++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-static=
ly-linked-arches.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 18011f72125bbea273d07ee5d792ac0ce6059572 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From 6c2438f187ca912c54a71b4ac65ab98999a019d2 Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxf=
oundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;=
<br>
&gt;=C2=A0 Date: Sat, 2 Jul 2022 23:08:13 +0100<br>
&gt;=C2=A0 Subject: [PATCH 9/9] go: Filter build paths on staticly linked a=
rches<br>
&gt; @@ -11,17 +11,18 @@ on mips/ppc.<br>
&gt;=C2=A0 Upstream-Status: Submitted [<a href=3D"https://github.com/golang=
/go/pull/56410" rel=3D"noreferrer" target=3D"_blank">https://github.com/gol=
ang/go/pull/56410</a>]<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.or=
g</a>&gt;<br>
&gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt;=C2=A0 =C2=A0src/cmd/go/internal/load/pkg.go | 15 +++++++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 13 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/intern=
al/load/pkg.go<br>
&gt; -index f427e29..6d6dc4e 100644<br>
&gt; +index c0e6265..b199fee 100644<br>
&gt;=C2=A0 --- a/src/cmd/go/internal/load/pkg.go<br>
&gt;=C2=A0 +++ b/src/cmd/go/internal/load/pkg.go<br>
&gt; -@@ -2270,6 +2270,17 @@ func (p *Package) collectDeps() {<br>
&gt; - // to their VCS information (vcsStatusError).<br>
&gt; - var vcsStatusCache par.Cache<br>
&gt; +@@ -2269,6 +2269,17 @@ func appendBuildSetting(info *debug.BuildInfo,=
 key, value string) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0info.Settings =3D append(info.Settings, debug.Bui=
ldSetting{Key: key, Value: value})<br>
&gt; + }<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 +func filterCompilerFlags(flags string) string {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 var newflags []string<br>
&gt; @@ -34,10 +35,10 @@ index f427e29..6d6dc4e 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 return strings.Join(newflags, &quot; &quot;)<br>
&gt;=C2=A0 +}<br>
&gt;=C2=A0 +<br>
&gt; - // setBuildInfo gathers build information, formats it as a string to=
 be<br>
&gt; - // embedded in the binary, then sets p.Internal.BuildInfo to that st=
ring.<br>
&gt; - // setBuildInfo should only be called on a main package with no erro=
rs.<br>
&gt; -@@ -2376,7 +2387,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {<=
br>
&gt; + // setBuildInfo gathers build information and sets it into<br>
&gt; + // p.Internal.BuildInfo, which will later be formatted as a string a=
nd embedded<br>
&gt; + // in the binary. setBuildInfo should only be called on a main packa=
ge with no<br>
&gt; +@@ -2376,7 +2387,7 @@ func (p *Package) setBuildInfo(ctx context.Cont=
ext, autoVCS bool) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if gcflags :=3D BuildGcflags.String(); gcfla=
gs !=3D &quot;&quot; &amp;&amp; cfg.BuildContext.Compiler =3D=3D &quot;gc&q=
uot; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0appendSetting(&q=
uot;-gcflags&quot;, gcflags)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; @@ -46,7 +47,7 @@ index f427e29..6d6dc4e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// <a href=3D"ht=
tps://go.dev/issue/52372" rel=3D"noreferrer" target=3D"_blank">https://go.d=
ev/issue/52372</a>: only include ldflags if -trimpath is not set,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// since it can =
include system paths through various linker flags (notably<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// -extar, -extl=
d, and -extldflags).<br>
&gt; -@@ -2422,7 +2433,7 @@ func (p *Package) setBuildInfo(autoVCS bool) {<=
br>
&gt; +@@ -2419,7 +2430,7 @@ func (p *Package) setBuildInfo(ctx context.Cont=
ext, autoVCS bool) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0// subset of flags that are known not to be =
paths?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if cfg.BuildContext.CgoEnabled &amp;&amp; !c=
fg.BuildTrimpath {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for _, name :=3D=
 range []string{&quot;CGO_CFLAGS&quot;, &quot;CGO_CPPFLAGS&quot;, &quot;CGO=
_CXXFLAGS&quot;, &quot;CGO_LDFLAGS&quot;} {<br>
&gt; @@ -56,5 +57,5 @@ index f427e29..6d6dc4e 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0appendSetting(&quot;GOARCH&quot;, cfg.BuildC=
ontext.GOARCH)<br>
&gt;=C2=A0 -- <br>
&gt; -2.30.2<br>
&gt; +2.43.0<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go_1.20.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a> b/meta/recipes-devt=
ools/go/<a href=3D"http://go_1.21.0.bb" rel=3D"noreferrer" target=3D"_blank=
">go_1.21.0.bb</a><br>
&gt; similarity index 100%<br>
&gt; rename from meta/recipes-devtools/go/<a href=3D"http://go_1.20.12.bb" =
rel=3D"noreferrer" target=3D"_blank">go_1.20.12.bb</a><br>
&gt; rename to meta/recipes-devtools/go/<a href=3D"http://go_1.21.0.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.21.0.bb</a><br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#191943): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/191943" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/191943</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10303155=
4/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/103031554/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000f5b48a060c39058c--

