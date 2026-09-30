Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814ABCA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8494.1790756217606614430
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RlL5s421;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED25A1A107E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C268F60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE09D10329884;
	Wed, 30 Sep 2026 10:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756215; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NAyXXz6jZRfsR8GzDzgR8nBYEEmtQVmThDk3OP75CLA=;
	b=RlL5s421Pa6bpaQYGWhXz96gQ9tuHUsDYIYImRBSR25OhZhaIc9j40kPJry20cK1/RqHyX
	pPRgKL1d0ylUrZ0DIDHQN3h3yQPyTZ/woBK8yQmX4dUTQtUSJZs+yJx0sCQhQIaENa7S4E
	fLxVF43XJ+Mu5a+ZR6ReMA5yCvozpJDWGt0SIEbyyUqXRexOss3UYtKfOdZAcEzQD0PJKK
	vK7fOnbMavBwJHuBDweK0Ci7lSDt0lg5P2Yf8HHTpo6iFvQHbSLpb/mDDrr2NQULANTYcK
	fA1eaLA6xpLZnz6vrd/uywfIjcTWwo9QeCRxB0lC4TM28BgInT3rBMKLShPSiQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:37 +0200
Subject: [PATCH 12/24] vulkan-headers: upgrade 1.4.357.0 -> 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-12-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1446;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=L7vup+Yh1DoqWISXLXNF1XptY0q3GPl8UgalOOukgdA=;
 b=S/6vKuLJj0z1sJHQWinGBv78UZh6GlF5j7ttfAaRFXc6t+smpDVRS+L3ybZjE/TTtKIVVv2kb
 BG/AW15h5FXC4ydxXsk0ECsLC6lAynOXAQDGkl6PTRQ7KYQl9bMrIP6
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246936

Changelog:
- Update for Vulkan-Docs 1.4.363
- Update for Vulkan-Docs 1.4.362
- Update for Vulkan-Docs 1.4.361
- Update Vulkan named module in test
- Update for Vulkan-Docs 1.4.360
- Update for Vulkan-Docs 1.4.359
- Update for Vulkan-Docs 1.4.358
- Mention CONTRIBUTING.md to be part of the repo itself
- Clarify home repository of `registry/*.xml` files

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../vulkan/{vulkan-headers_1.4.357.0.bb => vulkan-headers_1.4.363.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb
index 4a91e39dcdbb..b187d75d5ff0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.363.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 AND MIT AND (Apache-2.0 OR MIT)"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=adc9da32fdd898219b3db5529f2185c0"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 
-SRCREV = "e3b1eec08173d6b825cd3ac88c885a63b621504a"
+SRCREV = "6802bb4733b63ed5efd3adb308a6c885ef180ea1"
 
 inherit cmake
 

-- 
2.47.3


