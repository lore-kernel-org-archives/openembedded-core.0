Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705E1C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 16:07:56 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.137.1711728469716725418
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 09:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=msy7Z8l3;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso2005637b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 09:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711728469; x=1712333269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nEDJp35/YOKYAhSSsZx3+tVzeiQfuBihqRqVHMSKBqg=;
        b=msy7Z8l3iimZJF8bb4mq9y/FF6OeC4e7CwX1aVKPMtf6+aBRPveH/wYjEekWa5Ca4K
         8pjBWRrIti1zDkwlPpms6fGdG8lvtv6VMF/lKsKqPf73i09jjUpkAFxnFnbmvhZYaEAc
         xd/Hts457l/mrbZVLKU4m2ISugdsHnVeNXsD2K+A1mHNqJjfo50lP4r04VSotea3FFVW
         0R0lOvSyJIDI+k9Co6mIpKv8lE0A7CTU/aGs7XeppvV5cTZsDOt25xp+lRSvXTDBTx/U
         xpQZJBNJGkptiJMgmEbzxmio2aR8yHe5fji2nA0b/Tjh9NMCs0b7LNE0eJ0qLPwkB746
         8etw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711728469; x=1712333269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEDJp35/YOKYAhSSsZx3+tVzeiQfuBihqRqVHMSKBqg=;
        b=MUia46O9YBvr3ktC6qHdU7R9YAEwX6u/OtBHKYL4Yvm8i1aKfOKtDLglTayp93zV2N
         C9hAe29a8ubPxB7yUQjMi3vOzT8jQ3JiZkJcZso97mvARQ+qCIFMQfps1ZYiiOx94+A9
         z08QKAxQRbB6U6M+P+OQ9nACq/X5MO/KCNqYird7xWW3tgFH0Mo0wtPODKxIoq7Cyn1u
         UKr36qRABL6DDkc3l8Xj/S6V2UILNZmk6FeLChsD2AfrTlmI84BE2P8pE63P6SvNeYn6
         v3PoIDe5orViO7RSeYp24YARdCsd2IL2gF0RD4LrvdxU6B+4xn3byJfGqfbojQAI7Qby
         Np5Q==
X-Gm-Message-State: AOJu0YwAFT4ycoicSPWVKe+TiMl1350VQBw4haZupieh6NPRvsQlSHX4
	n5HDS4ysKM5vuAP2qmA+H+Il24QM44R6DwhACmTNlg9Q9k293wxkB7VSEVhc
X-Google-Smtp-Source: AGHT+IFh7TphGrtCs0NrOLXMV1DvR9PROfCIwpvzE581p/OuN83+l1Te7pHT0pTn8Pw6bOHs7/w5fw==
X-Received: by 2002:a05:6a21:7898:b0:1a1:6803:69a3 with SMTP id bf24-20020a056a21789800b001a1680369a3mr2805200pzc.0.1711728468688;
        Fri, 29 Mar 2024 09:07:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::dfbb])
        by smtp.gmail.com with ESMTPSA id x1-20020a17090ab00100b0029de90f4d44sm5370541pjq.9.2024.03.29.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 09:07:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mesa: Drop LLVM-17 patch
Date: Fri, 29 Mar 2024 09:07:46 -0700
Message-ID: <20240329160746.1787388-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 16:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197639

This patch is no longer needed with llvm/clang 18+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-gallium-Fix-build-with-llvm-17.patch | 40 -------------------
 meta/recipes-graphics/mesa/mesa.inc           |  1 -
 2 files changed, 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch b/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
deleted file mode 100644
index ceb0153f8d3..00000000000
--- a/meta/recipes-graphics/mesa/files/0001-gallium-Fix-build-with-llvm-17.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 3e1e5c475b52651657c906e6b03ee13567cccdd7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 23 Jun 2023 01:20:38 -0700
-Subject: [PATCH] gallium: Fix build with llvm 17
-
-These headers are not available for C files in llvm 17+
-and they seem to be not needed to compile after all with llvm 17
-so add conditions to exclude them for llvm >= 17
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23827]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/gallium/auxiliary/gallivm/lp_bld_init.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/gallium/auxiliary/gallivm/lp_bld_init.c b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-index cd2108f..b1a4d03 100644
---- a/src/gallium/auxiliary/gallivm/lp_bld_init.c
-+++ b/src/gallium/auxiliary/gallivm/lp_bld_init.c
-@@ -46,15 +46,19 @@
- #if GALLIVM_USE_NEW_PASS == 1
- #include <llvm-c/Transforms/PassBuilder.h>
- #elif GALLIVM_HAVE_CORO == 1
-+#if LLVM_VERSION_MAJOR < 17
- #include <llvm-c/Transforms/Scalar.h>
--#if LLVM_VERSION_MAJOR >= 7
-+#endif
-+#if LLVM_VERSION_MAJOR >= 7 && LLVM_VERSION_MAJOR < 17
- #include <llvm-c/Transforms/Utils.h>
- #endif
- #if LLVM_VERSION_MAJOR <= 8 && (DETECT_ARCH_AARCH64 || DETECT_ARCH_ARM || DETECT_ARCH_S390 || DETECT_ARCH_MIPS64)
- #include <llvm-c/Transforms/IPO.h>
- #endif
-+#if LLVM_VERSION_MAJOR < 17
- #include <llvm-c/Transforms/Coroutines.h>
- #endif
-+#endif
- 
- unsigned gallivm_perf = 0;
- 
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a8088e6fb6a..6e961900845 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,7 +17,6 @@ PE = "2"
 SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-gallium-Fix-build-with-llvm-17.patch \
            file://0001-drisw-fix-build-without-dri3.patch \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
-- 
2.44.0


