Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B285C44513
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:05:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6666.1784124317846882015
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=FMeRW9vg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F79E1477
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D94463F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 07:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784124317; bh=n6K49rCO/HzKUCfQbJpWi/n1prgVLZYjf0zSj+kiX+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FMeRW9vgbwjHlgzOuLnbv/1xUvRlmce5zQYANarOOsDiAHqnrgj0lca4RNIgz9Hhz
	 ENlyk5SPEigeaP1xVw4JSTBGQGKpKCoruWPKSWxEIDAik0Pfgjes3oPfkjq7Mf7WCk
	 SOvE13uTg3qIWlkymRdrHKMjbF6Fe+lur8BXZ9mE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/12] mkfontscale: use meson
Date: Wed, 15 Jul 2026 15:05:01 +0100
Message-ID: <20260715140507.2329605-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715140507.2329605-1-ross.burton@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 14:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240965

Also drop util-macros-native dependency, which is only needed by the
configure scripts.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb b/meta/r=
ecipes-graphics/xorg-app/mkfontscale_1.2.4.bb
index 42867db65d6..176f8562e2d 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
@@ -8,7 +8,7 @@ font name (XLFD) is generated, and is written together wi=
th the file \
 name to a file fonts.scale in the directory.  The resulting fonts.scale =
\
 is used by the mkfontdir program."
=20
-DEPENDS =3D "util-macros-native zlib libfontenc freetype xorgproto"
+DEPENDS =3D "zlib libfontenc freetype xorgproto"
=20
 PROVIDES +=3D "mkfontdir"
 RPROVIDES:${PN} +=3D "mkfontdir"
@@ -19,3 +19,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5a60c596d1b5=
f3dee9f005b703b3180d"
=20
 SRC_URI_EXT =3D "xz"
 SRC_URI[sha256sum] =3D "a01492a17a9b6c0ee3f92ee578850e305315b9f298da5f00=
6a1cd4b51db01a5e"
+
+XORGBUILDCLASS =3D "meson"
--=20
2.43.0


