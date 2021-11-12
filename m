Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D774EC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 04:57:04 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.11436.1636693024130620048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 20:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QdKtrq1s;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id np3so5756236pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 20:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LhgDPlVuEdyDXXUGv2BfKS/p/T3c6RrZhncbLjyCmbI=;
        b=QdKtrq1s3PvftLSjQ3jLH3C21frALleWsKD6jb868Qj0nM+JpjrTLjc1+BMTu1bC6W
         8LNY8VOoWbZc559IxPj6RGNvMe8eNX9ohG1E8g8tZzAJ+HpEhczOGQnF2e5zF8+PzXU3
         uwGYUDGl83cUY3vNzyoLmy2AV2vccTTUAkneCMd2viVM8FABu1aSvxQsejVESYZCrj3M
         LBIh6Ue/+syOCKJxzUtNyHDHfo5Ow99aegrQxo0GWUOqEN2APMwUqjO9kxrCfzrKe27G
         /QO3/LCvDBvkUHPsztm67Vq5CU9OLf1PAmEuy/0eI8Ysl0FGLLV8/AFjmjj3tCwRIzR3
         oQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LhgDPlVuEdyDXXUGv2BfKS/p/T3c6RrZhncbLjyCmbI=;
        b=7UcAnJyVT4Wsyns8tvbrc+JrNiZHaRspsLTDMDjv3oUzqZJttmTSb73VyTeEu+wlZr
         3bYqiSFwPHnYwJUHsBaRY6uW25RiQWo17WztZC9/XRoijZELXOvjURQjy4znyr0P4Sw8
         0XpO5oIYBZBugciOuowfNZZnYQKt2Pl9LRQYBmDNpqM0SerT11Vb4ftHhd9ccXXSJOmP
         tfpvs5PAbezXvaZFaWpaaHUePXGIdSveNqtvIkm7qYzbFLdfJEwa4nB3gQpt3B0sVsVQ
         K5xdR4hyWWmE6dILSATUqHo4o/jGuJGrb4pLemjKc/yX8iXgCvHD298uSRmpF5RErx9a
         l4dg==
X-Gm-Message-State: AOAM530uvOSuYnXyE8oancGj3Y6q7e5B/F676kCRGpGB6oidOv4v16CC
	/+9cBDdWvL/LE8W2ZDNnl3BRCukT9jQ=
X-Google-Smtp-Source: 
 ABdhPJyOhGk5O6rbWfJu0BwE4KLY24hVJGNEnQFqWpdtxaSIQMfTpUtUvLcHF115kXvunURODsjiOA==
X-Received: by 2002:a17:90a:bb12:: with SMTP id
 u18mr14496802pjr.44.1636693023113;
        Thu, 11 Nov 2021 20:57:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 e15sm4424831pfc.134.2021.11.11.20.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 20:57:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] vulkan-samples: Fix cmake errors about plain signature
Date: Thu, 11 Nov 2021 20:56:58 -0800
Message-Id: <20211112045658.1343768-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 04:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158207

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-mix-plain-and-keyword-target_link_l.patch | 38 +++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch
new file mode 100644
index 00000000000..66ed8bb47d3
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch
@@ -0,0 +1,38 @@
+From 64b806ab702a6f445fd84aca5f03bb85b86a66e3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 11 Nov 2021 18:37:09 -0800
+Subject: [PATCH] framework: do not mix plain and keyword
+ target_link_libraries() signatures
+
+Fixes
+| CMake Error at framework/CMakeLists.txt:461 (target_link_libraries):
+|   The plain signature for target_link_libraries has already been used with
+|   the target "framework".  All uses of target_link_libraries with a target                                            |   must be either all-keyword or all-plain.
+|
+|   The uses of the plain signature are here:
+|                                                                                                                       |    * framework/CMakeLists.txt:453 (target_link_libraries)
+|
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/395]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
+index 948c796..13d3324 100644
+--- a/framework/CMakeLists.txt
++++ b/framework/CMakeLists.txt
+@@ -450,7 +450,7 @@ target_link_libraries(${PROJECT_NAME} PUBLIC
+     plugins)
+ 
+ if(${NEED_LINK_ATOMIC})
+-    target_link_libraries(${PROJECT_NAME} atomic)
++    target_link_libraries(${PROJECT_NAME} PUBLIC atomic)
+ endif()
+ 
+ # Link platform specific libraries
+-- 
+2.33.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 613ed592c61..8a2f3d89b19 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
+           file://0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch \
            file://debugfix.patch \
            "
 
-- 
2.33.1


