Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D723ACCA494
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:18:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web09.620.1654100323884437803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=L4D0/zCC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010181200fe982-5a51f32f-b11d-4953-9259-eb139ad672e8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Osi/ptSOR4ixf1xcrtxYCJMQN0U4EE28JC+/s7hKDTQ=;
	b=L4D0/zCCg8EMo9/L7vOQOtbzTzfMtKNKHbfGPqTHp1jCCZvwIu2krtBjQsxawds1
	lxSDPPyy5eG6x+y3nBLmnf/S8Phhi48vJJtyKPVZ0FjwUUXOl5QjHNQMTZZiRMx7kHO
	rHMwA24Eb7LE2MA35A3hSA4FPySYZI3d7MRIssTo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1654100323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Osi/ptSOR4ixf1xcrtxYCJMQN0U4EE28JC+/s7hKDTQ=;
	b=IqZDzhODRXDvdH54IFIbKXLxO8zd5dV5oDwiHWxmRL62fqbtgT3xP7Xbx9zLJPB8
	yqu2onnGxpxVF1tQ+WFn35h80Mt0U+J6XpD7U9fAU/3TRWlmU7a52Mp2EQbmloDdoqH
	IdGqazzy5uYjDZ4IApgSGWRcpRYD0jz03mWic13Q=
Content-Type: multipart/mixed; boundary="===============6334459251621352353=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.23.2 FAILED
Message-ID: 
 <01010181200fe982-5a51f32f-b11d-4953-9259-eb139ad672e8-000000@us-west-2.amazonses.com>
Date: Wed, 1 Jun 2022 16:18:42 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:18:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166402

--===============6334459251621352353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.23.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.23.1-3.23.2.patch
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
--===============6334459251621352353==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.23.1-3.23.2.patch"

From a283fa07882ff32d4ad0d9aaa7ec99b68d3731e5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Jun 2022 07:14:08 +0000
Subject: [PATCH] cmake: upgrade 3.23.1 -> 3.23.2

