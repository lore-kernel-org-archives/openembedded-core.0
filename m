Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74830FF8848
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:02 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32589.1777064218459784528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bTewcylc;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4890098abbaso62801735e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064217; x=1777669017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJ+2O2k7R+WGg5SQTfm3fxamEWye8YXTPKuIKYGBXBI=;
        b=bTewcylcp7XkvcEbJ/EYOp3sM87MzQlJL3R4ZSRCVUaYXIbexTPdaeyqJjQDUWMtJ6
         D5UoqZ+xumCMvVWo/jLsfcXovVzdZO2wz7Yjm9h6p/7BO/qPetOWfC9Au8YllPrZEI7u
         KUIFBulEQM7u9MLqqRzazZM+da46Col9vshEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064217; x=1777669017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJ+2O2k7R+WGg5SQTfm3fxamEWye8YXTPKuIKYGBXBI=;
        b=PQcZUfJJzzJPG8bLzPCMGpPs/mIElaA5GNIoFS/JhFDhkGzWNyvuK18023kZmCepUZ
         GR9p1cTimUpsNoFuLooQic0zlnKxsowg/o8eooL701YDRGSVnpvhB0E210RyyVhFYiQL
         UTpYHTkatMbq9R2hQR63TQjLONa0EkSNAWN8Ekv3x6cZjpIWwqeMZP4g+sVYOumrUjUs
         zFmezmUf2c5hIjSQqXC+M9xyQNCCIbxtPi62eERTxVWMfxzJDOM1f129AVMaUCTpPG0t
         GdXQaY7GHwM1uSJJDprdMctgp+hZPhhhcooYBVVClngkPfVXvbGOYkKA6eH2LAPWZfr9
         mnag==
X-Gm-Message-State: AOJu0YyxG9M5YzhK/4qCzFR4dTbzwE++0kHhQ8PyRODMM+NraF5dWOFE
	NRvJK9sfmkLIrJMqV5BFyYdK3DmOsZYQTbenGvJfp1BTwaOzSLNOsK4H/Pnof5wFoWtQ43zmBSi
	e+ZKsYzf2Ugl7
X-Gm-Gg: AeBDievvZLsYtNjDGP6+hIxBCS1uwAOa9L2D3Hs6OwgV7jCUiKXMSBU4iL1GPJHhZ1T
	yq7qSzQF46YKK/Y8BUw/t2CyXqVLvkMDHoRfyN7SqHiTr3nu5XFq0+Q5mu8fB+Y3jVSN+sfkHyF
	aAhSzIwYGcUjjoq3ahRF2yOdtvZkI9B12xWFmw9QC1mkVm/PlZlEjRqotRP9eGCYWClGxaoc7Wp
	zZmy5NOzS9+m1psQzFCyPq1j4S6Vd0DnEYtrG+d3RLO0E8JCT/N4drxlanXhCpsJaIp0FYGltaP
	++4X71HwFBZQuBk0P1yRnUngwYVl7F8LLuT74AJDuOjSvGfaMV1uDlU4dZRomPlFppeDaV992Mt
	2U4T/NqD6gJ/f6+5hxV7p9i0rgb/mDpobNsiGJ78tttImRYKwgBXGUb44bZhKB7LT5+80+FPP3h
	dxPt0y0UCgLQb3FLpLvMSH1Kk4ewnYbXYdZNjfZ766Z+dtt57XFJb9GDgRvb83EvKqd54qpkdU7
	kuakQM4qHx1qm/49sfXYKbK+ZltEJMBafZ/Dg==
X-Received: by 2002:a05:600c:4fd1:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488fb78ede0mr477784435e9.29.1777064216584;
        Fri, 24 Apr 2026 13:56:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.56.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:56:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 35/66] spirv-tools: backport a fix for building with gcc-16
Date: Fri, 24 Apr 2026 22:55:34 +0200
Message-ID: <7df9bc5569cf5942bca56e86db5fa92b41a32a1b.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235908

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
https://errors.yoctoproject.org/Errors/Details/905195/
when building on host with gcc-16

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b4801e63d1284f3fa5006f0e24f560130c2a0a4c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch | 50 +++++++++++++++++++
 .../spir/spirv-tools_1.3.275.0.bb             |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch b/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
new file mode 100644
index 00000000000..ce58b6b8c0f
--- /dev/null
+++ b/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
@@ -0,0 +1,50 @@
+From aab5c96b7eb237b8bcd15e28f8aff068842db4b7 Mon Sep 17 00:00:00 2001
+From: David Neto <dneto@google.com>
+Date: Tue, 3 Mar 2026 12:11:47 -0500
+Subject: [PATCH] opt: Fix build issue with gcc 16  (replaeces PR #6542)
+ (#6567)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Compiling with gcc 16 throws this error:
+
+FAILED: [code=1]
+source/opt/CMakeFiles/SPIRV-Tools-opt.dir/decoration_manager.cpp.o
+    source/opt/decoration_manager.cpp: In member function
+‘spvtools::opt::analysis::DecorationManager::CloneDecorations(unsigned
+int, unsigned int)’:
+    source/opt/decoration_manager.cpp:546:27: error:
+‘MEM[(unsigned int &)&op + 24]’ may be used uninitialized
+[-Werror=maybe-uninitialized]
+
+546 | if (op.words[0] == from) { // add new pair of operands: (to,
+literal)
+    source/opt/decoration_manager.cpp:545:19: note: ‘op’ declared here
+      545 |           Operand op = inst->GetOperand(i);
+          |                   ^~
+    cc1plus: all warnings being treated as errors
+
+Make sure that the vector is not empty before using it.
+
+Co-authored-by: José Expósito <jose.exposito89@gmail.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [c28f5937bce369dde1d645299a8c9873da43dc72]
+---
+ source/opt/decoration_manager.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/source/opt/decoration_manager.cpp b/source/opt/decoration_manager.cpp
+index 3e95dbc35..bee7d9482 100644
+--- a/source/opt/decoration_manager.cpp
++++ b/source/opt/decoration_manager.cpp
+@@ -543,7 +543,8 @@ void DecorationManager::CloneDecorations(uint32_t from, uint32_t to) {
+         const uint32_t num_operands = inst->NumOperands();
+         for (uint32_t i = 1; i < num_operands; i += 2) {
+           Operand op = inst->GetOperand(i);
+-          if (op.words[0] == from) {  // add new pair of operands: (to, literal)
++          if (!op.words.empty() &&
++              op.words[0] == from) {  // add new pair of operands: (to, literal)
+             inst->AddOperand(
+                 Operand(spv_operand_type_t::SPV_OPERAND_TYPE_ID, {to}));
+             op = inst->GetOperand(i + 1);
diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
index 05c6de1b500..027fa4f9c99 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.3.275.0.bb
@@ -8,7 +8,9 @@ LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "f0cc85efdbbe3a46eae90e0f915dc1509836d0fc"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
+    file://0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch \
+"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools

