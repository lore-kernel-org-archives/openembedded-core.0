Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6159BC3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 07:35:14 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.5848.1692862506020843169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Aug 2023 00:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Ui9equvI;
 spf=pass (domain: baylibre.com, ip: 209.85.218.46, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99bcf2de59cso836603666b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 00:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692862504; x=1693467304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpqGRDVFbp4LFRewLe8shrBDAdjaur9F4R3vy8EPuGQ=;
        b=Ui9equvIeQZPmJ32QMvdo9gyAYBpkSbyT7zBxX5SYjdACaMsUXKEG5pllNKlKUpIcx
         nmewKWRRIFHDtLNsb1BsBx7XP33oJB9zhImlq1gKQmU8ZENSM2tL1qv5ryp+c1caJvEo
         TDpIliV8zQSDwcjnZoVSrb8uMMT+eoyGa8dILqTW5VxVFXpYjLA2FWTsp15Q8ozPwLXz
         bQi/Rdsb/uH7dO4UQ37WEPTOCsr4/9FKAQJOoWINp/0dQUKRKGaZPz9ILsDcQ95HgPpw
         gegjkqnlU+5wrZ8hiPSdbImg8K5UvYL07XvnHSabGBlZZlgnLi8AW9mzvlwfeUuWdjSG
         uJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692862504; x=1693467304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpqGRDVFbp4LFRewLe8shrBDAdjaur9F4R3vy8EPuGQ=;
        b=T++8CCvfcICqCpK52GhuUvivxjHbvQSpSXiN63+BzhLqmDm7rrjugWKxqOp5euF4AZ
         olqMWVFb2ImKiurMnLuL/LHM1dQOYy1b0eNc/+tAIurQtQ1LqkO6/KOSw886mFQdGSqS
         yqGbU47fYxHwJp4lYPTizFnZrQDKW4U/W6OK5K1QqfW6A9sXhBl6FJz14wgJcxtsNovN
         dVeMP/L0VdJ6L5aKz84vn4Rk4wvj6AIUonwjxHSskV9nFt9eRceyHDw9fcBNO0yLHIFH
         eEgaiVY56qV97zGOuSODd7q1MZtTC0iHVq78YUTivuPPLpPykhYsBbUIlXVO8x3z8ejT
         JuJA==
X-Gm-Message-State: AOJu0YyVAQ2Yup6o2DB+xPYGeao378aqbMTPyIiN+PV0c/Ka6fm6z879
	SdtwiHoLJbb8rnVOrX7+jjXJ1gdi6LDZMKev9m0Srg==
X-Google-Smtp-Source: AGHT+IExAJMfgjIm61mCiYLk7PGZBB9gYu5ZpIYIt1Y3N4PaCb28t3vP7mWlki2QPhYh+cY8Pyozvg==
X-Received: by 2002:a17:906:225c:b0:9a1:c376:9d7b with SMTP id 28-20020a170906225c00b009a1c3769d7bmr4485746ejr.32.1692862503747;
        Thu, 24 Aug 2023 00:35:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id p23-20020a170906141700b009931a3adf64sm10731777ejc.17.2023.08.24.00.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 00:35:03 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 2/2] vulkan-samples: convert debugfix.patch to git format patch
Date: Thu, 24 Aug 2023 09:34:58 +0200
Message-ID: <20230824073458.3054480-2-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230824073458.3054480-1-jstephan@baylibre.com>
References: <20230824073458.3054480-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 07:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186643

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


