Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00CC9ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 10:07:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by mx.groups.io with SMTP id smtpd.web09.47.1662718041802303021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 03:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=neutral (domain: denx.de, ip: 212.18.0.9, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4MPBVv2X3lz1r158;
	Fri,  9 Sep 2022 12:07:19 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4MPBVv2J6yz1qqkB;
	Fri,  9 Sep 2022 12:07:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
	with ESMTP id cuHvhazFw_en; Fri,  9 Sep 2022 12:07:18 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
 [88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri,  9 Sep 2022 12:07:17 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 66B92454267E;
	Fri,  9 Sep 2022 12:07:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LH3mGefysriY; Fri,  9 Sep 2022 12:07:14 +0200 (CEST)
Received: from paperino.fritz.box (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id B68724541AC4;
	Fri,  9 Sep 2022 12:07:13 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [PATCH] libubootenv: upgrade 0.3.2 -> 0.3.3
Date: Fri,  9 Sep 2022 12:07:07 +0200
Message-Id: <20220909100707.1781537-1-sbabic@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 10:07:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170482

This includes the following changes:

1081006 Prepare 0.3.3
5d3e33c CMakeLists.txt: fix some inconsistent coding style
0e8f45c fw_printenv: dont hard-code configuration/environment files
44ecc1c fw_setenv: fix bug when SPI flash write size !=3D sector size
9ddccfc uboot_env: fix fileprotect for Android
066bec4 CI: add REUSE compatibility check
5cd7022 Android.bp: add missing copyright
73d0ded Android.bp: initial addition
629c5bc uboot_env: remove unused function
2dab85e uboot_env: remove unused parameters
82730b4 uboot_env: remove unused variables
2736ff3 uboot_env: fix pointer-sign warnings
f5d9292 uboot_env: switch to strchr/strrchr
369121e Add description of the fw_setenv script syntax
10c9a57 Include cstddef in the header for C++
471cdd5 Correct type of conversion of HEX .flags
7dbfffa Fix parsing multiple .flags variables
de31f3d Add REUSE badge
6390c1c Make libubootenv REUSE compliant
0573071 doxygen: fix libuboot_open/close return value description
0d12468 Add documentation for the configuration file
b1178c1 Add configuration for disabling MTD lock
5dadcb3 main: Remove duplicated code about '=3D' in variable name.
e085e37 libubootenv: Forbid to give empty variable name to fw_setenv.
42f919e main: Check libuboot_set_env() result.
1bc91d1 CI: add gitlab config

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 .../u-boot/{libubootenv_0.3.2.bb =3D> libubootenv_0.3.3.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.2.bb =3D> libubootenv_0.=
3.3.bb} (77%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-=
bsp/u-boot/libubootenv_0.3.3.bb
similarity index 77%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb
index e8f58941cf..55f91b6f05 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb
@@ -6,12 +6,12 @@ It provides a hardware-independent replacement for fw_p=
rintenv/setenv utilities
 provided by U-Boot"
=20
 HOMEPAGE =3D "https://github.com/sbabic/libubootenv"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://Licenses/lgpl-2.1.txt;md5=3D4fbd65380cdd255=
951079008b364516c"
+LICENSE =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4fbd65=
380cdd255951079008b364516c"
 SECTION =3D "libs"
=20
 SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps;branch=
=3Dmaster"
-SRCREV =3D "ba7564f5006d09bec51058cf4f5ac90d4dc18b3c"
+SRCREV =3D "108100622160bb0c7ef4b6186230fe1f26402791"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.34.1


