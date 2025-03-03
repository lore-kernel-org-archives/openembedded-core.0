Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6934C282C6
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 11:27:34 +0000 (UTC)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
 by mx.groups.io with SMTP id smtpd.web10.51299.1741001253859137128
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 03:27:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cAH5lXsT;
 spf=pass (domain: gmail.com, ip: 209.85.221.178, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52098b01902so3985166e0c.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 03:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741001253; x=1741606053; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vCjUV7dMaVO5Z2kT7pgMlXmPOEyFRjhT02WevWJPfgs=;
        b=cAH5lXsTX9J7w0wyEhS8zFqxCKyGDLEOrsHAOEfOpbNKiZsDwr7g9VGAU7Jgw1avBq
         dwyGKKaPVSuWAbogSoHuiMk0GYATCVPk95gfxqTQDQqR3rak8CGo4XVFdU/UF+gceFp9
         bMABzALUE7Tko6OpYmhO8X820ygXDo7YY2rly3g4ma1oos1/coYwmLDWlhcl0PiJiSch
         vW8OPpFJ6EGW4CvZeEEtLfXJoWYjWONBoGbtLolLFtwKufyABl0bq4+svklT0it3UQIM
         OW1RvwZ1Xmp8JewMn8P2kGv9vrgHT0MyN85iCdFVmQtgAcQlP8wdfrynZZjo6jYtdXqs
         2sGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741001253; x=1741606053;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCjUV7dMaVO5Z2kT7pgMlXmPOEyFRjhT02WevWJPfgs=;
        b=vRDpeAJ9I9TXK75/s1nx4PyqiJa2YrA+C0VJLpUmd3oj/a+utYOfFCLkcZKyCPcAEh
         EMBb5HxuAROVMUc7t52zc6Rkda1wSyzfac9jzOdoWwoVeKok92lBoMN/dybWV1g47myC
         UVDZ9dbI5x/0dwAd7eK1rGGn6d69Zu7QNHwbV95NwVvjFRxoVZJYDRno7XXgk+FuJwjr
         MHXAxx/uCCwOr1baN2Jlrgz/et3fdVOCEumtzEbS6ZH+DWaNpCCDv/t8k4XFxNOJOoAO
         JHtfFZtHO8D+yo7CmLcU2yEmJyB33PaLnckjTw69cUDCBPPpX3W3p9OGfpHivn3DBa8O
         bm8w==
X-Forwarded-Encrypted: i=1; AJvYcCWIILDOs9vGLvDmzsyjCNLj76IIdfHP0CXAQiDxiUvZNYhEs0xc5e36PlIDn2R4NZFJWanBZ7n59MvbIWJU6zYo3w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywk3bAoWYN1PlSCsEP8mWEPPmoFF1w0RP2eXuXxLytSgE0W83KM
	0p8XuBtNUMp0JqVGepaxSogvaIKvFzKgxYd6aJHgeNFcb+dBJg9QRFXdY7ZtOZXl7mCUbxENlly
	cRMokP5Ed5Zxt0addOkaAW5PC+ts=
X-Gm-Gg: ASbGncvTLKJT1IpbFqNMvkt+giQk5qqTUoBXpJz3SYR6+pOE11ULYOV8mggN0xKKLRn
	nbKMdZFybpBMmiQ6GK13Vpf6SKc/HCWcHXFlVodcGrMrHYMohz6H6cBsJ0Voq/ec2R7iNLHnNNN
	qHDnHQFZTJ1adnnuDtvgWt+LdDVfVs
X-Google-Smtp-Source: AGHT+IEeknZ8u2h4NF2Rokyagb6vfCWyXp+DB4BDalTzQ07VK2vZT7CLp2PV994whybs5D9LWdvgzCYTIMFDbNsaATY=
X-Received: by 2002:a05:6122:458f:b0:523:792e:e9c3 with SMTP id
 71dfb90a1353d-523792ef188mr3426312e0c.0.1741001252751; Mon, 03 Mar 2025
 03:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20250301075552.354661-1-hongxu.jia@windriver.com> <20250301075552.354661-3-hongxu.jia@windriver.com>
In-Reply-To: <20250301075552.354661-3-hongxu.jia@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 3 Mar 2025 11:27:22 +0000
X-Gm-Features: AQ5f1JoXC5vnZZAyYpdnicE7EmdR3jxADvZjVE8nkpkB1_dbKiS4O1zEvO2WoY8
Message-ID: <CANPvuRmtnxM4YTrw_8qKcU6Z_a-ftaLmkHA0yMrvPzcS=K2Q_w@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH 2/3] go: fix buildpath issue for go-runtime
To: hongxu.jia@eng.windriver.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org, randy.macleod@windriver.com, 
	jose.quaresma@foundries.io, mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000003952a3062f6e71fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 11:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212204

