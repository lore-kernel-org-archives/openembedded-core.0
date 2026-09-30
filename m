Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45489CA5FC1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8570.1790756221127489220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gs4Snc3a;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7F7C61A107C
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D7E660749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73E20103298B1;
	Wed, 30 Sep 2026 10:16:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756218; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tDMLvMdmznTMhNtZ6bdOKamyt9McdGc9LzVk8aOL5C8=;
	b=gs4Snc3azWEpkPCrryrDa8/11dsvXX3XZ26tDV9WSGJdIoH026t7ZYqt6h84UBRFqXKoSr
	4saXKG991iV2WDBhY9kVFyVs1QunhpBD47aOlTXCc1dE9M5jqbIeLEvyzkkuC5V9fhdTPZ
	q5JrXof20OAXo+lQzKNcU+ZHZyjA3xog+Ro7GEVDoQSiixOBifqZQi29gSwkAr0zgGwI1O
	1tu8mN9/AANXoKUq4DRm1iXEt22O/urzbsPZ20iGPBUD+3FUpCgnVAdoANpeuuUgSPrQpF
	WW56xmFeVIpbob3oTFXIdIS8DKOmZbFmLyxnDxiALATp1anD7qB6xytfaGS9eA==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:40 +0200
Subject: [PATCH 15/24] vulkan-loader: 1.4.357.0 -> 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-15-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1192;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=2vQmqqAEvxiglhFYZXsdje9y8FESj9WbTxtwhJNwe+8=;
 b=Of9PRHWn7ae7aiOKaQP40V1xKU0B6R3mkA7c9moOqBWU+gjQVoWJLwdccPtBrAAdH92W2n5IP
 aklcBu/wzYSAhnLNlL8HhVSIwPhYuTJoqI7bp2ATFUx4s/3WaaJsWUV
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246939

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../vulkan/{vulkan-loader_1.4.357.0.bb => vulkan-loader_1.4.363.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb
index 1c21bea5e9a4..7d976a256b72 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.363.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "5f157b62e333c63260d05d81bf66faa216ab0fb8"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;nobranch=1;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "fa218055ff4948b159f31d43f800c808a13d51df"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 

-- 
2.47.3


