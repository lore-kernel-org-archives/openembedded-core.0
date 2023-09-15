Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADCDEED639
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.29482.1694804396040014687
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VrDQRv+T;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hRvo+dmJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018a9a36c498-992f33e7-ffef-4f59-aa06-4d5a074e36a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/XJfHzwo3p40ocDcZMIEDoN66gi3m3VdK95hmhAyH6A=;
	b=VrDQRv+Tx7D8xcWUgrTtaM26T4RxLzcfcqQGZfhXj2O5nODe5IFxVu+NylPctnpm
	58ANpAONjTKMn0gAYNuTgqw3z96KSxxtqKYpU5q29A4mz3dEstbqtf29VnOIpBjqf37
	aIM2c911fWOMkgW+hJm0TW+0ZPs9tl0oSohJMSgM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/XJfHzwo3p40ocDcZMIEDoN66gi3m3VdK95hmhAyH6A=;
	b=hRvo+dmJnKD9FhT8ntp5LTLFCxIVzXk1Fxh4BhG6tCmNS5DK85mPnR3a78wUZw3V
	PzvJD4HYb0+WM1vXJwqE6a8J2NG6X1qwIVu18hQZ7PhyOwCNIIdup+rWfkSRGg+ZDGo
	1G9pYFr6Cr8ZoK69qKCsDgjNIOsuwrSuF0i1t9eE=
Content-Type: multipart/mixed; boundary="===============8004202711147848074=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.261.1 FAILED
Message-ID: <0101018a9a36c498-992f33e7-ffef-4f59-aa06-4d5a074e36a7-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187757

--===============8004202711147848074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.261.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.250.0-1.3.261.1.patch
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

-- >8 --
From 0e4405bf575d26c0797fc324fbea67b57959a550 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 15:52:13 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.250.0 -> 1.3.261.1

---
 ...ts.txt-do-not-make-special-arrangeme.patch | 29 -------------------
 ...1.3.250.0.bb => vulkan-tools_1.3.261.1.bb} |  6 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.250.0.bb => vulkan-tools_1.3.261.1.bb} (89%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch b/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
deleted file mode 100644
index 6b70a1e62d..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-tools/0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9060e916ca05d34b56c62f2be0b4a77dd104e2aa Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 2 Jun 2023 14:13:00 +0200
-Subject: [PATCH] scripts/CMakeLists.txt: append to CMAKE_FIND_ROOT_PATH
- instead of replacing it
-
-Resetting CMAKE_FIND_ROOT_PATH in particular breaks builds in Yocto
-(which is a major cross compiling framework).
-
-Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Tools/pull/808]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- scripts/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/CMakeLists.txt b/scripts/CMakeLists.txt
-index 5b979d43..19a58bf9 100644
---- a/scripts/CMakeLists.txt
-+++ b/scripts/CMakeLists.txt
-@@ -114,7 +114,7 @@ if (MOLTENVK_REPO_ROOT)
- endif()
- 
- if (CMAKE_CROSSCOMPILING)
--    set(CMAKE_FIND_ROOT_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
-+    set(CMAKE_FIND_ROOT_PATH ${CMAKE_FIND_ROOT_PATH} ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
- else()
-     set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} PARENT_SCOPE)
- endif()
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
index 0346b380ee..7a7edc9ebd 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
@@ -6,10 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https \
-           file://0001-scripts-CMakeLists.txt-do-not-make-special-arrangeme.patch \
-           "
-SRCREV = "695887a994ef9cc00a7aa3f9c00b31a56ea79534"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "a7da7027ca9fd0901639f02619c226da9c6036f1"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============8004202711147848074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-030c1f83f34b6baf15db34da3fb67944a9889828"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:030c1f83f34b6baf15db34da3fb67944a9889828"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 124 Local 114 Mirrors 0 Missed 10 Current 428 (91% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1439 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_recipe_qa)
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1531 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_fetch: Succeeded
NOTE: Running task 1532 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_unpack)
NOTE: Running task 1533 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_unpack: Succeeded
NOTE: Running task 1534 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_patch)
NOTE: Running task 1535 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_patch: Succeeded
NOTE: Running task 1536 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1537 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_generate_toolchain_file)
NOTE: Running task 1538 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1539 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_configure: Succeeded
NOTE: Running task 1540 of 1549 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build'
| 
| Run Build Command(s): ninja -v -j 56 all
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build -m32 -
 march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/
 1.3.261.1/build=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++14 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-tools/1.3.261.1/git/icd/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build -m32 -march=
 core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.26
 1.1/build=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++14 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-too
 ls/1.3.261.1/git/icd/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/mock_icd.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/mock_icd.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3208:31: error: 'VkPhysicalDeviceMaintenance5FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4FeaturesKHR'?
