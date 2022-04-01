Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A29FC43219
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:41 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.10396.1648819420454281433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=l4AjqCce;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 0101017fe54bb822-860195d9-8c46-4b47-97ef-846495942099-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Lx4xtxD9hBoUxgF5DsDkx6HcYrl6jHy0H/6N3RKiv7s=;
	b=l4AjqCcecUKs0qWZW65ftEck55HjVNdT80NHIAcet5uovYFqwEYlEforKP6jPdYk
	WDWYlSrTcmtxxJoOPg/dzzjrxFXehLHj40i3doQFXDsauMXK/H8ltgX8+p+4j60rBYt
	Me5W8OicqLuUPM/j2I74QBdw6Kwfl+Us4exFc5D0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Lx4xtxD9hBoUxgF5DsDkx6HcYrl6jHy0H/6N3RKiv7s=;
	b=Z5UFJ4KD9XUjxg1131/UlFLN0PnWul9UGqbr7v+b1ZexlR6Vrr045fZ1sbBioObY
	neDuM38C8KrRSt6HHXgyVnAKEWrtGhVUhPVJ5ei5bdaVi/grIvzrIiJ0M4u1OFFGjsg
	3KQNKPlViOLbJVtAgjZQMDUMzevU9qoxP73omI6Y=
Content-Type: multipart/mixed; boundary="===============6304746702798096581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.23.0 FAILED
Message-ID: 
 <0101017fe54bb822-860195d9-8c46-4b47-97ef-846495942099-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163891

--===============6304746702798096581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.23.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.22.3-3.23.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6304746702798096581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.22.3-3.23.0.patch"

From 2ae20e8e8c441d18a41e2fc63c804abef5293975 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 06:30:54 +0000
Subject: [PATCH] cmake: upgrade 3.22.3 -> 3.23.0

