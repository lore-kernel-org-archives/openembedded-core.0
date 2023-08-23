Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C8FEE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 13:41:47 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.11732.1692798106194749783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 06:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=egphhbjg;
 spf=pass (domain: baylibre.com, ip: 209.85.167.43, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5007abb15e9so5723754e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692798104; x=1693402904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpqGRDVFbp4LFRewLe8shrBDAdjaur9F4R3vy8EPuGQ=;
        b=egphhbjgW4HR/MbSf6BljlmWRuIdJ4aA2tcTw+Drxspel9uACFxebyzIFeSZwbz19l
         JeDXC4zL8OkRO842czZt4YBNats9pIYYk2DstWQEQpbbHqUf3WPqL/xtAm5pcqbZeSFg
         y0BfiMNSno/N8m5h7IGbX8xE/aI/jNyk1cOdaNWahbPGsyLXR1W4spLXd57zpL6wU/1k
         C23rnl6cc0bSTuTslSdrYpUPr7AmNBI6uCzcrRYjvMnPUqDRZlAKkzF5wREvNfQ/7Czx
         4SuFpL5okM2ihrtznfIY4gPbVpP06Od9xxrSCdD0M28s/ETOrGpfEDbSw0MylMLa46t2
         sy0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692798104; x=1693402904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpqGRDVFbp4LFRewLe8shrBDAdjaur9F4R3vy8EPuGQ=;
        b=A+Zz767etY6pzK2yGaq/OOvsue7O2ureQbnBP0N1ur+7vbUsph4MYx1FFuZC5NC26H
         U757uvh7ok5fak8724oa2brWqDNsYycKRdTJuA1IWqoSYGMPTbFHHtNbW2IkiPWtXnNL
         naGyGrUb4A4bgqZB0L8vMmvIMjMvqSdg1sIbpkPatRHj6y7GVmlcVjPh02FbSBxB7pNa
         9e2WVs4bL+cxPDKAo+7DZm8RjmwpgjKmwav7Wcn0/n8giLl/wUSFTECxDQ3Oqq3t8Tw4
         pomovqSassvjEmAT4cUN/ZU3DCDqrUA3NElXL6GofgEZk8BxLtlNDxcGHbpfA6xNxtyp
         2YYg==
X-Gm-Message-State: AOJu0Yx93Cz/QFdTK2OG2n134pMEBFyXV6XoqUmnQa9ykdcZaix9Lwn4
	wHciOTti+Lv3HTb0F4KB9uV3p2YOdbGkpmLrmnv12Q==
X-Google-Smtp-Source: AGHT+IHzGQxmE4/YxvCNwHihdYJP5uReW4H37ethHz4t17pn3B8dt/WBQlFXYJOo5mK9wB1QsAstIw==
X-Received: by 2002:a05:6512:3444:b0:500:78ee:4cd7 with SMTP id j4-20020a056512344400b0050078ee4cd7mr6713597lfr.23.1692798103441;
        Wed, 23 Aug 2023 06:41:43 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id xa13-20020a170907b9cd00b0099bd5d28dc4sm9854581ejc.195.2023.08.23.06.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 06:41:42 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 2/2] vulkan-samples: convert debugfix.patch to git format patch
Date: Wed, 23 Aug 2023 15:41:35 +0200
Message-ID: <20230823134135.3037433-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823134135.3037433-1-jstephan@baylibre.com>
References: <20230823134135.3037433-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 13:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186580

devtool modify on vulkan-samples fails to apply the debugfix.patch
because it is not in one of git's known formats.

Here is the error:
ERROR: Applying patch 'debugfix.patch' on target directory '<..>/build/tmp/work/core2-64-poky-linux/vulkan-samples/git/devtooltmp-38uz7jyq/workdir/git'
CmdError("sh -c 'git add -f -A .'", 0, 'stdout:
stderr: fatal: not a git repository (or any of the parent directories):
.git
')

Also, rename debugfix.patch to something more meaningfull

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 ...n-samples-Fix-reproducibility-issue.patch} | 22 ++++++++++++++-----
 .../vulkan/vulkan-samples_git.bb              |  2 +-
 2 files changed, 18 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/vulkan/vulkan-samples/{debugfix.patch => 0001-vulkan-samples-Fix-reproducibility-issue.patch} (62%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/debugfix.patch b/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
similarity index 62%
rename from meta/recipes-graphics/vulkan/vulkan-samples/debugfix.patch
rename to meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
index d723fcc19ad..76090114211 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples/debugfix.patch
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-vulkan-samples-Fix-reproducibility-issue.patch
@@ -1,3 +1,8 @@
+From d998c753254649c7cf7c64e3fed78e41c11ad7ed Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 23 Aug 2023 09:38:37 +0200
+Subject: [PATCH] vulkan-samples: Fix reproducibility issue
+
 There is code to remove the prefix CMAKE_SOURCE_DIR from __FILENAME__ paths
 used for logging with LOGE() in the code. We need to make this match the value we use
 in the debug source remapping from CFLAGS
@@ -16,11 +21,16 @@ will currently change the output!
 Upstream-Status: Pending [needs to be discussed upstream]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: git/bldsys/cmake/global_options.cmake
-===================================================================
---- git.orig/bldsys/cmake/global_options.cmake
-+++ git/bldsys/cmake/global_options.cmake
-@@ -47,7 +47,7 @@ set(CMAKE_CXX_STANDARD 14)
+Signed-off-by: Julien Stephan <jstephan@baylibre.com>
+---
+ bldsys/cmake/global_options.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bldsys/cmake/global_options.cmake b/bldsys/cmake/global_options.cmake
+index b15c2da..d8952e5 100644
+--- a/bldsys/cmake/global_options.cmake
++++ b/bldsys/cmake/global_options.cmake
+@@ -62,7 +62,7 @@ set(CMAKE_CXX_STANDARD 14)
  set(CMAKE_DISABLE_SOURCE_CHANGES ON)
  set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)
  
@@ -29,3 +39,5 @@ Index: git/bldsys/cmake/global_options.cmake
  add_definitions(-DROOT_PATH_SIZE=${ROOT_PATH_SIZE})
  
  set(CMAKE_C_FLAGS_DEBUG   "-DDEBUG=0 ${CMAKE_C_FLAGS_DEBUG}")
+--
+2.41.0
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 458d1405aee..66f1ef5e9df 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -6,7 +6,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48aa35cefb768436223a6e7f18dc2a2a"
 
 SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=main;protocol=https;lfs=0 \
-           file://debugfix.patch \
+           file://0001-vulkan-samples-Fix-reproducibility-issue.patch \
            file://0001-Do-not-use-LFS64-functions-on-linux-musl.patch;patchdir=third_party/spdlog \
            file://0001-Deprecate-u8string_view.patch;patchdir=third_party/spdlog \
            file://32bit.patch \
-- 
2.41.0


