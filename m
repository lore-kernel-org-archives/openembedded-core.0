Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119A0CA5FCA
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8495.1790756222480824085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=CK89RdGv;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D649C1A107D
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB33760749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1273A103298B3;
	Wed, 30 Sep 2026 10:16:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AQisoRVQwIla1lX7rpnSaR8FyeimpzEvp6h0KQtpxTc=;
	b=CK89RdGvBZtCMNarpN0G6z0X4c72ICgq7IJBD17EaeG4RQNxH/UkAf0WGvjjQoMeHMVAgh
	VIS7i5sxz9TmHRys96jjXkG7i/mcTfqBj9IS1y8yGiThmJQK3bUSJPSSMYoaoeviRSgPU4
	baQl7pLVAKD2Ubkzomoxila6UkQgeMFT8Hsw2iFnb2kGuH0cipRm8vtJPPk8x85okyoTBw
	EIujTntMSyRbYS6cu24TyOhEmINN6e3y9Kn7FWfdHCd3xdE4QyvQ/257tu4v7+hc+CoALh
	+sOjg8mAcXBvVsDo2vZO6K1bU6HMniRViZlwUinBa+38fQXs3UTFQIPVhNSd2g==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:41 +0200
Subject: [PATCH 16/24] vulkan-tools: upgrade 1.4.357.0 -> 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-16-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1749;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=ClS0tH2cHvu53+3r1LoFi/aNQb754Q9BB0sJ4WMjxtg=;
 b=zoDVFH6UFQKElGHVYqacqQAT3eqonEHeI4bS7dubBrlvgi2c+0AHXppTGTcCPiFeF7OYxKZo3
 /QgO040FwthASovCzaSi51mOhMVFqfB5SI+J2Vt5z6HIePtZ3Z3IkoX
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246940

Changelog:
- Update known_good.json
- Add VK_EXT_display_surface_counter instance extension
- build: Update to header v1.4.363
- vulkaninfo: add missing <ctime> include
- build: Update to header v1.4.362
- build: Update to header v1.4.361
- vulkaninfo: Include extended flags in video format props output
- build: Update to header v1.4.360
- build: Update to header v1.4.359
- build: Avoid AppleClang using the wrong headers
- vulkaninfo: Fix 32-bit image usage flags upper bound
- build: Update to header v1.4.358
- vulkaninfo: VK_KHR_extended_flags interaction with video
- vulkaninfo: Enable more instance extensions

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../vulkan/{vulkan-tools_1.4.357.0.bb => vulkan-tools_1.4.363.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb
index cafd3e7a0a2e..b987c1af7f52 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.363.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "286299bb6b732e4b22771cfb9d7d421542d40501"
+SRCREV = "6fe2055cf2fa921d52a4c6a31528cfc279a6977f"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"

-- 
2.47.3


