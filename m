Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76673FD3758
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:37:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44112.1772023007652859293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:36:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Hr38ohbk;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8E27F1A1373;
	Wed, 25 Feb 2026 12:36:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 634EC5FDE6;
	Wed, 25 Feb 2026 12:36:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D2A6210369072;
	Wed, 25 Feb 2026 13:36:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772023004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DREW44xKbTtafvbfcs50V1oslTz+w+1C0z47epTgDPQ=;
	b=Hr38ohbkZW9lE4w7wBC9pJNSPCZF60ZNTo2SEGMJGM1H9Rh9ah5+8BM33nIxs2HkKfJgz2
	0QT+QylQsfdzBsCAVVVyruwAKzow9LedAmH9kAYRyHvaLGFIPCKtzFdNzOw8YDFFdCVERz
	D51TbFeHJHu6ZgiWTYxiufR5eknLsjAVmiBm99sY3AWojRtiU414Yf/xGm8oFsOd/w+mDG
	74JcWlt41QIHf5ACEG7PorP7YK+H2Salkjmbjh16b2oBppV/CD7zocKkFwt19vB95etgpp
	oDP1VRZEdakSs+qQDMnViXLpuHIKwxxaT+EzXx2P90VZoaF/nE1XS0aDxRMcfA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 25 Feb 2026 13:36:29 +0100
Subject: [PATCH v2 1/6] maintainers.inc: Sort list in alphabetical order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260225-add-sbom-cve-check-v2-1-eeffa285b901@bootlin.com>
References: <20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com>
In-Reply-To: <20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231957

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/conf/distro/include/maintainers.inc | 68 ++++++++++++++++----------=
------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index b5ab35d92a06..1a3490d6d625 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -67,8 +67,8 @@ RECIPE_MAINTAINER:pn-bindgen-cli =3D "Khem Raj <raj.khe=
m@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} =3D "Khem Raj <raj.kh=
em@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D=
 "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-binutils-testsuite =3D "Khem Raj <raj.khem@gmail.co=
m>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} =3D "Khem Raj <raj.khe=
m@gmail.com>"
+RECIPE_MAINTAINER:pn-binutils-testsuite =3D "Khem Raj <raj.khem@gmail.co=
m>"
 RECIPE_MAINTAINER:pn-bison =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-blktrace =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-blueprint-compiler =3D "Liu Yiding <liuyd.fnst@fuji=
tsu.com>"
@@ -82,18 +82,18 @@ RECIPE_MAINTAINER:pn-btrfs-tools =3D "Wang Mingyu <wa=
ngmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-build-appliance-image =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-build-sysroots =3D "Richard Purdie <richard.purdie@=
linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-builder =3D "Richard Purdie <richard.purdie@linuxfo=
undation.org>"
-RECIPE_MAINTAINER:pn-buildtools-extended-tarball =3D "Richard Purdie <ri=
chard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-buildtools-tarball =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-docs-tarball =3D "Richard Purdie <richar=
d.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-buildtools-extended-tarball =3D "Richard Purdie <ri=
chard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-buildtools-make-tarball =3D "Richard Purdie <richar=
d.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-buildtools-tarball =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-busybox =3D "Andrej Valek <andrej.v@skyrain.eu>"
 RECIPE_MAINTAINER:pn-busybox-inittab =3D "Denys Dmytriyenko <denis@denix=
.org>"
 RECIPE_MAINTAINER:pn-bzip2 =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-ca-certificates =3D "Unassigned <unassigned@yoctopr=
oject.org>"
 RECIPE_MAINTAINER:pn-cairo =3D "Unassigned <unassigned@yoctoproject.org>=
"
+RECIPE_MAINTAINER:pn-cantarell-fonts =3D "Unassigned <unassigned@yoctopr=
oject.org>"
 RECIPE_MAINTAINER:pn-cargo =3D "Randy MacLeod <Randy.MacLeod@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-cargo-c =3D "Deepesh Varatharajan <Deepesh.Varathar=
ajan@windriver.com>"
-RECIPE_MAINTAINER:pn-cantarell-fonts =3D "Unassigned <unassigned@yoctopr=
oject.org>"
 RECIPE_MAINTAINER:pn-ccache =3D "Robert Yang <liezhi.yang@windriver.com>=
"
 RECIPE_MAINTAINER:pn-cdrtools-native =3D "Yi Zhao <yi.zhao@windriver.com=
>"
 RECIPE_MAINTAINER:pn-chrpath =3D "Yi Zhao <yi.zhao@windriver.com>"
