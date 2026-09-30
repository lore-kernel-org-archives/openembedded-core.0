Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65501CA5FC4
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8493.1790756216934595039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ouv3f6DU;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4C4C51A107D
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AC0F60749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 849051032986C;
	Wed, 30 Sep 2026 10:16:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756213; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Y7Hs1yjcLGI4Ci2eAz/OdVVVWCAt3bkAI8bYW+6746Q=;
	b=ouv3f6DUpGR+TR3LKd3hoJNTwvOpmDV1IrnvQh2TA5ito+1qwMrklv7Zlk4PigxqeNzvN8
	u2K8+FvOET2cE2RVaaNLv5EaRxH6d13OuLlNbYfU1RUypj0lK8e9BaNIEVxZk2ypXeuxXz
	vOjeh43sxAeolFXSXMcQ2+5C4nrlm1PCJ6Oq2oSC8nsNTvHphR/dsNAU0ts0E24F9rmB9v
	FWlLeNRs2zFAsski0GS4QtdCklk3yfM1arYuycp1aJmFVsP09OD1aB6vPpuFvkTZTTzvfb
	HNlgvZV+T2HfKAJfGE7AWZMnkCnfbCVNfQ1VKMW0NBJA1W5vKnr8iF2/G6PpJw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:36 +0200
Subject: [PATCH 11/24] spirv-headers: upgrade 1.4.357.0 -> 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-11-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1388;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=uYj0ue+ThJDxWM+hSs4zY6pY4loLl7A5BjXZHZYNUm8=;
 b=R8cp9v6tByp8UbQ5w45e00ba6ONoi8MYMv234CWAouAYMzoJO+/5atQGR7o08X5HBKcVYE0yG
 FPmfv3S5Fn1Ap1v9UpWnFI+1E0sMFzP12+La5ReQIfGIvrewXgMmtx1
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246935

Changelog:
- SPV_QCOM_subgroup_size
- SPV_QCOM_bfloat16_muladd
- document header tagging conventions
- Correct name and comment
- Add SPV_EXT_cooperative_matrix_maintenance1
- switch to the canonical CC-BY-4.0 license text
- Add Java output

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../spir/{spirv-headers_1.4.357.0.bb => spirv-headers_1.4.363.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.363.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.363.0.bb
index 244c6854fa1b..4ad077c6883a 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.357.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.363.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "CC-BY-4.0 AND MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "29981f65241605e08b0ede4cfeb999fe3b723c6a"
+SRCREV = "496543121ce6419f23d6fa5d7194ba66c36212d2"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:

-- 
2.47.3


