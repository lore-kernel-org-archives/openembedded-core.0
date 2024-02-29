Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8222C48BF6
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 05:16:50 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.17681.1709183807118211153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 21:16:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JYzsVgQb;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-21f2f813e3bso731145fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 21:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709183806; x=1709788606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFpKjz/3cHCk6ix79ouTUZ++ee0ai1uMaYd+UQB+JJU=;
        b=JYzsVgQbWv0eXnkSNo1f+GlxLqqzccFWFn561hOIGc9mSCa/WxZDquLG8yKC5a/WZQ
         5aVHmnb2Q6zuucCGnW4Ikgk0GRinIz/vmU3ZUfaXfRUbTDQQiwAUQB1eEA8STGAZC+ky
         AY0oBtAk1QTEh3OU/KkIQj9vNv87ohvD6ym+d+Xe+fxmOcUdbuoQypFbAmgXG5Jwl19b
         /K80gBO2FSd99j3Ks2MIsVnYQGxvAu6DLfa7XZ/678wPqfq9VK2QhKiLqg/RWq73tpru
         8Cey31AuYMbk395DOt1CligGtM6ErAnX94wViUnmddsJISPoeNwCeynNF711a6slc7qp
         gRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709183806; x=1709788606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFpKjz/3cHCk6ix79ouTUZ++ee0ai1uMaYd+UQB+JJU=;
        b=qwcAbpQvSo+mjv2J9ddmwsb9K+oGstzU/g8OpkJe/Wd3pO07HTU/DVwCbSZV+3unKO
         TXErq3S9QOMY2BLJSlU/rsXhes+b5a601INbpsTyiyyMb4oIqbdq5/BQ2tFNaor4a+MA
         Ho/bNKZ+mfJK+bsWa0w1x5pgpJsgOGQGva7IKfGQG1UXFy8BB45dZqALMR9UiGJQ00he
         TdJX4Niwlw1h7+of4G2XVv6SjE7OWR1sSZHeiRdWg2pz0k6n+Zbnzp6/zAcAtEqr7aQ7
         0ow4LEh6ZyZqO85pd9slLVUJRdQPnEgWu99x8r8jzaMdRaiLSQu5BAqYzDIDc93ZjyOj
         Urug==
X-Gm-Message-State: AOJu0Yy9OAUJmDjM0wKseTWNTeNHiNW6fTRoVjU/sUvg/2/jSXcRvhzE
	vKfSBlrwhbtjjHdzxDPNuOYS5cA++vYmmocGpWS4OZEa3HjdPxNo95fe5Y8OGME1EEI3EmbHEvS
	EjQzyAkcEOoUXBknPFSBXCrbOBCE=
X-Google-Smtp-Source: AGHT+IHT61E1xj8VUko8IV+IUKMIfsgwZ7yHOf1U8SZr6DinAYy+u2Ja+iTA3Q5W2OUucyPzF9fecMk3cDqWuVPHUhc=
X-Received: by 2002:a05:6870:f70d:b0:220:8d07:cfa with SMTP id
 ej13-20020a056870f70d00b002208d070cfamr354171oab.8.1709183806115; Wed, 28 Feb
 2024 21:16:46 -0800 (PST)
MIME-Version: 1.0
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
In-Reply-To: <20240228183011.1495807-1-jose.quaresma@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2024 21:16:19 -0800
Message-ID: <CAMKF1sqZc2HR=iWKjDHQAVHHxTfXKv0DqcbHZr+-akTSvU24eA@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH v2 1/7] go: rework patch to avoid identation
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 05:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196413

Fails to compile bunch of  recipes using go e.g. influxdb, crucible,
syzkaller in meta-oe see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3667/step=
s/15/logs/stdio

