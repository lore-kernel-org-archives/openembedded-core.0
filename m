Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9D7C54ED0
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 19:02:01 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.31598.1747940520989815173
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 12:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZkBZ98q;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af59c920d32so5143935a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747940520; x=1748545320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEBdthyY63iNudy8rTXwNWcOtdDQE3CaBMRZ96eePg0=;
        b=lZkBZ98qR8MjUplstmoOkcoBvHgED4daydkryAyQxqVfTjREGZq2CC+mxWcN0rIZWo
         SXG2206SSIvV0nup9rzW2hkXcpEbwNSCs2+s1MKmYP3mS1HbU2gGcgdwsnDvGqQuCoXC
         2X/ghvjsZ4XXbthLmIjnIeNrKo4yH5yHI/3aBMtiuH2hTiLR+yuQLsHpU8xmt1bZtGCx
         NzakJmDW72QgBOrG4ToibC4k9WZMZ779JGxbB8xMNZyHS2ZPzk4B/e1s20+Cev8sbbUk
         gRkWe2lvzvqZEqoT3u6IuAJSwEHtGJ1EE1cU1JcuVbizwo74pOv609aExnkL/igyKBrS
         BMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940520; x=1748545320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEBdthyY63iNudy8rTXwNWcOtdDQE3CaBMRZ96eePg0=;
        b=MhMV06N3H2maMPlulfWjpTLcaodmlmTibwINu8KRq0DeEDTSteWE00ggat8chJ4ufh
         eY+xjZG+/boyDFRyROFqnVimsPaj6CNKePzFr6/CtSgy077ynF2/l1kr1C/3nqSRugxD
         munZnXs+4LQmOpVph7OAHjV6Hww6DiwGgOs7/ngt5YFwaoB3TmrAQT44io2Lvu1JURXn
         eN0CGiMU4nNn0VVwQq+iVEGOY5YV4NCOlFJTnpJhpdQ/+LsLGsAEqeRAaD/gWUnBxYUP
         X2K6h/pu9lk18Ys08vVw2N0pcpaLasmeWD+68TIg+QNIRSzpFhbzFxdIBgeJv3GuXtxA
         KFKw==
X-Gm-Message-State: AOJu0Ywe/xSiq3l/nAOjZ6LahTQM2MbuBB/1K5LnKtw7lJKfOkVYO6h+
	jrT6JFupi8DhN60blJTMEKp5qfaVB2JFf1PxAeHmsHLdqCY3+LLi+0V1a/znAfrR
X-Gm-Gg: ASbGncv3wdZvLS3IDpEfHJxfN5IY1hWs5QqDm65D7ltP8Itr0Q6BixBxed01WzcPWFD
	NSoTwEboOncZ26jrcmHLTpW9yGkRRkENWNMuWw6dGQwJHek9TYWxcKbBOZAEKTx1un3OZGWB1BL
	z0Q35ou7EKnIJ1uHOY46AllgWtRLNMRLAqNX0KckpVVGRVqyMeDIl3XGJY+jGR2PIeOX9nSGen8
	AbZjwmlQ5OHGjgJznIdIResSJLungOL969F3Md8/ezF4qJxhYGl57eIqcqX87TUY+HHpZLcqktz
	oR7b+UAtJPf2TuqxDSUXdr223oGPFxOjAc6tZuJkXAk=
X-Google-Smtp-Source: AGHT+IFr5PSTBkvUKW9eube/c/TFr/Q3SqZaxU1ca0H73PPG9RR1kuOhSYuz66FVN+ADu+PhTYufVw==
X-Received: by 2002:a17:902:ef4e:b0:220:d257:cdbd with SMTP id d9443c01a7336-233f261075dmr1444155ad.48.1747940520018;
        Thu, 22 May 2025 12:02:00 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adbfcbsm112238895ad.75.2025.05.22.12.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:01:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vulkan-samples: Upgrade to latest tip of trunk
Date: Thu, 22 May 2025 12:01:56 -0700
Message-ID: <20250522190156.731992-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250522190156.731992-1-raj.khem@gmail.com>
References: <20250522190156.731992-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 19:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217147

Drop backports available in latest sources

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-framework-Include-stdint.h.patch     | 26 ----------------
 ...bal_options.cmake-removed-unused-ROO.patch | 30 -------------------
 .../vulkan/vulkan-samples_git.bb              |  4 +--
 3 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
deleted file mode 100644
index b30b0e0017f..00000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-Include-stdint.h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 9a187d2f54d3683636b951a10c165d949b3a1d18 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 23 Mar 2025 20:09:35 -0700
-Subject: [PATCH] framework: Include stdint.h
-
-Needed for uint32_t used in this header
-GCC 15 gets upset about it.
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/1314]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- framework/platform/configuration.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/framework/platform/configuration.h b/framework/platform/configuration.h
-index f6a9cae..c15f76f 100644
---- a/framework/platform/configuration.h
-+++ b/framework/platform/configuration.h
-@@ -18,6 +18,7 @@
- #pragma once
- 
- #include <algorithm>
-+#include <cstdint>
- #include <map>
- #include <memory>
- #include <string>
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch
deleted file mode 100644
index ffac2d78ce6..00000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From da4ef211810bc3b0c51ea89f02c031a170fe0cb8 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 1 Apr 2025 18:53:34 +0200
-Subject: [PATCH] bldsys/cmake/global_options.cmake: removed unused
- ROOT_PATH_SIZE define
-
-After various refactorings it is no longer used anywhere (and
-is problematic for build reproducibility, as build path sizes can
-differ between build hosts).
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/1325]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- bldsys/cmake/global_options.cmake | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/bldsys/cmake/global_options.cmake b/bldsys/cmake/global_options.cmake
-index 96c7add..67a6c5e 100644
---- a/bldsys/cmake/global_options.cmake
-+++ b/bldsys/cmake/global_options.cmake
-@@ -126,9 +126,6 @@ set(CMAKE_CXX_STANDARD 17)
- set(CMAKE_DISABLE_SOURCE_CHANGES ON)
- set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
- 
--string(LENGTH "${CMAKE_SOURCE_DIR}/" ROOT_PATH_SIZE)
--add_definitions(-DROOT_PATH_SIZE=${ROOT_PATH_SIZE})
--
- set(CMAKE_C_FLAGS_DEBUG   "-DDEBUG=0 ${CMAKE_C_FLAGS_DEBUG}")
- set(CMAKE_CXX_FLAGS_DEBUG "-DDEBUG=0 ${CMAKE_CXX_FLAGS_DEBUG}")
- 
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 505b6ab2f28..1caff12a5b9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,12 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
            file://0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch;patchdir=third_party/glslang \
-           file://0001-framework-Include-stdint.h.patch \
-           file://0003-bldsys-cmake-global_options.cmake-removed-unused-ROO.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "8547ce1022a19870d3e49075b5b08ca2d11c8773"
+SRCREV = "eca122602a5d7a9f63686411dcef1b62feb36a9a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"

