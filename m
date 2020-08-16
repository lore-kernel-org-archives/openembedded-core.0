Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.19880.1597558949544786959
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68FEAE0203B; Sat, 15 Aug 2020 23:22:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A79CDE02084
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:44 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wpebackend-fdo: upgrading to 1.7.1 FAILED
Message-Id: <20200816062229.68FEAE0203B@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:29 -0700 (PDT)
X-Groupsio-MsgNum: 141518
Content-Type: multipart/mixed; boundary="===============8347812628265556375=="

--===============8347812628265556375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wpebackend-fdo* to *1.7.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-wpebackend-fdo-upgrade-1.6.1-1.7.1.patch
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

--===============8347812628265556375==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-wpebackend-fdo-upgrade-1.6.1-1.7.1.patch"

From 146de886f58157d5ba482576c4ad46eb486b8c7d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 05:22:07 +0000
Subject: [PATCH] wpebackend-fdo: upgrade 1.6.1 -> 1.7.1

---
 .../webkit/{wpebackend-fdo_1.6.1.bb => wpebackend-fdo_1.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-sato/webkit/{wpebackend-fdo_1.6.1.bb => wpebackend-fdo_1.7.1.bb} (85%)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
similarity index 85%
rename from meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb
rename to meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
index 2fdab42c38..df057092e3 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.6.1.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb
@@ -13,5 +13,5 @@ inherit cmake features_check
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "740eee3327acfb462b8460519a219e30dc0a870326e88e2ddc4fe2c8de20b1c9"
+SRC_URI[sha256sum] = "9b980a73ea4e3762266c48f81ded56d9dcad4acf32bad9bd05d0dffdd454c6f5"
 
-- 
2.17.1


--===============8347812628265556375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1342 entries from dependency cache.
Parsing recipes...done.
Parsing of 778 .bb files complete (777 cached, 1 parsed). 1342 targets, 33 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200816"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9606244567de0f29cdf25a8bd59c4270c6596715"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 225 Found 217 Missed 8 Current 571 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1673 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_fetch)
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_fetch: Started
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 2029 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_unpack)
NOTE: Running task 2030 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_unpack: Started
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2448 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_patch)
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_patch: Started
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 2449 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_generate_toolchain_file)
NOTE: Running task 2450 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2451 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_populate_lic)
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_populate_lic: Started
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2452 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_configure)
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_populate_lic: Succeeded
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_configure: Started
ERROR: wpebackend-fdo-1.7.1-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/temp/run.do_configure.4646' failed with exit code 1:
-- The C compiler identification is GNU 10.1.0
-- The CXX compiler identification is GNU 10.1.0
-- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc
-- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++
-- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Performing Test CXX_HAS_FLAG_-fno-exceptions
-- Performing Test CXX_HAS_FLAG_-fno-exceptions - Success
-- Performing Test CXX_HAS_FLAG_-fno-rtti
-- Performing Test CXX_HAS_FLAG_-fno-rtti - Success
-- Performing Test CXX_HAS_FLAG_-Wall
-- Performing Test CXX_HAS_FLAG_-Wall - Success
-- Performing Test CC_HAS_FLAG_-Wall
-- Performing Test CC_HAS_FLAG_-Wall - Success
-- Found PkgConfig: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2") 
-- Checking for module 'epoxy'
--   No package 'epoxy' found
-- Could NOT find EPOXY (missing: EPOXY_LIBRARY EPOXY_INCLUDE_DIR) 
-- Found GLIB: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/include/glib-2.0;/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/lib/glib-2.0/include (found version "2.64.4") 
-- Checking for module 'wayland-client'
--   Found wayland-client, version 1.18.0
-- Checking for module 'wayland-server'
--   Found wayland-server, version 1.18.0
-- Checking for module 'wayland-egl'
--   Found wayland-egl, version 18.1.0
-- Found Wayland: 1.18.0  found components: client server egl 
-- Found WAYLAND_SCANNER: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/wayland-scanner  
-- Checking for module 'wpe-1.0'
--   Found wpe-1.0, version 1.7.1
-- Found WPE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/lib/libwpe-1.0.so (Required is at least version "1.5.90") 
-- Configuring done
CMake Error at CMakeLists.txt:181 (add_library):
  Target "WPEBackend-fdo" links to target "Epoxy::libepoxy" but the target
  was not found.  Perhaps a find_package() call is missing for an IMPORTED
  target, or an ALIAS target is missing?


-- Generating done
CMake Warning:
  Manually-specified variables were not used by the project:

    LIB_SUFFIX
    PYTHON_EXECUTABLE
    Python3_EXECUTABLE
    Python_EXECUTABLE


