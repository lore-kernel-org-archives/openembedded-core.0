Return-Path: <sbabic@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA84C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 11:27:47 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web10.10113.1685705266450570919
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 04:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: denx.de, ip: 212.18.0.10, mailfrom: sbabic@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4QXghv35cxz1sHPm;
	Fri,  2 Jun 2023 13:27:43 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4QXghv2Qvlz1qqlW;
	Fri,  2 Jun 2023 13:27:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id gGvL3V1gLfiK; Fri,  2 Jun 2023 13:27:42 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net [88.217.136.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Fri,  2 Jun 2023 13:27:42 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 146EF4540854;
	Fri,  2 Jun 2023 13:27:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([127.0.0.1])
	by localhost (mail.babic.homelinux.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FfyK6ec-Ro62; Fri,  2 Jun 2023 13:27:39 +0200 (CEST)
Received: from paperino.fritz.box (paperino.fritz.box [192.168.178.48])
	by babic.homelinux.org (Postfix) with ESMTP id 8475345407E4;
	Fri,  2 Jun 2023 13:27:39 +0200 (CEST)
From: Stefano Babic <sbabic@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Babic <sbabic@denx.de>
Subject: [PATCH] libubootenv: upgrade 0.3.3 -> 0.3.4
Date: Fri,  2 Jun 2023 13:27:37 +0200
Message-Id: <20230602112737.28608-1-sbabic@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 11:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182303

Signed-off-by: Stefano Babic <sbabic@denx.de>
---
 .../u-boot/{libubootenv_0.3.3.bb =3D> libubootenv_0.3.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.3.bb =3D> libubootenv_0.=
3.4.bb} (93%)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb b/meta/recipes-=
bsp/u-boot/libubootenv_0.3.4.bb
similarity index 93%
rename from meta/recipes-bsp/u-boot/libubootenv_0.3.3.bb
rename to meta/recipes-bsp/u-boot/libubootenv_0.3.4.bb
index 55f91b6f05..25cdf3b05c 100644
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
--=20
2.34.1


