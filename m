Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BB9D75E57
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 14:22:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25533.1732285323757329912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 06:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42AC4113E
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 06:22:33 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CDFEB3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 06:22:02 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] xorg-driver: remove redundant DEPENDS on xorgproto
Date: Fri, 22 Nov 2024 14:21:57 +0000
Message-Id: <20241122142158.2256406-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 14:22:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207619

xorg-driver-common already has this dependency.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-driver/xorg-driver-input.inc | 2 --
 meta/recipes-graphics/xorg-driver/xorg-driver-video.inc | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc b/me=
ta/recipes-graphics/xorg-driver/xorg-driver-input.inc
index 934c3d75c12..4efb90278c5 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-input.inc
@@ -1,7 +1,5 @@
 require xorg-driver-common.inc
=20
-DEPENDS +=3D "xorgproto"
-
 python add_xorg_abi_depends() {
     _add_xorg_abi_depends(d, "input")
 }
diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc b/me=
ta/recipes-graphics/xorg-driver/xorg-driver-video.inc
index 2938ef11616..c9365d8954a 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-video.inc
@@ -1,7 +1,5 @@
 require xorg-driver-common.inc
=20
-DEPENDS =3D+ "xorgproto"
-
 python add_xorg_abi_depends() {
     _add_xorg_abi_depends(d, "video")
 }
--=20
2.34.1


