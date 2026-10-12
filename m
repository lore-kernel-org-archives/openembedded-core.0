Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B704ACA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 15:44:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16468.1791819850463498134
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 08:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=N1JbXVWa;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4F1D169E
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 08:44:05 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6C9813F7B4
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791819848; bh=61HJ/QH3Wo4LRq4tjZdVyptK3n0KIJJi7bNHqx+Hx+Y=;
	h=From:To:Subject:Date:From;
	b=N1JbXVWaGjK2LLc6gAF+EVmKflHUTPZy3buB8ttlj/PYsm3dYkKfG97beVU2OQRzl
	 F6PXB1Uk7pc9MYkIIMTIsa7dX2aK+6zzA8dlARkwTUsmXAWVZgNqp9kN5BGgPCkwB9
	 yXvTO/f+2h5bjkdxoJtpV8pTHxfgbFTxNQQx3AO4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] adwaita-icon-theme: drop librsvg-native DEPENDS
Date: Mon, 12 Oct 2026 16:44:03 +0100
Message-ID: <20261012154404.870798-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 15:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247666

librsvg-native was previously used[1] because the install used
gtk-encode-symbolic-svg. However, since adwaita moved to Meson this tool
is no longer used.

[1] oe-core f109bb56f48 ("adwaita-icon-theme: depend on librsvg")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb b/meta/r=
ecipes-gnome/gnome/adwaita-icon-theme_51.0.bb
index 78dbe000eea..8f92d561b0c 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_51.0.bb
@@ -14,8 +14,6 @@ inherit gnomebase allarch gtk-icon-cache
=20
 SRC_URI[archive.sha256sum] =3D "ba561cf3c96305a47179fa5605856ad695c9238e=
a07f7093aebd9ba80c4e323b"
=20
-DEPENDS +=3D "librsvg-native"
-
 PACKAGES =3D+ "${PN}-cursors ${PN}-symbolic"
=20
 RREPLACES:${PN} =3D "gnome-icon-theme"
--=20
2.43.0


