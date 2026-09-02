Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E088C624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 15:46:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.334.1788364008818410201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 08:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ctGLh1xl;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EBEA01A195D
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C1D466053C
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Sep 2026 15:46:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2462B11C794B8;
	Wed,  2 Sep 2026 17:46:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788364006; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5KtkLyZlXpI4ARaiv42Hvgnwn/mUTOJXDCaeAtxFEOc=;
	b=ctGLh1xlXYfCP2OmRNkXACicr9eXXLpBhbjwmB51SMonts39otsge08QBjFK6X9B32VgPN
	DvpQz3p3cRE0AkmbZBUDe94HbMWqmc8VnAKeBNJMtLukFVbgNlxqhICsftUdrmCNbtVc2e
	a3NEWNGlDLVq5Sx7PkQiPBIrrD6mA/V0Z0zfxsiyDD3BDRyVCYl+7pxTIw0EMdcnHFrWUw
	gOp3GfJhgVOYuZtHLf+STAnmuC8Yew1yFab2yJ29bc8499iZTGEmZwZcRVxf1vsXWEDl4A
	uNDlIBC46ND9dHStYjraX30uvnQqio8pE39md61z/EI6leZpA53Z7RhgW9oG0A==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 02 Sep 2026 17:46:43 +0200
Subject: [PATCH 1/8] spirv-llvm-translator: upgrade 23.1.0 -> 23.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-mathieu-updates-2026-09-02-v1-1-039b74833ec7@bootlin.com>
References: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
In-Reply-To: <20260902-mathieu-updates-2026-09-02-v1-0-039b74833ec7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788364004; l=1217;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=kwOl5/LynjYYfgoeluKbM903YkGxi7EIBl2gPk2hjdc=;
 b=ukKeBmuSYAMcpBEApXFuhJLrHcC1+PcFKn9zc7zlH3+tz9UaFh7AtF0YyHdBMzmUPDw2HsIvB
 E1DzOgWEZQ1DR8MW32BqXYaMqGGFBnCgqtYnhylfB5RvLlDCzX3/cub
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 15:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244974

Changelog:
- Fix memory leak in isInternalSPIRVBuiltin

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 ...{spirv-llvm-translator_23.1.0.bb => spirv-llvm-translator_23.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb
index fd1dd9cfae71..42e3236b38c0 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.0.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_23.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_230"
-SRCREV = "19a29d4376ab470909ba43ca014ae668fb1156c9"
+SRCREV = "c808623558686b7b285cabfa71542a93a5390f55"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;branch=${SPIRV_BRANCH};tag=v${PV} \
 "

-- 
2.47.3


