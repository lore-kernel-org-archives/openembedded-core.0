Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C25CA5FB1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 08:17:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8568.1790756219609556300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 01:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ISFSBMxE;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EEE0B1A107D
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BDCA260749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:16:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 803CE103298B7;
	Wed, 30 Sep 2026 10:16:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790756216; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=021H3twMdeTcjVocORwJadscb0w7JgXh/DO6qP7B8WU=;
	b=ISFSBMxEYPc5tExAwHs/16T1fmza8oDEg+gIIwgz8NKBejl6E3J1WIm7AuoTBo1HXN6PIG
	1O2rFNuk34TnbBcl1NKE6dWaSZM84MY/9Dy4smyefir7HXEQpblj7uEzFtJ0KJR2djY1W4
	AcQ6eM4mjdHlO/2658yh7mw37EGqvwEIhhS17krRjgvMx8PJM38JE5iMIJKzQhwDYHQcyw
	oG+S2/uD8x7g+UlPaGVAPHK2V5iQkXEhixmXMxGojVizR9ggbSJehuDREttwQHZvXCshWC
	o6DN4nfMknu506Cb4Bia4vr3w+OJRw1pYjGacpQ8EYAI4sk0CrbkOVlETeWb1Q==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 10:16:39 +0200
Subject: [PATCH 14/24] spirv-tools: upgrade 1.4.357.0 -> 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v1-14-102c38be04df@bootlin.com>
References: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
In-Reply-To: <20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790756204; l=3687;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=oxEwZR8FFYgEq5v7SpGq5Uwt5M3QdQxH5f1wBIfl3F0=;
 b=h9+ENSZ8BNvS/4JbZojOs7T0qVptfQm+7qRcLYBwF9LMkjhp+YGMES+Sap4mnNKz5QxQsvFwZ
 CVAPgHBxDDKDwITIw7cZlo7BX7s9RIX/T+wVECyNu06j5YR9nYoqQkA
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 08:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246938

v2026.4 2026-09-09
  - Optimizer
    - Add pass to convert typed pointers to untyped pointers (`--convert-to-
      untyped`)
    - Support optimizing shaders using SPV_KHR_opacity_micromap across dead-code
      elimination and local passes
    - Add folding rule to dissolve OpCopyLogical of OpCompositeConstruct in
      simplification pass
    - Harden optimizer passes against ID overflow (#6851, #6852, #6857, #6858,
      #6863)
    - Filter duplicate decorations during module serialization to binary
    - Correctness fixes for vector constant folding size and OpSelect folding
      pre-SPIR-V 1.4 (#6798, #6827)
    - Stability fixes for IRContext analysis handling, debug info stripping, and
      eliminate dead functions (#6765, #6797, #6799)
  - Validator
    - Support and validate SPV_EXT_cooperative_matrix_maintenance1
    - Support and validate SPV_QCOM_image_processing3 and OpImageGatherQCOM
    - Add validation for NonSemantic.DebugPrintf extended instruction set
    - Validate OpAbortKHR explicit layout message type and require scalar
      packing (#6854, #6859)
    - Tighten relaxed block layout alignments and add explicit alignment VUIDs
      (#6819, #6853)
    - Validate Offset decoration on Input/Output storage classes and add VUID
      12509 (#6835, #6855)
    - Allow OpExtInstWithForwardRefsKHR in generic non-semantic instruction sets
    - Restrict Workgroup execution scope to OpGroupNonUniformRotateKHR for non-
      uniform group operations
    - Validate OpControlBarrierArriveEXT execution and memory scopes
    - Allow Generic pointer casts to and from CodeSectionINTEL storage class
    - Allow BFloat16 and FP8 result types in OpExtInst
    - Validate OpSourceContinued order following OpSource
    - Correctness fixes for >64-bit integer constant evaluation and
      AliasScopeINTELMask/NoAliasINTELMask operand counting (#6816, #6791,
      #6865)
    - Validate ArrayStride on OpConstantDataKHR result types
    - Add validation for UTFEncodedKHR decoration on array types
    - Validate that OpAbortKHR Message Type is a concrete type
  - Linker
    - Detect duplicate exported definitions without imports to prevent ODR
      violations
  - Assembler/Disassembler
    - Initialize parsed operand floating-point encoding to ensure deterministic
      disassembly of literal floats

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../spir/{spirv-tools_1.4.357.0.bb => spirv-tools_1.4.363.0.bb}      | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
index d9f6d2926788..a5b08684f0d4 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
@@ -7,9 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "9a49b0883b9b635689a85b5647dbfcb223268151"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.357;protocol=https;tag=vulkan-sdk-${PV} \
-"
+SRCREV = "ef96ed763b43b59b33b31b362f09a02b729fa1c9"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools

-- 
2.47.3


