Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15F5CA5FC6
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8567.1790756218624123830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MLhsE8m/;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E79FB1A107C
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5EF860749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0921103298A6;
	Wed, 30 Sep 2026 10:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vgIaCkgXZUXcizj5vnZzjrRylhKKqDxJxl03h49Vgrc=;
	b=MLhsE8m/GF88ElPPdVHH0U3X/c4o2zncVuD7ZeZ75iiXB+RA0dY0kwpYugmixR9wKvUR32
	4lePGBR1AR05/nacejZWjG7ymsFEeHK7+b2VZDm87VkSOmn5TKaGGcugPDJtn01k0wx+KW
	ROA7J6zKVKE3AR3G/Z/7m3P0+CKl4XpM+TghK/3zHOBn3eOdA3LzFekNWYLqJ93JMAUz1T
	UNukvEuK2dHo3fGtRO63ij9SUrwDGFpLQW0oJahCj3VFdzK1mU0vSp0mV4CdxVVto7I468
	wH47nCYxTmgEygXatRtemj1Gg1Dqo6pboJ2FREqA67wL/S1wjQD86zOGzLURqw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:38 +0200
Subject: [PATCH 13/24] glslang: upgrade 1.4.357.0 -> 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-13-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=2101;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=IZEy2cFyxr86Z7KQJFueXivR/meAbtLR8JpySeEAfSs=;
 b=18BsgTtvrIKyxithAGOaNt3w3n+CuLV0OMROb6MtFUlx0l7SaaQTwmroPaL2B7VRcphlKGQJw
 OwIphBKBLDYA7QZ7xpE6o3nIjIxd+svQaZ/d3eQ3/UTPFuN+95gVat1
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246937

All changes history:
https://github.com/KhronosGroup/glslang/compare/vulkan-sdk-1.4.357.0...vulkan-sdk-1.4.363.0

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch              | 2 +-
 .../glslang/{glslang_1.4.357.0.bb => glslang_1.4.363.0.bb}              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index b6a4c5a29b88..b000dabff9d7 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From f7aad1905705097782ebfea3c74c75856158a2ba Mon Sep 17 00:00:00 2001
+From 347ba2f438483f66d14fa0e8ef7baf828ed6be92 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.363.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.4.357.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.363.0.bb
index 0f43d83f4ea9..1a92e89564ea 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.357.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.363.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND MIT AND GPL-3.0-or-later WITH Bison-exception-2.2"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "168d452a4f460d24b588fed08477a81c44ee27a1"
+SRCREV = "e1b562a8bed273a02f30b59b66a5d499793cede5"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "

-- 
2.47.3


