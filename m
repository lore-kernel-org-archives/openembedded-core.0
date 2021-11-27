Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC6FC433EF
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.34454.1638006852067843251
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BkhEbqlV;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so3542466wmi.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZThXnTALsmzt+Mxsrl1B+3Ag1I4DlN3dyKYkLBZ7vd8=;
        b=BkhEbqlVTTl/bay+ZAZd2dCKVH/j3C9BQmP2v+JQClI1gJvjGSVhvLcdRz0PvYAR9F
         McT/ZQbwcaQhUmPIwa/u/gCTggnnxVPvbA1JMp2/e5wHgRSJcSFopQBC7C3LtvFn+alw
         5w6nwqHFiXQE6i3YTBm30Jgapr60ZSrdKwpDtETUF0w/8iR1zhEkNa70xrALbhOqaSJP
         K4LzuOhvpXE81gCAxthnz469U/jvcN9nL8YGZt5xpfG/HL5dlt+CokPH0jVbPjxQG9XZ
         Oo5MiewH+2SoZGGQF7a3EI9g/EMmba8YqfoEpPmvc07FZ+tsUGDu2B3Rsm8G5gHHyirC
         eWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZThXnTALsmzt+Mxsrl1B+3Ag1I4DlN3dyKYkLBZ7vd8=;
        b=bBLz7e3dhfhePIlmaayCY+j+LbSy/H7Iw2/Y3+/D6PDd9/wiLqCuo3/9cdhlrt+RHX
         vkhp+BjDRwx9UZ6n2VwkK9No3WWir1lrHICSCpTaPM13mcb1OCJyF6dhv4j9fpwkRWst
         L0Ct1bc+ev4F07RpENJBGw+3wjaNLxzIrdziah62v5yxKQHCa2kDvasdX5rU3f8YcTMr
         S5aJU1ZyNrNqAZLTUf054OKp+8C5eBEahdDQwpilhh1xC6R2CZT8Ei9/OVzqAc55M8Y+
         vMBXEpq98A2PXDjCsmHbo7U0HXLmvORS34JRq1AgJT19BHNOQQjB7BiQkYBJrum8ILLE
         ShTQ==
X-Gm-Message-State: AOAM530ZbcaPZnFMjxtLsHgK/VRz5QMImuQSX6c3Om0GMmaucEFAShIr
	zU+JSNvZ/BO5UJyYrICWyTSUagWvkcwgSg==
X-Google-Smtp-Source: 
 ABdhPJxoZcrtGLw+Qo1gzbhLAsBGtvc+GXNUL04zENCVG/KRLP8CzZY98D17vW6VZiXzOlEzkV3R1w==
X-Received: by 2002:a1c:a592:: with SMTP id
 o140mr21638206wme.10.1638006850379;
        Sat, 27 Nov 2021 01:54:10 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/13] libcomps: remove unneeded patch
Date: Sat, 27 Nov 2021 10:53:48 +0100
Message-Id: <20211127095357.1748429-4-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158853

Somewhere along the way the issue was fixed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Add-crc32.c-to-sources-list.patch    | 50 -------------------
 .../libcomps/libcomps_0.1.18.bb               |  1 -
 2 files changed, 51 deletions(-)
 delete mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
deleted file mode 100644
index 76fce19767..0000000000
--- a/meta/recipes-devtools/libcomps/libcomps/0001-Add-crc32.c-to-sources-list.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 72065bb2b5881dc224299f302379391aebdfca3d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 21 Nov 2018 13:09:05 +0100
-Subject: [PATCH 1/2] Add crc32.c to sources list
-
-Otherwise, there is a missing symbol runtime error under musl C library.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libcomps/src/python/src/CMakeLists.txt | 4 ++--
- libcomps/src/python/src/crc32.c        | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/libcomps/src/python/src/CMakeLists.txt b/libcomps/src/python/src/CMakeLists.txt
-index 89b9c91..08cd6b5 100644
---- a/libcomps/src/python/src/CMakeLists.txt
-+++ b/libcomps/src/python/src/CMakeLists.txt
-@@ -9,13 +9,13 @@ set (pycomps_SRCDIR ${CMAKE_CURRENT_SOURCE_DIR})
- set (pycomps_SRC pycomps.c pycomps_sequence.c
-      pycomps_envs.c pycomps_categories.c pycomps_groups.c
-      pycomps_gids.c pycomps_utils.c pycomps_dict.c pycomps_mdict.c
--     pycomps_hash.c pycomps_exc.c pycomps_lbw.c)
-+     pycomps_hash.c pycomps_exc.c pycomps_lbw.c crc32.c)
- 
- set (pycomps_HEADERS pycomps_macros.h pycomps_sequence.h
-      pycomps_envs.h pycomps_categories.h pycomps_groups.h
-      pycomps_gids.h pycomps_utils.h pycomps_dict.h pycomps_mdict.h
-      pycomps_hash.h pycomps_exc.h pycomps_lbw.h
--     pycomps_types.h)
-+     pycomps_types.h crc32.h)
- 
- #set(TEST_FILES ../__init__.py __test.py test_merge_comps.py test_libcomps.py
- #               utest.py)
-diff --git a/libcomps/src/python/src/crc32.c b/libcomps/src/python/src/crc32.c
-index d8f5e34..f266067 100644
---- a/libcomps/src/python/src/crc32.c
-+++ b/libcomps/src/python/src/crc32.c
-@@ -41,7 +41,7 @@
-  */
- 
- #include <sys/param.h>
--#include <sys/systm.h>
-+#include <stdint.h>
- 
- static uint32_t crc32_tab[] = {
- 	0x00000000, 0x77073096, 0xee0e612c, 0x990951ba, 0x076dc419, 0x706af48f,
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
index 3fd4d5b83d..ff6ecc7601 100644
--- a/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.18.bb
@@ -5,7 +5,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git;branch=master;protocol=https \
-           file://0001-Add-crc32.c-to-sources-list.patch \
            file://0002-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-- 
2.20.1


