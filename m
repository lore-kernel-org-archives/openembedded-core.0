Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.20568.1621847657420061163
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FQy1msWl;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id lz27so40671275ejb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oROEHazyQYhEScrn4113X4tGl6kY9cfiBsPE7AEQKjA=;
        b=FQy1msWlyw2Pf6fQkgRAiaIuplS7hS1UP2o9xG3Dz/fEuz4S7l6PVHwjEFxbS8J71L
         /+AcQxtfrM3DMhCpJ9JozoMkpHCBtNHw+yOOnPPhA9GjyoeTZO/SxnOJYpgv05TmXEB7
         cDNvRjc12l1qMxN107ewgfvNZr/qUlW514D+DUkar5XJD4ff29xob+0q75akRgWe5kY7
         9Xy34sPKVS7jQOowxD6YfZNuBGyvI0h4ufrlf4Lm6ccW9NA5QxDiFppBucD6BSvPrsbW
         6PydpMfYDqU79fE7dovxqfKF3V7Bg2qAv5pWTAI/DGzduUaG5RusZA+p8PfHsmJIVecW
         tXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oROEHazyQYhEScrn4113X4tGl6kY9cfiBsPE7AEQKjA=;
        b=AMXizFaxnrror6PBTtD6/uap1EF5D2yj0TfbeUcPugwY4YTC1nHKhgeJr9Q2xeabST
         H6khG3CyH0w/o8U0YzNr805JAkUbrPK6vNaLyOerV+e/bCkuUqgA4hTzs/eJmSh7E/Zt
         hroHYwUEez3MjnZNkxUCzSjtgHU7kKeoA/DVvNhH3QFpwrwhI+B4uq3l6MQjnR0hN2/j
         z8iy6laTIphwj6lTPwzdbdob5KKTI4UyS6/9HjGt/semrZDg6GIW4AiIUEIaUL7iX/Ha
         jojZprk6U42upUdbphVSSarB59MbnqN808yjxngyGfUlZGVGEBxmq5E+Yev/G+q7aBG1
         wX7w==
X-Gm-Message-State: AOAM532lvi2AroNb/U1u15lReqW3UAc7R72Sx/9YpQIue5+RsN3FD0n/
	mxhu85MLEgU8FVYzdP78laPvZoZ+sjg=
X-Google-Smtp-Source: ABdhPJxypHberA1Dkw8XjoaPtYSj0jIaPDHzmMTk6xb10svxy0HWVkA3IaOfzAWXMvIbfMa7xxdMRQ==
X-Received: by 2002:a17:906:f20e:: with SMTP id gt14mr22062343ejb.368.1621847656017;
        Mon, 24 May 2021 02:14:16 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/21] cmake: update 3.20.1 -> 3.20.2
Date: Mon, 24 May 2021 11:13:43 +0200
Message-Id: <20210524091347.419253-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.20.1.bb => cmake-native_3.20.2.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 2 +-
 ...CMakeDetermineSystem-use-oe-environment-vars-to-load.patch | 4 ++--
 .../cmake/{cmake_3.20.1.bb => cmake_3.20.2.bb}                | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.20.1.bb => cmake-native_3.20.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.20.1.bb => cmake_3.20.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 2e6059f980..be43760628 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "3f1808b9b00281df06c91dd7a021d7f52f724101000da7985a401678dfe035b0"
+SRC_URI[sha256sum] = "aecf6ecb975179eb3bb6a4a50cae192d41e92b9372b02300f9e8f1d5f559544e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 06e10bf861..9609f5f7c2 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From ac9b8d316ff3e013bc9d3c063db99aa1f064ce6a Mon Sep 17 00:00:00 2001
+From e75f76b00cc9c1cfc231c5e731e975552f5dd13e Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
@@ -25,7 +25,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index bae270d..5bb6bc0 100644
+index bae270de..5bb6bc0d 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
 @@ -111,6 +111,13 @@ else()
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.1.bb b/meta/recipes-devtools/cmake/cmake_3.20.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.20.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.20.2.bb
-- 
2.31.1

