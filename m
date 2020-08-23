Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.181520.1598214099269876620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jfg0DAwU;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id l2so3259794eji.3
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2obxp2wD5eCLSnDVX90JbZvP2Un00jatY7wmJz9ilQA=;
        b=jfg0DAwUPCbrNW76qbuw6X3CnxLy/ZUQpiDqgcw4CAnQZUy90GMR2GJuAXweB0QmI6
         ieN2bAINCpg13aYnvT7jmpwpbcawjK4oxvRMN5MLIB4/Y2nu1HYidE5N0y/UJFsmtxAX
         BI2qj9ggxBP2zar+kOArJTJF561MPfwxNtWU7nyL6l2fvufgUnP7etbzZ626FQpKNuZC
         KZFYA3YV7Hr5PGXe4n8IzhlcRtYblw3v8nKU76pruuMhSer77jxs7QgF5KcuQ0dSN5vK
         0kQVcb+qNsUZYEWHr15PGN0Ehc1qqKBi4MEGy5CSKDa1ZtqSxMDyLbyD9GarsqZ4mJvH
         VNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2obxp2wD5eCLSnDVX90JbZvP2Un00jatY7wmJz9ilQA=;
        b=YvXfjT5rvdHSW+/ieiffCJGEmRHNOrm55LT1JPHMVFTboF4FSkAtenlhNFMY2e24dD
         q/Ca+gX+6k+3dloteYrlSKHn1D13imIGSy20g6RDzh3/UAMM4F7peOSiKE/z8qdqcZj3
         GyrSgNZgIriRlS6wZlaqoPlfsntvZ4/VFuYKKxAHJq8GvNC30ib+umaGbMXPrVd8luUZ
         wu+3yFLG4SE3JGxE36dfpmJN4K0ZQfHxQzsizor5o+I/TSGdq/Gd90o/P7YIu04aINvd
         gxCT/5yn06VKROLuk5uk/zegXCl7O6jyDij/C72RLXoZGyQEi08Epo1A6qdoK8nzJz5N
         ZJtA==
X-Gm-Message-State: AOAM53300j6f9c+SEyWimpZ5q5DDWqY7nqV11ZxSpPIEq+gubpGkxq33
	Cdt0Cf23XO2KEaruLxrAC2XwUA/Cp/4=
X-Google-Smtp-Source: ABdhPJztf37JK5Rand29n2cTxwwq1ksstWbT9c93gqYQ6bvPKHMMKgiHeS9m9VKsOoMxPg4ryoz9ag==
X-Received: by 2002:a17:906:5902:: with SMTP id h2mr2761357ejq.423.1598214097411;
        Sun, 23 Aug 2020 13:21:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/37] cmake: update 3.17.3 -> 3.18.1
