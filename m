Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.17526.1590940456856755033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F/9ES3w1;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id z5so6894242ejb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0k/UPbWHVhRWY+vE7HXJP6Fbg0n9T2QozskW/CRHNY=;
        b=F/9ES3w1m+NhFVvXiHMwYn33fb93k5PIbZK2eCgpl7A5OM6H9NP3DzxqLhOZ1rlqbL
         LI9NrDMS9fR/giWEfrAC864WNJokd002DA3IfcLQ4+l+BE6hhR5VRppyXKu5EZD6/NX9
         4SB3qxxFmDlZtvgjuCrsZKxqrhQ/wpGy3MZmy0M2IYe0a9ezTVw/tu4zo/hlIGx6CdbG
         VwTv5LOM0wtpNCsXEpos97ffwPOp6jX5MUD+m/nFPs4h5cwZK++7OGUJWvQvdMEYhQzI
         OK3DLYnsAXEvxcD7gaeU+jlALuiI7l2e1L5jBBgMxh5nopbUSOlQthShsKFX1AxEf2w3
         m9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0k/UPbWHVhRWY+vE7HXJP6Fbg0n9T2QozskW/CRHNY=;
        b=qpJG/RkCfGKoW9T3kb1I29qG52A+INEjSspHW5UpSHoKQfskdoPmoXjK9vDF/FhPwB
         QzUV2/DVvi/+NRxwq/ZkZu7HVWr51q7bmDnM3oLtoLM6TXeT2qz/61kka1UISsUjrcIO
         Op9z4EFvW8RjMB2xyRYTDa19rOwx2O/qNMBgHvvv/BTJlSQMY81dTTUfD0o7RCrHHLiT
         koRzbmIoIGYVn8/5vVvn9URoWUPlgaS4iH8d7yPeZEr+308jR5V+5Dn4Jr9VW/acQbNR
         Zt8iqLoqd/hjxU5i40xY+S9417qz/6485aC/nLFY60Rs62nbohwsKFdyleobnZ4GzHs/
         rFtw==
X-Gm-Message-State: AOAM531i20Zp4nqd1l0pXAilLDB140dJsyj7+2pbj/jRtc/mkDBHuGav
	1UIob43RPrOiheUJHYz/sCR+mO73
X-Google-Smtp-Source: ABdhPJzDvqSCHoRTyCvJmsjbisBQuizA+s8qvV+iVh8TFd85u0JCUt/6dw5a8WwHztJDgE/atbgyrQ==
X-Received: by 2002:a17:906:148f:: with SMTP id x15mr15394522ejc.85.1590940455130;
        Sun, 31 May 2020 08:54:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:14 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 54/70] cmake: update 3.16.5 -> 3.17.3
Date: Sun, 31 May 2020 17:52:38 +0200
Message-Id: <20200531155254.10283-54-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e-native_3.16.5.bb => cmake-native_3.17.3.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc            |  7 +++----
 ...eSystem-use-oe-environment-vars-to-load.patch |  2 +-
 ...0002-cmake-Prevent-the-detection-of-Qt5.patch | 16 ++++++++--------
 .../cmake/{cmake_3.16.5.bb => cmake_3.17.3.bb}   |  0
 5 files changed, 12 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.16.5.bb => cmake-native_3.17.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.16.5.bb => cmake_3.17.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 09949b566c..7f0307c15b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,8 +10,8 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=622747147b46f22e1953876a7cba3323 \
-                    file://Source/cmake.h;md5=4494dee184212fc89c469c3acd555a14;beginline=1;endline=3 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=c721f56fce89ba2eadc2fdd8ba1f4d83 \
+                    file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14 \
                     "
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
@@ -22,7 +22,6 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[md5sum] = "d86ccaf3d2462b6b5947919abe5b9f15"
-SRC_URI[sha256sum] = "5f760b50b8ecc9c0c37135fae5fbf00a2fef617059aa9d61c1bb91653e5a8bfc"
+SRC_URI[sha256sum] = "0bd60d512275dc9f6ef2a2865426a184642ceb3761794e6b65bff233b91d8c40"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index e2a58d25e2..f5c1a212f5 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From ab272d703ce77f323aa1285526559c9efbf85834 Mon Sep 17 00:00:00 2001
+From d4aa2dbdc69774ad668756586d59331ad215a2c6 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
index 61c8f27cd6..cf1dda7c9b 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
@@ -1,4 +1,4 @@
-From 5a86c7fa987bd407f228176df2abeffd015be9ea Mon Sep 17 00:00:00 2001
+From 126994379ea75c8826874656bb55f955182ae911 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 17 Jan 2018 10:02:14 -0200
 Subject: [PATCH] cmake: Prevent the detection of Qt5
@@ -25,7 +25,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  7 files changed, 8 insertions(+), 9 deletions(-)
 
 diff --git a/Source/QtDialog/CMakeLists.txt b/Source/QtDialog/CMakeLists.txt
-index cb89d19..9e68981 100644
+index 98dd0e2..252302b 100644
 --- a/Source/QtDialog/CMakeLists.txt
 +++ b/Source/QtDialog/CMakeLists.txt
 @@ -3,7 +3,7 @@
@@ -38,18 +38,18 @@ index cb89d19..9e68981 100644
    include_directories(${Qt5Widgets_INCLUDE_DIRS})
    add_definitions(${Qt5Widgets_DEFINITONS})
 diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
-index 57fa7fc..d50c146 100644
+index aff7383..e220503 100644
 --- a/Tests/CMakeLists.txt
 +++ b/Tests/CMakeLists.txt
-@@ -1329,7 +1329,7 @@ ${CMake_SOURCE_DIR}/Utilities/Release/push.bash --dir dev -- '${CMake_BUILD_NIGH
+@@ -215,7 +215,7 @@ if(BUILD_TESTING)
      set(CMake_TEST_Qt5 1)
    endif()
    if(CMake_TEST_Qt5)
 -    find_package(Qt5Widgets QUIET NO_MODULE)
 +    #find_package(Qt5Widgets QUIET NO_MODULE)
    endif()
-   if(CMake_TEST_Qt5 AND Qt5Widgets_FOUND)
-     add_subdirectory(Qt5Autogen)
+ 
+   if(NOT CMake_TEST_EXTERNAL_CMAKE)
 diff --git a/Tests/Qt4And5Automoc/CMakeLists.txt b/Tests/Qt4And5Automoc/CMakeLists.txt
 index ad74961..a9dd74b 100644
 --- a/Tests/Qt4And5Automoc/CMakeLists.txt
@@ -96,10 +96,10 @@ index c08efc4..87e25d9 100644
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
 diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
-index 6b2f117..1002005 100644
+index e9f8bca..3a2da34 100644
 --- a/Tests/RunCMake/CMakeLists.txt
 +++ b/Tests/RunCMake/CMakeLists.txt
-@@ -376,7 +376,7 @@ else()
+@@ -396,7 +396,7 @@ else()
  endif()
  
  find_package(Qt4 QUIET)
diff --git a/meta/recipes-devtools/cmake/cmake_3.16.5.bb b/meta/recipes-devtools/cmake/cmake_3.17.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.16.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.17.3.bb
-- 
2.26.2

