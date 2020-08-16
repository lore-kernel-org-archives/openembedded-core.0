Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.19668.1597558929368177923
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Aug 2020 23:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3778FE0203A; Sat, 15 Aug 2020 23:22:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3E85E02068
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Aug 2020 23:19:42 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.2.148.0 FAILED
Message-Id: <20200816062209.3778FE0203A@yocto-www.yoctoproject.org>
Date: Sat, 15 Aug 2020 23:22:09 -0700 (PDT)
X-Groupsio-MsgNum: 141511
Content-Type: multipart/mixed; boundary="===============7177678193002213631=="

--===============7177678193002213631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.2.148.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.2.135.0-1.2.148.0.patch
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

--===============7177678193002213631==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.2.135.0-1.2.148.0.patch"

From 323cb00ebb9537005383cac082139dbc2f594543 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 16 Aug 2020 01:37:46 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.2.135.0 -> 1.2.148.0

---
 ...{vulkan-loader_1.2.135.0.bb => vulkan-loader_1.2.148.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.135.0.bb => vulkan-loader_1.2.148.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb
index 8bab58f0b9..59a80db638 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.135"
-SRCREV = "86429d9e7f3542e88fb98ffa7d8a82c10c9828ac"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.148"
+SRCREV = "340aeb54ce70dcece84fd1d4456ad85c4ebb6b48"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============7177678193002213631==
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
meta-yocto-bsp       = "tmp-auh-upgrades:3e33660f12d9306a4f9a40958b7ef1774c4d5ddf"
workspace            = "master:bd1da2aca0bc26720f438a9c1d54f5b04084da4e"

Initialising tasks...done.
Sstate summary: Wanted 257 Found 249 Missed 8 Current 529 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1630 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_fetch: Succeeded
NOTE: Running task 2421 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_unpack)
NOTE: Running task 2422 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_unpack: Succeeded
NOTE: Running task 2423 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_patch: Succeeded
NOTE: Running task 2424 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_generate_toolchain_file)
NOTE: Running task 2425 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2426 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2427 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_configure: Succeeded
NOTE: Running task 2428 of 2435 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_compile: Started
ERROR: vulkan-loader-1.2.148.0-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/temp/run.do_compile.20745' failed with exit code 1:
[1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/murmurhash.c
[2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c
FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c:31:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
[3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c
FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c:23:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
[4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c
FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                   ^
[5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c
FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:196:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  196 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
      |                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:198:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  198 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
      |                                                             ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:37,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:204:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  204 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
      |                            ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:254:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  254 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:300:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  300 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:348:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  348 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:398:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  398 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:426:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  426 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:668:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  668 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:676:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  676 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:783:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  783 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:791:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  791 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:900:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  900 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:908:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  908 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1168:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1168 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1176:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1176 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1626:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1626 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1634:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1634 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1667:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1667 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1711:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1711 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1741:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1741 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1743:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1743 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
      |                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1961:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1961 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1977:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1977 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2001:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2001 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2039:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2039 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2044:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2044 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2066:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2066 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
[6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c
FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.h:26,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c:37:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c:39:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_object_types.h:215:5: error: 'VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT' undeclared here (not in a function)
  215 |     VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT,   // kVulkanObjectTypePrivateDataSlotEXT
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c
FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
[8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c
FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c:33:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
[9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/bu
 ild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/cJSON.c
[10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c
FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:60:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:89:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:38: error: 'PFN_vkGetImageViewAddressNVX' undeclared (first use in this function); did you mean 'PFN_vkGetImageViewHandleNVX'?
  616 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                      PFN_vkGetImageViewHandleNVX
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:38: note: each undeclared identifier is reported only once for each function it appears in
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:67: error: expected ';' before 'gdpa'
  616 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
      |                                                                   ^~~~
      |                                                                   ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:762:33: error: 'PFN_vkCmdSetCullModeEXT' undeclared (first use in this function)
  762 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:762:57: error: expected ';' before 'gdpa'
  762 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:763:34: error: 'PFN_vkCmdSetFrontFaceEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
  763 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                  PFN_vkCmdSetLineStippleEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:763:59: error: expected ';' before 'gdpa'
  763 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
      |                                                           ^~~~
      |                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:764:42: error: 'PFN_vkCmdSetPrimitiveTopologyEXT' undeclared (first use in this function)
  764 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:764:75: error: expected ';' before 'gdpa'
  764 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
      |                                                                           ^~~~
      |                                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:765:42: error: 'PFN_vkCmdSetViewportWithCountEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetViewportWScalingNV'?
  765 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                          PFN_vkCmdSetViewportWScalingNV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:765:75: error: expected ';' before 'gdpa'
  765 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
      |                                                                           ^~~~
      |                                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:766:41: error: 'PFN_vkCmdSetScissorWithCountEXT' undeclared (first use in this function)
  766 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:766:73: error: expected ';' before 'gdpa'
  766 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
      |                                                                         ^~~~
      |                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:767:40: error: 'PFN_vkCmdBindVertexBuffers2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdBindVertexBuffers'?
  767 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                        PFN_vkCmdBindVertexBuffers
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:767:71: error: expected ';' before 'gdpa'
  767 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:768:40: error: 'PFN_vkCmdSetDepthTestEnableEXT' undeclared (first use in this function)
  768 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:768:71: error: expected ';' before 'gdpa'
  768 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:769:41: error: 'PFN_vkCmdSetDepthWriteEnableEXT' undeclared (first use in this function)
  769 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:769:73: error: expected ';' before 'gdpa'
  769 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
      |                                                                         ^~~~
      |                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:770:39: error: 'PFN_vkCmdSetDepthCompareOpEXT' undeclared (first use in this function)
  770 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:770:69: error: expected ';' before 'gdpa'
  770 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
      |                                                                     ^~~~
      |                                                                     ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:771:46: error: 'PFN_vkCmdSetDepthBoundsTestEnableEXT' undeclared (first use in this function)
  771 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
      |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:771:83: error: expected ';' before 'gdpa'
  771 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
      |                                                                                   ^~~~
      |                                                                                   ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:772:42: error: 'PFN_vkCmdSetStencilTestEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilReference'?
  772 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                          PFN_vkCmdSetStencilReference
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:772:75: error: expected ';' before 'gdpa'
  772 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
      |                                                                           ^~~~
      |                                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:773:34: error: 'PFN_vkCmdSetStencilOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
  773 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                  PFN_vkCmdSetLineStippleEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:773:59: error: expected ';' before 'gdpa'
  773 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
      |                                                           ^~~~
      |                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:784:40: error: 'PFN_vkCreatePrivateDataSlotEXT' undeclared (first use in this function)
  784 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:784:71: error: expected ';' before 'gdpa'
  784 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:785:41: error: 'PFN_vkDestroyPrivateDataSlotEXT' undeclared (first use in this function)
  785 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:785:73: error: expected ';' before 'gdpa'
  785 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
      |                                                                         ^~~~
      |                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:786:33: error: 'PFN_vkSetPrivateDataEXT' undeclared (first use in this function); did you mean 'PFN_vkSetHdrMetadataEXT'?
  786 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
      |                                 PFN_vkSetHdrMetadataEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:786:57: error: expected ';' before 'gdpa'
  786 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:787:33: error: 'PFN_vkGetPrivateDataEXT' undeclared (first use in this function)
  787 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:787:57: error: expected ';' before 'gdpa'
  787 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:2576:5: error: unknown type name 'VkImageViewAddressPropertiesNVX'
 2576 |     VkImageViewAddressPropertiesNVX*            pProperties) {
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:89:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetCullModeEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3640:5: error: called object is not a function or function pointer
 3640 |     disp->CmdSetCullModeEXT(commandBuffer, cullMode);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetFrontFaceEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3647:5: error: called object is not a function or function pointer
 3647 |     disp->CmdSetFrontFaceEXT(commandBuffer, frontFace);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveTopologyEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3654:5: error: called object is not a function or function pointer
 3654 |     disp->CmdSetPrimitiveTopologyEXT(commandBuffer, primitiveTopology);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetViewportWithCountEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3662:5: error: called object is not a function or function pointer
 3662 |     disp->CmdSetViewportWithCountEXT(commandBuffer, viewportCount, pViewports);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetScissorWithCountEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3670:5: error: called object is not a function or function pointer
 3670 |     disp->CmdSetScissorWithCountEXT(commandBuffer, scissorCount, pScissors);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindVertexBuffers2EXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3682:5: error: called object is not a function or function pointer
 3682 |     disp->CmdBindVertexBuffers2EXT(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets, pSizes, pStrides);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthTestEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3689:5: error: called object is not a function or function pointer
 3689 |     disp->CmdSetDepthTestEnableEXT(commandBuffer, depthTestEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthWriteEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3696:5: error: called object is not a function or function pointer
 3696 |     disp->CmdSetDepthWriteEnableEXT(commandBuffer, depthWriteEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthCompareOpEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3703:5: error: called object is not a function or function pointer
 3703 |     disp->CmdSetDepthCompareOpEXT(commandBuffer, depthCompareOp);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBoundsTestEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3710:5: error: called object is not a function or function pointer
 3710 |     disp->CmdSetDepthBoundsTestEnableEXT(commandBuffer, depthBoundsTestEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilTestEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3717:5: error: called object is not a function or function pointer
 3717 |     disp->CmdSetStencilTestEnableEXT(commandBuffer, stencilTestEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilOpEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3728:5: error: called object is not a function or function pointer
 3728 |     disp->CmdSetStencilOpEXT(commandBuffer, faceMask, failOp, passOp, depthFailOp, compareOp);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3788:11: error: unknown type name 'VkPrivateDataSlotCreateInfoEXT'
 3788 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3790:5: error: unknown type name 'VkPrivateDataSlotEXT'
 3790 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot) {
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3797:5: error: unknown type name 'VkPrivateDataSlotEXT'
 3797 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3807:5: error: unknown type name 'VkPrivateDataSlotEXT'
 3807 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3817:5: error: unknown type name 'VkPrivateDataSlotEXT'
 3817 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:4439:25: error: 'GetImageViewAddressNVX' undeclared (first use in this function); did you mean 'GetImageViewHandleNVX'?
 4439 |         *addr = (void *)GetImageViewAddressNVX;
      |                         ^~~~~~~~~~~~~~~~~~~~~~
      |                         GetImageViewHandleNVX
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5009:25: error: 'CreatePrivateDataSlotEXT' undeclared (first use in this function)
 5009 |         *addr = (void *)CreatePrivateDataSlotEXT;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5013:25: error: 'DestroyPrivateDataSlotEXT' undeclared (first use in this function)
 5013 |         *addr = (void *)DestroyPrivateDataSlotEXT;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5017:25: error: 'SetPrivateDataEXT' undeclared (first use in this function)
 5017 |         *addr = (void *)SetPrivateDataEXT;
      |                         ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5021:25: error: 'GetPrivateDataEXT' undeclared (first use in this function)
 5021 |         *addr = (void *)GetPrivateDataEXT;
      |                         ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c: In function 'loader_create_instance_chain':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6010:5: error: unknown type name 'VkLoaderFeatureFlags'; did you mean 'VkFormatFeatureFlags'?
 6010 |     VkLoaderFeatureFlags feature_flags = 0;
      |     ^~~~~~~~~~~~~~~~~~~~
      |     VkFormatFeatureFlags
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6044:25: error: 'VK_LOADER_FEATURES' undeclared (first use in this function); did you mean 'VK_LOADER_DATA'?
 6044 |             .function = VK_LOADER_FEATURES,
      |                         ^~~~~~~~~~~~~~~~~~
      |                         VK_LOADER_DATA
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:18: error: 'union <anonymous>' has no member named 'loaderFeatures'
 6046 |                 .loaderFeatures = feature_flags,
      |                  ^~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:35: warning: initialization of 'VkLayerInstanceLink *' {aka 'struct VkLayerInstanceLink_ *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
 6046 |                 .loaderFeatures = feature_flags,
      |                                   ^~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:35: note: (near initialization for 'loader_features.u.pLayerInfo')
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c: In function 'ReadSortedPhysicalDevices':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7134:1: warning: label 'out' defined but not used [-Wunused-label]
 7134 | out:
      | ^~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7035:29: warning: unused variable 'icd_term' [-Wunused-variable]
 7035 |     struct loader_icd_term* icd_term = NULL;
      |                             ^~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7034:14: warning: unused variable 'sorted_alloc' [-Wunused-variable]
 7034 |     uint32_t sorted_alloc = 0;
      |              ^~~~~~~~~~~~
ninja: build stopped: subcommand failed.
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/temp/log.do_compile.20745
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/build --target all --
| [1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/murmurhash.c
| [2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c
| FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                   ^
| [5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:196:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   196 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:198:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   198 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
|       |                                                             ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:204:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   204 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
|       |                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:254:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   254 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:300:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   300 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:348:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   348 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:398:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   398 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:426:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   426 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:668:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   668 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:676:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   676 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:783:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   783 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:791:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   791 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:900:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   900 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:908:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   908 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1168:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1168 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1176:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1176 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1626:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1626 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1634:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1634 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1667:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1667 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1711:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1711 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1741:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1741 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1743:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1743 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1961:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1961 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1977:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1977 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2001:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2001 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2039:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2039 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2044:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2044 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2066:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2066 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| [6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_object_types.h:215:5: error: 'VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT' undeclared here (not in a function)
|   215 |     VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT,   // kVulkanObjectTypePrivateDataSlotEXT
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/cJSON.c
| [10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh
 /build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:89:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:38: error: 'PFN_vkGetImageViewAddressNVX' undeclared (first use in this function); did you mean 'PFN_vkGetImageViewHandleNVX'?
|   616 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      PFN_vkGetImageViewHandleNVX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:38: note: each undeclared identifier is reported only once for each function it appears in
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:67: error: expected ';' before 'gdpa'
|   616 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:762:33: error: 'PFN_vkCmdSetCullModeEXT' undeclared (first use in this function)
|   762 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:762:57: error: expected ';' before 'gdpa'
|   762 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:763:34: error: 'PFN_vkCmdSetFrontFaceEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   763 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCmdSetLineStippleEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:763:59: error: expected ';' before 'gdpa'
|   763 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:764:42: error: 'PFN_vkCmdSetPrimitiveTopologyEXT' undeclared (first use in this function)
|   764 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:764:75: error: expected ';' before 'gdpa'
|   764 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:765:42: error: 'PFN_vkCmdSetViewportWithCountEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetViewportWScalingNV'?
|   765 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkCmdSetViewportWScalingNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:765:75: error: expected ';' before 'gdpa'
|   765 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:766:41: error: 'PFN_vkCmdSetScissorWithCountEXT' undeclared (first use in this function)
|   766 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:766:73: error: expected ';' before 'gdpa'
|   766 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:767:40: error: 'PFN_vkCmdBindVertexBuffers2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdBindVertexBuffers'?
|   767 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdBindVertexBuffers
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:767:71: error: expected ';' before 'gdpa'
|   767 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:768:40: error: 'PFN_vkCmdSetDepthTestEnableEXT' undeclared (first use in this function)
|   768 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:768:71: error: expected ';' before 'gdpa'
|   768 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:769:41: error: 'PFN_vkCmdSetDepthWriteEnableEXT' undeclared (first use in this function)
|   769 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:769:73: error: expected ';' before 'gdpa'
|   769 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:770:39: error: 'PFN_vkCmdSetDepthCompareOpEXT' undeclared (first use in this function)
|   770 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:770:69: error: expected ';' before 'gdpa'
|   770 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
|       |                                                                     ^~~~
|       |                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:771:46: error: 'PFN_vkCmdSetDepthBoundsTestEnableEXT' undeclared (first use in this function)
|   771 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:771:83: error: expected ';' before 'gdpa'
|   771 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
|       |                                                                                   ^~~~
|       |                                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:772:42: error: 'PFN_vkCmdSetStencilTestEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilReference'?
|   772 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkCmdSetStencilReference
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:772:75: error: expected ';' before 'gdpa'
|   772 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:773:34: error: 'PFN_vkCmdSetStencilOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   773 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCmdSetLineStippleEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:773:59: error: expected ';' before 'gdpa'
|   773 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:784:40: error: 'PFN_vkCreatePrivateDataSlotEXT' undeclared (first use in this function)
|   784 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:784:71: error: expected ';' before 'gdpa'
|   784 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:785:41: error: 'PFN_vkDestroyPrivateDataSlotEXT' undeclared (first use in this function)
|   785 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:785:73: error: expected ';' before 'gdpa'
|   785 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:786:33: error: 'PFN_vkSetPrivateDataEXT' undeclared (first use in this function); did you mean 'PFN_vkSetHdrMetadataEXT'?
|   786 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkSetHdrMetadataEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:786:57: error: expected ';' before 'gdpa'
|   786 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:787:33: error: 'PFN_vkGetPrivateDataEXT' undeclared (first use in this function)
|   787 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:787:57: error: expected ';' before 'gdpa'
|   787 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:2576:5: error: unknown type name 'VkImageViewAddressPropertiesNVX'
|  2576 |     VkImageViewAddressPropertiesNVX*            pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:89:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetCullModeEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3640:5: error: called object is not a function or function pointer
|  3640 |     disp->CmdSetCullModeEXT(commandBuffer, cullMode);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetFrontFaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3647:5: error: called object is not a function or function pointer
|  3647 |     disp->CmdSetFrontFaceEXT(commandBuffer, frontFace);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveTopologyEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3654:5: error: called object is not a function or function pointer
|  3654 |     disp->CmdSetPrimitiveTopologyEXT(commandBuffer, primitiveTopology);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetViewportWithCountEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3662:5: error: called object is not a function or function pointer
|  3662 |     disp->CmdSetViewportWithCountEXT(commandBuffer, viewportCount, pViewports);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetScissorWithCountEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3670:5: error: called object is not a function or function pointer
|  3670 |     disp->CmdSetScissorWithCountEXT(commandBuffer, scissorCount, pScissors);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindVertexBuffers2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3682:5: error: called object is not a function or function pointer
|  3682 |     disp->CmdBindVertexBuffers2EXT(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets, pSizes, pStrides);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3689:5: error: called object is not a function or function pointer
|  3689 |     disp->CmdSetDepthTestEnableEXT(commandBuffer, depthTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthWriteEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3696:5: error: called object is not a function or function pointer
|  3696 |     disp->CmdSetDepthWriteEnableEXT(commandBuffer, depthWriteEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthCompareOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3703:5: error: called object is not a function or function pointer
|  3703 |     disp->CmdSetDepthCompareOpEXT(commandBuffer, depthCompareOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBoundsTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3710:5: error: called object is not a function or function pointer
|  3710 |     disp->CmdSetDepthBoundsTestEnableEXT(commandBuffer, depthBoundsTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3717:5: error: called object is not a function or function pointer
|  3717 |     disp->CmdSetStencilTestEnableEXT(commandBuffer, stencilTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3728:5: error: called object is not a function or function pointer
|  3728 |     disp->CmdSetStencilOpEXT(commandBuffer, faceMask, failOp, passOp, depthFailOp, compareOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3788:11: error: unknown type name 'VkPrivateDataSlotCreateInfoEXT'
|  3788 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3790:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3790 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot) {
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3797:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3797 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3807:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3807 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3817:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3817 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:4439:25: error: 'GetImageViewAddressNVX' undeclared (first use in this function); did you mean 'GetImageViewHandleNVX'?
|  4439 |         *addr = (void *)GetImageViewAddressNVX;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
|       |                         GetImageViewHandleNVX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5009:25: error: 'CreatePrivateDataSlotEXT' undeclared (first use in this function)
|  5009 |         *addr = (void *)CreatePrivateDataSlotEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5013:25: error: 'DestroyPrivateDataSlotEXT' undeclared (first use in this function)
|  5013 |         *addr = (void *)DestroyPrivateDataSlotEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5017:25: error: 'SetPrivateDataEXT' undeclared (first use in this function)
|  5017 |         *addr = (void *)SetPrivateDataEXT;
|       |                         ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5021:25: error: 'GetPrivateDataEXT' undeclared (first use in this function)
|  5021 |         *addr = (void *)GetPrivateDataEXT;
|       |                         ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c: In function 'loader_create_instance_chain':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6010:5: error: unknown type name 'VkLoaderFeatureFlags'; did you mean 'VkFormatFeatureFlags'?
|  6010 |     VkLoaderFeatureFlags feature_flags = 0;
|       |     ^~~~~~~~~~~~~~~~~~~~
|       |     VkFormatFeatureFlags
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6044:25: error: 'VK_LOADER_FEATURES' undeclared (first use in this function); did you mean 'VK_LOADER_DATA'?
|  6044 |             .function = VK_LOADER_FEATURES,
|       |                         ^~~~~~~~~~~~~~~~~~
|       |                         VK_LOADER_DATA
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:18: error: 'union <anonymous>' has no member named 'loaderFeatures'
|  6046 |                 .loaderFeatures = feature_flags,
|       |                  ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:35: warning: initialization of 'VkLayerInstanceLink *' {aka 'struct VkLayerInstanceLink_ *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
|  6046 |                 .loaderFeatures = feature_flags,
|       |                                   ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:35: note: (near initialization for 'loader_features.u.pLayerInfo')
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c: In function 'ReadSortedPhysicalDevices':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7134:1: warning: label 'out' defined but not used [-Wunused-label]
|  7134 | out:
|       | ^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7035:29: warning: unused variable 'icd_term' [-Wunused-variable]
|  7035 |     struct loader_icd_term* icd_term = NULL;
|       |                             ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7034:14: warning: unused variable 'sorted_alloc' [-Wunused-variable]
|  7034 |     uint32_t sorted_alloc = 0;
|       |              ^~~~~~~~~~~~
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/temp/run.do_compile.20745' failed with exit code 1:
| [1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/murmurhash.c
| [2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c
| FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                   ^
| [5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:196:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   196 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:198:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   198 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
|       |                                                             ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:204:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   204 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
|       |                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:254:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   254 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:300:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   300 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:348:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   348 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:398:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   398 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:426:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   426 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:668:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   668 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:676:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   676 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:783:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   783 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:791:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   791 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:900:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   900 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:908:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   908 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1168:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1168 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1176:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1176 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1626:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1626 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1634:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1634 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1667:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1667 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1711:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1711 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1741:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1741 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1743:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1743 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1961:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1961 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:1977:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1977 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2001:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2001 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2039:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2039 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2044:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2044 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/wsi.c:2066:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2066 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| [6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/debug_utils.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_object_types.h:215:5: error: 'VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT' undeclared here (not in a function)
|   215 |     VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT,   // kVulkanObjectTypePrivateDataSlotEXT
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/co
 re2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/
 build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/cJSON.c
| [10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh
 /build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0=/usr/src/debug/vulkan-loader/1.2.148.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/b
 uild/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o   -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:553:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   553 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:699:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   699 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:700:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   700 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:701:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   701 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:702:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   702 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:703:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   703 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:704:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   704 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:705:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   705 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:706:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   706 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   707 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   708 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   709 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   710 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:721:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   721 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:722:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   722 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:723:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   723 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_layer_dispatch_table.h:724:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   724 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:89:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:38: error: 'PFN_vkGetImageViewAddressNVX' undeclared (first use in this function); did you mean 'PFN_vkGetImageViewHandleNVX'?
|   616 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      PFN_vkGetImageViewHandleNVX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:38: note: each undeclared identifier is reported only once for each function it appears in
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:616:67: error: expected ';' before 'gdpa'
|   616 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:762:33: error: 'PFN_vkCmdSetCullModeEXT' undeclared (first use in this function)
|   762 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:762:57: error: expected ';' before 'gdpa'
|   762 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:763:34: error: 'PFN_vkCmdSetFrontFaceEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   763 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCmdSetLineStippleEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:763:59: error: expected ';' before 'gdpa'
|   763 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:764:42: error: 'PFN_vkCmdSetPrimitiveTopologyEXT' undeclared (first use in this function)
|   764 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:764:75: error: expected ';' before 'gdpa'
|   764 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:765:42: error: 'PFN_vkCmdSetViewportWithCountEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetViewportWScalingNV'?
|   765 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkCmdSetViewportWScalingNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:765:75: error: expected ';' before 'gdpa'
|   765 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:766:41: error: 'PFN_vkCmdSetScissorWithCountEXT' undeclared (first use in this function)
|   766 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:766:73: error: expected ';' before 'gdpa'
|   766 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:767:40: error: 'PFN_vkCmdBindVertexBuffers2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdBindVertexBuffers'?
|   767 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdBindVertexBuffers
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:767:71: error: expected ';' before 'gdpa'
|   767 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:768:40: error: 'PFN_vkCmdSetDepthTestEnableEXT' undeclared (first use in this function)
|   768 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:768:71: error: expected ';' before 'gdpa'
|   768 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:769:41: error: 'PFN_vkCmdSetDepthWriteEnableEXT' undeclared (first use in this function)
|   769 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:769:73: error: expected ';' before 'gdpa'
|   769 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:770:39: error: 'PFN_vkCmdSetDepthCompareOpEXT' undeclared (first use in this function)
|   770 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:770:69: error: expected ';' before 'gdpa'
|   770 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
|       |                                                                     ^~~~
|       |                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:771:46: error: 'PFN_vkCmdSetDepthBoundsTestEnableEXT' undeclared (first use in this function)
|   771 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:771:83: error: expected ';' before 'gdpa'
|   771 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
|       |                                                                                   ^~~~
|       |                                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:772:42: error: 'PFN_vkCmdSetStencilTestEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilReference'?
|   772 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkCmdSetStencilReference
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:772:75: error: expected ';' before 'gdpa'
|   772 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:773:34: error: 'PFN_vkCmdSetStencilOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   773 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCmdSetLineStippleEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:773:59: error: expected ';' before 'gdpa'
|   773 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:784:40: error: 'PFN_vkCreatePrivateDataSlotEXT' undeclared (first use in this function)
|   784 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:784:71: error: expected ';' before 'gdpa'
|   784 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:785:41: error: 'PFN_vkDestroyPrivateDataSlotEXT' undeclared (first use in this function)
|   785 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:785:73: error: expected ';' before 'gdpa'
|   785 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:786:33: error: 'PFN_vkSetPrivateDataEXT' undeclared (first use in this function); did you mean 'PFN_vkSetHdrMetadataEXT'?
|   786 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkSetHdrMetadataEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:786:57: error: expected ';' before 'gdpa'
|   786 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:787:33: error: 'PFN_vkGetPrivateDataEXT' undeclared (first use in this function)
|   787 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:787:57: error: expected ';' before 'gdpa'
|   787 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:2576:5: error: unknown type name 'VkImageViewAddressPropertiesNVX'
|  2576 |     VkImageViewAddressPropertiesNVX*            pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:89:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetCullModeEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3640:5: error: called object is not a function or function pointer
|  3640 |     disp->CmdSetCullModeEXT(commandBuffer, cullMode);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetFrontFaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3647:5: error: called object is not a function or function pointer
|  3647 |     disp->CmdSetFrontFaceEXT(commandBuffer, frontFace);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveTopologyEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3654:5: error: called object is not a function or function pointer
|  3654 |     disp->CmdSetPrimitiveTopologyEXT(commandBuffer, primitiveTopology);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetViewportWithCountEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3662:5: error: called object is not a function or function pointer
|  3662 |     disp->CmdSetViewportWithCountEXT(commandBuffer, viewportCount, pViewports);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetScissorWithCountEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3670:5: error: called object is not a function or function pointer
|  3670 |     disp->CmdSetScissorWithCountEXT(commandBuffer, scissorCount, pScissors);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindVertexBuffers2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3682:5: error: called object is not a function or function pointer
|  3682 |     disp->CmdBindVertexBuffers2EXT(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets, pSizes, pStrides);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3689:5: error: called object is not a function or function pointer
|  3689 |     disp->CmdSetDepthTestEnableEXT(commandBuffer, depthTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthWriteEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3696:5: error: called object is not a function or function pointer
|  3696 |     disp->CmdSetDepthWriteEnableEXT(commandBuffer, depthWriteEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthCompareOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3703:5: error: called object is not a function or function pointer
|  3703 |     disp->CmdSetDepthCompareOpEXT(commandBuffer, depthCompareOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBoundsTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3710:5: error: called object is not a function or function pointer
|  3710 |     disp->CmdSetDepthBoundsTestEnableEXT(commandBuffer, depthBoundsTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3717:5: error: called object is not a function or function pointer
|  3717 |     disp->CmdSetStencilTestEnableEXT(commandBuffer, stencilTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3728:5: error: called object is not a function or function pointer
|  3728 |     disp->CmdSetStencilOpEXT(commandBuffer, faceMask, failOp, passOp, depthFailOp, compareOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3788:11: error: unknown type name 'VkPrivateDataSlotCreateInfoEXT'
|  3788 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3790:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3790 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot) {
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3797:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3797 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3807:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3807 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:3817:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3817 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:4439:25: error: 'GetImageViewAddressNVX' undeclared (first use in this function); did you mean 'GetImageViewHandleNVX'?
|  4439 |         *addr = (void *)GetImageViewAddressNVX;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
|       |                         GetImageViewHandleNVX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5009:25: error: 'CreatePrivateDataSlotEXT' undeclared (first use in this function)
|  5009 |         *addr = (void *)CreatePrivateDataSlotEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5013:25: error: 'DestroyPrivateDataSlotEXT' undeclared (first use in this function)
|  5013 |         *addr = (void *)DestroyPrivateDataSlotEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5017:25: error: 'SetPrivateDataEXT' undeclared (first use in this function)
|  5017 |         *addr = (void *)SetPrivateDataEXT;
|       |                         ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/generated/vk_loader_extensions.c:5021:25: error: 'GetPrivateDataEXT' undeclared (first use in this function)
|  5021 |         *addr = (void *)GetPrivateDataEXT;
|       |                         ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c: In function 'loader_create_instance_chain':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6010:5: error: unknown type name 'VkLoaderFeatureFlags'; did you mean 'VkFormatFeatureFlags'?
|  6010 |     VkLoaderFeatureFlags feature_flags = 0;
|       |     ^~~~~~~~~~~~~~~~~~~~
|       |     VkFormatFeatureFlags
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6044:25: error: 'VK_LOADER_FEATURES' undeclared (first use in this function); did you mean 'VK_LOADER_DATA'?
|  6044 |             .function = VK_LOADER_FEATURES,
|       |                         ^~~~~~~~~~~~~~~~~~
|       |                         VK_LOADER_DATA
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:18: error: 'union <anonymous>' has no member named 'loaderFeatures'
|  6046 |                 .loaderFeatures = feature_flags,
|       |                  ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:35: warning: initialization of 'VkLayerInstanceLink *' {aka 'struct VkLayerInstanceLink_ *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
|  6046 |                 .loaderFeatures = feature_flags,
|       |                                   ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:6046:35: note: (near initialization for 'loader_features.u.pLayerInfo')
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c: In function 'ReadSortedPhysicalDevices':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7134:1: warning: label 'out' defined but not used [-Wunused-label]
|  7134 | out:
|       | ^~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7035:29: warning: unused variable 'icd_term' [-Wunused-variable]
|  7035 |     struct loader_icd_term* icd_term = NULL;
|       |                             ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.148.0-r0/git/loader/loader.c:7034:14: warning: unused variable 'sorted_alloc' [-Wunused-variable]
|  7034 |     uint32_t sorted_alloc = 0;
|       |              ^~~~~~~~~~~~
| ninja: build stopped: subcommand failed.
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe vulkan-loader-1.2.148.0-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2428 tasks of which 2419 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.148.0.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============7177678193002213631==--