Date: Sun, 23 Aug 2020 22:20:29 +0200
Message-Id: <20200823202031.24686-35-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ke-native_3.17.3.bb => cmake-native_3.18.1.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc             |  2 +-
 ...neSystem-use-oe-environment-vars-to-load.patch |  4 ++--
 .../0002-cmake-Prevent-the-detection-of-Qt5.patch | 10 +++++-----
 ...pport-OpenEmbedded-Qt4-tool-binary-names.patch |  2 +-
 ...ntly-if-system-Qt-installation-is-broken.patch |  2 +-
 ...of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 15 +++++++--------
 .../cmake/{cmake_3.17.3.bb => cmake_3.18.1.bb}    |  4 ++--
 8 files changed, 19 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.17.3.bb => cmake-native_3.18.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.17.3.bb => cmake_3.18.1.bb} (94%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.17.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.18.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.17.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.18.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 7f0307c15b..94465efc85 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -22,6 +22,6 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "0bd60d512275dc9f6ef2a2865426a184642ceb3761794e6b65bff233b91d8c40"
+SRC_URI[sha256sum] = "c0e3338bd37e67155b9d1e9526fec326b5c541f74857771b7ffed0c46ad62508"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index f5c1a212f5..f3f9f7d8d1 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From d4aa2dbdc69774ad668756586d59331ad215a2c6 Mon Sep 17 00:00:00 2001
+From 434761616f66074f1823b43145558c239c85b37d Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
@@ -25,7 +25,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index dc208c6..e0af4ca 100644
+index f3ec4da..bb05656 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
 @@ -81,6 +81,13 @@ else()
diff --git a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
index cf1dda7c9b..162bfe5783 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-cmake-Prevent-the-detection-of-Qt5.patch
@@ -1,4 +1,4 @@
-From 126994379ea75c8826874656bb55f955182ae911 Mon Sep 17 00:00:00 2001
+From 106cf5134d22db889e4ddf2f98ec302d5f4b9ca7 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Wed, 17 Jan 2018 10:02:14 -0200
 Subject: [PATCH] cmake: Prevent the detection of Qt5
@@ -38,7 +38,7 @@ index 98dd0e2..252302b 100644
    include_directories(${Qt5Widgets_INCLUDE_DIRS})
    add_definitions(${Qt5Widgets_DEFINITONS})
 diff --git a/Tests/CMakeLists.txt b/Tests/CMakeLists.txt
-index aff7383..e220503 100644
+index db6dbf3..5b26879 100644
 --- a/Tests/CMakeLists.txt
 +++ b/Tests/CMakeLists.txt
 @@ -215,7 +215,7 @@ if(BUILD_TESTING)
@@ -96,11 +96,11 @@ index c08efc4..87e25d9 100644
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
 diff --git a/Tests/RunCMake/CMakeLists.txt b/Tests/RunCMake/CMakeLists.txt
-index e9f8bca..3a2da34 100644
+index 10e66c3..ecc4eeb 100644
 --- a/Tests/RunCMake/CMakeLists.txt
 +++ b/Tests/RunCMake/CMakeLists.txt
-@@ -396,7 +396,7 @@ else()
- endif()
+@@ -440,7 +440,7 @@ if(NOT WIN32)
+ endif ()
  
  find_package(Qt4 QUIET)
 -find_package(Qt5Core QUIET)
diff --git a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
index e30dc51e4a..575a5cb7fb 100644
--- a/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
+++ b/meta/recipes-devtools/cmake/cmake/0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch
@@ -1,4 +1,4 @@
-From e528861023bf69df0ad061a59fd4e527c9dde1ce Mon Sep 17 00:00:00 2001
+From 2d02ac91d5a5d72eaddba4894eaa6db3ed8fee62 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 12 May 2011 15:36:03 +0000
 Subject: [PATCH] cmake: support OpenEmbedded Qt4 tool binary names
diff --git a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
index 48f43be837..1b196db81a 100644
--- a/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
+++ b/meta/recipes-devtools/cmake/cmake/0004-Fail-silently-if-system-Qt-installation-is-broken.patch
@@ -1,4 +1,4 @@
-From b0aeca35187983e22ec256a439cff4702dbde331 Mon Sep 17 00:00:00 2001
+From 60864efbe52cc12018efaafbc4e4c3c8b4af2b65 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:26:48 -0300
 Subject: [PATCH] Fail silently if system Qt installation is broken
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index ad42d409d9..d6f7308fe0 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,7 +1,8 @@
-From 0df8d46d14c371f21c327966a553c4c187a8acfe Mon Sep 17 00:00:00 2001
+From fd9a04c1434e12f21c043385e306e0b52d38d749 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
-Subject: [PATCH 5/5] Disable use of ext2fs/ext2_fs.h by cmake's internal
+Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
+
  libarchive copy
 Organization: O.S. Systems Software LTDA.
 
@@ -12,15 +13,16 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
 ---
  Utilities/cmlibarchive/CMakeLists.txt | 8 ++------
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index 206f3c6a5..642fb0dd9 100644
+index bfcaf30..2960683 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -430,12 +430,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -682,12 +682,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
@@ -34,7 +36,4 @@ index 206f3c6a5..642fb0dd9 100644
 +SET(HAVE_WORKING_EXT2_IOC_GETFLAGS 0)
  LA_CHECK_INCLUDE_FILE("fcntl.h" HAVE_FCNTL_H)
  LA_CHECK_INCLUDE_FILE("grp.h" HAVE_GRP_H)
- LA_CHECK_INCLUDE_FILE("inttypes.h" HAVE_INTTYPES_H)
--- 
-2.18.0
-
+ LA_CHECK_INCLUDE_FILE("io.h" HAVE_IO_H)
diff --git a/meta/recipes-devtools/cmake/cmake_3.17.3.bb b/meta/recipes-devtools/cmake/cmake_3.18.1.bb
similarity index 94%
rename from meta/recipes-devtools/cmake/cmake_3.17.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.18.1.bb
index e0457677e8..64c92b89f2 100644
--- a/meta/recipes-devtools/cmake/cmake_3.17.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.18.1.bb
@@ -1,6 +1,6 @@
 require cmake.inc
 
-inherit cmake
+inherit cmake bash-completion
 
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
@@ -46,7 +46,7 @@ do_install_append_class-nativesdk() {
 
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}"
 
-FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION} ${datadir}/cmake ${datadir}/aclocal"
+FILES_${PN} += "${datadir}/cmake-${CMAKE_MAJOR_VERSION} ${datadir}/cmake ${datadir}/aclocal ${datadir}/emacs ${datadir}/vim"
 FILES_${PN}-doc += "${docdir}/cmake-${CMAKE_MAJOR_VERSION}"
 FILES_${PN}-dev = ""
 
-- 
2.28.0

