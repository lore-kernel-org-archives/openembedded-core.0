Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1784C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.1765.1645114199335473749
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LZbPGBmL;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a23so8465301eju.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqja7knxat7yvzRWE+cY0fxFxazOgSpdwNIx5WY0UnY=;
        b=LZbPGBmLFkJhRm+KV7M8J/mJXEv+rHjJwO8GWFzNLTUgCP3goZDsYtzlnfPEe8QLiC
         /SDL3AqENwqaLX9X9KZ7CJlpYy1nbBNuzO87ZwjNASOmprCBb4dCHGxoK+HLydmXkqLt
         ImC+jwLYecpLQyERcVFqfubDjUVTGRRR4FZjPeKOnzC7hn/qHDU9Y5goS7uEHSBKw3z8
         c+kZWMJiyCJ3xpBbgSG9KS6dyMX1UMpd3OaWwGHQZGBmJ8VNNxibLOfNVDT+dina7m52
         ds8YqYYnDa7q7wJivtmy5Fwftj7By08ySoyE/S2fKmS23GSwV/a550Ou0wE8DsceZUFr
         ILUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqja7knxat7yvzRWE+cY0fxFxazOgSpdwNIx5WY0UnY=;
        b=pqeOwwjJVtiU0x317rjklS71ILS5q86zCqm8UUr2f0HivHwW3HZcTEmCJgjUE18Sws
         dN8Gj45aZjz7n0Ek7I4mxF2t5ZAvP4D2Ns5mH5dYKypuuZt1DP0Ajby1XHjzrKDdbdVj
         a8tDHgPHO0YMa6B3pjwg+1ewaC5j2v0IpWeNkcYukJMM3jKEpBjXGDNji88yoH4pG6tG
         /QFXrKC5DsoJAhx+QjPGOZI4XjwKGn8hRAJWshtcwbMRqM7gEuND2/PR27CetIUzJkft
         4yhvc7SOjfStoMBcg1S1hz3XAMGIucQ30zvrORkBTl7uMHfdE57oj8so0S6AafFvDxkN
         CkKw==
X-Gm-Message-State: AOAM532egXAw6X/wgO4eaTH0uDwOxQzvgK0IDaIVnubbfDfnF2fwPDTI
	ek3ejuGqU59aacQmudQG/qhsi1X19tk=
X-Google-Smtp-Source: 
 ABdhPJyo9jFN15EejJkgVeReFo+whonIt15pzcQzrTnUyuOJeBBNJ1mS5sGwkIcGtSfFBrd65PkoNQ==
X-Received: by 2002:a17:906:2846:b0:6ce:21cd:5398 with SMTP id
 s6-20020a170906284600b006ce21cd5398mr3023177ejc.49.1645114197909;
        Thu, 17 Feb 2022 08:09:57 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 10/28] vulkan-samples: update to latest revision
Date: Thu, 17 Feb 2022 17:09:21 +0100
Message-Id: <20220217160939.1424397-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161827

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...dd-explicit-static_cast-from-vk-Buff.patch | 35 -----------------
 ...-mix-plain-and-keyword-target_link_l.patch | 38 -------------------
 .../vulkan/vulkan-samples_git.bb              |  4 +-
 3 files changed, 1 insertion(+), 76 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch
deleted file mode 100644
index b0e7cdabe4..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f88fd472e57b59013570f08949dbbc0875c1bae4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 13 Nov 2021 18:37:13 -0800
-Subject: [PATCH] framework/core: Add explicit static_cast from vk::Buffer to
- VkBuffer
-
-This fixes errors like
-framework/core/hpp_buffer.cpp:149:3: error: no matching function for call to 'vmaDestroyBuffer'
-|                 vmaDestroyBuffer(vmaAllocator, handle, vmaAllocation);
-|                 ^~~~~~~~~~~~~~~~
-| /mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux-musl/vulkan-samples/git-r0/git/third_party/vma/src/vk_mem_alloc.h:3803:33: note: candidate function not viable: no known conversion from 'vk::Buffer' to 'V
-kBuffer' (aka 'unsigned long long') for 2nd argument
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/395]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- framework/core/hpp_buffer.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/framework/core/hpp_buffer.cpp b/framework/core/hpp_buffer.cpp
-index c1f5649..2609e4e 100644
---- a/framework/core/hpp_buffer.cpp
-+++ b/framework/core/hpp_buffer.cpp
-@@ -146,7 +146,7 @@ void HPPBuffer::destroy()
- 	{
- 		assert(vmaAllocation != VK_NULL_HANDLE);
- 		unmap();
--		vmaDestroyBuffer(vmaAllocator, handle, vmaAllocation);
-+		vmaDestroyBuffer(vmaAllocator, static_cast<VkBuffer>(handle), vmaAllocation);
- 	}
- }
- 
--- 
-2.33.1
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch
deleted file mode 100644
index 66ed8bb47d..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-samples/0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 64b806ab702a6f445fd84aca5f03bb85b86a66e3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 11 Nov 2021 18:37:09 -0800
-Subject: [PATCH] framework: do not mix plain and keyword
- target_link_libraries() signatures
-
-Fixes
-| CMake Error at framework/CMakeLists.txt:461 (target_link_libraries):
-|   The plain signature for target_link_libraries has already been used with
-|   the target "framework".  All uses of target_link_libraries with a target                                            |   must be either all-keyword or all-plain.
-|
-|   The uses of the plain signature are here:
-|                                                                                                                       |    * framework/CMakeLists.txt:453 (target_link_libraries)
-|
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples/pull/395]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- framework/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
-index 948c796..13d3324 100644
---- a/framework/CMakeLists.txt
-+++ b/framework/CMakeLists.txt
-@@ -450,7 +450,7 @@ target_link_libraries(${PROJECT_NAME} PUBLIC
-     plugins)
- 
- if(${NEED_LINK_ATOMIC})
--    target_link_libraries(${PROJECT_NAME} atomic)
-+    target_link_libraries(${PROJECT_NAME} PUBLIC atomic)
- endif()
- 
- # Link platform specific libraries
--- 
-2.33.1
-
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 1e45e9f04b..53c7254ce7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -7,13 +7,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;protocol=https \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch \
-           file://0001-framework-do-not-mix-plain-and-keyword-target_link_l.patch \
-           file://0001-framework-core-Add-explicit-static_cast-from-vk-Buff.patch \
            file://debugfix.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "ae6e4a3712cebde49a29e5996a3bd2f403566890"
+SRCREV = "28ca2dad83ceb157386e0708f5151ae89c177ad4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.20.1


