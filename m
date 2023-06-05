Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C45C7EE24
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:51 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web11.2153.1685951631051457673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: denx.de, ip: 212.18.0.10, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4QZQph4cSSz1sLpJ;
	Mon,  5 Jun 2023 09:53:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4QZQph41kGz1qqlS;
	Mon,  5 Jun 2023 09:53:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id lSIaFTX_1cjU; Mon,  5 Jun 2023 09:53:47 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Mon,  5 Jun 2023 09:53:47 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 443C945407F6;
	Mon,  5 Jun 2023 09:53:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mDO3i7iFea0i; Mon,  5 Jun 2023 09:53:43 +0200 (CEST)
Received: from paperino.fritz.box (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id 5A94245407D6;
	Mon,  5 Jun 2023 09:53:43 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [PATCH V2] libubootenv: upgrade 0.3.3 -> 0.3.4
Date: Mon,  5 Jun 2023 09:53:25 +0200
Message-Id: <20230605075325.273171-1-sbabic@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182374

Signed-off-by: Stefano Babic <sbabic@denx.de>
---

Changes since V1:
  - added missing dependency to libyaml

 .../u-boot/{libubootenv_0.3.3.bb =3D> libubootenv_0.3.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.3.bb =3D> libubootenv_0.=
3.4.bb} (90%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb b/meta/recipes-=
bsp/u-boot/libubootenv_0.3.4.bb
similarity index 90%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
index 55f91b6f05b..ac1e03b8e97 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-2.1-or-later=
.txt;md5=3D4fbd65380cdd255951
 SECTION =3D "libs"
=20
 SRC_URI =3D "git://github.com/sbabic/libubootenv;protocol=3Dhttps;branch=
=3Dmaster"
-SRCREV =3D "108100622160bb0c7ef4b6186230fe1f26402791"
+SRCREV =3D "4dfb5254fc0540a36e87914bc14644c047ea7678"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -19,7 +19,7 @@ inherit cmake lib_package
=20
 EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease"
=20
-DEPENDS =3D "zlib"
+DEPENDS =3D "zlib libyaml"
 PROVIDES +=3D "u-boot-fw-utils"
 RPROVIDES:${PN}-bin +=3D "u-boot-fw-utils"
=20
--=20
2.34.1


