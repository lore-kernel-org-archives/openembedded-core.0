Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.2422.1609185898434730168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DGpy9nlm;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id cw27so10771196edb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tu5ZY8xAPsTUnoU6UJj1YPu4k/PLBYkk21WVk5F5c40=;
        b=DGpy9nlm1sLXyZzQ4nyozL4h05SurCnL2HufTaV0mAR+rX2PHiq9RKgGW6Frltk1b6
         SSWZSp9csKrQXRhJY6/qgSHPpuizrxGl47wqSHL2TzIXbcL41KOJTpisF8RhJ8IZGVi1
         sOLJ2SOXQCoNYqQPB+Gxvc4KbqtKw0ObWH9KB3ghm/ab+3cnxiIqCYmNDAJDTZzzas/w
         oHMt8E6R0vgfoiTpzBLE7BalWm8SduP72tcuj+Dpo0ctyne302iqUVF7Gn7+wQiTObaV
         DrrmKNunGxVZEEM3zlogKcTxXoB6B1LfuopmG2fF0K1g1sAquAVWFWWnEc4fl0GhH4gu
         1iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tu5ZY8xAPsTUnoU6UJj1YPu4k/PLBYkk21WVk5F5c40=;
        b=cnhpbU0ZpG9jOuFj6Ma0A68jOcA+6bNfv38YbRB+xTWAkAChiUCxc1+hhvfabFsDcs
         +5AxnH1qYpUmwKaE3lzX7sFndLveHITv9FxR7CBI2bYCYTcs/InhLvTJYFWzyib1m5WX
         A5sIXEnntd/flBU+SpJsoQL5rk+oLimOsUfVQ+2ciegFkg/5RnBNpSYhxHsWtXQC5vVk
         Llu0jpNSHC7e8+bCs1+6frHN4t1wzWYvCXPef/cyo8J1X7iVfShLNJO4FG3kEDfj05Ax
         GiU9YBVz4cL8R4nqW6Dcg6Y0n417TD1eCg3M5uHrX44sKiu5iYq48H5Osr3qxbu4+pYP
         jWmQ==
X-Gm-Message-State: AOAM532KApMQS+uEB9ideC5AxW/zqMkK+NT3WeBQpLZbypaGoIgbBkXH
	YaRQ7aAv5Vk0lUXvPR9p7UODrh/kaFI=
X-Google-Smtp-Source: ABdhPJy9dkpL45a6tthhv7giFHb2+zjCtPWqyiUMyATDlyaXdJzFvCZwS3MjtJPMMvQxSVqrViRM6Q==
X-Received: by 2002:a05:6402:366:: with SMTP id s6mr43154162edw.44.1609185897001;
        Mon, 28 Dec 2020 12:04:57 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:56 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 18/22] cmake: update 3.18.4 -> 3.19.2