@@ -110,24 +110,24 @@ RECIPE_MAINTAINER:pn-connman-conf =3D "Ross Burton =
<ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-connman-gnome =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-consolekit =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-core-image-base =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-full-cmdline =3D "Richard Purdie <richar=
d.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-initramfs-boot =3D "Ross Burton <ross.bu=
rton@arm.com>"
+RECIPE_MAINTAINER:pn-core-image-kernel-dev =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-minimal =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-minimal-dev =3D "Richard Purdie <richard=
.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-minimal-initramfs =3D "Richard Purdie <r=
ichard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-minimal-mtdutils =3D "Richard Purdie <ri=
chard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-tiny-initramfs =3D "Richard Purdie <rich=
ard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-full-cmdline =3D "Richard Purdie <richar=
d.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-kernel-dev =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-ptest-all =3D "Richard Purdie <richard.p=
urdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-ptest-fast =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-sato =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-sato-dev =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-sato-sdk =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-testcontroller-initramfs =3D "Richard Pu=
rdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-testcontroller =3D "Richard Purdie <rich=
ard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-testcontroller-initramfs =3D "Richard Pu=
rdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-core-image-tiny-initramfs =3D "Richard Purdie <rich=
ard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-weston =3D "Richard Purdie <richard.purd=
ie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-weston-sdk =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-core-image-x11 =3D "Richard Purdie <richard.purdie@=
linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-core-image-sato-dev =3D "Richard Purdie <richard.pu=
rdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-coreutils =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-cpio =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-cracklib =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
@@ -167,8 +167,8 @@ RECIPE_MAINTAINER:pn-dtc =3D "Wang Mingyu <wangmy@fuj=
itsu.com>"
 RECIPE_MAINTAINER:pn-dwarfsrcfiles =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-e2fsprogs =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-ed =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr =3D "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-efivar =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-ell =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-enchant2 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
@@ -179,8 +179,8 @@ RECIPE_MAINTAINER:pn-ethtool =3D "Unassigned <unassig=
ned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-eudev =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-expat =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-expect =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-ffmpeg =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-fastfloat =3D "Markus Volk <f_l_k@t-online.de>"
+RECIPE_MAINTAINER:pn-ffmpeg =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-file =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-flac =3D "Michael Opdenacker <michael.opdenacker@ro=
otcommit.com>"
@@ -201,6 +201,7 @@ RECIPE_MAINTAINER:pn-gcc-crosssdk-${SDK_SYS} =3D "Khe=
m Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-runtime =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-sanitizers =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gcc-source-15.2.0 =3D "Khem Raj <raj.khem@gmail.com=
>"
+RECIPE_MAINTAINER:pn-gcompat =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gconf =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-gcr =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-gdb =3D "Khem Raj <raj.khem@gmail.com>"
@@ -222,8 +223,8 @@ RECIPE_MAINTAINER:pn-glibc-locale =3D "Khem Raj <raj.=
khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-mtrace =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-scripts =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glibc-testsuite =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-gmp =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-glslang =3D "Jose Quaresma <quaresma.jose@gmail.com=
>"
+RECIPE_MAINTAINER:pn-gmp =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gn =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-gnome-desktop-testing =3D "Ross Burton <ross.burton=
@arm.com>"
 RECIPE_MAINTAINER:pn-gnu-config =3D "Robert Yang <liezhi.yang@windriver.=
com>"
@@ -241,7 +242,6 @@ RECIPE_MAINTAINER:pn-gobject-introspection =3D "Unass=
igned <unassigned@yoctoprojec
 RECIPE_MAINTAINER:pn-gperf =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-gpgme =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-gptfdisk =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
-RECIPE_MAINTAINER:pn-gcompat =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-graphene =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-grep =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-groff =3D "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -262,8 +262,8 @@ RECIPE_MAINTAINER:pn-gstreamer1.0-python =3D "Unassig=
ned <unassigned@yoctoproject.
 RECIPE_MAINTAINER:pn-gstreamer1.0-rtsp-server =3D "Unassigned <unassigne=
d@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-gstreamer1.0-vaapi =3D "Unassigned <unassigned@yoct=
oproject.org>"
 RECIPE_MAINTAINER:pn-gtk+3 =3D "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-gtk4 =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-gtk-doc =3D "Unassigned <unassigned@yoctoproject.or=
