Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6115BC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:11:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15414.1788361859868314972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Xdt+VSm5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE252165C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:55 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A8743F673
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 08:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788361859; bh=yH47lw/3DT+rdsSwE4rqBrtw75A8zBUNhDRkToDLUYA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xdt+VSm5IOFXXYOmDYwjV6u3kDYy2mcjQ0GIC9HAG1afAlAC6T85z/sUkMvukF7+V
	 rQvfM3kR78Eg3AkuQbaJ0EWUV/JFT6dCBrfeBC+dbvtISTLLEzCiJPrMSvvZiG2N0z
	 txCxPSEduqVVgBei6XFRJaKhvKKgP0yakRGiGOuk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] xorg-lib-common: depend on util-macros-native
Date: Wed,  2 Sep 2026 16:10:49 +0100
Message-ID: <20260902151051.159953-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902151051.159953-1-ross.burton@arm.com>
References: <20260902151051.159953-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244970

There's no need to depend on the target form of this recipe as it just
provides autoconf macros, the native is sufficient.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/re=
cipes-graphics/xorg-lib/xorg-lib-common.inc
index a32e47f63b4..13b3b1a73bd 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -3,7 +3,7 @@ BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cg=
i?product=3Dxorg"
=20
 SECTION =3D "x11/libs"
 LICENSE =3D "MIT"
-DEPENDS =3D "util-macros"
+DEPENDS =3D "util-macros-native"
=20
 XORG_PN =3D "${BPN}"
 XORG_EXT ?=3D "tar.xz"
--=20
2.43.0