On Wed, Feb 28, 2024 at 10:30=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail=
.com> wrote:
>
> It's more hard to read but easy to rebase, no functional changes
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...dist-separate-host-and-target-builds.patch | 136 +++++-------------
>  1 file changed, 35 insertions(+), 101 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-=
target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-ho=
st-and-target-builds.patch
> index 29598449da..aa2df58995 100644
> --- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-=
builds.patch
> +++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-=
builds.patch
> @@ -3,8 +3,6 @@ From: Alex Kube <alexander.j.kube@gmail.com>
>  Date: Wed, 23 Oct 2019 21:18:12 +0430
>  Subject: [PATCH 5/9] cmd/dist: separate host and target builds
>
> -Upstream-Status: Inappropriate [OE specific]
> -
>  Change the dist tool to allow for OE-style cross-
>  and cross-canadian builds:
>
> @@ -33,13 +31,20 @@ Adapted to Go 1.13 from patches originally submitted =
to
>  the meta/recipes-devtools/go tree by
>  Matt Madison <matt@madison.systems>.
>
> +Rework the patch to avoid identation, it's more hard to read
> +but easy to rebase.
> +Jose Quaresma <jose.quaresma@foundries.io>
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
>  Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>  ---
> - src/cmd/dist/build.go | 152 +++++++++++++++++++++++++++++++-----------
> - 1 file changed, 113 insertions(+), 39 deletions(-)
> + src/cmd/dist/build.go | 76 ++++++++++++++++++++++++++++++++++++++++++-
> + 1 file changed, 75 insertions(+), 1 deletion(-)
>
>  diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
> -index 5d31718..1c7f308 100644
> +index 5d3171856a..d0ba54c072 100644
>  --- a/src/cmd/dist/build.go
>  +++ b/src/cmd/dist/build.go
>  @@ -44,6 +44,7 @@ var (
> @@ -119,17 +124,14 @@ index 5d31718..1c7f308 100644
>                 xprintf("\n")
>         }
>
> --      gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_G=
CFLAGS until now
> --      setNoOpt()
> --      goldflags =3D os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_L=
DFLAGS until now
>  +      // For split host/target cross/cross-canadian builds, we don't
>  +      // want to be setting these flags until after we have compiled
>  +      // the toolchain that runs on the build host.
>  +      if !crossBuild {
> -+              gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using $B=
OOT_GO_GCFLAGS until now
> -+              setNoOpt()
> -+              goldflags =3D os.Getenv("GO_LDFLAGS") // we were using $B=
OOT_GO_LDFLAGS until now
> -+      }
> +       gogcflags =3D os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_G=
CFLAGS until now
> +       setNoOpt()
> +       goldflags =3D os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_L=
DFLAGS until now
> ++}
>         goBootstrap :=3D pathf("%s/go_bootstrap", tooldir)
>         cmdGo :=3D pathf("%s/go", gorootBin)
>         if debug {
> @@ -137,25 +139,27 @@ index 5d31718..1c7f308 100644
>                 xprintf("\n")
>         }
>         xprintf("Building Go toolchain2 using go_bootstrap and Go toolcha=
in1.\n")
> --      os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> -+      if crossBuild {
> ++      if !crossBuild {
> +       os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
> ++} else {
>  +              os.Setenv("CC", defaultcc[""])
> -+      } else {
> -+              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch=
))
>  +      }
>         // Now that cmd/go is in charge of the build process, enable GOEX=
PERIMENT.
>         os.Setenv("GOEXPERIMENT", goexperiment)
>         goInstall(goBootstrap, toolchain...)
> -@@ -1421,46 +1454,84 @@ func cmdbootstrap() {
> +@@ -1421,6 +1454,7 @@ func cmdbootstrap() {
>                 copyfile(pathf("%s/compile3", tooldir), pathf("%s/compile=
", tooldir), writeExec)
>         }
>
> --      if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> --              // Common case - not setting up for cross-compilation.
> --              timelog("build", "toolchain")
> --              if vflag > 0 {
> --                      xprintf("\n")
> -+      if crossBuild {
> ++      if !crossBuild {
> +       if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> +               // Common case - not setting up for cross-compilation.
> +               timelog("build", "toolchain")
> +@@ -1462,6 +1496,42 @@ func cmdbootstrap() {
> +               checkNotStale(goBootstrap, append(toolchain, "runtime/int=
ernal/sys")...)
> +               copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile=
", tooldir), writeExec)
> +       }
> ++} else {
>  +              gogcflags =3D os.Getenv("GO_GCFLAGS")
>  +              goldflags =3D os.Getenv("GO_LDFLAGS")
>  +              tool_files, _ :=3D filepath.Glob(pathf("%s/*", tooldir))
> @@ -189,94 +193,24 @@ index 5d31718..1c7f308 100644
>  +                      goInstall(goBootstrap, toBuild...)
>  +                      checkNotStale(goBootstrap, toBuild...)
>  +                      // Skip cmdGo staleness checks here, since we can=
't run the target's cmdGo binary
> -               }
> --              xprintf("Building packages and commands for %s/%s.\n", go=
os, goarch)
> -       } else {
> --              // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
> --              // Finish GOHOSTOS/GOHOSTARCH installation and then
> --              // run GOOS/GOARCH installation.
> --              timelog("build", "host toolchain")
> --              if vflag > 0 {
> --                      xprintf("\n")
> -+
> -+              if goos =3D=3D oldgoos && goarch =3D=3D oldgoarch {
> -+                      // Common case - not setting up for cross-compila=
tion.
> -+                      timelog("build", "toolchain")
> -+                      if vflag > 0 {
> -+                              xprintf("\n")
> -+                      }
> -+                      xprintf("Building packages and commands for %s/%s=
.\n", goos, goarch)
> -+              } else {
> -+                      // GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH=
.
> -+                      // Finish GOHOSTOS/GOHOSTARCH installation and th=
en
> -+                      // run GOOS/GOARCH installation.
> -+                      timelog("build", "host toolchain")
> -+                      if vflag > 0 {
> -+                              xprintf("\n")
> -+                      }
> -+                      xprintf("Building packages and commands for host,=
 %s/%s.\n", goos, goarch)
> -+                      goInstall(goBootstrap, "std", "cmd")
> -+                      checkNotStale(goBootstrap, "std", "cmd")
> -+                      checkNotStale(cmdGo, "std", "cmd")
> -+
> -+                      timelog("build", "target toolchain")
> -+                      if vflag > 0 {
> -+                              xprintf("\n")
> -+                      }
> -+                      goos =3D oldgoos
> -+                      goarch =3D oldgoarch
> -+                      os.Setenv("GOOS", goos)
> -+                      os.Setenv("GOARCH", goarch)
> -+                      os.Setenv("CC", compilerEnvLookup(defaultcc, goos=
, goarch))
> -+                      xprintf("Building packages and commands for targe=
t, %s/%s.\n", goos, goarch)
> -               }
> --              xprintf("Building packages and commands for host, %s/%s.\=
n", goos, goarch)
> -               goInstall(goBootstrap, "std", "cmd")
> -               checkNotStale(goBootstrap, "std", "cmd")
> -               checkNotStale(cmdGo, "std", "cmd")
> -
> --              timelog("build", "target toolchain")
> --              if vflag > 0 {
> --                      xprintf("\n")
> -+              if debug {
> -+                      run("", ShowOutput|CheckExit, pathf("%s/compile",=
 tooldir), "-V=3Dfull")
> -+                      run("", ShowOutput|CheckExit, pathf("%s/buildid",=
 tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarc=
h))
> -+                      checkNotStale(goBootstrap, append(toolchain, "run=
time/internal/sys")...)
> -+                      copyfile(pathf("%s/compile4", tooldir), pathf("%s=
/compile", tooldir), writeExec)
> -               }
> --              goos =3D oldgoos
> --              goarch =3D oldgoarch
> --              os.Setenv("GOOS", goos)
> --              os.Setenv("GOARCH", goarch)
> --              os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch=
))
> --              xprintf("Building packages and commands for target, %s/%s=
.\n", goos, goarch)
> --      }
> --      targets :=3D []string{"std", "cmd"}
> --      goInstall(goBootstrap, targets...)
> --      checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sy=
s")...)
> --      checkNotStale(goBootstrap, targets...)
> --      checkNotStale(cmdGo, targets...)
> --      if debug {
> --              run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir=
), "-V=3Dfull")
> --              checkNotStale(goBootstrap, append(toolchain, "runtime/int=
ernal/sys")...)
> --              copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile=
", tooldir), writeExec)
> -       }
> ++              }
> ++      }
>
>         // Check that there are no new files in $GOROOT/bin other than
> -@@ -1477,8 +1548,11 @@ func cmdbootstrap() {
> +       // go and gofmt and $GOOS_$GOARCH (target bin when cross-compilin=
g).
> +@@ -1477,8 +1547,12 @@ func cmdbootstrap() {
>                 }
>         }
>
> --      // Remove go_bootstrap now that we're done.
> --      xremove(pathf("%s/go_bootstrap", tooldir))
>  +      // Except that for split host/target cross-builds, we need to
>  +      // keep it.
>  +      if !crossBuild {
> -+              xremove(pathf("%s/go_bootstrap", tooldir))
> -+      }
> +       // Remove go_bootstrap now that we're done.
> +       xremove(pathf("%s/go_bootstrap", tooldir))
> ++}
>
>         if goos =3D=3D "android" {
>                 // Make sure the exec wrapper will sync a fresh $GOROOT t=
o the device.
>  --
> -2.30.2
> +2.43.0
>
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196400): https://lists.openembedded.org/g/openembedde=
d-core/message/196400
> Mute This Topic: https://lists.openembedded.org/mt/104628621/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

