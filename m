Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34354C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:11:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15059.1788361861293906849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:11:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=G8RErWzw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 258D1165C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78D5C3F673
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788361860; bh=DQsftr4YSAwzonj9mTt90rOZWARnSpNEXM39mrz9324=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G8RErWzwya5KnTiwItHof6pAWMPO0z4NkncB+VchIVqJYDCcp5YZD+39kkKhvzA3o
	 MP0mJtsi78sPGkMtQ+ikGpfUbYE0jXLb89qzTL59amIAO8JhDLvjz+wRqj8NuH8UvJ
	 WnF/6CjUo+ydCSoqJ8sgYEYzndsmq97lbc+hHj6k=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] font-util: depend on util-macros-native
Date: Wed,  2 Sep 2026 16:10:51 +0100
Message-ID: <20260902151051.159953-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902151051.159953-1-ross.burton@arm.com>
References: <20260902151051.159953-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:11:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244972

There's no need to depend on the target form of this recipe as it just
provides autoconf macros, the native is sufficient.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-font/font-util_1.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb b/meta/re=
cipes-graphics/xorg-font/font-util_1.4.2.bb
index 05f246bf20e..103c91ba913 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.4.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D756e7412ee04c8=
0f5833cd2f35242f7a \
                     file://map-ISO8859-1;beginline=3D1;endline=3D4;md5=3D=
9c9c1d525d29c0e82b5c99edbb8e71c1 \
                     "
=20
-DEPENDS =3D "encodings util-macros"
+DEPENDS =3D "encodings util-macros-native"
 DEPENDS:class-native =3D "util-macros-native"
 RDEPENDS:${PN} =3D "mkfontdir mkfontscale encodings"
 RDEPENDS:${PN}:class-native =3D ""
--=20
2.43.0


