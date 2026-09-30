Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC06CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 15:51:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16890.1790783485622192894
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 08:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YFkAAyzS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 637001A1072
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 15:51:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3866560749
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 15:51:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA7FF1032968B;
	Wed, 30 Sep 2026 17:51:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790783478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=uVb7DLKnSzrFEile/8o0ydlfUL7QLBmINLVDA1cMn74=;
	b=YFkAAyzS2jUezqGcylkLdyeCrMOMiwoBoN88EWuYRqUe84PWGGfOPFts3a/vWlGOzjlvxI
	DftknBDJY7sd//agFJKDD3u7PrPlpQyuZNdPp7kTpUJkKEYzJWL3NZnTJc/Ucw6/+Qh3Yf
	FHdFVKjZpMrK+RDVhC68oCVvuigulsMS9VYeyH7aEXRc0gdPnKzbnN902FGe+Bs/M5GYhN
	kxCjZXfmZ9hbQ3W0CIHDo4BhE3uVq4uYUQxbeP6VOoKyoaPp6jkBD/MwOsXMUDb+1FcZGT
	C0u0Wt7F4v3Nhr7prrmAB/uT9IwuSIhxIhlosfSUcxo/cfbo8r1lvvPzzW1MHQ==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Wed, 30 Sep 2026 17:51:03 +0200
Subject: [PATCH v2] spirv-tools: upgrade 1.4.357.0 -> 1.4.363.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-mathieu-upgrades-2026-02-29-v2-1-242276052d85@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOYvvWoC/42NSwqDQBAFryK9Toe2FT9Z5R7BhTqtNkRHZlQSx
 Ltn9ARZVj2ot4MXp+LhEe3gZFOvdgrAtwjaoZ56QTWBgYkzKhPCsV4GlRXXuXe1EY/ngsTIJWa
 G8rxIio7TFEJhdtLp56q/qsCD+sW673W2xaf9r7vFSBgTt0nRCKWmezbWLm+d7q0doTqO4wd58
 B5IyAAAAA==
X-Change-ID: 20260930-mathieu-upgrades-2026-02-29-6d077838f244
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790783477; l=5607;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=1mOs/00iRWEpj1Labs9A0qcx9DHoCsJjenF4h6teNXY=;
 b=GT1gCEoSZ3h3nKOCv34xm5b/KxG54c4QAZiwCnvqhY8mDQTTQhTj+CKav1ZfK9u+lENo0kSBn
 u15ongiHuEfA3FLsFEt4DmERLZ2urqTJDy0fXkyyFXTMcydE1D3BBNY
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 15:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246979

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
Changes in v2:
- Fix build on with g++ 12
- Link to v1: https://lore.kernel.org/r/20260930-mathieu-upgrades-2026-02-29-v1-0-102c38be04df@bootlin.com
---
 ...0001-CMakeLists-Do-not-use-fno-exceptions.patch | 30 ++++++++++++++++++++++
 ...tools_1.4.357.0.bb => spirv-tools_1.4.363.0.bb} |  7 ++---
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-CMakeLists-Do-not-use-fno-exceptions.patch b/meta/recipes-graphics/spir/spirv-tools/0001-CMakeLists-Do-not-use-fno-exceptions.patch
new file mode 100644
index 000000000000..1169a02646f0
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-tools/0001-CMakeLists-Do-not-use-fno-exceptions.patch
@@ -0,0 +1,30 @@
+From f11c932f15c91c3cb7579df8c8f9adf73a23f261 Mon Sep 17 00:00:00 2001
+From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+Date: Wed, 30 Sep 2026 11:21:27 +0000
+Subject: [PATCH] CMakeLists: Do not use -fno-exceptions
+
+Build is failing with g++ 12.2 (Debian 12) with -fno-exceptions. Build
+without it.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b69ec9fb54f8..e666cf51111a 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -188,7 +188,7 @@ function(spvtools_default_compile_options TARGET)
+   if (${COMPILER_IS_LIKE_GNU})
+     target_compile_options(${TARGET} PRIVATE
+       -Wall -Wextra -Wno-long-long -Wshadow -Wundef -Wconversion
+-      -Wno-sign-conversion -fno-exceptions)
++      -Wno-sign-conversion)
+ 
+     if(NOT ENABLE_RTTI)
+         add_compile_options(-fno-rtti)
+-- 
+2.39.5
+
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
similarity index 91%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
index d9f6d2926788..621b1cbc7f0a 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.357.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.363.0.bb
@@ -7,9 +7,10 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "9a49b0883b9b635689a85b5647dbfcb223268151"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=vulkan-sdk-1.4.357;protocol=https;tag=vulkan-sdk-${PV} \
-"
+SRCREV = "ef96ed763b43b59b33b31b362f09a02b729fa1c9"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV} \
+    file://0001-CMakeLists-Do-not-use-fno-exceptions.patch \
+    "
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools

---
base-commit: b2c42ac2a70fbbee2df1fbda2199643d5e5bb66d
change-id: 20260930-mathieu-upgrades-2026-02-29-6d077838f244

Best regards,
-- 
Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>


