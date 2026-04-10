Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AC6F459E9
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 14:55:36 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158481.1775832926524826494
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 07:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pPiQFcuR;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488d2079582so18524155e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 07:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775832925; x=1776437725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FOrSscKKBqy3PzWB4FqJE1yN1z4M2vzm99tnD7e5CwQ=;
        b=pPiQFcuRNMPN/8WYyQrTEADylZ21a8RIj/ujM0yLXTiK/lL7kPP+e5FCyVveCyQjWP
         4V8f6500H96z0Q0TR1uW9OXwciTsU/HFWA82nj8DJna72XORKUusVWWo45FEvb9xNcHU
         2vlZlC4kbP3yvc1LqiYgYL/JgMDO43zB/yx7ZcraDh0zv7K+DjFWVJtev1BKwjPiLxJz
         eT0VcNp255g1gK5JgeztaGt2V7h1Ql2tjoH+Y4gRKPt1BzsW5Evsjke2SgBFdT6/EEdC
         0tuPNRhoQ+8yb3Q7xe2eWAzEYGN9fDjZxinSfcvrBZOlzgMZmacbwS/ven212GKV3X8N
         SbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775832925; x=1776437725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOrSscKKBqy3PzWB4FqJE1yN1z4M2vzm99tnD7e5CwQ=;
        b=R8jjdYQTvZIj+SNt0OI74NNE0faZKyFguE3gKT+Vb/RSYRzULa1ziLHjqyaVl2DOcZ
         1dR4Bl9cNyUdiZv8IXsxG7sjndiBq5I90YEdA/+rYWXmnss5bG5HXram/a4brotYrd6c
         KneTvgS65PlaoO9VTCQQU40JwkANpa6H7gIXvjm/wiaJrL35v/J1j46TWqKBJj3eA+1Y
         h5hty5qIHPZSJvABAEu/0zK4YbuTIgFiD6RleYJsXBpgpty/WKp2k/6iqrt+AerkhtF/
         vuu3368D1tNMede+dJLGL1AUHMdCyJy6bvVqGG6xrBUFr9Jzjsvc5GaNl2DDtXIFTMFl
         Wbqg==
X-Gm-Message-State: AOJu0YylZbIi2SMFn8J41r/neg9rAQYBK2sups+cKlv6OwdrrkmkO0mg
	c8DLyElLHWOMnamzFE87x+9OiwhzGTe7FSKkdQxcIA0+mq5xWP7sVqMNhkawIQ==
X-Gm-Gg: AeBDietWj5IvwCCZSnZSkT3NtCfvXNj2wZsVVYioWM2Osu9YFH+X96R+OJCIcAzesZS
	Ow6gnZVQ2uCA18v1yjmPMoUrSLgP0gB8r+riYVBYTCVPqrN4du4+X1ZGpueUDOEYTw/GbEk2Rdo
	4sN37YOoMFfYHjkOXKz8kPd7Hfl/SUC5npd9hoCjT2aO7LE/VSpjTu9NMf1TdY6hhkomaGlCqjy
	GWwAepJjI6w0QeoJxdADUMmjYaF1R7w/y44MPWYVTxDSdjXlBNDMZzXXDbM78apYFYOa1j5EMkv
	JgDADgyVRgRuwzpP9Jfs3eZWLkYAxW2PHn26uI6frtCjQj3OviW9KCAbiPXtN6FoXGObfs8rLL8
	CYnqxlg+OXAQlflEZznZTZQpSPJzK1wMO4DLZevlD63NBaDG61D+dFQfHsHTF7H0oOuG30msowz
	FWFRUNYBS6jf9xIgVSQyjEb9hxR4/D3dVVq3V6vDbD12bW/BMmgR0+FcJtViUSnRKAN6K3QWsnU
	cSmraqm29bBE33h9KNm
X-Received: by 2002:a05:600c:608e:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488d688a11amr45494685e9.29.1775832924711;
        Fri, 10 Apr 2026 07:55:24 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5888acbsm93461125e9.1.2026.04.10.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 07:55:24 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] spirv-tools: backport a fix for building with gcc-16
Date: Fri, 10 Apr 2026 16:55:16 +0200
Message-ID: <20260410145519.137698-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 14:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235037

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
https://errors.yoctoproject.org/Errors/Details/905195/
when building on host with gcc-16

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...sue-with-gcc-16-replaeces-PR-6542-65.patch | 50 +++++++++++++++++++
 .../spir/spirv-tools_1.3.275.0.bb             |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch

diff --git a/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch b/meta/recipes-graphics/spir/spirv-tools/0001-opt-Fix-build-issue-with-gcc-16-replaeces-PR-6542-65.patch
new file mode 100644
index 0000000000..ce58b6b8c0
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
index 05c6de1b50..027fa4f9c9 100644
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