---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 ...stem-use-oe-environment-vars-to-load.patch |  2 +-
 .../cmake/cmake/OEToolchainConfig.cmake       | 24 --------------
 .../cmake/SDKToolchainConfig.cmake.template   | 31 -----------------
 .../cmake/cmake/cmake-setup.py                | 33 -------------------
 .../cmake/cmake/environment.d-cmake.sh        |  2 --
 .../{cmake_3.23.1.bb => cmake_3.23.2.bb}      | 13 +++-----
 7 files changed, 7 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
 delete mode 100644 meta/recipes-devtools/cmake/cmake/SDKToolchainConfig.cmake.template
 delete mode 100755 meta/recipes-devtools/cmake/cmake/cmake-setup.py
 delete mode 100644 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
 rename meta/recipes-devtools/cmake/{cmake_3.23.1.bb => cmake_3.23.2.bb} (86%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 934d577acf..4a6884e871 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3"
+SRC_URI[sha256sum] = "f316b40053466f9a416adf981efda41b160ca859e97f6a484b447ea299ff26aa"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 9a2287f517..2f03ed31c9 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From 89f6c846f02ad6d30b9ebb7eaaaa4fb6f9cec054 Mon Sep 17 00:00:00 2001
+From a2c8493986f7f01593d9b37dac259ddf3acbcf9c Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/cmake/cmake_3.23.1.bb b/meta/recipes-devtools/cmake/cmake_3.23.2.bb
similarity index 86%
rename from meta/recipes-devtools/cmake/cmake_3.23.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.23.2.bb
index bb7ed83e30..f26bd0afb7 100644
--- a/meta/recipes-devtools/cmake/cmake_3.23.1.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.23.2.bb
@@ -4,14 +4,6 @@ inherit cmake bash-completion
 
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
-SRC_URI:append:class-nativesdk = " \
-    file://OEToolchainConfig.cmake \
-    file://SDKToolchainConfig.cmake.template \
-    file://cmake-setup.py \
-    file://environment.d-cmake.sh \
-    file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
-"
-
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
@@ -34,6 +26,11 @@ python () {
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
2.31.1


--===============6334459251621352353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.23.1.bb: Unable to get checksum for cmake-native SRC_URI entry OEToolchainConfig.cmake: file could not be found
done.
Parsing of 883 .bb files complete (881 cached, 2 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-780a5b66a51cab425a5cabb48f9d07672f1841bf"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:780a5b66a51cab425a5cabb48f9d07672f1841bf"
workspace            = "master:95066dde6861ee08fdb505ab3e0422156cc24fae"

Initialising tasks...done.
Sstate summary: Wanted 46 Local 34 Mirrors 0 Missed 12 Current 181 (73% match, 94% complete)
Removing 1 stale sstate objects for arch core2-32...done.
Removing 2 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 199 of 227 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 668 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.23.1.bb:do_fetch)
NOTE: Running task 752 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.2.bb:do_fetch)
NOTE: recipe cmake-native-3.23.1-r0: task do_fetch: Started
WARNING: cmake-native-3.23.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.23.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz_bad-checksum_33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3
NOTE: recipe cmake-3.23.2-r0: task do_fetch: Started
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-3.23.2-r0: task do_fetch: Succeeded
NOTE: Running task 844 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.2.bb:do_unpack)
NOTE: recipe expat-2.4.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 845 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_fetch)
NOTE: recipe cmake-3.23.2-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_fetch: Started
NOTE: recipe expat-2.4.8-r0: task do_fetch: Succeeded
NOTE: Running task 846 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_unpack)
NOTE: recipe expat-2.4.8-r0: task do_unpack: Started
NOTE: recipe expat-2.4.8-r0: task do_unpack: Succeeded
NOTE: Running task 847 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_patch)
NOTE: recipe expat-2.4.8-r0: task do_patch: Started
NOTE: recipe expat-2.4.8-r0: task do_patch: Succeeded
NOTE: Running task 848 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_generate_toolchain_file)
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.8-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe cmake-3.23.2-r0: task do_unpack: Succeeded
NOTE: Running task 850 of 881 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.2.bb:do_patch)
NOTE: recipe cmake-3.23.2-r0: task do_patch: Started
WARNING: cmake-native-3.23.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.23.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz_bad-checksum_33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3
NOTE: recipe cmake-3.23.2-r0: task do_patch: Failed
WARNING: cmake-native-3.23.1-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.23/cmake-3.23.1.tar.gz - will attempt other sources if available
WARNING: cmake-native-3.23.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.23.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz_bad-checksum_33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3
NOTE: recipe cmake-native-3.23.1-r0: task do_fetch: Failed
NOTE: Tasks Summary: Attempted 850 tasks of which 842 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.2.bb:do_patch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.23.1.bb:do_fetch
Summary: There were 9 WARNING messages.
Summary: There were 3 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: cmake-3.23.2-r0 do_patch: Applying patch '0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.23.2-r0/cmake-3.23.2'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.23.2-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Patch 0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch is already applied; check your series file

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.23.2-r0/temp/log.do_patch.2601195
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.23.2.bb:do_patch) failed with exit code '1'
ERROR: cmake-native-3.23.1-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.23/cmake-3.23.1.tar.gz
ERROR: cmake-native-3.23.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.23.1.tar.gz\' has sha256 checksum \'33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3\' when \'f316b40053466f9a416adf981efda41b160ca859e97f6a484b447ea299ff26aa\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "33fd10a8ec687a4d0d5b42473f10459bb92b3ae7def2b745dc10b192760869f3"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.23/cmake-3.23.1.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.23.1-r0/temp/log.do_fetch.2601081
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.23.1.bb:do_fetch) failed with exit code '1'

--===============6334459251621352353==--