Date: Mon, 28 Dec 2020 21:04:32 +0100
Message-Id: <20201228200436.78130-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: only the first two lines contain licensing info

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ative_3.18.4.bb => cmake-native_3.19.2.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc         |  5 ++--
 ...stem-use-oe-environment-vars-to-load.patch |  6 ++---
 ...cmake-do-not-try-to-run-the-test-bin.patch | 26 +++++++++++++++++++
 ...2-cmake-Prevent-the-detection-of-Qt5.patch | 22 ++++++++--------
 .../{cmake_3.18.4.bb => cmake_3.19.2.bb}      |  0
 6 files changed, 43 insertions(+), 16 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.18.4.bb => cmake-native_3.19.2.bb} (100%)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch
 rename meta/recipes-devtools/cmake/{cmake_3.18.4.bb => cmake_3.19.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.18.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.18.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.19.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index e840e884cf..db03819b66 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -11,7 +11,7 @@ BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://Copyright.txt;md5=c721f56fce89ba2eadc2fdd8ba1f4d83 \
-                    file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14 \
+                    file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
@@ -20,9 +20,10 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0002-cmake-Prevent-the-detection-of-Qt5.patch \
            file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
+           file://0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch \
 "
 
-SRC_URI[sha256sum] = "597c61358e6a92ecbfad42a9b5321ddd801fc7e7eca08441307c9138382d4f77"
+SRC_URI[sha256sum] = "e3e0fd3b23b7fb13e1a856581078e0776ffa2df4e9d3164039c36d3315e0c7f0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index c4f81b27b5..8181510324 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From dd0fe8d54def4684d360b3e9b10e963ef0208202 Mon Sep 17 00:00:00 2001
+From 66d5b27dc37ef6243f6549e16d0285ba6c064a6e Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
@@ -25,10 +25,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index f3ec4da..bb05656 100644
+index bae270d..5bb6bc0 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
-@@ -81,6 +81,13 @@ else()
+@@ -111,6 +111,13 @@ else()
    endif()
  endif()
  
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch b/meta/recipes-devtools/cmake/cmake/0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch
new file mode 100644
index 0000000000..4483bbce18
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-cm_cxx_features.cmake-do-not-try-to-run-the-test-bin.patch
@@ -0,0 +1,26 @@
+From ca105727dc4862733c3aad09e9de819be63a7b6b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Sun, 27 Dec 2020 23:18:10 +0100
+Subject: [PATCH] cm_cxx_features.cmake: do not try to run the test binary
+
+This causes errors when cross compiling cmake.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Source/Checks/cm_cxx_features.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/Checks/cm_cxx_features.cmake b/Source/Checks/cm_cxx_features.cmake
+index 663d89a..e8dca3b 100644
+--- a/Source/Checks/cm_cxx_features.cmake
++++ b/Source/Checks/cm_cxx_features.cmake
+@@ -81,7 +81,7 @@ if(CMake_HAVE_CXX_MAKE_UNIQUE)
+ endif()
+ cm_check_cxx_feature(unique_ptr)
+ if (NOT CMAKE_CXX_STANDARD LESS "17")
+-  cm_check_cxx_feature(filesystem TRY_RUN)
++  cm_check_cxx_feature(filesystem)
+ else()
+   set(CMake_HAVE_CXX_FILESYSTEM FALSE)
+ endif()
diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
index 162bfe5783..33db07ccf0 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
@@ -1,4 +1,4 @@
-From 106cf5134d22db889e4ddf2f98ec302d5f4b9ca7 Mon Sep 17 00:00:00 2001
+From 98abade8cc119e076e4c5f1461c5188f6d49c1d8 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 17 Jan 2018 10:02:14 -0200
 Subject: [PATCH] cmake: Prevent the detection of Qt5
@@ -25,23 +25,23 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  7 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
-index 98dd0e2..252302b 100644
+index 452a303..d0a9fb4 100644
 --- a/Source/QtDialog/CMakeLists.txt
 +++ b/Source/QtDialog/CMakeLists.txt
 @@ -3,7 +3,7 @@
  
  project(QtDialog)
  CMake_OPTIONAL_COMPONENT(cmake-gui)
--find_package(Qt5Widgets QUIET)
-+#find_package(Qt5Widgets QUIET)
- if (Qt5Widgets_FOUND)
-   include_directories(${Qt5Widgets_INCLUDE_DIRS})
-   add_definitions(${Qt5Widgets_DEFINITONS})
+-find_package(Qt5Widgets REQUIRED)
++#find_package(Qt5Widgets REQUIRED)
+ 
+ set(CMake_QT_EXTRA_LIBRARIES)
+ 
 diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
-index db6dbf3..5b26879 100644
+index 1fb47cb..e022229 100644
 --- a/Tests/CMakeLists.txt
 +++ b/Tests/CMakeLists.txt
-@@ -215,7 +215,7 @@ if(BUILD_TESTING)
+@@ -251,7 +251,7 @@ if(BUILD_TESTING)
      set(CMake_TEST_Qt5 1)
    endif()
    if(CMake_TEST_Qt5)
@@ -96,10 +96,10 @@ index c08efc4..87e25d9 100644
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
 diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
-index 10e66c3..ecc4eeb 100644
+index 370dd76..6bacbff 100644
 --- a/Tests/RunCMake/CMakeLists.txt
 +++ b/Tests/RunCMake/CMakeLists.txt
-@@ -440,7 +440,7 @@ if(NOT WIN32)
+@@ -473,7 +473,7 @@ if(NOT WIN32)
  endif ()
  
  find_package(Qt4 QUIET)
diff --git a/meta/recipes-devtools/cmake/cmake_3.18.4.bb b/meta/recipes-devtools/cmake/cmake_3.19.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.18.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.19.2.bb
-- 
2.29.2

