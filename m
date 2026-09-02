Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B16C624D3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:11:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15056.1788361858590630445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WxFRn6jg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37F7E165C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 874F23F673
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788361857; bh=4EsK9LmKOvteklzNQKzgqShWZDEWCx1oGlQgnCYOuDQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WxFRn6jgShMIWoIa1R5SunkNgXZ/fHskDrG9kL/V6tEskEWwo6lOdK3U7M8yHKhCF
	 6wQEJgKrbp5b0R8NOj/xgs2GmCyVmy2SFmajggW+5mGPRNJw3a0sANnvV7Pv9W51Cd
	 xKtQOgENEg0jPjQ4bd3vnS157xOWN6qbUBUOCqRY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] rgb: remove redundant util-macros dependency
Date: Wed,  2 Sep 2026 16:10:47 +0100
Message-ID: <20260902151051.159953-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902151051.159953-1-ross.burton@arm.com>
References: <20260902151051.159953-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244968

This is bought in via xorg-app-common.inc already.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/rgb_1.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb b/meta/recipes-g=
raphics/xorg-app/rgb_1.1.1.bb
index 4e1b055f492..8e5dc9d8f77 100644
--- a/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/rgb_1.1.1.bb
@@ -6,7 +6,7 @@ to RGB values (rgb.txt) and, if configured to use a datab=
ase for color \
 lookup, the rgb program to convert the text file into the binary databas=
e \
 format."
=20
-DEPENDS +=3D " xorgproto util-macros"
+DEPENDS +=3D "xorgproto"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ddc4f23db04773a414e3c39cc97a9f=
415"
 PE =3D "1"
=20
--=20
2.43.0


