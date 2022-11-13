Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7E6C4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 10:25:13 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web12.1405.1668335105174965953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 02:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@email.de header.s=s29768273 header.b=FD2ZmHo5;
 spf=pass (domain: email.de, ip: 212.227.15.4, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1668335102;
	bh=ckhZXaLPTNvY3B5EmGWfQ4etgykzMi1TocpqLiHPEG4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=FD2ZmHo5G54gm8km3EtzcGwkNJFhz5H+o6MWwG+vPqIvnftll/GYa2wcW3+b0E1JK
	 a+op6vgANSpWQv0nRXbsLAr4rGyc+SSv74+ifVltb67W1c4MLsE5GJfQlK36H4zYT5
	 n/Dg/2uKXixALAwPZOEeQu7Kl4RNH7INGxtXMRWtdG4eycQJRAvrVwvGV/+zcz2rYV
	 8dOKPTDkg8fFzZS/vl19Fwu4LqqxjD62neiY0aNGglVkip2kgFRLmdJgiMP2W/9dWJ
	 jnJLtWYpx9eqPZeQhGoft3lLg/wuRLxT1le8AvdPTfCJ034Jt+jYXUdAl+YZEDqyN2
	 mHUMPKQ2rECCw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MidHP-1pQlIH2hSp-00fmRo; Sun, 13 Nov 2022 11:25:02 +0100
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [meta-oe][PATCH v3] initial configs: set initial {DISTRO|MACHINE|IMAGE}FEATUREs as weak as possible
Date: Sun, 13 Nov 2022 10:24:44 +0000
Message-Id: <20221113102444.8267-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:PQIBphLyDP7pqB2idnzZuK07e/gm0sZ83s1ccOQwt1ifpgENs2n
 xg+zQhDymgJkkzgeuLUgabTM0wDrf0/2Ynl5wYY/4wPaLhZy+cN29fD5XwJhofg8j6bpsCh
 R2kGFUUXg/dP2u6xbVa5eN2TyTSM2RADp6zQvFnPbiorLCRo6HMnFYLD4R+rCEAoociwi5x
 cZB7Q0V1tbFeVzX72iGJQ==
UI-OutboundReport: notjunk:1;M01:P0:ZPfXpFj5Hhw=;iMGOS6Fz+q5EZ6ADxwRoagN1xu/
 TBCHZXyWwuj07RP5KyhKRO1wyLUQlSNqIidVSNk3yvCDdyuC6Iiue+NcdnN9RxB9de3l7tFtH
 /jf+pAt1t/dbaz6FQcypJUocSmwuKCBXCqG26Osyp+SERs29z1jDqVAjx7H/JzwBaum7Uchje
 AQ8VBkH9z4GNI3PcKAdoEWZbSksKjo2Nt5nkNhrQHC1fW3FbZymbx2nYt4D0CSVJJrpLY0Sam
 7fgHie05N1XZms374N3yR8mYylaj+KwDTBqrc+IH338FokhyG1mxifCUNrahcf9FzwYLkkXay
 4Qm9dDfojEASn3+HqRn8g6NIaawDWuowD6ZkMZCMhezlIE457Cr8j5wPSr8RWPM/8HoUECP08
 bPeusAfonIxem1NvzZLSNq3Ke6z0HKilBHDP6gAjv9ouy4Z5QA8fohHruaRACV52jZX0vmg5n
 aofo8zLf6yR6flVKKpPOu4kwEHT67K1W0UJAvG6Y52KG4UeoeM4u6j9S7U7YvUJ7oVs+70DXb
 7o2/S51XtzaUjREbXePdGhk94im6FyvRlOP90DoY6igyZ2vhBb6dp3OFJCU327zpgFTo5/6Ov
 vuYm+S7hFNhSfL39tH/d/eitHsdcMTrnLQ9Ytdze0E3B+gNnm0A5NEh96RL4E18Km65LTKpWR
 h4oFqm72yEXH09KRaOkE2KY3BuySGH7YQUoYjLp2SGmrDnv/NLZduFP0+AbRAtdvbDxS3OfmZ
 4wLX13t+kttt8kmllgnqHGbXogp/Qtnu82o6wZLY/ikS5dmu/NYSlagrqNXrj/PrSXze++Nsk
 7aoVtxTsofEiYmztWdIemipLgG5LiShldXH/FGzfZLl4voaW8v9DMGmV/fb+nzMn+0rlrVgG6
 YvZkOwNpV8cOzyPkbcCaFNJvs+NLXFmDd+oMLAKNd8q+LwqQPk+yXB2Q4v+ynuReXy07P/mXz
 7U8xaQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 10:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173188

From: Christoph Lauer <christoph.lauer@xtronic.de>

This gives BSP creators the flexibility to change features with weak defau=
lts.
Non-empty FEATURES must not be weaker because then the empty weaker value =
from bitbake.conf might be applied.

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta/conf/bitbake.conf                        | 28 +++++++++----------
 .../distro/include/default-distrovars.inc     |  4 +--
 meta/conf/machine/include/qemu.inc            |  2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index dea573986d..b2540bb3f5 100644
=2D-- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -885,31 +885,31 @@ OES_BITBAKE_CONF =3D "1"
 # Machine properties and packagegroup-base stuff
 ##################################################################

-MACHINE_FEATURES ?=3D ""
-DISTRO_FEATURES ?=3D ""
+MACHINE_FEATURES ??=3D ""
+DISTRO_FEATURES ??=3D ""

-DISTRO_EXTRA_RDEPENDS ?=3D ""
-DISTRO_EXTRA_RRECOMMENDS ?=3D ""
-MACHINE_EXTRA_RDEPENDS ?=3D ""
-MACHINE_EXTRA_RRECOMMENDS ?=3D ""
-MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?=3D ""
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?=3D ""
+DISTRO_EXTRA_RDEPENDS ??=3D ""
+DISTRO_EXTRA_RRECOMMENDS ??=3D ""
+MACHINE_EXTRA_RDEPENDS ??=3D ""
+MACHINE_EXTRA_RRECOMMENDS ??=3D ""
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS ??=3D ""
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ??=3D ""

 EXTRA_IMAGE_FEATURES ??=3D ""
 IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"

 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
-DISTRO_FEATURES_NATIVESDK ?=3D "x11"
+DISTRO_FEATURES_NATIVE ??=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVESDK ??=3D "x11"

 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
-DISTRO_FEATURES_FILTER_NATIVE ?=3D "api-documentation debuginfod opengl w=
ayland"
-DISTRO_FEATURES_FILTER_NATIVESDK ?=3D "api-documentation debuginfod openg=
l wayland"
+DISTRO_FEATURES_FILTER_NATIVE ??=3D "api-documentation debuginfod opengl =
wayland"
+DISTRO_FEATURES_FILTER_NATIVESDK ??=3D "api-documentation debuginfod open=
gl wayland"

-DISTRO_FEATURES_BACKFILL =3D "pulseaudio sysvinit gobject-introspection-d=
ata ldconfig"
-MACHINE_FEATURES_BACKFILL =3D "rtc qemu-usermode"
+DISTRO_FEATURES_BACKFILL ??=3D "pulseaudio sysvinit gobject-introspection=
-data ldconfig"
+MACHINE_FEATURES_BACKFILL ??=3D "rtc qemu-usermode"

 COMBINED_FEATURES =3D "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACH=
INE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] +=3D "DISTRO_FEATURES MACHINE_FEATURES"
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/d=
istro/include/default-distrovars.inc
index abf48f79f0..3ef8117bfa 100644
=2D-- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -19,9 +19,9 @@ DISTRO_FEATURES_DEFAULT:remove:arc =3D "seccomp"
 # seccomp is not yet ported to microblaze
 DISTRO_FEATURES_DEFAULT:remove:microblaze =3D "seccomp"

-DISTRO_FEATURES_DEFAULT ?=3D "acl alsa bluetooth debuginfod ext2 ipv4 ipv=
6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat sec=
comp"
+DISTRO_FEATURES_DEFAULT ??=3D "acl alsa bluetooth debuginfod ext2 ipv4 ip=
v6 pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11 vfat se=
ccomp"
 DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}"
-IMAGE_FEATURES ?=3D ""
+IMAGE_FEATURES ??=3D ""

 COMMERCIAL_AUDIO_PLUGINS ?=3D ""
 # COMMERCIAL_AUDIO_PLUGINS ?=3D "gst-plugins-ugly-mad gst-plugins-ugly-mp=
egaudioparse"
diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/includ=
e/qemu.inc
index d9bed7708d..3cda8be06f 100644
=2D-- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -10,7 +10,7 @@ XSERVER ?=3D "xserver-xorg \
             xf86-video-fbdev \
             "

-MACHINE_FEATURES =3D "alsa bluetooth usbgadget screen vfat"
+MACHINE_FEATURES ?=3D "alsa bluetooth usbgadget screen vfat"

 MACHINEOVERRIDES =3D. "qemuall:"

=2D-
2.17.1