---
 meta/recipes-devtools/cmake/cmake.inc         |  4 +-
 ...stem-use-oe-environment-vars-to-load.patch |  2 +-
 .../cmake/cmake/OEToolchainConfig.cmake       | 24 -----------
 .../cmake/SDKToolchainConfig.cmake.template   | 31 -------------
 .../cmake/cmake/cmake-setup.py                | 33 --------------
 .../cmake/cmake/environment.d-cmake.sh        |  2 -
 .../{cmake_3.22.3.bb => cmake_3.23.0.bb}      | 43 +++++++++++++++----
 7 files changed, 38 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
 delete mode 100644 meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template
 delete mode 100755 meta/recipes-devtools/cmake/cmake/cmake-setup.py
 delete mode 100644 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
 rename meta/recipes-devtools/cmake/{cmake_3.22.3.bb => cmake_3.23.0.bb} (56%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d500321138..6f6fa61cdb 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=31023e1d3f51ca90a58f55bcee8e2339 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=f2102a52df7aa592cf072180e7ebc8c7 \
                     file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0"
+SRC_URI[sha256sum] = "5ab0a12f702f44013be7e19534cd9094d65cc9fe7b2cd0f8c9e5318e0fe4ac82"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 9a2287f517..c9143a58e0 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From 89f6c846f02ad6d30b9ebb7eaaaa4fb6f9cec054 Mon Sep 17 00:00:00 2001
+From d6928315528227ceef1f7c74ed7bc6d8504554b8 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
deleted file mode 100644
index 86446c3ace..0000000000
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ /dev/null
@@ -1,24 +0,0 @@
-set( CMAKE_SYSTEM_NAME Linux )
-set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
-set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
-set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
-
-set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
-set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
-set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
-
-set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")
-
-# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
-if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
-  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
-endif()
-
-# Include the toolchain configuration subscripts
-file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST_FILE}.d/*.cmake" )
-foreach(config ${toolchain_config_files})
-    include(${config})
-endforeach()
diff --git a/meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template b/meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template
deleted file mode 100644
index c69569a843..0000000000
--- a/meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template
+++ /dev/null
@@ -1,31 +0,0 @@
-set(SDK_INSTALL_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../../..")
-set(HOST_SYSROOT    "${SDK_INSTALL_DIR}/sysroots/@OECORE_SDK_SYS")
-set(TARGET_SYSROOT  "${SDK_INSTALL_DIR}/sysroots/@OECORE_TARGET_SYS")
-set(HOST_BIN        "${HOST_SYSROOT}/usr/bin")
-set(TOOLCHAIN_NAME  "@OECORE_TARGET_ALIAS")
-set(GCC_DIR         "${HOST_BIN}/${TOOLCHAIN_NAME}")
-
-set(CMAKE_SYSTEM_NAME       Linux)
-set(CMAKE_SYSTEM_PROCESSOR "@OECORE_TARGET_ARCH")
-
-set(CMAKE_C_COMPILER    "${GCC_DIR}/${TOOLCHAIN_NAME}-gcc")
-set(CMAKE_CXX_COMPILER  "${GCC_DIR}/${TOOLCHAIN_NAME}-g++")
-
-set(ARCH_FLAGS          "@OECORE_TUNE_CCARGS")
-set(CMAKE_C_FLAGS       "${ARCH_FLAGS}" CACHE STRING "" FORCE )
-set(CMAKE_CXX_FLAGS     "${ARCH_FLAGS}" CACHE STRING "" FORCE )
-set(CMAKE_ASM_FLAGS     ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
-set(CMAKE_LDFLAGS_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
-
-set(CMAKE_SYSROOT "${TARGET_SYSROOT}")
-
-set(CMAKE_FIND_ROOT_PATH "${TARGET_SYSROOT}" )
-
-set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
-set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
-set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
-set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
-
-set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "")
-
-set(CMAKE_PROGRAM_PATH "${HOST_SYSROOT}/usr/bin" CACHE STRING "" FORCE)
diff --git a/meta/recipes-devtools/cmake/cmake/cmake-setup.py b/meta/recipes-devtools/cmake/cmake/cmake-setup.py
deleted file mode 100755
index af587a44cc..0000000000
--- a/meta/recipes-devtools/cmake/cmake/cmake-setup.py
+++ /dev/null
@@ -1,33 +0,0 @@
-#!/usr/bin/env python3
-
-import os
-import string
-import sys
-
-class Template(string.Template):
-    delimiter = "@"
-
-class Environ():
-    def __getitem__(self, name):
-        if name == "OECORE_SDK_SYS":
-            return  os.path.basename(os.environ["OECORE_NATIVE_SYSROOT"])
-        elif name == "OECORE_TARGET_SYS":
-            return  os.path.basename(os.environ["OECORE_TARGET_SYSROOT"])
-        elif name == "OECORE_TARGET_ALIAS":
-            return  os.path.basename(os.environ["TARGET_PREFIX"].strip("-"))
-        else:
-            return  os.environ[name]
-
-try:
-    sysroot = os.environ['OECORE_NATIVE_SYSROOT']
-except KeyError:
-    print("Not in environment setup, bailing")
-    sys.exit(1)
-
-template_file = os.path.join(sysroot, 'usr/share/cmake/SDKToolchainConfig.cmake.template')
-cross_file = os.path.join(sysroot, 'usr/share/cmake/%s-toolchain.cmake' % (os.path.basename(os.environ["OECORE_TARGET_SYSROOT"])))
-with open(template_file) as in_file:
-    template = in_file.read()
-    output = Template(template).substitute(Environ())
-    with open(cross_file, "w") as out_file:
-        out_file.write(output)
diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
deleted file mode 100644
index 7bdb19fb6c..0000000000
--- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-export OE_CMAKE_TOOLCHAIN_FILE="$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
-export OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX="`echo $OECORE_BASELIB | sed -e s/lib//`"
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.3.bb b/meta/recipes-devtools/cmake/cmake_3.23.0.bb
similarity index 56%
rename from meta/recipes-devtools/cmake/cmake_3.22.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.23.0.bb
index e111dd3c5a..80d1687a12 100644
--- a/meta/recipes-devtools/cmake/cmake_3.22.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.23.0.bb
@@ -1,17 +1,39 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- Copyright.txt
+# +++ Copyright.txt
+# @@ -1,5 +1,5 @@
+#  CMake - Cross Platform Makefile Generator
+# -Copyright 2000-2021 Kitware, Inc. and Contributors
+# +Copyright 2000-2022 Kitware, Inc. and Contributors
+#  All rights reserved.
+#  
+#  Redistribution and use in source and binary forms, with or without
+# @@ -62,7 +62,9 @@
+#  * Helio Chissini de Castro <helio@kde.org>
+#  * Ilya Lavrenov <ilya.lavrenov@itseez.com>
+#  * Insight Software Consortium <insightsoftwareconsortium.org>
+# +* Intel Corporation <www.intel.com>
+#  * Jan Woetzel
+# +* Jordan Williams <jordan@jwillikers.com>
+#  * Julien Schueller
+#  * Kelly Thompson <kgt@lanl.gov>
+#  * Konstantin Podsvirov <konstantin@podsvirov.pro>
+# 
+#
+
 require cmake.inc
 
 inherit cmake bash-completion
 
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
-SRC_URI:append:class-nativesdk = " \
-    file://OEToolchainConfig.cmake \
-    file://SDKToolchainConfig.cmake.template \
-    file://cmake-setup.py \
-    file://environment.d-cmake.sh \
-    file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
-"
-
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
     prefix=d.getVar("prefix")
@@ -27,6 +49,11 @@ python () {
     d.setVar("docdir_stripped", docdir_stripped)
 }
 
+SRC_URI += "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
+           file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
+           file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
+           "
 EXTRA_OECMAKE=" \
     -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
-- 
2.27.0


--===============6304746702798096581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1640 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb: Unable to get checksum for cmake-native SRC_URI entry OEToolchainConfig.cmake: file could not be found
done.
Parsing of 882 .bb files complete (880 cached, 2 parsed). 1640 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6b6e0bdccc0ae4059e93fbf22240fbc8fa4e3329"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 28 Mirrors 0 Missed 12 Current 193 (70% match, 94% complete)
Removing 2 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemux86...done.
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 680 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb:do_fetch)
NOTE: Running task 688 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: Running task 774 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.0.bb:do_fetch)
NOTE: recipe cmake-native-3.22.3-r0: task do_fetch: Started
WARNING: cmake-native-3.22.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.22.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz_bad-checksum_9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0
NOTE: recipe cmake-3.23.0-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe cmake-3.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 870 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.0.bb:do_unpack)
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 871 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: recipe cmake-3.23.0-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
WARNING: cmake-native-3.22.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.22.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz_bad-checksum_9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0
WARNING: cmake-native-3.22.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.22/cmake-3.22.3.tar.gz - will attempt other sources if available
NOTE: recipe cmake-3.23.0-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.0.bb:do_patch)
NOTE: recipe cmake-3.23.0-r0: task do_patch: Started
WARNING: cmake-native-3.22.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.22.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz_bad-checksum_9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0
NOTE: recipe cmake-native-3.22.3-r0: task do_fetch: Failed
NOTE: recipe cmake-3.23.0-r0: task do_patch: Failed
NOTE: Tasks Summary: Attempted 873 tasks of which 867 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb:do_fetch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.0.bb:do_patch
Summary: There were 8 WARNING messages.
Summary: There were 3 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: cmake-native-3.22.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.22/cmake-3.22.3.tar.gz
ERROR: cmake-native-3.22.3-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.22.3.tar.gz\' has sha256 checksum \'9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0\' when \'5ab0a12f702f44013be7e19534cd9094d65cc9fe7b2cd0f8c9e5318e0fe4ac82\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.22/cmake-3.22.3.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.22.3-r0/temp/log.do_fetch.1953321
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.22.3.bb:do_fetch) failed with exit code '1'
ERROR: cmake-3.23.0-r0 do_patch: Applying patch '0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.23.0-r0/cmake-3.23.0'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.23.0-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.23.0-r0/temp/log.do_patch.1953361
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.0.bb:do_patch) failed with exit code '1'

--===============6304746702798096581==--

