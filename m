Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4E7CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8496.1790756223582719983
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=A9wW+pSJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E83851A107C
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6BB060749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FF4E103298AE;
	Wed, 30 Sep 2026 10:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756220; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=23bcSml5gqd9eXUoc2YMLHQCWu1yCF7PS2wIyfzct48=;
	b=A9wW+pSJk+qsJHci9z9EAndjFgAN58IwrmCE7TRxw3kFAotmTae4F6C/53OM7oac18534i
	r5y201l9GzYE1Z2Q4tQOFkpR+Uugk4Re4wvBHBtDbp9taZOe+xniX+e86q1CEbVALB4EFc
	yZCAzXL9xh/6r9V9ho22rfYj/Eu03ZDvY5xsUE3Whh3nGRY6Djtwur79I/LHeeKnRCBdgc
	GqY/Axpd8/l5eBDpdw9AaLsAU+GwbbiEvQwLtTJDUWWyPJ3/1vYC7ONtpAWzepDvAkjn8x
	myh4oVhSHZwwjXQZu4y1RP2SeODxqT0ssjcsE6d1xhjzNBtt8ExMC7fYUqqiyg==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:42 +0200
Subject: [PATCH 17/24] vulkan-utility-libraries: upgrade 1.4.357.0 ->
 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-17-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1577;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=3aRjZOBie7OVAsFvCgAhocukDHM8+I2ETo3e7/Jmza4=;
 b=lbFLFF78/ZPNp869zhmtlF5DmDvZgdSeuQ82Xlgm6MxeLTcGzf2ddmnJLTSG6S+Q2HjT6YUJx
 +Aq6a6GvNw+DPitx4COf877Wq2c7amcZxegebzLP4/Wq6gmxyX6EpTm
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246941

Changelog:
- build: Update to header v1.4.363
- safe: Handle Sampler in VkDescriptorMappingSourceDataEXT
- build: Update to header v1.4.362
- build: Update to header v1.4.361
- build: Update to header v1.4.360
- build: Check if Vulkan-Headers is an ALIAS target
- build: Update to header v1.4.359
- build: Avoid AppleClang using the wrong headers
- cmake: support shared utility libraries
- build: Update to header v1.4.358

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...ity-libraries_1.4.357.0.bb => vulkan-utility-libraries_1.4.363.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb
index c750428d0940..45ffa83af1d9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.363.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "e9585c3e3d41ab608ee3b098ce4721d357308fc8"
+SRCREV = "57f01541b3959f2528f769043396e882851a7e75"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 

-- 
2.47.3