g>"
+RECIPE_MAINTAINER:pn-gtk4 =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-gzip =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-harfbuzz =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-hdparm =3D "Denys Dmytriyenko <denis@denix.org>"
@@ -298,7 +298,6 @@ RECIPE_MAINTAINER:pn-iputils =3D "Unassigned <unassig=
ned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-iso-codes =3D "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER:pn-itstool =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-iw =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-libjpeg-turbo =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-json-c =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-json-glib =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-kbd =3D "Unassigned <unassigned@yoctoproject.org>"
@@ -354,8 +353,8 @@ RECIPE_MAINTAINER:pn-libgcrypt =3D "Hongxu Jia <hongx=
u.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-libgfortran =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libgit2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libgloss =3D "Alejandro Hernandez <alejandro@enedin=
o.org>"
-RECIPE_MAINTAINER:pn-libglvnd =3D "Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libglu =3D "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-libglvnd =3D "Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com>"
 RECIPE_MAINTAINER:pn-libgpg-error =3D "Hongxu Jia <hongxu.jia@windriver.=
com>"
 RECIPE_MAINTAINER:pn-libgudev =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libhandy =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
@@ -364,14 +363,15 @@ RECIPE_MAINTAINER:pn-libice =3D "Unassigned <unassi=
gned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libidn2 =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libinput =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libjitterentropy =3D "Ross Burton <ross.burton@arm.=
com>"
+RECIPE_MAINTAINER:pn-libjpeg-turbo =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-libksba =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libmatchbox =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-libmd =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libmicrohttpd =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-libmnl =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-libmpc =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libmodule-build-perl =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
 RECIPE_MAINTAINER:pn-libmodulemd =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
+RECIPE_MAINTAINER:pn-libmpc =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libnl =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libnotify =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-libnsl2 =3D "Khem Raj <raj.khem@gmail.com>"
@@ -386,12 +386,11 @@ RECIPE_MAINTAINER:pn-libpipeline =3D "Wang Mingyu <=
wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libpng =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libportal =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-libproxy =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
+RECIPE_MAINTAINER:pn-libpsl =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libpthread-stubs =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-libptytty =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-libpsl =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-librepo =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-librsvg =3D "Unassigned <unassigned@yoctoproject.or=
g>"
-RECIPE_MAINTAINER:pn-libstd-rs =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-libsamplerate0 =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-libsass =3D "Simone Wei=C3=9F <simone.p.weiss@poste=
o.com>"
 RECIPE_MAINTAINER:pn-libsdl2 =3D "Yi Zhao <yi.zhao@windriver.com>"
@@ -404,6 +403,7 @@ RECIPE_MAINTAINER:pn-libsolv =3D "Unassigned <unassig=
ned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsoup =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libssh2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libssp-nonshared =3D "Khem Raj <raj.khem@gmail.com>=
"
+RECIPE_MAINTAINER:pn-libstd-rs =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-libtasn1 =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-libtest-fatal-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
 RECIPE_MAINTAINER:pn-libtest-needs-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
@@ -416,12 +416,12 @@ RECIPE_MAINTAINER:pn-libtool-cross =3D "Robert Yang=
 <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-libtool-native =3D "Robert Yang <liezhi.yang@windri=
ver.com>"
 RECIPE_MAINTAINER:pn-libtraceevent =3D "Bruce Ashfield <bruce.ashfield@g=
mail.com>"
 RECIPE_MAINTAINER:pn-libtry-tiny-perl =3D "Tim Orling <tim.orling@konsul=
ko.com>"
+RECIPE_MAINTAINER:pn-libubootenv =3D "Stefano Babic <sbabic@nabladev.com=
>"
 RECIPE_MAINTAINER:pn-libucontext =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libunistring =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-libunwind =3D "Bruce Ashfield <bruce.ashfield@gmail=
.com>"
 RECIPE_MAINTAINER:pn-liburcu =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-libusb1 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
-RECIPE_MAINTAINER:pn-libubootenv =3D "Stefano Babic <sbabic@nabladev.com=
>"
 RECIPE_MAINTAINER:pn-libuv =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libva =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-libva-initial =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
@@ -433,11 +433,11 @@ RECIPE_MAINTAINER:pn-libx11 =3D "Unassigned <unassi=
gned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libx11-compose-data =3D "Unassigned <unassigned@yoc=
toproject.org>"
 RECIPE_MAINTAINER:pn-libxau =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libxcb =3D "Unassigned <unassigned@yoctoproject.org=
>"
-RECIPE_MAINTAINER:pn-libxcvt =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libxcomposite =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
-RECIPE_MAINTAINER:pn-libxcursor =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-libxcrypt =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libxcrypt-compat =3D "Khem Raj <raj.khem@gmail.com>=
"
+RECIPE_MAINTAINER:pn-libxcursor =3D "Unassigned <unassigned@yoctoproject=
.org>"
+RECIPE_MAINTAINER:pn-libxcvt =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-libxdamage =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-libxdmcp =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-libxext =3D "Unassigned <unassigned@yoctoproject.or=
g>"
@@ -473,20 +473,20 @@ RECIPE_MAINTAINER:pn-libxxf86vm =3D "Unassigned <un=
assigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libyaml =3D "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-lighttpd =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
 RECIPE_MAINTAINER:pn-linux-dummy =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
