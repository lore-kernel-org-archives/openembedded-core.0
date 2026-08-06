Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99154C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 05:14:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13246.1785993285888373646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 22:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rSipGnhq;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so10222695e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 22:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785993284; x=1786598084; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObnMI+V9pYt0fvHqyRraQ99couLZUlAezItNcpR/keM=;
        b=rSipGnhqaTw7A/LloXhROwPuPqFR9zzV549TLMSOVkmVqTN+ifsUY3b6RcB+acHlfe
         qlv+Fw3aULErN33E/ReoWSediqlUqN9SZBANyxteSAMRAmUm0brBz03lheKmKqyFYizD
         4siYiI6oymWopeC3cBTb4rDaalweI2X1Gevg371pVsRGxun2R0MwNUIXViT97KPCMXKS
         GtxoQ5e2DAmSGCDsfeFjv5vCL8UxVmZEZymJs8x7dYUs123DrsIV0N6H1XQCNKpIFh4b
         9glxWrdXr1Ms0TKrHaM8YlarsHeTtPZwgawoKSnoGFu4FqgKeID4M7gcgjvy9ywWNCZK
         dAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785993284; x=1786598084;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ObnMI+V9pYt0fvHqyRraQ99couLZUlAezItNcpR/keM=;
        b=goAmCbDK8G5rtnK+sc6YBYJb2p0o1c7Zkxonrxux+Qbg+Ve2kdyEbojT5rTrfNdJsk
         uMEL4Lh5IiCp0IdtRQyP3XTobjCn/gpmdAzTJ/blCSfzt6aoRIQYCJHB+QZa5tDhICjn
         BvYEvnoYSJns0GlYPIel31VSIyUv+98yDfQ8jHgmtvA9+vRV3mLBCtdaNFETp/TpzCQW
         fU1Qivh2hCT4JNZ53wpAIipGvQVmDlghIzOY3yhYrE/hVqfKVyqr4N8HC0E+akNcHVgV
         3QlqsYzi/DdqXJQgiA4UK9rzb5nEZJ146KaCGc0q18/Xgac8dbCucAzApU24JZ3eA1rP
         V8cA==
X-Gm-Message-State: AOJu0Yx6nt7M+ffbCGrmCxmRz9sL+qZ/FmStuhURZYjXxFxHtlJ6YuBB
	AZUvKSoAmMxoNLl5n3T/O//aBwdIhAePswfxEHExDmy5y5M+0ed+IcW9zcX0Rw==
X-Gm-Gg: AR+sD131NgZqz/7vUp75tcBuDGAg7LN5R/BKHggGFknRPGPCKH2S9kB1G0lsptm5hRK
	+bcUUwHEI1eiAGlyOWa3mQey09fVIRKtsImd9qhThT07bEU+sdTD8HoXeEyJZKUIC+kuWRMPqnC
	XGr9WPZ5TnoVk4XMuq5oU6xUDxmgGzeuljQSjpUw/Q/cVNdohxadlOaBOtjHuhfLaOknsO9U/WB
	JoHHoSfY0RXovDs61CkeIIfJTqZHkyHsXktb9w/WhY6gePDq8wVKQwhluHNjnm22NGKrzb9Y4kB
	W/p70IGsihN8BV0l+c44hMCTOCokGJdE6RbuR2kLVsCT5k+UUJV3/JHD7GhLI8JsUgI0obFpJQO
	3IzbOW1nMWjpkQXk6/XIQZnknBbhw4+Rjc/CSElwEYDhfVCP0M0wny/Wy21eXJ/dwTdvY6LuY4y
	9EazJcYv/sTCzNsgJBMZ7lbMes0KHQzsViA7QjXXLm8bFh6Vx/+w==
X-Received: by 2002:a7b:cd19:0:b0:495:4bf3:2150 with SMTP id 5b1f17b1804b1-4994e7af664mr124280475e9.8.1785993283986;
        Wed, 05 Aug 2026 22:14:43 -0700 (PDT)
Received: from term011.lan (95C81D0F.dsl.pool.telekom.hu. [149.200.29.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499542183b2sm35765355e9.4.2026.08.05.22.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 22:14:43 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 1/3] mesa: Upgrade to 26.2.0
Date: Thu,  6 Aug 2026 07:14:35 +0200
Message-ID: <20260806051437.276400-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 05:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242896

Release notes:
https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.html

Removed upstream 0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
Adapted 0001-freedreno-don-t-encode-build-path-into-binaries.patch

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...on-t-encode-build-path-into-binaries.patch | 17 +++++++-----
 ...livm-Fix-armhf-build-against-LLVM-22.patch | 27 -------------------
 meta/recipes-graphics/mesa/mesa.inc           |  5 ++--
 3 files changed, 13 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 9aa598b2cf..a5e6570af8 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 266f7047df67d500223b66f7eb9d8779be4f4ad1 Mon Sep 17 00:00:00 2001
+From 1ae1feb55885c8ec26ed2ef148fa75c6240d9804 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index e8f01b8..8144a75 100644
+index e8f01b880bc..8144a75bd1c 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
@@ -42,13 +42,18 @@ index e8f01b8..8144a75 100644
  dep_libarchive = dependency('libarchive', allow_fallback: true, required: false, disabler : true)
  dep_libxml2 = dependency('libxml-2.0', allow_fallback: true, required: false)
 diff --git a/src/freedreno/registers/meson.build b/src/freedreno/registers/meson.build
-index f4be681..cd0caaf 100644
+index 9318ce48fe5..8d2b305d202 100644
 --- a/src/freedreno/registers/meson.build
 +++ b/src/freedreno/registers/meson.build
-@@ -43,4 +43,6 @@ if install_fd_decode_tools
-   endforeach
- endif
+@@ -16,6 +16,8 @@ freedreno_copyright = files(copyright_file)
+ 
+ freedreno_xml_header_files = []
  
 +devenv.set('RNN_PATH', meson.current_source_dir())
 +
  subdir('adreno')
+ 
+ foreach f : xml_adreno_files
+-- 
+2.55.0
+
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
deleted file mode 100644
index 32fac20d94..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8db6e909c3a540d31a73b79a0792e927cc2c6e83 Mon Sep 17 00:00:00 2001
-From: Alessandro Astone <ales.astone@gmail.com>
-Date: Sun, 1 Mar 2026 18:14:09 +0100
-Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
-
-StringMapIterator<bool> became StringMapIterBase<bool, false /* IsConst */>;
-Use `auto` to handle either case.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40161]
-Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_misc.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index ce8ca02..86779f0 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-@@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
-       llvm::sys::getHostCPUFeatures(features);
-    #endif
- 
--   for (llvm::StringMapIterator<bool> f = features.begin();
-+   for (auto f = features.begin();
-         f != features.end();
-         ++f) {
-       MAttrs.push_back(((*f).second ? "+" : "-") + (*f).first().str());
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index cbf67e50ce..a50b900cf2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,14 +17,13 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-           file://0001-gallivm-Fix-armhf-build-against-LLVM-22.patch \
            file://0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch \
            file://0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            "
 
-SRC_URI[sha256sum] = "5296b88a0f1e012e2cb9ada150a2bbadf728ca81e5a4fb2ab43c83a4d2158606"
-PV = "26.1.6"
+SRC_URI[sha256sum] = "efd4bb08cdb7c365a812cd4e6c9202ab55b2f22cdcd13c7d6c4f9647b799a4ef"
+PV = "26.2.0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.55.0