|  3208 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3208:70: error: template argument 1 is invalid
|  3208 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5FeaturesKHR> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3212:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR'?
|  3212 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3212:92: error: template argument 1 is invalid
|  3212 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3217:31: error: 'VkPhysicalDeviceMaintenance5PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4PropertiesKHR'?
|  3217 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5PropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3217:72: error: template argument 1 is invalid
|  3217 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5PropertiesKHR> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3221:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR'?
|  3221 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3221:94: error: template argument 1 is invalid
|  3221 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR> {
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3226:31: error: 'VkRenderingAreaInfoKHR' was not declared in this scope; did you mean 'VkRenderingInfoKHR'?
|  3226 | template <> struct LvlTypeMap<VkRenderingAreaInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3226:53: error: template argument 1 is invalid
|  3226 | template <> struct LvlTypeMap<VkRenderingAreaInfoKHR> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3230:32: error: 'VK_STRUCTURE_TYPE_RENDERING_AREA_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_INFO_KHR'?
|  3230 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_AREA_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3230:73: error: template argument 1 is invalid
|  3230 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_AREA_INFO_KHR> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3235:31: error: 'VkImageSubresource2KHR' was not declared in this scope; did you mean 'VkImageSubresource2EXT'?
|  3235 | template <> struct LvlTypeMap<VkImageSubresource2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
|       |                               VkImageSubresource2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3235:53: error: template argument 1 is invalid
|  3235 | template <> struct LvlTypeMap<VkImageSubresource2KHR> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3239:32: error: 'VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_EXT'?
|  3239 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3239:73: error: template argument 1 is invalid
|  3239 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3244:31: error: 'VkDeviceImageSubresourceInfoKHR' was not declared in this scope
|  3244 | template <> struct LvlTypeMap<VkDeviceImageSubresourceInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3244:62: error: template argument 1 is invalid
|  3244 | template <> struct LvlTypeMap<VkDeviceImageSubresourceInfoKHR> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3248:32: error: 'VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_PICTURE_RESOURCE_INFO_KHR'?
|  3248 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_PICTURE_RESOURCE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3248:83: error: template argument 1 is invalid
|  3248 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO_KHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3253:31: error: 'VkSubresourceLayout2KHR' was not declared in this scope; did you mean 'VkSubresourceLayout2EXT'?
|  3253 | template <> struct LvlTypeMap<VkSubresourceLayout2KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSubresourceLayout2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3253:54: error: template argument 1 is invalid
|  3253 | template <> struct LvlTypeMap<VkSubresourceLayout2KHR> {
|       |                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3257:32: error: 'VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_EXT'?
|  3257 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3257:74: error: template argument 1 is invalid
|  3257 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3262:31: error: 'VkPipelineCreateFlags2CreateInfoKHR' was not declared in this scope; did you mean 'VkPipelineRenderingCreateInfoKHR'?
|  3262 | template <> struct LvlTypeMap<VkPipelineCreateFlags2CreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineRenderingCreateInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3262:66: error: template argument 1 is invalid
|  3262 | template <> struct LvlTypeMap<VkPipelineCreateFlags2CreateInfoKHR> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3266:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO_KHR'?
|  3266 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_RENDERING_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3266:89: error: template argument 1 is invalid
|  3266 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO_KHR> {
|       |                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3271:31: error: 'VkBufferUsageFlags2CreateInfoKHR' was not declared in this scope
|  3271 | template <> struct LvlTypeMap<VkBufferUsageFlags2CreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3271:63: error: template argument 1 is invalid
|  3271 | template <> struct LvlTypeMap<VkBufferUsageFlags2CreateInfoKHR> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3275:32: error: 'VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO_KHR'?
|  3275 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3275:86: error: template argument 1 is invalid
|  3275 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO_KHR> {
|       |                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3289:31: error: 'VkCooperativeMatrixPropertiesKHR' was not declared in this scope; did you mean 'VkCooperativeMatrixPropertiesNV'?
|  3289 | template <> struct LvlTypeMap<VkCooperativeMatrixPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3289:63: error: template argument 1 is invalid
|  3289 | template <> struct LvlTypeMap<VkCooperativeMatrixPropertiesKHR> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3293:32: error: 'VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  3293 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3293:83: error: template argument 1 is invalid
|  3293 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_KHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3298:31: error: 'VkPhysicalDeviceCooperativeMatrixFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixFeaturesNV'?
|  3298 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrixFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCooperativeMatrixFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3298:75: error: template argument 1 is invalid
|  3298 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrixFeaturesKHR> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3302:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV'?
|  3302 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3302:97: error: template argument 1 is invalid
|  3302 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR> {
|       |                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3307:31: error: 'VkPhysicalDeviceCooperativeMatrixPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  3307 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrixPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3307:77: error: template argument 1 is invalid
|  3307 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrixPropertiesKHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3311:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  3311 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:3311:99: error: template argument 1 is invalid
|  3311 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5231:31: error: 'VkPhysicalDeviceHostImageCopyFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  5231 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5231:71: error: template argument 1 is invalid
|  5231 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyFeaturesEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5235:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  5235 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5235:94: error: template argument 1 is invalid
|  5235 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT> {
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5240:31: error: 'VkPhysicalDeviceHostImageCopyPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderPropertiesEXT'?
|  5240 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMeshShaderPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5240:73: error: template argument 1 is invalid
|  5240 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyPropertiesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5244:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT'?
|  5244 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5244:96: error: template argument 1 is invalid
|  5244 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5249:31: error: 'VkMemoryToImageCopyEXT' was not declared in this scope
|  5249 | template <> struct LvlTypeMap<VkMemoryToImageCopyEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5249:53: error: template argument 1 is invalid
|  5249 | template <> struct LvlTypeMap<VkMemoryToImageCopyEXT> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5253:32: error: 'VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2'?
|  5253 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_IMAGE_COPY_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5253:74: error: template argument 1 is invalid
|  5253 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY_EXT> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5258:31: error: 'VkImageToMemoryCopyEXT' was not declared in this scope
|  5258 | template <> struct LvlTypeMap<VkImageToMemoryCopyEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5258:53: error: template argument 1 is invalid
|  5258 | template <> struct LvlTypeMap<VkImageToMemoryCopyEXT> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5262:32: error: 'VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER'?
|  5262 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5262:74: error: template argument 1 is invalid
|  5262 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY_EXT> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5267:31: error: 'VkCopyMemoryToImageInfoEXT' was not declared in this scope; did you mean 'VkCopyMemoryToMicromapInfoEXT'?
|  5267 | template <> struct LvlTypeMap<VkCopyMemoryToImageInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyMemoryToMicromapInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5267:57: error: template argument 1 is invalid
|  5267 | template <> struct LvlTypeMap<VkCopyMemoryToImageInfoEXT> {
|       |                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5271:32: error: 'VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_MEMORY_TO_MICROMAP_INFO_EXT'?
|  5271 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_MEMORY_TO_MICROMAP_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5271:79: error: template argument 1 is invalid
|  5271 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO_EXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5276:31: error: 'VkCopyImageToMemoryInfoEXT' was not declared in this scope; did you mean 'VkCopyMicromapToMemoryInfoEXT'?
|  5276 | template <> struct LvlTypeMap<VkCopyImageToMemoryInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyMicromapToMemoryInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5276:57: error: template argument 1 is invalid
|  5276 | template <> struct LvlTypeMap<VkCopyImageToMemoryInfoEXT> {
|       |                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5280:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_MICROMAP_TO_MEMORY_INFO_EXT'?
|  5280 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_MICROMAP_TO_MEMORY_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5280:79: error: template argument 1 is invalid
|  5280 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO_EXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5285:31: error: 'VkCopyImageToImageInfoEXT' was not declared in this scope; did you mean 'VkCopyImageToBufferInfo2'?
|  5285 | template <> struct LvlTypeMap<VkCopyImageToImageInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyImageToBufferInfo2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5285:56: error: template argument 1 is invalid
|  5285 | template <> struct LvlTypeMap<VkCopyImageToImageInfoEXT> {
|       |                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5289:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2'?
|  5289 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5289:78: error: template argument 1 is invalid
|  5289 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO_EXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5294:31: error: 'VkHostImageLayoutTransitionInfoEXT' was not declared in this scope
|  5294 | template <> struct LvlTypeMap<VkHostImageLayoutTransitionInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5294:65: error: template argument 1 is invalid
|  5294 | template <> struct LvlTypeMap<VkHostImageLayoutTransitionInfoEXT> {
|       |                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5298:32: error: 'VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLE_LOCATIONS_INFO_EXT'?
|  5298 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLE_LOCATIONS_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5298:87: error: template argument 1 is invalid
|  5298 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO_EXT> {
|       |                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5303:31: error: 'VkSubresourceHostMemcpySizeEXT' was not declared in this scope
|  5303 | template <> struct LvlTypeMap<VkSubresourceHostMemcpySizeEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5303:61: error: template argument 1 is invalid
|  5303 | template <> struct LvlTypeMap<VkSubresourceHostMemcpySizeEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5307:32: error: 'VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_EXT'?
|  5307 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5307:82: error: template argument 1 is invalid
|  5307 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE_EXT> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5312:31: error: 'VkHostImageCopyDevicePerformanceQueryEXT' was not declared in this scope
|  5312 | template <> struct LvlTypeMap<VkHostImageCopyDevicePerformanceQueryEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5312:71: error: template argument 1 is invalid
|  5312 | template <> struct LvlTypeMap<VkHostImageCopyDevicePerformanceQueryEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5316:32: error: 'VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT'?
|  5316 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5316:94: error: template argument 1 is invalid
|  5316 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY_EXT> {
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5528:31: error: 'VkPhysicalDeviceDepthBiasControlFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  5528 | template <> struct LvlTypeMap<VkPhysicalDeviceDepthBiasControlFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDepthClipControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5528:74: error: template argument 1 is invalid
|  5528 | template <> struct LvlTypeMap<VkPhysicalDeviceDepthBiasControlFeaturesEXT> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5532:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT'?
|  5532 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5532:97: error: template argument 1 is invalid
|  5532 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT> {
|       |                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5537:31: error: 'VkDepthBiasInfoEXT' was not declared in this scope
|  5537 | template <> struct LvlTypeMap<VkDepthBiasInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5537:49: error: template argument 1 is invalid
|  5537 | template <> struct LvlTypeMap<VkDepthBiasInfoEXT> {
|       |                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5541:32: error: 'VK_STRUCTURE_TYPE_DEPTH_BIAS_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT'?
|  5541 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEPTH_BIAS_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5541:69: error: template argument 1 is invalid
|  5541 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEPTH_BIAS_INFO_EXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5546:31: error: 'VkDepthBiasRepresentationInfoEXT' was not declared in this scope
|  5546 | template <> struct LvlTypeMap<VkDepthBiasRepresentationInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5546:63: error: template argument 1 is invalid
|  5546 | template <> struct LvlTypeMap<VkDepthBiasRepresentationInfoEXT> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5550:32: error: 'VK_STRUCTURE_TYPE_DEPTH_BIAS_REPRESENTATION_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODE_INFO_EXT'?
|  5550 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEPTH_BIAS_REPRESENTATION_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_MODE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:5550:84: error: template argument 1 is invalid
|  5550 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEPTH_BIAS_REPRESENTATION_INFO_EXT> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6933:31: error: 'VkPhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  6933 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6933:87: error: template argument 1 is invalid
|  6933 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceGeneratedCommandsComputeFeaturesNV> {
|       |                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6937:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_COMPUTE_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV'?
|  6937 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_COMPUTE_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6937:111: error: template argument 1 is invalid
|  6937 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_COMPUTE_FEATURES_NV> {
|       |                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6942:31: error: 'VkComputePipelineIndirectBufferInfoNV' was not declared in this scope; did you mean 'VkComputePipelineCreateInfo'?
|  6942 | template <> struct LvlTypeMap<VkComputePipelineIndirectBufferInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkComputePipelineCreateInfo
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6942:68: error: template argument 1 is invalid
|  6942 | template <> struct LvlTypeMap<VkComputePipelineIndirectBufferInfoNV> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6946:32: error: 'VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_INDIRECT_BUFFER_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO'?
|  6946 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_INDIRECT_BUFFER_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6946:90: error: template argument 1 is invalid
|  6946 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COMPUTE_PIPELINE_INDIRECT_BUFFER_INFO_NV> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6951:31: error: 'VkPipelineIndirectDeviceAddressInfoNV' was not declared in this scope
|  6951 | template <> struct LvlTypeMap<VkPipelineIndirectDeviceAddressInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6951:68: error: template argument 1 is invalid
|  6951 | template <> struct LvlTypeMap<VkPipelineIndirectDeviceAddressInfoNV> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6955:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_INDIRECT_DEVICE_ADDRESS_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_GET_REMOTE_ADDRESS_INFO_NV'?
|  6955 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_INDIRECT_DEVICE_ADDRESS_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_GET_REMOTE_ADDRESS_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:6955:90: error: template argument 1 is invalid
|  6955 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_INDIRECT_DEVICE_ADDRESS_INFO_NV> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7005:31: error: 'VkExternalMemoryAcquireUnmodifiedEXT' was not declared in this scope
|  7005 | template <> struct LvlTypeMap<VkExternalMemoryAcquireUnmodifiedEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7005:67: error: template argument 1 is invalid
|  7005 | template <> struct LvlTypeMap<VkExternalMemoryAcquireUnmodifiedEXT> {
|       |                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7009:32: error: 'VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_ACQUIRE_UNMODIFIED_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV'?
|  7009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_ACQUIRE_UNMODIFIED_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7009:88: error: template argument 1 is invalid
|  7009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_ACQUIRE_UNMODIFIED_EXT> {
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7320:31: error: 'VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDynamicRenderingFeaturesKHR'?
|  7320 | template <> struct LvlTypeMap<VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDynamicRenderingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7320:91: error: template argument 1 is invalid
|  7320 | template <> struct LvlTypeMap<VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7324:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR'?
|  7324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7324:115: error: template argument 1 is invalid
|  7324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT> {
|       |                                                                                                                   ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:25,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/mock_icd.cpp:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:2441:11: error: 'VkRenderingAreaInfoKHR' does not name a type; did you mean 'VkRenderingInfoKHR'?
|  2441 |     const VkRenderingAreaInfoKHR*               pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:2446:11: error: 'VkDeviceImageSubresourceInfoKHR' does not name a type
|  2446 |     const VkDeviceImageSubresourceInfoKHR*      pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:2447:5: error: 'VkSubresourceLayout2KHR' has not been declared
|  2447 |     VkSubresourceLayout2KHR*                    pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:2452:11: error: 'VkImageSubresource2KHR' does not name a type; did you mean 'VkImageSubresource2EXT'?
|  2452 |     const VkImageSubresource2KHR*               pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:2453:5: error: 'VkSubresourceLayout2KHR' has not been declared
|  2453 |     VkSubresourceLayout2KHR*                    pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:2460:5: error: 'VkCooperativeMatrixPropertiesKHR' has not been declared
|  2460 |     VkCooperativeMatrixPropertiesKHR*           pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:3382:11: error: 'VkCopyMemoryToImageInfoEXT' does not name a type; did you mean 'VkCopyMemoryToMicromapInfoEXT'?
|  3382 |     const VkCopyMemoryToImageInfoEXT*           pCopyMemoryToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToMicromapInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:3386:11: error: 'VkCopyImageToMemoryInfoEXT' does not name a type; did you mean 'VkCopyMicromapToMemoryInfoEXT'?
|  3386 |     const VkCopyImageToMemoryInfoEXT*           pCopyImageToMemoryInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMicromapToMemoryInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:3390:11: error: 'VkCopyImageToImageInfoEXT' does not name a type; did you mean 'VkCopyImageToBufferInfo2'?
|  3390 |     const VkCopyImageToImageInfoEXT*            pCopyImageToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToBufferInfo2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:3395:11: error: 'VkHostImageLayoutTransitionInfoEXT' does not name a type
|  3395 |     const VkHostImageLayoutTransitionInfoEXT*   pTransitions);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:3400:11: error: 'VkImageSubresource2KHR' does not name a type; did you mean 'VkImageSubresource2EXT'?
|  3400 |     const VkImageSubresource2KHR*               pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:3401:5: error: 'VkSubresourceLayout2KHR' has not been declared
|  3401 |     VkSubresourceLayout2KHR*                    pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:3449:11: error: 'VkDepthBiasInfoEXT' does not name a type
|  3449 |     const VkDepthBiasInfoEXT*                   pDepthBiasInfo);
|       |           ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_declarations.h:3936:11: error: 'VkPipelineIndirectDeviceAddressInfoNV' does not name a type
|  3936 |     const VkPipelineIndirectDeviceAddressInfoNV* pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h: In function 'void vkmock::GetPhysicalDeviceFeatures2KHR(VkPhysicalDevice, VkPhysicalDeviceFeatures2*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:2901:62: error: 'VkPhysicalDeviceHostImageCopyFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  2901 |     const auto *host_image_copy_features = lvl_find_in_chain<VkPhysicalDeviceHostImageCopyFeaturesEXT>(pFeatures->pNext);
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:2901:103: error: no matching function for call to 'lvl_find_in_chain<<expression error> >(void*&)'
|  2901 |     const auto *host_image_copy_features = lvl_find_in_chain<VkPhysicalDeviceHostImageCopyFeaturesEXT>(pFeatures->pNext);
|       |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7628:32: note: candidate: 'template<class T> const T* lvl_find_in_chain(const void*)'
|  7628 | template <typename T> const T *lvl_find_in_chain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7628:32: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:2901:103: error: template argument 1 is invalid
|  2901 |     const auto *host_image_copy_features = lvl_find_in_chain<VkPhysicalDeviceHostImageCopyFeaturesEXT>(pFeatures->pNext);
|       |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h: In function 'void vkmock::GetPhysicalDeviceProperties2KHR(VkPhysicalDevice, VkPhysicalDeviceProperties2*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:3011:58: error: 'VkPhysicalDeviceHostImageCopyPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderPropertiesEXT'?
|  3011 |     auto *host_image_copy_props = lvl_find_mod_in_chain< VkPhysicalDeviceHostImageCopyPropertiesEXT>(pProperties->pNext);
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VkPhysicalDeviceMeshShaderPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:3011:101: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  3011 |     auto *host_image_copy_props = lvl_find_mod_in_chain< VkPhysicalDeviceHostImageCopyPropertiesEXT>(pProperties->pNext);
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7642:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  7642 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/vk_typemap_helper.h:7642:26: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:3011:101: error: template argument 1 is invalid
|  3011 |     auto *host_image_copy_props = lvl_find_mod_in_chain< VkPhysicalDeviceHostImageCopyPropertiesEXT>(pProperties->pNext);
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h: In function 'void vkmock::GetPhysicalDeviceFormatProperties2KHR(VkPhysicalDevice, VkFormat, VkFormatProperties2*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:3041:43: error: 'VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR'?
|  3041 |         props_3->optimalTilingFeatures |= VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT;
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4033:11: error: 'VkRenderingAreaInfoKHR' does not name a type; did you mean 'VkRenderingInfoKHR'?
|  4033 |     const VkRenderingAreaInfoKHR*               pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4041:11: error: 'VkDeviceImageSubresourceInfoKHR' does not name a type
|  4041 |     const VkDeviceImageSubresourceInfoKHR*      pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4042:5: error: 'VkSubresourceLayout2KHR' has not been declared
|  4042 |     VkSubresourceLayout2KHR*                    pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4050:11: error: 'VkImageSubresource2KHR' does not name a type; did you mean 'VkImageSubresource2EXT'?
|  4050 |     const VkImageSubresource2KHR*               pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4051:5: error: 'VkSubresourceLayout2KHR' has not been declared
|  4051 |     VkSubresourceLayout2KHR*                    pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4061:5: error: 'VkCooperativeMatrixPropertiesKHR' has not been declared
|  4061 |     VkCooperativeMatrixPropertiesKHR*           pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::GetPhysicalDeviceCooperativeMatrixPropertiesKHR(VkPhysicalDevice, uint32_t*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4067:24: error: request for member 'MSize' in '* pProperties', which is of non-class type 'int'
|  4067 |         pProperties[0].MSize = 16;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4068:24: error: request for member 'NSize' in '* pProperties', which is of non-class type 'int'
|  4068 |         pProperties[0].NSize = 16;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4069:24: error: request for member 'KSize' in '* pProperties', which is of non-class type 'int'
|  4069 |         pProperties[0].KSize = 16;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4070:24: error: request for member 'AType' in '* pProperties', which is of non-class type 'int'
|  4070 |         pProperties[0].AType = VK_COMPONENT_TYPE_UINT32_KHR;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4070:32: error: 'VK_COMPONENT_TYPE_UINT32_KHR' was not declared in this scope; did you mean 'VK_COMPONENT_TYPE_UINT32_NV'?
|  4070 |         pProperties[0].AType = VK_COMPONENT_TYPE_UINT32_KHR;
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_COMPONENT_TYPE_UINT32_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4071:24: error: request for member 'BType' in '* pProperties', which is of non-class type 'int'
|  4071 |         pProperties[0].BType = VK_COMPONENT_TYPE_UINT32_KHR;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4072:24: error: request for member 'CType' in '* pProperties', which is of non-class type 'int'
|  4072 |         pProperties[0].CType = VK_COMPONENT_TYPE_UINT32_KHR;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4073:24: error: request for member 'ResultType' in '* pProperties', which is of non-class type 'int'
|  4073 |         pProperties[0].ResultType = VK_COMPONENT_TYPE_UINT32_KHR;
|       |                        ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4074:24: error: request for member 'saturatingAccumulation' in '* pProperties', which is of non-class type 'int'
|  4074 |         pProperties[0].saturatingAccumulation = VK_FALSE;
|       |                        ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4075:24: error: request for member 'scope' in '* pProperties', which is of non-class type 'int'
|  4075 |         pProperties[0].scope = VK_SCOPE_DEVICE_KHR;
|       |                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:4075:32: error: 'VK_SCOPE_DEVICE_KHR' was not declared in this scope; did you mean 'VK_SCOPE_DEVICE_NV'?
|  4075 |         pProperties[0].scope = VK_SCOPE_DEVICE_KHR;
|       |                                ^~~~~~~~~~~~~~~~~~~
|       |                                VK_SCOPE_DEVICE_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:5502:11: error: 'VkCopyMemoryToImageInfoEXT' does not name a type; did you mean 'VkCopyMemoryToMicromapInfoEXT'?
|  5502 |     const VkCopyMemoryToImageInfoEXT*           pCopyMemoryToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToMicromapInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:5510:11: error: 'VkCopyImageToMemoryInfoEXT' does not name a type; did you mean 'VkCopyMicromapToMemoryInfoEXT'?
|  5510 |     const VkCopyImageToMemoryInfoEXT*           pCopyImageToMemoryInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMicromapToMemoryInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:5518:11: error: 'VkCopyImageToImageInfoEXT' does not name a type; did you mean 'VkCopyImageToBufferInfo2'?
|  5518 |     const VkCopyImageToImageInfoEXT*            pCopyImageToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToBufferInfo2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:5527:11: error: 'VkHostImageLayoutTransitionInfoEXT' does not name a type
|  5527 |     const VkHostImageLayoutTransitionInfoEXT*   pTransitions)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:5536:11: error: 'VkImageSubresource2KHR' does not name a type; did you mean 'VkImageSubresource2EXT'?
|  5536 |     const VkImageSubresource2KHR*               pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource2EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:5537:5: error: 'VkSubresourceLayout2KHR' has not been declared
|  5537 |     VkSubresourceLayout2KHR*                    pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:5612:11: error: 'VkDepthBiasInfoEXT' does not name a type
|  5612 |     const VkDepthBiasInfoEXT*                   pDepthBiasInfo)
|       |           ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/icd/generated/function_definitions.h:6363:11: error: 'VkPipelineIndirectDeviceAddressInfoNV' does not name a type
|  6363 |     const VkPipelineIndirectDeviceAddressInfoNV* pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-s
 ysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tool
 s/1.3.261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++14 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot
   -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build=/usr/src/debug/vulkan-tools/1.3.261.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.
 261.1/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++14 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/vulkaninfo.cpp:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkFormatString(VkFormat)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:360:15: error: 'VK_FORMAT_A1B5G5R5_UNORM_PACK16_KHR' was not declared in this scope; did you mean 'VK_FORMAT_A1R5G5B5_UNORM_PACK16'?
|   360 |         case (VK_FORMAT_A1B5G5R5_UNORM_PACK16_KHR): return "FORMAT_A1B5G5R5_UNORM_PACK16_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_A1R5G5B5_UNORM_PACK16
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:361:15: error: 'VK_FORMAT_A8_UNORM_KHR' was not declared in this scope; did you mean 'VK_FORMAT_R8_UNORM'?
|   361 |         case (VK_FORMAT_A8_UNORM_KHR): return "FORMAT_A8_UNORM_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R8_UNORM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkFormatFeatureFlagBits2GetStrings(VkFormatFeatureFlagBits2)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:754:9: error: 'VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR'?
|   754 |     if (VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT & value) strings.push_back("FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkImageUsageFlagBitsGetStrings(VkImageUsageFlagBits)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:809:9: error: 'VK_IMAGE_USAGE_HOST_TRANSFER_BIT_EXT' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_TRANSFER_DST_BIT'?
|   809 |     if (VK_IMAGE_USAGE_HOST_TRANSFER_BIT_EXT & value) strings.push_back("IMAGE_USAGE_HOST_TRANSFER_BIT_EXT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_TRANSFER_DST_BIT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1543:91: error: 'VkPhysicalDeviceCooperativeMatrixFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceCooperativeMatrixFeaturesNV'?
|  1543 | void DumpVkPhysicalDeviceCooperativeMatrixFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceCooperativeMatrixFeaturesKHR &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceCooperativeMatrixFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCooperativeMatrixFeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1546:63: error: request for member 'cooperativeMatrix' in 'obj', which is of non-class type 'const int'
|  1546 |     p.PrintKeyBool("cooperativeMatrix", static_cast<bool>(obj.cooperativeMatrix));
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1547:81: error: request for member 'cooperativeMatrixRobustBufferAccess' in 'obj', which is of non-class type 'const int'
|  1547 |     p.PrintKeyBool("cooperativeMatrixRobustBufferAccess", static_cast<bool>(obj.cooperativeMatrixRobustBufferAccess));
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1549:93: error: 'VkPhysicalDeviceCooperativeMatrixPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  1549 | void DumpVkPhysicalDeviceCooperativeMatrixPropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceCooperativeMatrixPropertiesKHR &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             VkPhysicalDeviceCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceCooperativeMatrixPropertiesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1551:71: error: request for member 'cooperativeMatrixSupportedStages' in 'obj', which is of non-class type 'const int'
|  1551 |     DumpVkShaderStageFlags(p, "cooperativeMatrixSupportedStages", obj.cooperativeMatrixSupportedStages);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1564:90: error: 'VkPhysicalDeviceDepthBiasControlFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  1564 | void DumpVkPhysicalDeviceDepthBiasControlFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceDepthBiasControlFeaturesEXT &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceDepthClipControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDepthBiasControlFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1567:62: error: request for member 'depthBiasControl' in 'obj', which is of non-class type 'const int'
|  1567 |     p.PrintKeyBool("depthBiasControl", static_cast<bool>(obj.depthBiasControl));
|       |                                                              ^~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1568:93: error: request for member 'leastRepresentableValueForceUnormRepresentation' in 'obj', which is of non-class type 'const int'
|  1568 |     p.PrintKeyBool("leastRepresentableValueForceUnormRepresentation", static_cast<bool>(obj.leastRepresentableValueForceUnormRepresentation));
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1569:65: error: request for member 'floatRepresentation' in 'obj', which is of non-class type 'const int'
|  1569 |     p.PrintKeyBool("floatRepresentation", static_cast<bool>(obj.floatRepresentation));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1570:60: error: request for member 'depthBiasExact' in 'obj', which is of non-class type 'const int'
|  1570 |     p.PrintKeyBool("depthBiasExact", static_cast<bool>(obj.depthBiasExact));
|       |                                                            ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1729:107: error: 'VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingFeaturesKHR'?
|  1729 | void DumpVkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT &obj) {
|       |                                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                           VkPhysicalDeviceDynamicRenderingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1732:79: error: request for member 'dynamicRenderingUnusedAttachments' in 'obj', which is of non-class type 'const int'
|  1732 |     p.PrintKeyBool("dynamicRenderingUnusedAttachments", static_cast<bool>(obj.dynamicRenderingUnusedAttachments));
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1965:87: error: 'VkPhysicalDeviceHostImageCopyFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  1965 | void DumpVkPhysicalDeviceHostImageCopyFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceHostImageCopyFeaturesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceHostImageCopyFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1968:59: error: request for member 'hostImageCopy' in 'obj', which is of non-class type 'const int'
|  1968 |     p.PrintKeyBool("hostImageCopy", static_cast<bool>(obj.hostImageCopy));
|       |                                                           ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1970:89: error: 'VkPhysicalDeviceHostImageCopyPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceMeshShaderPropertiesEXT'?
|  1970 | void DumpVkPhysicalDeviceHostImageCopyPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceHostImageCopyPropertiesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDeviceMeshShaderPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceHostImageCopyPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1973:47: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  1973 |     p.PrintKeyValue("copySrcLayoutCount", obj.copySrcLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1975:51: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  1975 |         ArrayWrapper arr(p,"pCopySrcLayouts", obj.copySrcLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1976:38: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  1976 |         for (uint32_t i = 0; i < obj.copySrcLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1977:21: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  1977 |             if (obj.pCopySrcLayouts != nullptr) {
|       |                     ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1979:61: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  1979 |                 DumpVkImageLayout(p, "pCopySrcLayouts", obj.pCopySrcLayouts[i]);
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1983:47: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  1983 |     p.PrintKeyValue("copyDstLayoutCount", obj.copyDstLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1985:51: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  1985 |         ArrayWrapper arr(p,"pCopyDstLayouts", obj.copyDstLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1986:38: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  1986 |         for (uint32_t i = 0; i < obj.copyDstLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1987:21: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  1987 |             if (obj.pCopyDstLayouts != nullptr) {
|       |                     ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1989:61: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  1989 |                 DumpVkImageLayout(p, "pCopyDstLayouts", obj.pCopyDstLayouts[i]);
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1993:52: error: request for member 'optimalTilingLayoutUUID' in 'obj', which is of non-class type 'const int'
|  1993 |     p.PrintKeyValue("optimalTilingLayoutUUID", obj.optimalTilingLayoutUUID);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:1994:77: error: request for member 'identicalMemoryTypeRequirements' in 'obj', which is of non-class type 'const int'
|  1994 |     p.PrintKeyBool("identicalMemoryTypeRequirements", static_cast<bool>(obj.identicalMemoryTypeRequirements));
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2236:86: error: 'VkPhysicalDeviceMaintenance5FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4FeaturesKHR'?
|  2236 | void DumpVkPhysicalDeviceMaintenance5FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceMaintenance5FeaturesKHR &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceMaintenance4FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance5FeaturesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2239:58: error: request for member 'maintenance5' in 'obj', which is of non-class type 'const int'
|  2239 |     p.PrintKeyBool("maintenance5", static_cast<bool>(obj.maintenance5));
|       |                                                          ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2241:88: error: 'VkPhysicalDeviceMaintenance5PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4PropertiesKHR'?
|  2241 | void DumpVkPhysicalDeviceMaintenance5PropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceMaintenance5PropertiesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceMaintenance4PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance5PropertiesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2244:97: error: request for member 'earlyFragmentMultisampleCoverageAfterSampleCounting' in 'obj', which is of non-class type 'const int'
|  2244 |     p.PrintKeyBool("earlyFragmentMultisampleCoverageAfterSampleCounting", static_cast<bool>(obj.earlyFragmentMultisampleCoverageAfterSampleCounting));
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2245:93: error: request for member 'earlyFragmentSampleMaskTestBeforeSampleCounting' in 'obj', which is of non-class type 'const int'
|  2245 |     p.PrintKeyBool("earlyFragmentSampleMaskTestBeforeSampleCounting", static_cast<bool>(obj.earlyFragmentSampleMaskTestBeforeSampleCounting));
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2246:75: error: request for member 'depthStencilSwizzleOneSupport' in 'obj', which is of non-class type 'const int'
|  2246 |     p.PrintKeyBool("depthStencilSwizzleOneSupport", static_cast<bool>(obj.depthStencilSwizzleOneSupport));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2247:66: error: request for member 'polygonModePointSize' in 'obj', which is of non-class type 'const int'
|  2247 |     p.PrintKeyBool("polygonModePointSize", static_cast<bool>(obj.polygonModePointSize));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2248:91: error: request for member 'nonStrictSinglePixelWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  2248 |     p.PrintKeyBool("nonStrictSinglePixelWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictSinglePixelWideLinesUseParallelogram));
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:2249:80: error: request for member 'nonStrictWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  2249 |     p.PrintKeyBool("nonStrictWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictWideLinesUseParallelogram));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3239:5: error: 'VkPhysicalDeviceCooperativeMatrixPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  3239 |     VkPhysicalDeviceCooperativeMatrixPropertiesKHR PhysicalDeviceCooperativeMatrixPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3256:5: error: 'VkPhysicalDeviceHostImageCopyPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceMeshShaderPropertiesEXT'?
|  3256 |     VkPhysicalDeviceHostImageCopyPropertiesEXT PhysicalDeviceHostImageCopyPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMeshShaderPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3262:5: error: 'VkPhysicalDeviceMaintenance5PropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4PropertiesKHR'?
|  3262 |     VkPhysicalDeviceMaintenance5PropertiesKHR PhysicalDeviceMaintenance5PropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3298:9: error: 'PhysicalDeviceCooperativeMatrixPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  3298 |         PhysicalDeviceCooperativeMatrixPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3298:62: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  3298 |         PhysicalDeviceCooperativeMatrixPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3315:9: error: 'PhysicalDeviceHostImageCopyPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  3315 |         PhysicalDeviceHostImageCopyPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceHostImageCopyPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3315:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT'?
|  3315 |         PhysicalDeviceHostImageCopyPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3321:9: error: 'PhysicalDeviceMaintenance5PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4PropertiesKHR'?
|  3321 |         PhysicalDeviceMaintenance5PropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceMaintenance4PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3321:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR'?
|  3321 |         PhysicalDeviceMaintenance5PropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3469:5: error: 'VkPhysicalDeviceCooperativeMatrixFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceCooperativeMatrixFeaturesNV'?
|  3469 |     VkPhysicalDeviceCooperativeMatrixFeaturesKHR PhysicalDeviceCooperativeMatrixFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceCooperativeMatrixFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3471:5: error: 'VkPhysicalDeviceDepthBiasControlFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  3471 |     VkPhysicalDeviceDepthBiasControlFeaturesEXT PhysicalDeviceDepthBiasControlFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDepthClipControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3479:5: error: 'VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingFeaturesKHR'?
|  3479 |     VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDynamicRenderingFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3491:5: error: 'VkPhysicalDeviceHostImageCopyFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceASTCDecodeFeaturesEXT'?
|  3491 |     VkPhysicalDeviceHostImageCopyFeaturesEXT PhysicalDeviceHostImageCopyFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceASTCDecodeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3506:5: error: 'VkPhysicalDeviceMaintenance5FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4FeaturesKHR'?
|  3506 |     VkPhysicalDeviceMaintenance5FeaturesKHR PhysicalDeviceMaintenance5FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3594:9: error: 'PhysicalDeviceCooperativeMatrixFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixFeaturesNV'?
|  3594 |         PhysicalDeviceCooperativeMatrixFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceCooperativeMatrixFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3594:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV'?
|  3594 |         PhysicalDeviceCooperativeMatrixFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3596:9: error: 'PhysicalDeviceDepthBiasControlFeaturesEXT' was not declared in this scope; did you mean 'PhysicalDeviceDepthClipControlFeaturesEXT'?
|  3596 |         PhysicalDeviceDepthBiasControlFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceDepthClipControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3596:59: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT'?
|  3596 |         PhysicalDeviceDepthBiasControlFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3604:9: error: 'PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT'?
|  3604 |         PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3604:76: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR'?
|  3604 |         PhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3616:9: error: 'PhysicalDeviceHostImageCopyFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  3616 |         PhysicalDeviceHostImageCopyFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceHostImageCopyFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3616:56: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  3616 |         PhysicalDeviceHostImageCopyFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3630:9: error: 'PhysicalDeviceMaintenance5FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4FeaturesKHR'?
|  3630 |         PhysicalDeviceMaintenance5FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceMaintenance4FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3630:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR'?
|  3630 |         PhysicalDeviceMaintenance5FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3958:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  3958 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3959:54: error: 'VK_KHR_COOPERATIVE_MATRIX_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_COOPERATIVE_MATRIX_EXTENSION_NAME'?
|  3959 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_COOPERATIVE_MATRIX_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_COOPERATIVE_MATRIX_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3960:13: error: 'VkPhysicalDeviceCooperativeMatrixPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  3960 |             VkPhysicalDeviceCooperativeMatrixPropertiesKHR* props = (VkPhysicalDeviceCooperativeMatrixPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceCooperativeMatrixPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3960:61: error: 'props' was not declared in this scope
|  3960 |             VkPhysicalDeviceCooperativeMatrixPropertiesKHR* props = (VkPhysicalDeviceCooperativeMatrixPropertiesKHR*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:3960:117: error: expected primary-expression before ')' token
|  3960 |             VkPhysicalDeviceCooperativeMatrixPropertiesKHR* props = (VkPhysicalDeviceCooperativeMatrixPropertiesKHR*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4064:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT'?
|  4064 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4065:54: error: 'VK_EXT_HOST_IMAGE_COPY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_YCBCR_IMAGE_ARRAYS_EXTENSION_NAME'?
|  4065 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_HOST_IMAGE_COPY_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_YCBCR_IMAGE_ARRAYS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4066:13: error: 'VkPhysicalDeviceHostImageCopyPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  4066 |             VkPhysicalDeviceHostImageCopyPropertiesEXT* props = (VkPhysicalDeviceHostImageCopyPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceHostImageCopyPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4066:57: error: 'props' was not declared in this scope
|  4066 |             VkPhysicalDeviceHostImageCopyPropertiesEXT* props = (VkPhysicalDeviceHostImageCopyPropertiesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4066:109: error: expected primary-expression before ')' token
|  4066 |             VkPhysicalDeviceHostImageCopyPropertiesEXT* props = (VkPhysicalDeviceHostImageCopyPropertiesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4104:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR'?
|  4104 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4105:54: error: 'VK_KHR_MAINTENANCE_5_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  4105 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_5_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4106:13: error: 'VkPhysicalDeviceMaintenance5PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4PropertiesKHR'?
|  4106 |             VkPhysicalDeviceMaintenance5PropertiesKHR* props = (VkPhysicalDeviceMaintenance5PropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMaintenance4PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4106:56: error: 'props' was not declared in this scope
|  4106 |             VkPhysicalDeviceMaintenance5PropertiesKHR* props = (VkPhysicalDeviceMaintenance5PropertiesKHR*)structure;
|       |                                                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4106:107: error: expected primary-expression before ')' token
|  4106 |             VkPhysicalDeviceMaintenance5PropertiesKHR* props = (VkPhysicalDeviceMaintenance5PropertiesKHR*)structure;
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4387:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV'?
|  4387 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4388:54: error: 'VK_KHR_COOPERATIVE_MATRIX_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_COOPERATIVE_MATRIX_EXTENSION_NAME'?
|  4388 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_COOPERATIVE_MATRIX_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_COOPERATIVE_MATRIX_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4389:13: error: 'VkPhysicalDeviceCooperativeMatrixFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixFeaturesNV'?
|  4389 |             VkPhysicalDeviceCooperativeMatrixFeaturesKHR* props = (VkPhysicalDeviceCooperativeMatrixFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceCooperativeMatrixFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4389:59: error: 'props' was not declared in this scope
|  4389 |             VkPhysicalDeviceCooperativeMatrixFeaturesKHR* props = (VkPhysicalDeviceCooperativeMatrixFeaturesKHR*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4389:113: error: expected primary-expression before ')' token
|  4389 |             VkPhysicalDeviceCooperativeMatrixFeaturesKHR* props = (VkPhysicalDeviceCooperativeMatrixFeaturesKHR*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4399:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT'?
|  4399 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4400:54: error: 'VK_EXT_DEPTH_BIAS_CONTROL_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEPTH_CLIP_CONTROL_EXTENSION_NAME'?
|  4400 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEPTH_BIAS_CONTROL_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEPTH_CLIP_CONTROL_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4401:13: error: 'VkPhysicalDeviceDepthBiasControlFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  4401 |             VkPhysicalDeviceDepthBiasControlFeaturesEXT* props = (VkPhysicalDeviceDepthBiasControlFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceDepthClipControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4401:58: error: 'props' was not declared in this scope
|  4401 |             VkPhysicalDeviceDepthBiasControlFeaturesEXT* props = (VkPhysicalDeviceDepthBiasControlFeaturesEXT*)structure;
|       |                                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4401:111: error: expected primary-expression before ')' token
|  4401 |             VkPhysicalDeviceDepthBiasControlFeaturesEXT* props = (VkPhysicalDeviceDepthBiasControlFeaturesEXT*)structure;
|       |                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4449:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR'?
|  4449 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4450:54: error: 'VK_EXT_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_EXTENSION_NAME' was not declared in this scope
|  4450 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4451:13: error: 'VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT'?
|  4451 |             VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT* props = (VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4451:75: error: 'props' was not declared in this scope
|  4451 |             VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT* props = (VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT*)structure;
|       |                                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4451:145: error: expected primary-expression before ')' token
|  4451 |             VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT* props = (VkPhysicalDeviceDynamicRenderingUnusedAttachmentsFeaturesEXT*)structure;
|       |                                                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4521:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  4521 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4522:54: error: 'VK_EXT_HOST_IMAGE_COPY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_YCBCR_IMAGE_ARRAYS_EXTENSION_NAME'?
|  4522 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_HOST_IMAGE_COPY_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_YCBCR_IMAGE_ARRAYS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4523:13: error: 'VkPhysicalDeviceHostImageCopyFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  4523 |             VkPhysicalDeviceHostImageCopyFeaturesEXT* props = (VkPhysicalDeviceHostImageCopyFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceHostImageCopyFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4523:55: error: 'props' was not declared in this scope
|  4523 |             VkPhysicalDeviceHostImageCopyFeaturesEXT* props = (VkPhysicalDeviceHostImageCopyFeaturesEXT*)structure;
|       |                                                       ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4523:105: error: expected primary-expression before ')' token
|  4523 |             VkPhysicalDeviceHostImageCopyFeaturesEXT* props = (VkPhysicalDeviceHostImageCopyFeaturesEXT*)structure;
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4610:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR'?
|  4610 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4611:54: error: 'VK_KHR_MAINTENANCE_5_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  4611 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_5_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4612:13: error: 'VkPhysicalDeviceMaintenance5FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4FeaturesKHR'?
|  4612 |             VkPhysicalDeviceMaintenance5FeaturesKHR* props = (VkPhysicalDeviceMaintenance5FeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMaintenance4FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4612:54: error: 'props' was not declared in this scope
|  4612 |             VkPhysicalDeviceMaintenance5FeaturesKHR* props = (VkPhysicalDeviceMaintenance5FeaturesKHR*)structure;
|       |                                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/git/vulkaninfo/generated/vulkaninfo.hpp:4612:103: error: expected primary-expression before ')' token
|  4612 |             VkPhysicalDeviceMaintenance5FeaturesKHR* props = (VkPhysicalDeviceMaintenance5FeaturesKHR*)structure;
|       |                                                                                                       ^
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/temp/run.do_compile.319921:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/temp/run.do_compile.319921, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/temp/run.do_compile.319921, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/temp/run.do_compile.319921, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/temp/run.do_compile.319921, line 166
NOTE: recipe vulkan-tools-1.3.261.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1540 tasks of which 1529 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.261.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/temp/run.do_compile.319921', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.261.1/temp/log.do_compile.319921
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb:do_compile) failed with exit code '1'

--===============8004202711147848074==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.250.0-1.3.261.1.patch"

RnJvbSAwZTQ0MDViZjU3NWQyNmMwNzk3ZmMzMjRmYmVhNjdiNTc5NTlhNTUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTU6NTI6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjI1MC4wIC0+IDEuMy4yNjEuMQoKLS0tCiAuLi50cy50
eHQtZG8tbm90LW1ha2Utc3BlY2lhbC1hcnJhbmdlbWUucGF0Y2ggfCAyOSAtLS0tLS0tLS0tLS0t
LS0tLS0tCiAuLi4xLjMuMjUwLjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yNjEuMS5iYn0gfCAg
NiArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0p
CiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
dG9vbHMvMDAwMS1zY3JpcHRzLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1tYWtlLXNwZWNpYWwtYXJy
YW5nZW1lLnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2Fu
LXRvb2xzXzEuMy4yNTAuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI2MS4xLmJifSAoODklKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzLzAw
MDEtc2NyaXB0cy1DTWFrZUxpc3RzLnR4dC1kby1ub3QtbWFrZS1zcGVjaWFsLWFycmFuZ2VtZS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzLzAwMDEtc2Ny
aXB0cy1DTWFrZUxpc3RzLnR4dC1kby1ub3QtbWFrZS1zcGVjaWFsLWFycmFuZ2VtZS5wYXRjaApk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNmI3MGExZTYyZC4uMDAwMDAwMDAwMAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29scy8wMDAxLXNjcmlwdHMt
Q01ha2VMaXN0cy50eHQtZG8tbm90LW1ha2Utc3BlY2lhbC1hcnJhbmdlbWUucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSwyOSArMCwwIEBACi1Gcm9tIDkwNjBlOTE2Y2EwNWQzNGI1NmM2MmYyYmUw
YjRhNzdkZDEwNGUyYWEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotRGF0ZTogRnJpLCAyIEp1biAyMDIzIDE0OjEz
OjAwICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIHNjcmlwdHMvQ01ha2VMaXN0cy50eHQ6IGFwcGVu
ZCB0byBDTUFLRV9GSU5EX1JPT1RfUEFUSAotIGluc3RlYWQgb2YgcmVwbGFjaW5nIGl0Ci0KLVJl
c2V0dGluZyBDTUFLRV9GSU5EX1JPT1RfUEFUSCBpbiBwYXJ0aWN1bGFyIGJyZWFrcyBidWlsZHMg
aW4gWW9jdG8KLSh3aGljaCBpcyBhIG1ham9yIGNyb3NzIGNvbXBpbGluZyBmcmFtZXdvcmspLgot
Ci1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL0tocm9ub3NH
cm91cC9WdWxrYW4tVG9vbHMvcHVsbC84MDhdCi1TaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotCi0tLS0KLSBzY3JpcHRzL0NNYWtlTGlzdHMudHh0
IHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQot
Ci1kaWZmIC0tZ2l0IGEvc2NyaXB0cy9DTWFrZUxpc3RzLnR4dCBiL3NjcmlwdHMvQ01ha2VMaXN0
cy50eHQKLWluZGV4IDViOTc5ZDQzLi4xOWE1OGJmOSAxMDA2NDQKLS0tLSBhL3NjcmlwdHMvQ01h
a2VMaXN0cy50eHQKLSsrKyBiL3NjcmlwdHMvQ01ha2VMaXN0cy50eHQKLUBAIC0xMTQsNyArMTE0
LDcgQEAgaWYgKE1PTFRFTlZLX1JFUE9fUk9PVCkKLSBlbmRpZigpCi0gCi0gaWYgKENNQUtFX0NS
T1NTQ09NUElMSU5HKQotLSAgICBzZXQoQ01BS0VfRklORF9ST09UX1BBVEggJHtDTUFLRV9QUkVG
SVhfUEFUSH0gUEFSRU5UX1NDT1BFKQotKyAgICBzZXQoQ01BS0VfRklORF9ST09UX1BBVEggJHtD
TUFLRV9GSU5EX1JPT1RfUEFUSH0gJHtDTUFLRV9QUkVGSVhfUEFUSH0gUEFSRU5UX1NDT1BFKQot
IGVsc2UoKQotICAgICBzZXQoQ01BS0VfUFJFRklYX1BBVEggJHtDTUFLRV9QUkVGSVhfUEFUSH0g
UEFSRU5UX1NDT1BFKQotIGVuZGlmKCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNTAuMC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg5JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMu
MjUwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRv
b2xzXzEuMy4yNjEuMS5iYgppbmRleCAwMzQ2YjM4MGVlLi43YTdlZGM5ZWJkIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjUwLjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS4zLjI2MS4x
LmJiCkBAIC02LDEwICs2LDggQEAgU0VDVElPTiA9ICJsaWJzIgogCiBMSUNFTlNFID0gIkFwYWNo
ZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9M2I4M2Vm
OTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCi1TUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
S2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMg
XAotICAgICAgICAgICBmaWxlOi8vMDAwMS1zY3JpcHRzLUNNYWtlTGlzdHMudHh0LWRvLW5vdC1t
YWtlLXNwZWNpYWwtYXJyYW5nZW1lLnBhdGNoIFwKLSAgICAgICAgICAgIgotU1JDUkVWID0gIjY5
NTg4N2E5OTRlZjljYzAwYTdhYTNmOWMwMGIzMWE1NmVhNzk1MzQiCitTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPW1haW47cHJv
dG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiYTdkYTcwMjdjYTlmZDA5MDE2MzlmMDI2MTljMjI2ZGE5
YzYwMzZmMSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============8004202711147848074==--