CMake Generate step failed.  Build files cannot be regenerated correctly.
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/temp/log.do_configure.4646
Log data follows:
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 10.1.0
| -- The CXX compiler identification is GNU 10.1.0
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Performing Test CXX_HAS_FLAG_-fno-exceptions
| -- Performing Test CXX_HAS_FLAG_-fno-exceptions - Success
| -- Performing Test CXX_HAS_FLAG_-fno-rtti
| -- Performing Test CXX_HAS_FLAG_-fno-rtti - Success
| -- Performing Test CXX_HAS_FLAG_-Wall
| -- Performing Test CXX_HAS_FLAG_-Wall - Success
| -- Performing Test CC_HAS_FLAG_-Wall
| -- Performing Test CC_HAS_FLAG_-Wall - Success
| -- Found PkgConfig: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
| -- Checking for module 'epoxy'
| --   No package 'epoxy' found
| -- Could NOT find EPOXY (missing: EPOXY_LIBRARY EPOXY_INCLUDE_DIR)
| -- Found GLIB: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/include/glib-2.0;/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/lib/glib-2.0/include (found version "2.64.4")
| -- Checking for module 'wayland-client'
| --   Found wayland-client, version 1.18.0
| -- Checking for module 'wayland-server'
| --   Found wayland-server, version 1.18.0
| -- Checking for module 'wayland-egl'
| --   Found wayland-egl, version 18.1.0
| -- Found Wayland: 1.18.0  found components: client server egl
| -- Found WAYLAND_SCANNER: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/wayland-scanner
| -- Checking for module 'wpe-1.0'
| --   Found wpe-1.0, version 1.7.1
| -- Found WPE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/lib/libwpe-1.0.so (Required is at least version "1.5.90")
| -- Configuring done
| CMake Error at CMakeLists.txt:181 (add_library):
|   Target "WPEBackend-fdo" links to target "Epoxy::libepoxy" but the target
|   was not found.  Perhaps a find_package() call is missing for an IMPORTED
|   target, or an ALIAS target is missing?
| 
| 
| -- Generating done
| CMake Warning:
|   Manually-specified variables were not used by the project:
| 
|     LIB_SUFFIX
|     PYTHON_EXECUTABLE
|     Python3_EXECUTABLE
|     Python_EXECUTABLE
| 
| 
| CMake Generate step failed.  Build files cannot be regenerated correctly.
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/temp/run.do_configure.4646' failed with exit code 1:
| -- The C compiler identification is GNU 10.1.0
| -- The CXX compiler identification is GNU 10.1.0
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - works
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - works
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Performing Test CXX_HAS_FLAG_-fno-exceptions
| -- Performing Test CXX_HAS_FLAG_-fno-exceptions - Success
| -- Performing Test CXX_HAS_FLAG_-fno-rtti
| -- Performing Test CXX_HAS_FLAG_-fno-rtti - Success
| -- Performing Test CXX_HAS_FLAG_-Wall
| -- Performing Test CXX_HAS_FLAG_-Wall - Success
| -- Performing Test CC_HAS_FLAG_-Wall
| -- Performing Test CC_HAS_FLAG_-Wall - Success
| -- Found PkgConfig: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/pkg-config (found version "0.29.2")
| -- Checking for module 'epoxy'
| --   No package 'epoxy' found
| -- Could NOT find EPOXY (missing: EPOXY_LIBRARY EPOXY_INCLUDE_DIR)
| -- Found GLIB: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/include/glib-2.0;/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/lib/glib-2.0/include (found version "2.64.4")
| -- Checking for module 'wayland-client'
| --   Found wayland-client, version 1.18.0
| -- Checking for module 'wayland-server'
| --   Found wayland-server, version 1.18.0
| -- Checking for module 'wayland-egl'
| --   Found wayland-egl, version 18.1.0
| -- Found Wayland: 1.18.0  found components: client server egl
| -- Found WAYLAND_SCANNER: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot-native/usr/bin/wayland-scanner
| -- Checking for module 'wpe-1.0'
| --   Found wpe-1.0, version 1.7.1
| -- Found WPE: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/wpebackend-fdo/1.7.1-r0/recipe-sysroot/usr/lib/libwpe-1.0.so (Required is at least version "1.5.90")
| -- Configuring done
| CMake Error at CMakeLists.txt:181 (add_library):
|   Target "WPEBackend-fdo" links to target "Epoxy::libepoxy" but the target
|   was not found.  Perhaps a find_package() call is missing for an IMPORTED
|   target, or an ALIAS target is missing?
| 
| 
| -- Generating done
| CMake Warning:
|   Manually-specified variables were not used by the project:
| 
|     LIB_SUFFIX
|     PYTHON_EXECUTABLE
|     Python3_EXECUTABLE
|     Python_EXECUTABLE
| 
| 
| CMake Generate step failed.  Build files cannot be regenerated correctly.
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe wpebackend-fdo-1.7.1-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2452 tasks of which 2444 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/wpebackend-fdo_1.7.1.bb:do_configure
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============8347812628265556375==--
