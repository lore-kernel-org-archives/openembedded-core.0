Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF74CA5FC5
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8497.1790756224159044672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PjhiTcKh;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 819391A107E
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5622060749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89107103298BA;
	Wed, 30 Sep 2026 10:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756221; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CnY+dQv/Us+YOfyiJM3x8q9MT0PvrSbZE0ANP24XIic=;
	b=PjhiTcKhNo8pKrw33s/L1k32oXmNuTuXHW5j+q+EgDO385uSrq797/aMxqNwxH8AyV0Sqw
	uHK2KKqnkMd91REJX4n9tNFa8zX0dwBIc9bqSd2TYSuM4WYh/DXeIEPd+mDh4ljFaS0trN
	IyGGdczYlVmKfadxLnsm0sR/kjEXWtWsO1DfFO36yoKTS9sGbxLsriNFW7z4VSKB8If8bA
	ZQqd2J9VWLCWVo9OjZkWuBQoQlVdDVO5mxE+UdpvpSR5FKYcBXIIJMLoV8dsVDb1UbDW/p
	c+UedoyL/h/w3cCtVwBrafNxmX3vmSHxIkq9LCxtvEMcw2pxOCti3QWxTSMyLw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:43 +0200
Subject: [PATCH 18/24] vulkan-validation-layers: upgrade 1.4.357.0 ->
 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-18-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=1381;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=+exzzxSN79qCGZ2Xj0nToT+r+ghIprl8gpM2XyduOsY=;
 b=2W5ufa1cFlwJX7xZHf68Y+CrIvyjbN1IZrNWJuMe9N9yL68FvaTdsSkPqVDxH0zBqG/xr3y5i
 PbUq1MPy5AfBf/OmsapX2xHDM0DQ4xY9PlukrlAH2wTKUbT9XQZfQq4
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246942

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...tion-layers_1.4.357.0.bb => vulkan-validation-layers_1.4.363.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.0.bb
index 5a35e9797b9c..10f74b49ec31 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.363.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 AND BSL-1.0 AND MIT AND BSD-2-Clause AND (Apache-2.0 WITH LLVM-exception)"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15158583155fe4efc33ea65c1370a177"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.357;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "f4874eee15c78d7bdb2b7e60659d539f14741500"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.363;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "15c64e73db67e27ff0215708fbe48684a35c6827"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 

-- 
2.47.3