-RECIPE_MAINTAINER:pn-linux-yocto-fitimage =3D "Adrian Freihofer <adrian.=
freihofer@siemens.com>"
 RECIPE_MAINTAINER:pn-linux-firmware =3D "Unassigned <unassigned@yoctopro=
ject.org>"
 RECIPE_MAINTAINER:pn-linux-libc-headers =3D "Bruce Ashfield <bruce.ashfi=
eld@gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto =3D "Bruce Ashfield <bruce.ashfield@gma=
il.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-dev =3D "Bruce Ashfield <bruce.ashfield=
@gmail.com>"
+RECIPE_MAINTAINER:pn-linux-yocto-fitimage =3D "Adrian Freihofer <adrian.=
freihofer@siemens.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-rt =3D "Bruce Ashfield <bruce.ashfield@=
gmail.com>"
 RECIPE_MAINTAINER:pn-linux-yocto-tiny =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
 RECIPE_MAINTAINER:pn-lld =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb =3D "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-project-source-21.1.8 =3D "Khem Raj <raj.khem@=
gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native =3D "Khem Raj <raj.khem@gmail.co=
m>"
-RECIPE_MAINTAINER:pn-llvm =3D "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-log4cplus =3D "Unassigned <unassigned@yoctoproject.=
org>"
+RECIPE_MAINTAINER:pn-logrotate =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-lrzsz =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-lsb-release =3D "Hongxu Jia <hongxu.jia@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-lsof =3D "Ross Burton <ross.burton@arm.com>"
@@ -496,17 +496,17 @@ RECIPE_MAINTAINER:pn-lttng-tools =3D "Richard Purdi=
e <richard.purdie@linuxfoundati
 RECIPE_MAINTAINER:pn-lttng-ust =3D "Richard Purdie <richard.purdie@linux=
foundation.org>"
 RECIPE_MAINTAINER:pn-lua =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-lz4 =3D "Denys Dmytriyenko <denis@denix.org>"
-RECIPE_MAINTAINER:pn-lzo =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzip =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzlib =3D "Denys Dmytriyenko <denis@denix.org>"
+RECIPE_MAINTAINER:pn-lzo =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-lzop =3D "Marek Vasut <marex@denx.de>"
 RECIPE_MAINTAINER:pn-m4 =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-m4-native =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-make =3D "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-make-mod-scripts =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
 RECIPE_MAINTAINER:pn-makedepend =3D "Robert Yang <liezhi.yang@windriver.=
com>"
 RECIPE_MAINTAINER:pn-makedevs =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-makedumpfile =3D "Etienne Cordonnier <ecordonnier@s=
nap.com>"
-RECIPE_MAINTAINER:pn-make-mod-scripts =3D "Bruce Ashfield <bruce.ashfiel=
d@gmail.com>"
 RECIPE_MAINTAINER:pn-man-db =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-man-pages =3D "Hongxu Jia <hongxu.jia@windriver.com=
>"
 RECIPE_MAINTAINER:pn-matchbox-config-gtk =3D "Ross Burton <ross.burton@a=
rm.com>"
@@ -557,12 +557,12 @@ RECIPE_MAINTAINER:pn-nativesdk-libtool =3D "Richard=
 Purdie <richard.purdie@linuxfo
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host =3D "Ross Burton <r=
oss.burton@arm.com>"
 RECIPE_MAINTAINER:pn-nativesdk-qemu-helper =3D "Richard Purdie <richard.=
purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-sdk-provides-dummy =3D "Richard Purdie <r=
ichard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-newlib =3D "Alejandro Hernandez <alejandro@enedino.=
org>"
 RECIPE_MAINTAINER:pn-ncurses =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-neard =3D "Unassigned <unassigned@yoctoproject.org>=
"
 RECIPE_MAINTAINER:pn-net-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
 RECIPE_MAINTAINER:pn-netbase =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-nettle =3D "Unassigned <unassigned@yoctoproject.org=
>"
+RECIPE_MAINTAINER:pn-newlib =3D "Alejandro Hernandez <alejandro@enedino.=
org>"
 RECIPE_MAINTAINER:pn-nfs-export-root =3D "Robert Yang <liezhi.yang@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-nfs-utils =3D "Robert Yang <liezhi.yang@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-nghttp2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