--0000000000003952a3062f6e71fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hongxu,

From the analysis I did I also saw that it was GOROOT that was causing the
problem
but I couldn't figure out where he really was.

Thank you for your work.

Jose

hongxu via lists.openembedded.org <hongxu.jia=3D
eng.windriver.com@lists.openembedded.org> escreveu (s=C3=A1bado, 1/03/2025 =
=C3=A0(s)
07:56):

> In upstream commit [cmd: remove support for GOROOT_FINAL][1], it clear
> GOROOT for func ld when -trimpath is used
>
> But it missed to do the same thing for share libarary linking which cause=
d
> building go-runtime failed with buildpath issue
>
> |ERROR: go-runtime-1.23.4-r0 do_package_qa: QA Issue: File /usr/lib/go/pk=
g/
> linux_amd64_dynlink/libstd.so in package go-runtime contains reference to
> TMPDIR [buildpaths]
>
> This commit applied a patch to clear GOROOT for func ldShared when
> -trimpath is used and add option -trimpath to go-runtime build
>
> [1]
> https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5=
a98
> [2]
> https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5=
a98#diff-cab5921f94f2667bb0bc1b935d2d46b4c03541b4351b33438ab7290b94dea212R6=
69
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-devtools/go/go-1.24.0.inc        |  1 +
>  meta/recipes-devtools/go/go-runtime.inc       |  2 +-
>  ...OOT-for-func-ldShared-when-trimpath-.patch | 51 +++++++++++++++++++
>  3 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-wh=
en-trimpath-.patch
>
> diff --git a/meta/recipes-devtools/go/go-1.24.0.inc
> b/meta/recipes-devtools/go/go-1.24.0.inc
> index 26a4947caf..a52dd19e76 100644
> --- a/meta/recipes-devtools/go/go-1.24.0.inc
> +++ b/meta/recipes-devtools/go/go-1.24.0.inc
> @@ -14,6 +14,7 @@ SRC_URI +=3D "\
>
>  file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
>
>  file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
>      file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
> +
> file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
>      file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
>  "
>  SRC_URI[main.sha256sum] =3D
> "d14120614acb29d12bcab72bd689f257eb4be9e0b6f88a8fb7e41ac65f8556e5"
> diff --git a/meta/recipes-devtools/go/go-runtime.inc
> b/meta/recipes-devtools/go/go-runtime.inc
> index 413cf6d33f..e5f17337bc 100644
> --- a/meta/recipes-devtools/go/go-runtime.inc
> +++ b/meta/recipes-devtools/go/go-runtime.inc
> @@ -34,7 +34,7 @@ do_compile() {
>         if [ -n "${GO_DYNLINK}" ]; then
>                 export GOTOOLDIR=3D"${B}/pkg/tool/native_native"
>                 CC=3D"$CC_FOR_${TARGET_GOTUPLE}" GOARCH=3D"${TARGET_GOARC=
H}"
> GOOS=3D"${TARGET_GOOS}" GOROOT=3D${B} \
> -                       $GOTOOLDIR/go_bootstrap install -linkshared
> -buildmode=3Dshared ${GO_SHLIB_LDFLAGS} std
> +                       $GOTOOLDIR/go_bootstrap install -linkshared
> -trimpath -buildmode=3Dshared ${GO_SHLIB_LDFLAGS} std
>         fi
>         cd ${B}
>  }
> diff --git
> a/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-=
when-trimpath-.patch
> b/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-=
when-trimpath-.patch
> new file mode 100644
> index 0000000000..2c2f0cbfb5
> --- /dev/null
> +++
> b/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-=
when-trimpath-.patch
> @@ -0,0 +1,51 @@
> +From c4215b5ca69a7626d97cf9b7ebc460c2b5b9148b Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Fri, 28 Feb 2025 19:13:18 -0800
> +Subject: [PATCH 10/11] cmd/go: clear GOROOT for func ldShared when
> -trimpath
> + is used
> +
> +In commit [cmd: remove support for GOROOT_FINAL][1], it clear GOROOT
> +for func ld when -trimpath is used. [2]
> +
> +This commit do the same thing for func ldShared, otherwise run
> go_bootstrap
> +with -trimpath does not remove build path directory from the generated
> share
> +libarary
> +
> +  $ ./make.bash --target-only --no-banner std
> +  $ go_bootstrap install -linkshared -buildmode=3Dshared -trimpath std
> +  $ grep "$(pwd)" ./pkg/linux_amd64_dynlink/libstd.so
> +  Binary file ./pkg/linux_amd64_dynlink/libstd.so matches
> +
> +[1]
> https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5=
a98
> +[2]
> https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5=
a98#diff-cab5921f94f2667bb0bc1b935d2d46b4c03541b4351b33438ab7290b94dea212R6=
69
> +
> +Upstream-Status: Submitted [
> https://go-review.googlesource.com/c/go/+/653895]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/cmd/go/internal/work/gc.go | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/cmd/go/internal/work/gc.go
> b/src/cmd/go/internal/work/gc.go
> +index 3a173efee8..8b7a44e031 100644
> +--- a/src/cmd/go/internal/work/gc.go
> ++++ b/src/cmd/go/internal/work/gc.go
> +@@ -728,7 +728,14 @@ func (gcToolchain) ldShared(b *Builder, root
> *Action, toplevelactions []*Action,
> +       // the output file path is recorded in the .gnu.version_d section=
.
> +       dir, targetPath :=3D filepath.Split(targetPath)
> +
> +-      return b.Shell(root).run(dir, targetPath, nil, cfg.BuildToolexec,
> base.Tool("link"), "-o", targetPath, "-importcfg", importcfg, ldflags)
> ++      env :=3D []string{}
> ++      // When -trimpath is used, GOROOT is cleared
> ++      if cfg.BuildTrimpath {
> ++              env =3D append(env, "GOROOT=3D")
> ++      } else {
> ++              env =3D append(env, "GOROOT=3D"+cfg.GOROOT)
> ++      }
> ++      return b.Shell(root).run(dir, targetPath, env, cfg.BuildToolexec,
> base.Tool("link"), "-o", targetPath, "-importcfg", importcfg, ldflags)
> + }
> +
> + func (gcToolchain) cc(b *Builder, a *Action, ofile, cfile string) error=
 {
> +--
> +2.25.1
> +
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212088):
> https://lists.openembedded.org/g/openembedded-core/message/212088
> Mute This Topic: https://lists.openembedded.org/mt/111448992/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000003952a3062f6e71fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Hongxu,</div><br>From the analysis I d=
id I also saw that it was=C2=A0<span style=3D"color:rgb(0,0,0)">GOROOT</spa=
n>=C2=A0that was causing the problem<br>but I couldn&#39;t figure out where=
 he really was.<br><br>Thank you for your work.<br><br>Jose<br><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">hongxu via <a href=3D"http://lists.openembedded.org">lists.openembedded=
.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists.openemb=
edded.org">eng.windriver.com@lists.openembedded.org</a>&gt; escreveu (s=C3=
=A1bado, 1/03/2025 =C3=A0(s) 07:56):<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">In upstream commit [cmd: remove support for GOROOT_FIN=
AL][1], it clear<br>
GOROOT for func ld when -trimpath is used<br>
<br>
But it missed to do the same thing for share libarary linking which caused<=
br>
building go-runtime failed with buildpath issue<br>
<br>
|ERROR: go-runtime-1.23.4-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/=
<br>
linux_amd64_dynlink/libstd.so in package go-runtime contains reference to<b=
r>
TMPDIR [buildpaths]<br>
<br>
This commit applied a patch to clear GOROOT for func ldShared when<br>
-trimpath is used and add option -trimpath to go-runtime build<br>
<br>
[1] <a href=3D"https://github.com/golang/go/commit/507d1b22f4b58ac68841582d=
0c2c0ab6b20e5a98" rel=3D"noreferrer" target=3D"_blank">https://github.com/g=
olang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98</a><br>
[2] <a href=3D"https://github.com/golang/go/commit/507d1b22f4b58ac68841582d=
0c2c0ab6b20e5a98#diff-cab5921f94f2667bb0bc1b935d2d46b4c03541b4351b33438ab72=
90b94dea212R669" rel=3D"noreferrer" target=3D"_blank">https://github.com/go=
lang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98#diff-cab5921f94f266=
7bb0bc1b935d2d46b4c03541b4351b33438ab7290b94dea212R669</a><br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/go/go-1.24.0.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0meta/recipes-devtools/go/go-runtime.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0...OOT-for-func-ldShared-when-trimpath-.patch | 51 ++++++++++++++++++=
+<br>
=C2=A03 files changed, 53 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/go/go/0010-cmd-go-clear-GORO=
OT-for-func-ldShared-when-trimpath-.patch<br>
<br>
diff --git a/meta/recipes-devtools/go/go-1.24.0.inc b/meta/recipes-devtools=
/go/go-1.24.0.inc<br>
index 26a4947caf..a52dd19e76 100644<br>
--- a/meta/recipes-devtools/go/go-1.24.0.inc<br>
+++ b/meta/recipes-devtools/go/go-1.24.0.inc<br>
@@ -14,6 +14,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0file://0007-exec.go-filter-out-build-specific-paths-fro=
m-linker-.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-hos=
t-compile.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://0009-go-Filter-build-paths-on-staticly-linked-ar=
ches.patch \<br>
+=C2=A0 =C2=A0 file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimp=
ath-.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \=
<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[main.sha256sum] =3D &quot;d14120614acb29d12bcab72bd689f257eb4=
be9e0b6f88a8fb7e41ac65f8556e5&quot;<br>
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtool=
s/go/go-runtime.inc<br>
index 413cf6d33f..e5f17337bc 100644<br>
--- a/meta/recipes-devtools/go/go-runtime.inc<br>
+++ b/meta/recipes-devtools/go/go-runtime.inc<br>
@@ -34,7 +34,7 @@ do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${GO_DYNLINK}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export GOTOOLDIR=3D=
&quot;${B}/pkg/tool/native_native&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;$CC_FOR_=
${TARGET_GOTUPLE}&quot; GOARCH=3D&quot;${TARGET_GOARCH}&quot; GOOS=3D&quot;=
${TARGET_GOOS}&quot; GOROOT=3D${B} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=3Dshared $=
{GO_SHLIB_LDFLAGS} std<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0$GOTOOLDIR/go_bootstrap install -linkshared -trimpath -buildmode=
=3Dshared ${GO_SHLIB_LDFLAGS} std<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}<br>
=C2=A0}<br>
diff --git a/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-=
ldShared-when-trimpath-.patch b/meta/recipes-devtools/go/go/0010-cmd-go-cle=
ar-GOROOT-for-func-ldShared-when-trimpath-.patch<br>
new file mode 100644<br>
index 0000000000..2c2f0cbfb5<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShare=
d-when-trimpath-.patch<br>
@@ -0,0 +1,51 @@<br>
+From c4215b5ca69a7626d97cf9b7ebc460c2b5b9148b Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+Date: Fri, 28 Feb 2025 19:13:18 -0800<br>
+Subject: [PATCH 10/11] cmd/go: clear GOROOT for func ldShared when -trimpa=
th<br>
+ is used<br>
+<br>
+In commit [cmd: remove support for GOROOT_FINAL][1], it clear GOROOT<br>
+for func ld when -trimpath is used. [2]<br>
+<br>
+This commit do the same thing for func ldShared, otherwise run go_bootstra=
p<br>
+with -trimpath does not remove build path directory from the generated sha=
re<br>
+libarary<br>
+<br>
+=C2=A0 $ ./make.bash --target-only --no-banner std<br>
+=C2=A0 $ go_bootstrap install -linkshared -buildmode=3Dshared -trimpath st=
d<br>
+=C2=A0 $ grep &quot;$(pwd)&quot; ./pkg/linux_amd64_dynlink/libstd.so<br>
+=C2=A0 Binary file ./pkg/linux_amd64_dynlink/libstd.so matches<br>
+<br>
+[1] <a href=3D"https://github.com/golang/go/commit/507d1b22f4b58ac68841582=
d0c2c0ab6b20e5a98" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98</a><br>
+[2] <a href=3D"https://github.com/golang/go/commit/507d1b22f4b58ac68841582=
d0c2c0ab6b20e5a98#diff-cab5921f94f2667bb0bc1b935d2d46b4c03541b4351b33438ab7=
290b94dea212R669" rel=3D"noreferrer" target=3D"_blank">https://github.com/g=
olang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98#diff-cab5921f94f26=
67bb0bc1b935d2d46b4c03541b4351b33438ab7290b94dea212R669</a><br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://go-review.googlesource.com/=
c/go/+/653895" rel=3D"noreferrer" target=3D"_blank">https://go-review.googl=
esource.com/c/go/+/653895</a>]<br>
+<br>
+Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+---<br>
+ src/cmd/go/internal/work/gc.go | 9 ++++++++-<br>
+ 1 file changed, 8 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/cmd/go/internal/work/gc.go b/src/cmd/go/internal/work/gc.=
go<br>
+index 3a173efee8..8b7a44e031 100644<br>
+--- a/src/cmd/go/internal/work/gc.go<br>
++++ b/src/cmd/go/internal/work/gc.go<br>
+@@ -728,7 +728,14 @@ func (gcToolchain) ldShared(b *Builder, root *Action,=
 toplevelactions []*Action,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0// the output file path is recorded in the .gnu=
.version_d section.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0dir, targetPath :=3D filepath.Split(targetPath)=
<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 return b.Shell(root).run(dir, targetPath, nil, cfg.B=
uildToolexec, base.Tool(&quot;link&quot;), &quot;-o&quot;, targetPath, &quo=
t;-importcfg&quot;, importcfg, ldflags)<br>
++=C2=A0 =C2=A0 =C2=A0 env :=3D []string{}<br>
++=C2=A0 =C2=A0 =C2=A0 // When -trimpath is used, GOROOT is cleared<br>
++=C2=A0 =C2=A0 =C2=A0 if cfg.BuildTrimpath {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D append(env, &quo=
t;GOROOT=3D&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env =3D append(env, &quo=
t;GOROOT=3D&quot;+cfg.GOROOT)<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 return b.Shell(root).run(dir, targetPath, env, cfg.B=
uildToolexec, base.Tool(&quot;link&quot;), &quot;-o&quot;, targetPath, &quo=
t;-importcfg&quot;, importcfg, ldflags)<br>
+ }<br>
+ <br>
+ func (gcToolchain) cc(b *Builder, a *Action, ofile, cfile string) error {=
<br>
+-- <br>
+2.25.1<br>
+<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#212088): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/212088" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/212088</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111448992/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111448992/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000003952a3062f6e71fa--

