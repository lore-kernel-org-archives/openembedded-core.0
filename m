Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.32501.1624189110246056103
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 04:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8926638C0912
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 11:38:29 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.20.4 FAILED
Message-ID: <MADEUP.168A4763FB3B65CA.15584@lists.openembedded.org>
X-Groupsio-MsgNum: 153101
Content-Type: multipart/mixed; boundary="===============8541327309583139876=="

--===============8541327309583139876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.20.4* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.20.3-3.20.4.patch
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

--===============8541327309583139876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1455 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb: Unable to get checksum for cmake-native SRC_URI entry OEToolchainConfig.cmake: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb: Unable to get checksum for cmake-native SRC_URI entry environment.d-cmake.sh: file could not be found
done.
Parsing of 818 .bb files complete (816 cached, 2 parsed). 1455 targets, 32 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-26551bf2a826462ec9179949f78093d5b717e1b3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:26551bf2a826462ec9179949f78093d5b717e1b3"
workspace            = "master:f585bf4c959ae0b52be8462d278cd289db79b813"

Initialising tasks...done.
Sstate summary: Wanted 75 Local 5 Network 0 Missed 70 Current 683 (6% match, 90% complete)
Removing 42 stale sstate objects for arch core2-32...done.
Removing 6 stale sstate objects for arch x86_64...done.
Removing 15 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 730 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb:do_fetch)
NOTE: recipe cmake-native-3.20.3-r0: task do_fetch: Started
WARNING: cmake-native-3.20.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.20.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz_bad-checksum_4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8
NOTE: Running task 1682 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.20.4.bb:do_fetch)
NOTE: recipe cmake-3.20.4-r0: task do_fetch: Started
NOTE: recipe cmake-3.20.4-r0: task do_fetch: Succeeded
NOTE: Running task 2122 of 2402 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.20.4.bb:do_unpack)
NOTE: recipe cmake-3.20.4-r0: task do_unpack: Started
WARNING: cmake-native-3.20.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.20.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz_bad-checksum_4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8
WARNING: cmake-native-3.20.3-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.20/cmake-3.20.3.tar.gz - will attempt other sources if available
WARNING: cmake-native-3.20.3-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.20.3-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz_bad-checksum_4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8
ERROR: cmake-native-3.20.3-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.20/cmake-3.20.3.tar.gz
ERROR: cmake-native-3.20.3-r0 do_fetch: Fetcher failure for URL: 'https://cmake.org/files/v3.20/cmake-3.20.3.tar.gz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.20.3.tar.gz' has sha256 checksum '4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8' when '87a4060298f2c6bb09d479de1400bc78195a5b55a65622a7dceeb3d1090a1b16' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.20.3-r0/temp/log.do_fetch.42403
NOTE: recipe cmake-native-3.20.3-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb:do_fetch) failed with exit code '1'
NOTE: recipe cmake-3.20.4-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 2228 tasks of which 2225 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb:do_fetch
Summary: There were 9 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============8541327309583139876==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.20.3-3.20.4.patch"

From 17352c96ebbfcae603482d0f6263c1770f548939 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Jun 2021 06:33:11 +0000
Subject: [PATCH] cmake: upgrade 3.20.3 -> 3.20.4

---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 ...stem-use-oe-environment-vars-to-load.patch |  2 +-
 .../cmake/cmake/OEToolchainConfig.cmake       | 25 -------------------
 .../cmake/cmake/environment.d-cmake.sh        |  2 --
 .../{cmake_3.20.3.bb => cmake_3.20.4.bb}      | 10 ++++----
 5 files changed, 7 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
 delete mode 100644 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
 rename meta/recipes-devtools/cmake/{cmake_3.20.3.bb => cmake_3.20.4.bb} (81%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 0987c01c87..cf2cd0c2fa 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
+SRC_URI[sha256sum] = "87a4060298f2c6bb09d479de1400bc78195a5b55a65622a7dceeb3d1090a1b16"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 9609f5f7c2..ac3484c61d 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From e75f76b00cc9c1cfc231c5e731e975552f5dd13e Mon Sep 17 00:00:00 2001
+From 4806e832200251528ba59bbf59b961fe97294a5d Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
deleted file mode 100644
index 8f6f3a272d..0000000000
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ /dev/null
@@ -1,25 +0,0 @@
-set( CMAKE_SYSTEM_NAME Linux )
-set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
-set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
-set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
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
diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
deleted file mode 100644
index 7bdb19fb6c..0000000000
--- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-export OE_CMAKE_TOOLCHAIN_FILE="$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
-export OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX="`echo $OECORE_BASELIB | sed -e s/lib//`"
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.3.bb b/meta/recipes-devtools/cmake/cmake_3.20.4.bb
similarity index 81%
rename from meta/recipes-devtools/cmake/cmake_3.20.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.20.4.bb
index 64c92b89f2..0ac81cad89 100644
--- a/meta/recipes-devtools/cmake/cmake_3.20.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.20.4.bb
@@ -4,11 +4,11 @@ inherit cmake bash-completion
 
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
-SRC_URI_append_class-nativesdk = " \
-    file://OEToolchainConfig.cmake \
-    file://environment.d-cmake.sh \
-    file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
-"
+SRC_URI += "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
+           file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
+           file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
+           "
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
2.20.1


--===============8541327309583139876==--