@@ -741,10 +741,10 @@ RECIPE_MAINTAINER:pn-python3-testtools =3D "Trevor =
Gamblin <tgamblin@baylibre.com>
 RECIPE_MAINTAINER:pn-python3-trove-classifiers =3D "Trevor Gamblin <tgam=
blin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-typing-extensions =3D "Tim Orling <tim.orli=
ng@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify =3D "Trevor Gamblin <tgamblin@bay=
libre.com>"
-RECIPE_MAINTAINER:pn-python3-uv-build =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-python3-unittest-automake-output =3D "Ross Burton <=
ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-python3-uritools =3D "Marta Rybczynska <marta.rybcz=
ynska@ygreky.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 =3D "Tim Orling <tim.orling@konsulk=
o.com>"
+RECIPE_MAINTAINER:pn-python3-uv-build =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-python3-vcversioner =3D "Bruce Ashfield <bruce.ashf=
ield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-webcolors =3D "Bruce Ashfield <bruce.ashfie=
ld@gmail.com>"
@@ -766,8 +766,8 @@ RECIPE_MAINTAINER:pn-readline =3D "Hongxu Jia <hongxu=
.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-repo =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-resolvconf =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-rgb =3D "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-rng-tools =3D "Unassigned <unassigned@yoctoproject.=
org>"
+RECIPE_MAINTAINER:pn-rpcbind =3D "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm =3D "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-rpm-sequoia =3D "Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com>"
@@ -780,8 +780,8 @@ RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.M=
acLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
-RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
 RECIPE_MAINTAINER:pn-sbc =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-scdoc =3D "Alex Kiernan <alex.kiernan@gmail.com>"
 RECIPE_MAINTAINER:pn-screen =3D "Unassigned <unassigned@yoctoproject.org=
>"
@@ -790,10 +790,10 @@ RECIPE_MAINTAINER:pn-sed =3D "Chen Qi <Qi.Chen@wind=
river.com>"
 RECIPE_MAINTAINER:pn-serf =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-setserial =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-settings-daemon =3D "Unassigned <unassigned@yoctopr=
oject.org>"
+RECIPE_MAINTAINER:pn-shaderc =3D "Jose Quaresma <quaresma.jose@gmail.com=
>"
 RECIPE_MAINTAINER:pn-shadow =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-shadow-securetty =3D "Chen Qi <Qi.Chen@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-shadow-sysroot =3D "Chen Qi <Qi.Chen@windriver.com>=
"
-RECIPE_MAINTAINER:pn-shaderc =3D "Jose Quaresma <quaresma.jose@gmail.com=
>"
 RECIPE_MAINTAINER:pn-shared-mime-info =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-shutdown-desktop =3D "Unassigned <unassigned@yoctop=
roject.org>"
 RECIPE_MAINTAINER:pn-signing-keys =3D "Richard Purdie <richard.purdie@li=
nuxfoundation.org>"
@@ -819,9 +819,9 @@ RECIPE_MAINTAINER:pn-syslinux =3D "Unassigned <unassi=
gned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-sysstat =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-boot =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-boot-native =3D "Viswanath Kraleti <quic_vk=
raleti@quicinc.com>"
 RECIPE_MAINTAINER:pn-systemd-bootchart =3D "Chen Qi <Qi.Chen@windriver.c=
om>"
 RECIPE_MAINTAINER:pn-systemd-bootconf =3D "Chen Qi <Qi.Chen@windriver.co=
m>"
-RECIPE_MAINTAINER:pn-systemd-boot-native =3D "Viswanath Kraleti <quic_vk=
raleti@quicinc.com>"
 RECIPE_MAINTAINER:pn-systemd-conf =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-machine-units =3D "Chen Qi <Qi.Chen@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty =3D "Chen Qi <Qi.Chen@windriver=
.com>"
@@ -854,10 +854,10 @@ RECIPE_MAINTAINER:pn-uninative-tarball =3D "Richard=
 Purdie <richard.purdie@linuxfo
 RECIPE_MAINTAINER:pn-unzip =3D "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-update-rc.d =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-usbutils =3D "Unassigned <unassigned@yoctoproject.o=
rg>"
+RECIPE_MAINTAINER:pn-utfcpp =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-util-linux =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-util-linux-libuuid =3D "Chen Qi <Qi.Chen@windriver.=
com>"
 RECIPE_MAINTAINER:pn-util-macros =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
-RECIPE_MAINTAINER:pn-utfcpp =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-v86d =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-vala =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-valgrind =3D "Mingli Yu <mingli.yu@windriver.com>"

--=20
2.53.0


