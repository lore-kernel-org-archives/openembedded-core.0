Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12420.1602843683161759980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5B60F38C1671
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.2.154.1 FAILED
Message-ID: <MADEUP.163E71D71B4B711E.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143482
Content-Type: multipart/mixed; boundary="===============5055312706133856728=="

--===============5055312706133856728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.2.154.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.2.135.0-1.2.154.1.patch
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

--===============5055312706133856728==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.2.135.0-1.2.154.1.patch"

From 4509d8d77d715b1343e6c79724ed2da67b747a19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:00:47 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.2.135.0 -> 1.2.154.1

---
 ...{vulkan-loader_1.2.135.0.bb => vulkan-loader_1.2.154.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.135.0.bb => vulkan-loader_1.2.154.1.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
index 8bab58f0b9..23bf59f8a6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.135"
-SRCREV = "86429d9e7f3542e88fb98ffa7d8a82c10c9828ac"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.154"
+SRCREV = "2aa801755eab3fab610d9676c4dd94054e30c854"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.4


--===============5055312706133856728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1462 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c1e91f44d3fc14b9ac260aa96d5061c2266daabe"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 228 Found 220 Missed 8 Current 494 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1564 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_fetch)
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_fetch: Succeeded
NOTE: Running task 2247 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_unpack)
NOTE: Running task 2248 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_unpack: Succeeded
NOTE: Running task 2249 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_patch)
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_patch: Succeeded
NOTE: Running task 2250 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_generate_toolchain_file)
NOTE: Running task 2251 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2252 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2253 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_configure)
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_configure: Succeeded
NOTE: Running task 2254 of 2261 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_compile)
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_compile: Started
ERROR: vulkan-loader-1.2.154.1-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038' failed with exit code 1:
[1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/murmurhash.c
[2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c
FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c:23:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
  537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
  538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
  539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
  540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
  541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
  542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
[3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c
FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c:31:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
  537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
  538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
  539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
  540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
  541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
  542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
[4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c
FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
  537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
  538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
  539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
  540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
  541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
  542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                   ^
[5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c
FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c:33:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
  537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
  538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
  539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
  540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
  541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
  542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
[6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c
FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
  537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
  538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
  539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
  540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
  541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
  542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:196:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  196 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
      |                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:198:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  198 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
      |                                                             ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:37,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:204:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  204 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
      |                            ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:254:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  254 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:300:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  300 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:348:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  348 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:398:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  398 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:426:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  426 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:668:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  668 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:676:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  676 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:783:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  783 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:791:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  791 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:900:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  900 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:908:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  908 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1168:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1168 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1176:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1176 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1626:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1626 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1634:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1634 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1667:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1667 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1711:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1711 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1741:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1741 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1743:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1743 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
      |                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1961:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1961 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1977:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1977 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2001:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2001 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2039:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2039 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2044:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2044 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2066:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2066 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
[7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c
FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
  537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
  538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
  539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
  540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
  541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
  542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
[8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c
FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.h:26,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c:37:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
  537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
  538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
  539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
  540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
  541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
  542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c:39:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_object_types.h:215:5: error: 'VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT' undeclared here (not in a function)
  215 |     VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT,   // kVulkanObjectTypePrivateDataSlotEXT
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-pok
 y-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/
 tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/cJSON.c
[10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-po
 ky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build
 /tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c
FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux
 /vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/wor
 k/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:60:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
  537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
  538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
  539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
  540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
  541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
  542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
  561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
  707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
  708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
  709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
  710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
  711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
  712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
  713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
  714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
  715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
  716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
  717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
  718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
  729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
  730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
  731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
  732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:89:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:33: error: 'PFN_vkCmdCopyBuffer2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyBuffer'?
  600 |     table->CmdCopyBuffer2KHR = (PFN_vkCmdCopyBuffer2KHR)gdpa(dev, "vkCmdCopyBuffer2KHR");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
      |                                 PFN_vkCmdCopyBuffer
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:33: note: each undeclared identifier is reported only once for each function it appears in
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:57: error: expected ';' before 'gdpa'
  600 |     table->CmdCopyBuffer2KHR = (PFN_vkCmdCopyBuffer2KHR)gdpa(dev, "vkCmdCopyBuffer2KHR");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:601:32: error: 'PFN_vkCmdCopyImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyImage'?
  601 |     table->CmdCopyImage2KHR = (PFN_vkCmdCopyImage2KHR)gdpa(dev, "vkCmdCopyImage2KHR");
      |                                ^~~~~~~~~~~~~~~~~~~~~~
      |                                PFN_vkCmdCopyImage
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:601:55: error: expected ';' before 'gdpa'
  601 |     table->CmdCopyImage2KHR = (PFN_vkCmdCopyImage2KHR)gdpa(dev, "vkCmdCopyImage2KHR");
      |                                                       ^~~~
      |                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:602:40: error: 'PFN_vkCmdCopyBufferToImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyBufferToImage'?
  602 |     table->CmdCopyBufferToImage2KHR = (PFN_vkCmdCopyBufferToImage2KHR)gdpa(dev, "vkCmdCopyBufferToImage2KHR");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                        PFN_vkCmdCopyBufferToImage
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:602:71: error: expected ';' before 'gdpa'
  602 |     table->CmdCopyBufferToImage2KHR = (PFN_vkCmdCopyBufferToImage2KHR)gdpa(dev, "vkCmdCopyBufferToImage2KHR");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:603:40: error: 'PFN_vkCmdCopyImageToBuffer2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyImageToBuffer'?
  603 |     table->CmdCopyImageToBuffer2KHR = (PFN_vkCmdCopyImageToBuffer2KHR)gdpa(dev, "vkCmdCopyImageToBuffer2KHR");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                        PFN_vkCmdCopyImageToBuffer
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:603:71: error: expected ';' before 'gdpa'
  603 |     table->CmdCopyImageToBuffer2KHR = (PFN_vkCmdCopyImageToBuffer2KHR)gdpa(dev, "vkCmdCopyImageToBuffer2KHR");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:604:32: error: 'PFN_vkCmdBlitImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdBlitImage'?
  604 |     table->CmdBlitImage2KHR = (PFN_vkCmdBlitImage2KHR)gdpa(dev, "vkCmdBlitImage2KHR");
      |                                ^~~~~~~~~~~~~~~~~~~~~~
      |                                PFN_vkCmdBlitImage
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:604:55: error: expected ';' before 'gdpa'
  604 |     table->CmdBlitImage2KHR = (PFN_vkCmdBlitImage2KHR)gdpa(dev, "vkCmdBlitImage2KHR");
      |                                                       ^~~~
      |                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:605:35: error: 'PFN_vkCmdResolveImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdResolveImage'?
  605 |     table->CmdResolveImage2KHR = (PFN_vkCmdResolveImage2KHR)gdpa(dev, "vkCmdResolveImage2KHR");
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
      |                                   PFN_vkCmdResolveImage
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:605:61: error: expected ';' before 'gdpa'
  605 |     table->CmdResolveImage2KHR = (PFN_vkCmdResolveImage2KHR)gdpa(dev, "vkCmdResolveImage2KHR");
      |                                                             ^~~~
      |                                                             ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:624:38: error: 'PFN_vkGetImageViewAddressNVX' undeclared (first use in this function); did you mean 'PFN_vkGetImageViewHandleNVX'?
  624 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                      PFN_vkGetImageViewHandleNVX
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:624:67: error: expected ';' before 'gdpa'
  624 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
      |                                                                   ^~~~
      |                                                                   ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:770:33: error: 'PFN_vkCmdSetCullModeEXT' undeclared (first use in this function)
  770 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:770:57: error: expected ';' before 'gdpa'
  770 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:771:34: error: 'PFN_vkCmdSetFrontFaceEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
  771 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                  PFN_vkCmdSetLineStippleEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:771:59: error: expected ';' before 'gdpa'
  771 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
      |                                                           ^~~~
      |                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:772:42: error: 'PFN_vkCmdSetPrimitiveTopologyEXT' undeclared (first use in this function)
  772 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:772:75: error: expected ';' before 'gdpa'
  772 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
      |                                                                           ^~~~
      |                                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:773:42: error: 'PFN_vkCmdSetViewportWithCountEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetViewportWScalingNV'?
  773 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                          PFN_vkCmdSetViewportWScalingNV
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:773:75: error: expected ';' before 'gdpa'
  773 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
      |                                                                           ^~~~
      |                                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:774:41: error: 'PFN_vkCmdSetScissorWithCountEXT' undeclared (first use in this function)
  774 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:774:73: error: expected ';' before 'gdpa'
  774 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
      |                                                                         ^~~~
      |                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:775:40: error: 'PFN_vkCmdBindVertexBuffers2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdBindVertexBuffers'?
  775 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                        PFN_vkCmdBindVertexBuffers
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:775:71: error: expected ';' before 'gdpa'
  775 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:776:40: error: 'PFN_vkCmdSetDepthTestEnableEXT' undeclared (first use in this function)
  776 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:776:71: error: expected ';' before 'gdpa'
  776 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:777:41: error: 'PFN_vkCmdSetDepthWriteEnableEXT' undeclared (first use in this function)
  777 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:777:73: error: expected ';' before 'gdpa'
  777 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
      |                                                                         ^~~~
      |                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:778:39: error: 'PFN_vkCmdSetDepthCompareOpEXT' undeclared (first use in this function)
  778 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:778:69: error: expected ';' before 'gdpa'
  778 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
      |                                                                     ^~~~
      |                                                                     ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:779:46: error: 'PFN_vkCmdSetDepthBoundsTestEnableEXT' undeclared (first use in this function)
  779 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
      |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:779:83: error: expected ';' before 'gdpa'
  779 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
      |                                                                                   ^~~~
      |                                                                                   ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:780:42: error: 'PFN_vkCmdSetStencilTestEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilReference'?
  780 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                          PFN_vkCmdSetStencilReference
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:780:75: error: expected ';' before 'gdpa'
  780 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
      |                                                                           ^~~~
      |                                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:781:34: error: 'PFN_vkCmdSetStencilOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
  781 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                  PFN_vkCmdSetLineStippleEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:781:59: error: expected ';' before 'gdpa'
  781 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
      |                                                           ^~~~
      |                                                           ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:792:40: error: 'PFN_vkCreatePrivateDataSlotEXT' undeclared (first use in this function)
  792 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:792:71: error: expected ';' before 'gdpa'
  792 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:793:41: error: 'PFN_vkDestroyPrivateDataSlotEXT' undeclared (first use in this function)
  793 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:793:73: error: expected ';' before 'gdpa'
  793 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
      |                                                                         ^~~~
      |                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:794:33: error: 'PFN_vkSetPrivateDataEXT' undeclared (first use in this function); did you mean 'PFN_vkSetHdrMetadataEXT'?
  794 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
      |                                 PFN_vkSetHdrMetadataEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:794:57: error: expected ';' before 'gdpa'
  794 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:795:33: error: 'PFN_vkGetPrivateDataEXT' undeclared (first use in this function)
  795 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:795:57: error: expected ';' before 'gdpa'
  795 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2412:11: error: unknown type name 'VkCopyBufferInfo2KHR'
 2412 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyBuffer2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2414:5: error: called object is not a function or function pointer
 2414 |     disp->CmdCopyBuffer2KHR(commandBuffer, pCopyBufferInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2419:11: error: unknown type name 'VkCopyImageInfo2KHR'
 2419 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo) {
      |           ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyImage2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2421:5: error: called object is not a function or function pointer
 2421 |     disp->CmdCopyImage2KHR(commandBuffer, pCopyImageInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2426:11: error: unknown type name 'VkCopyBufferToImageInfo2KHR'
 2426 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyBufferToImage2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2428:5: error: called object is not a function or function pointer
 2428 |     disp->CmdCopyBufferToImage2KHR(commandBuffer, pCopyBufferToImageInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2433:11: error: unknown type name 'VkCopyImageToBufferInfo2KHR'
 2433 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyImageToBuffer2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2435:5: error: called object is not a function or function pointer
 2435 |     disp->CmdCopyImageToBuffer2KHR(commandBuffer, pCopyImageToBufferInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2440:11: error: unknown type name 'VkBlitImageInfo2KHR'
 2440 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo) {
      |           ^~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBlitImage2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2442:5: error: called object is not a function or function pointer
 2442 |     disp->CmdBlitImage2KHR(commandBuffer, pBlitImageInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2447:11: error: unknown type name 'VkResolveImageInfo2KHR'
 2447 |     const VkResolveImageInfo2KHR*               pResolveImageInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdResolveImage2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2449:5: error: called object is not a function or function pointer
 2449 |     disp->CmdResolveImage2KHR(commandBuffer, pResolveImageInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2637:5: error: unknown type name 'VkImageViewAddressPropertiesNVX'
 2637 |     VkImageViewAddressPropertiesNVX*            pProperties) {
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:89:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetCullModeEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3701:5: error: called object is not a function or function pointer
 3701 |     disp->CmdSetCullModeEXT(commandBuffer, cullMode);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetFrontFaceEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3708:5: error: called object is not a function or function pointer
 3708 |     disp->CmdSetFrontFaceEXT(commandBuffer, frontFace);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveTopologyEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3715:5: error: called object is not a function or function pointer
 3715 |     disp->CmdSetPrimitiveTopologyEXT(commandBuffer, primitiveTopology);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetViewportWithCountEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3723:5: error: called object is not a function or function pointer
 3723 |     disp->CmdSetViewportWithCountEXT(commandBuffer, viewportCount, pViewports);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetScissorWithCountEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3731:5: error: called object is not a function or function pointer
 3731 |     disp->CmdSetScissorWithCountEXT(commandBuffer, scissorCount, pScissors);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindVertexBuffers2EXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3743:5: error: called object is not a function or function pointer
 3743 |     disp->CmdBindVertexBuffers2EXT(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets, pSizes, pStrides);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthTestEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3750:5: error: called object is not a function or function pointer
 3750 |     disp->CmdSetDepthTestEnableEXT(commandBuffer, depthTestEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthWriteEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3757:5: error: called object is not a function or function pointer
 3757 |     disp->CmdSetDepthWriteEnableEXT(commandBuffer, depthWriteEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthCompareOpEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3764:5: error: called object is not a function or function pointer
 3764 |     disp->CmdSetDepthCompareOpEXT(commandBuffer, depthCompareOp);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBoundsTestEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3771:5: error: called object is not a function or function pointer
 3771 |     disp->CmdSetDepthBoundsTestEnableEXT(commandBuffer, depthBoundsTestEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilTestEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3778:5: error: called object is not a function or function pointer
 3778 |     disp->CmdSetStencilTestEnableEXT(commandBuffer, stencilTestEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilOpEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3789:5: error: called object is not a function or function pointer
 3789 |     disp->CmdSetStencilOpEXT(commandBuffer, faceMask, failOp, passOp, depthFailOp, compareOp);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3849:11: error: unknown type name 'VkPrivateDataSlotCreateInfoEXT'
 3849 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3851:5: error: unknown type name 'VkPrivateDataSlotEXT'
 3851 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot) {
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3858:5: error: unknown type name 'VkPrivateDataSlotEXT'
 3858 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3868:5: error: unknown type name 'VkPrivateDataSlotEXT'
 3868 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3878:5: error: unknown type name 'VkPrivateDataSlotEXT'
 3878 |     VkPrivateDataSlotEXT                        privateDataSlot,
      |     ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:4526:25: error: 'GetImageViewAddressNVX' undeclared (first use in this function); did you mean 'GetImageViewHandleNVX'?
 4526 |         *addr = (void *)GetImageViewAddressNVX;
      |                         ^~~~~~~~~~~~~~~~~~~~~~
      |                         GetImageViewHandleNVX
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5096:25: error: 'CreatePrivateDataSlotEXT' undeclared (first use in this function)
 5096 |         *addr = (void *)CreatePrivateDataSlotEXT;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5100:25: error: 'DestroyPrivateDataSlotEXT' undeclared (first use in this function)
 5100 |         *addr = (void *)DestroyPrivateDataSlotEXT;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5104:25: error: 'SetPrivateDataEXT' undeclared (first use in this function)
 5104 |         *addr = (void *)SetPrivateDataEXT;
      |                         ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5108:25: error: 'GetPrivateDataEXT' undeclared (first use in this function)
 5108 |         *addr = (void *)GetPrivateDataEXT;
      |                         ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c: In function 'loader_create_instance_chain':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6037:5: error: unknown type name 'VkLoaderFeatureFlags'; did you mean 'VkFormatFeatureFlags'?
 6037 |     VkLoaderFeatureFlags feature_flags = 0;
      |     ^~~~~~~~~~~~~~~~~~~~
      |     VkFormatFeatureFlags
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6071:25: error: 'VK_LOADER_FEATURES' undeclared (first use in this function); did you mean 'VK_LOADER_DATA'?
 6071 |             .function = VK_LOADER_FEATURES,
      |                         ^~~~~~~~~~~~~~~~~~
      |                         VK_LOADER_DATA
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:18: error: 'union <anonymous>' has no member named 'loaderFeatures'
 6073 |                 .loaderFeatures = feature_flags,
      |                  ^~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:35: warning: initialization of 'VkLayerInstanceLink *' {aka 'struct VkLayerInstanceLink_ *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
 6073 |                 .loaderFeatures = feature_flags,
      |                                   ^~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:35: note: (near initialization for 'loader_features.u.pLayerInfo')
ninja: build stopped: subcommand failed.
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038:155 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
WARNING: Backtrace (BB generated script): 
	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 155
	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 149
	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 144
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 168

Backtrace (metadata-relative locations):
	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 205
	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 209
	#3: do_compile, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/log.do_compile.3468038
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/build --target all --
| [1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/murmurhash.c
| [2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c
| FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                   ^
| [5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:196:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   196 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:198:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   198 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
|       |                                                             ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:204:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   204 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
|       |                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:254:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   254 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:300:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   300 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:348:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   348 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:398:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   398 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:426:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   426 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:668:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   668 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:676:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   676 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:783:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   783 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:791:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   791 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:900:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   900 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:908:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   908 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1168:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1168 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1176:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1176 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1626:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1626 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1634:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1634 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1667:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1667 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1711:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1711 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1741:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1741 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1743:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1743 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1961:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1961 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1977:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1977 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2001:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2001 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2039:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2039 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2044:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2044 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2066:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2066 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| [7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_object_types.h:215:5: error: 'VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT' undeclared here (not in a function)
|   215 |     VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT,   // kVulkanObjectTypePrivateDataSlotEXT
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/cJSON.c
| [10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/bui
 ld/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:89:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:33: error: 'PFN_vkCmdCopyBuffer2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyBuffer'?
|   600 |     table->CmdCopyBuffer2KHR = (PFN_vkCmdCopyBuffer2KHR)gdpa(dev, "vkCmdCopyBuffer2KHR");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkCmdCopyBuffer
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:33: note: each undeclared identifier is reported only once for each function it appears in
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:57: error: expected ';' before 'gdpa'
|   600 |     table->CmdCopyBuffer2KHR = (PFN_vkCmdCopyBuffer2KHR)gdpa(dev, "vkCmdCopyBuffer2KHR");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:601:32: error: 'PFN_vkCmdCopyImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyImage'?
|   601 |     table->CmdCopyImage2KHR = (PFN_vkCmdCopyImage2KHR)gdpa(dev, "vkCmdCopyImage2KHR");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkCmdCopyImage
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:601:55: error: expected ';' before 'gdpa'
|   601 |     table->CmdCopyImage2KHR = (PFN_vkCmdCopyImage2KHR)gdpa(dev, "vkCmdCopyImage2KHR");
|       |                                                       ^~~~
|       |                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:602:40: error: 'PFN_vkCmdCopyBufferToImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyBufferToImage'?
|   602 |     table->CmdCopyBufferToImage2KHR = (PFN_vkCmdCopyBufferToImage2KHR)gdpa(dev, "vkCmdCopyBufferToImage2KHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdCopyBufferToImage
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:602:71: error: expected ';' before 'gdpa'
|   602 |     table->CmdCopyBufferToImage2KHR = (PFN_vkCmdCopyBufferToImage2KHR)gdpa(dev, "vkCmdCopyBufferToImage2KHR");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:603:40: error: 'PFN_vkCmdCopyImageToBuffer2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyImageToBuffer'?
|   603 |     table->CmdCopyImageToBuffer2KHR = (PFN_vkCmdCopyImageToBuffer2KHR)gdpa(dev, "vkCmdCopyImageToBuffer2KHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdCopyImageToBuffer
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:603:71: error: expected ';' before 'gdpa'
|   603 |     table->CmdCopyImageToBuffer2KHR = (PFN_vkCmdCopyImageToBuffer2KHR)gdpa(dev, "vkCmdCopyImageToBuffer2KHR");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:604:32: error: 'PFN_vkCmdBlitImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdBlitImage'?
|   604 |     table->CmdBlitImage2KHR = (PFN_vkCmdBlitImage2KHR)gdpa(dev, "vkCmdBlitImage2KHR");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkCmdBlitImage
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:604:55: error: expected ';' before 'gdpa'
|   604 |     table->CmdBlitImage2KHR = (PFN_vkCmdBlitImage2KHR)gdpa(dev, "vkCmdBlitImage2KHR");
|       |                                                       ^~~~
|       |                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:605:35: error: 'PFN_vkCmdResolveImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdResolveImage'?
|   605 |     table->CmdResolveImage2KHR = (PFN_vkCmdResolveImage2KHR)gdpa(dev, "vkCmdResolveImage2KHR");
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                   PFN_vkCmdResolveImage
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:605:61: error: expected ';' before 'gdpa'
|   605 |     table->CmdResolveImage2KHR = (PFN_vkCmdResolveImage2KHR)gdpa(dev, "vkCmdResolveImage2KHR");
|       |                                                             ^~~~
|       |                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:624:38: error: 'PFN_vkGetImageViewAddressNVX' undeclared (first use in this function); did you mean 'PFN_vkGetImageViewHandleNVX'?
|   624 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      PFN_vkGetImageViewHandleNVX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:624:67: error: expected ';' before 'gdpa'
|   624 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:770:33: error: 'PFN_vkCmdSetCullModeEXT' undeclared (first use in this function)
|   770 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:770:57: error: expected ';' before 'gdpa'
|   770 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:771:34: error: 'PFN_vkCmdSetFrontFaceEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   771 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCmdSetLineStippleEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:771:59: error: expected ';' before 'gdpa'
|   771 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:772:42: error: 'PFN_vkCmdSetPrimitiveTopologyEXT' undeclared (first use in this function)
|   772 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:772:75: error: expected ';' before 'gdpa'
|   772 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:773:42: error: 'PFN_vkCmdSetViewportWithCountEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetViewportWScalingNV'?
|   773 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkCmdSetViewportWScalingNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:773:75: error: expected ';' before 'gdpa'
|   773 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:774:41: error: 'PFN_vkCmdSetScissorWithCountEXT' undeclared (first use in this function)
|   774 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:774:73: error: expected ';' before 'gdpa'
|   774 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:775:40: error: 'PFN_vkCmdBindVertexBuffers2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdBindVertexBuffers'?
|   775 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdBindVertexBuffers
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:775:71: error: expected ';' before 'gdpa'
|   775 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:776:40: error: 'PFN_vkCmdSetDepthTestEnableEXT' undeclared (first use in this function)
|   776 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:776:71: error: expected ';' before 'gdpa'
|   776 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:777:41: error: 'PFN_vkCmdSetDepthWriteEnableEXT' undeclared (first use in this function)
|   777 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:777:73: error: expected ';' before 'gdpa'
|   777 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:778:39: error: 'PFN_vkCmdSetDepthCompareOpEXT' undeclared (first use in this function)
|   778 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:778:69: error: expected ';' before 'gdpa'
|   778 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
|       |                                                                     ^~~~
|       |                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:779:46: error: 'PFN_vkCmdSetDepthBoundsTestEnableEXT' undeclared (first use in this function)
|   779 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:779:83: error: expected ';' before 'gdpa'
|   779 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
|       |                                                                                   ^~~~
|       |                                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:780:42: error: 'PFN_vkCmdSetStencilTestEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilReference'?
|   780 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkCmdSetStencilReference
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:780:75: error: expected ';' before 'gdpa'
|   780 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:781:34: error: 'PFN_vkCmdSetStencilOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   781 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCmdSetLineStippleEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:781:59: error: expected ';' before 'gdpa'
|   781 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:792:40: error: 'PFN_vkCreatePrivateDataSlotEXT' undeclared (first use in this function)
|   792 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:792:71: error: expected ';' before 'gdpa'
|   792 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:793:41: error: 'PFN_vkDestroyPrivateDataSlotEXT' undeclared (first use in this function)
|   793 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:793:73: error: expected ';' before 'gdpa'
|   793 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:794:33: error: 'PFN_vkSetPrivateDataEXT' undeclared (first use in this function); did you mean 'PFN_vkSetHdrMetadataEXT'?
|   794 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkSetHdrMetadataEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:794:57: error: expected ';' before 'gdpa'
|   794 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:795:33: error: 'PFN_vkGetPrivateDataEXT' undeclared (first use in this function)
|   795 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:795:57: error: expected ';' before 'gdpa'
|   795 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2412:11: error: unknown type name 'VkCopyBufferInfo2KHR'
|  2412 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyBuffer2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2414:5: error: called object is not a function or function pointer
|  2414 |     disp->CmdCopyBuffer2KHR(commandBuffer, pCopyBufferInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2419:11: error: unknown type name 'VkCopyImageInfo2KHR'
|  2419 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyImage2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2421:5: error: called object is not a function or function pointer
|  2421 |     disp->CmdCopyImage2KHR(commandBuffer, pCopyImageInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2426:11: error: unknown type name 'VkCopyBufferToImageInfo2KHR'
|  2426 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyBufferToImage2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2428:5: error: called object is not a function or function pointer
|  2428 |     disp->CmdCopyBufferToImage2KHR(commandBuffer, pCopyBufferToImageInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2433:11: error: unknown type name 'VkCopyImageToBufferInfo2KHR'
|  2433 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyImageToBuffer2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2435:5: error: called object is not a function or function pointer
|  2435 |     disp->CmdCopyImageToBuffer2KHR(commandBuffer, pCopyImageToBufferInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2440:11: error: unknown type name 'VkBlitImageInfo2KHR'
|  2440 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBlitImage2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2442:5: error: called object is not a function or function pointer
|  2442 |     disp->CmdBlitImage2KHR(commandBuffer, pBlitImageInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2447:11: error: unknown type name 'VkResolveImageInfo2KHR'
|  2447 |     const VkResolveImageInfo2KHR*               pResolveImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdResolveImage2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2449:5: error: called object is not a function or function pointer
|  2449 |     disp->CmdResolveImage2KHR(commandBuffer, pResolveImageInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2637:5: error: unknown type name 'VkImageViewAddressPropertiesNVX'
|  2637 |     VkImageViewAddressPropertiesNVX*            pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:89:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetCullModeEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3701:5: error: called object is not a function or function pointer
|  3701 |     disp->CmdSetCullModeEXT(commandBuffer, cullMode);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetFrontFaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3708:5: error: called object is not a function or function pointer
|  3708 |     disp->CmdSetFrontFaceEXT(commandBuffer, frontFace);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveTopologyEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3715:5: error: called object is not a function or function pointer
|  3715 |     disp->CmdSetPrimitiveTopologyEXT(commandBuffer, primitiveTopology);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetViewportWithCountEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3723:5: error: called object is not a function or function pointer
|  3723 |     disp->CmdSetViewportWithCountEXT(commandBuffer, viewportCount, pViewports);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetScissorWithCountEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3731:5: error: called object is not a function or function pointer
|  3731 |     disp->CmdSetScissorWithCountEXT(commandBuffer, scissorCount, pScissors);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindVertexBuffers2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3743:5: error: called object is not a function or function pointer
|  3743 |     disp->CmdBindVertexBuffers2EXT(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets, pSizes, pStrides);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3750:5: error: called object is not a function or function pointer
|  3750 |     disp->CmdSetDepthTestEnableEXT(commandBuffer, depthTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthWriteEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3757:5: error: called object is not a function or function pointer
|  3757 |     disp->CmdSetDepthWriteEnableEXT(commandBuffer, depthWriteEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthCompareOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3764:5: error: called object is not a function or function pointer
|  3764 |     disp->CmdSetDepthCompareOpEXT(commandBuffer, depthCompareOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBoundsTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3771:5: error: called object is not a function or function pointer
|  3771 |     disp->CmdSetDepthBoundsTestEnableEXT(commandBuffer, depthBoundsTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3778:5: error: called object is not a function or function pointer
|  3778 |     disp->CmdSetStencilTestEnableEXT(commandBuffer, stencilTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3789:5: error: called object is not a function or function pointer
|  3789 |     disp->CmdSetStencilOpEXT(commandBuffer, faceMask, failOp, passOp, depthFailOp, compareOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3849:11: error: unknown type name 'VkPrivateDataSlotCreateInfoEXT'
|  3849 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3851:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3851 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot) {
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3858:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3858 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3868:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3868 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3878:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3878 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:4526:25: error: 'GetImageViewAddressNVX' undeclared (first use in this function); did you mean 'GetImageViewHandleNVX'?
|  4526 |         *addr = (void *)GetImageViewAddressNVX;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
|       |                         GetImageViewHandleNVX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5096:25: error: 'CreatePrivateDataSlotEXT' undeclared (first use in this function)
|  5096 |         *addr = (void *)CreatePrivateDataSlotEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5100:25: error: 'DestroyPrivateDataSlotEXT' undeclared (first use in this function)
|  5100 |         *addr = (void *)DestroyPrivateDataSlotEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5104:25: error: 'SetPrivateDataEXT' undeclared (first use in this function)
|  5104 |         *addr = (void *)SetPrivateDataEXT;
|       |                         ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5108:25: error: 'GetPrivateDataEXT' undeclared (first use in this function)
|  5108 |         *addr = (void *)GetPrivateDataEXT;
|       |                         ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c: In function 'loader_create_instance_chain':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6037:5: error: unknown type name 'VkLoaderFeatureFlags'; did you mean 'VkFormatFeatureFlags'?
|  6037 |     VkLoaderFeatureFlags feature_flags = 0;
|       |     ^~~~~~~~~~~~~~~~~~~~
|       |     VkFormatFeatureFlags
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6071:25: error: 'VK_LOADER_FEATURES' undeclared (first use in this function); did you mean 'VK_LOADER_DATA'?
|  6071 |             .function = VK_LOADER_FEATURES,
|       |                         ^~~~~~~~~~~~~~~~~~
|       |                         VK_LOADER_DATA
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:18: error: 'union <anonymous>' has no member named 'loaderFeatures'
|  6073 |                 .loaderFeatures = feature_flags,
|       |                  ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:35: warning: initialization of 'VkLayerInstanceLink *' {aka 'struct VkLayerInstanceLink_ *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
|  6073 |                 .loaderFeatures = feature_flags,
|       |                                   ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:35: note: (near initialization for 'loader_features.u.pLayerInfo')
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038:155 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 155
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 149
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 144
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 168
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038' failed with exit code 1:
| [1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/murmurhash.c
| [2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c
| FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                   ^
| [5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:196:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   196 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:198:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   198 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
|       |                                                             ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:204:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   204 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
|       |                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:254:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   254 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:300:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   300 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:348:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   348 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:398:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   398 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:426:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   426 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:668:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   668 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:676:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   676 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:783:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   783 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:791:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   791 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:900:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   900 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:908:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   908 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1168:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1168 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1176:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1176 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1626:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1626 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1634:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1634 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1667:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1667 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1711:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1711 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1741:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1741 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1743:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1743 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1961:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1961 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:1977:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1977 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2001:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2001 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2039:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2039 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2044:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2044 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/wsi.c:2066:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2066 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| [7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| [8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/debug_utils.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_object_types.h:215:5: error: 'VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT' undeclared here (not in a function)
|   215 |     VK_OBJECT_TYPE_PRIVATE_DATA_SLOT_EXT,   // kVulkanObjectTypePrivateDataSlotEXT
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-p
 oky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/cJSON.c
| [10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-
 poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/bui
 ld/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-lin
 ux/vulkan-loader/1.2.154.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0=/usr/src/debug/vulkan-loader/1.2.154.1-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:537:5: error: unknown type name 'PFN_vkCmdCopyBuffer2KHR'
|   537 |     PFN_vkCmdCopyBuffer2KHR CmdCopyBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:538:5: error: unknown type name 'PFN_vkCmdCopyImage2KHR'
|   538 |     PFN_vkCmdCopyImage2KHR CmdCopyImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:539:5: error: unknown type name 'PFN_vkCmdCopyBufferToImage2KHR'
|   539 |     PFN_vkCmdCopyBufferToImage2KHR CmdCopyBufferToImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:540:5: error: unknown type name 'PFN_vkCmdCopyImageToBuffer2KHR'
|   540 |     PFN_vkCmdCopyImageToBuffer2KHR CmdCopyImageToBuffer2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:541:5: error: unknown type name 'PFN_vkCmdBlitImage2KHR'
|   541 |     PFN_vkCmdBlitImage2KHR CmdBlitImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:542:5: error: unknown type name 'PFN_vkCmdResolveImage2KHR'
|   542 |     PFN_vkCmdResolveImage2KHR CmdResolveImage2KHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:561:5: error: unknown type name 'PFN_vkGetImageViewAddressNVX'
|   561 |     PFN_vkGetImageViewAddressNVX GetImageViewAddressNVX;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:707:5: error: unknown type name 'PFN_vkCmdSetCullModeEXT'
|   707 |     PFN_vkCmdSetCullModeEXT CmdSetCullModeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:708:5: error: unknown type name 'PFN_vkCmdSetFrontFaceEXT'
|   708 |     PFN_vkCmdSetFrontFaceEXT CmdSetFrontFaceEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:709:5: error: unknown type name 'PFN_vkCmdSetPrimitiveTopologyEXT'
|   709 |     PFN_vkCmdSetPrimitiveTopologyEXT CmdSetPrimitiveTopologyEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:710:5: error: unknown type name 'PFN_vkCmdSetViewportWithCountEXT'
|   710 |     PFN_vkCmdSetViewportWithCountEXT CmdSetViewportWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:711:5: error: unknown type name 'PFN_vkCmdSetScissorWithCountEXT'
|   711 |     PFN_vkCmdSetScissorWithCountEXT CmdSetScissorWithCountEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:712:5: error: unknown type name 'PFN_vkCmdBindVertexBuffers2EXT'
|   712 |     PFN_vkCmdBindVertexBuffers2EXT CmdBindVertexBuffers2EXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:713:5: error: unknown type name 'PFN_vkCmdSetDepthTestEnableEXT'
|   713 |     PFN_vkCmdSetDepthTestEnableEXT CmdSetDepthTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:714:5: error: unknown type name 'PFN_vkCmdSetDepthWriteEnableEXT'
|   714 |     PFN_vkCmdSetDepthWriteEnableEXT CmdSetDepthWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:715:5: error: unknown type name 'PFN_vkCmdSetDepthCompareOpEXT'
|   715 |     PFN_vkCmdSetDepthCompareOpEXT CmdSetDepthCompareOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:716:5: error: unknown type name 'PFN_vkCmdSetDepthBoundsTestEnableEXT'
|   716 |     PFN_vkCmdSetDepthBoundsTestEnableEXT CmdSetDepthBoundsTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:717:5: error: unknown type name 'PFN_vkCmdSetStencilTestEnableEXT'
|   717 |     PFN_vkCmdSetStencilTestEnableEXT CmdSetStencilTestEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:718:5: error: unknown type name 'PFN_vkCmdSetStencilOpEXT'
|   718 |     PFN_vkCmdSetStencilOpEXT CmdSetStencilOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:729:5: error: unknown type name 'PFN_vkCreatePrivateDataSlotEXT'
|   729 |     PFN_vkCreatePrivateDataSlotEXT CreatePrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:730:5: error: unknown type name 'PFN_vkDestroyPrivateDataSlotEXT'
|   730 |     PFN_vkDestroyPrivateDataSlotEXT DestroyPrivateDataSlotEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:731:5: error: unknown type name 'PFN_vkSetPrivateDataEXT'
|   731 |     PFN_vkSetPrivateDataEXT SetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_layer_dispatch_table.h:732:5: error: unknown type name 'PFN_vkGetPrivateDataEXT'
|   732 |     PFN_vkGetPrivateDataEXT GetPrivateDataEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:89:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:33: error: 'PFN_vkCmdCopyBuffer2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyBuffer'?
|   600 |     table->CmdCopyBuffer2KHR = (PFN_vkCmdCopyBuffer2KHR)gdpa(dev, "vkCmdCopyBuffer2KHR");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkCmdCopyBuffer
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:33: note: each undeclared identifier is reported only once for each function it appears in
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:600:57: error: expected ';' before 'gdpa'
|   600 |     table->CmdCopyBuffer2KHR = (PFN_vkCmdCopyBuffer2KHR)gdpa(dev, "vkCmdCopyBuffer2KHR");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:601:32: error: 'PFN_vkCmdCopyImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyImage'?
|   601 |     table->CmdCopyImage2KHR = (PFN_vkCmdCopyImage2KHR)gdpa(dev, "vkCmdCopyImage2KHR");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkCmdCopyImage
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:601:55: error: expected ';' before 'gdpa'
|   601 |     table->CmdCopyImage2KHR = (PFN_vkCmdCopyImage2KHR)gdpa(dev, "vkCmdCopyImage2KHR");
|       |                                                       ^~~~
|       |                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:602:40: error: 'PFN_vkCmdCopyBufferToImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyBufferToImage'?
|   602 |     table->CmdCopyBufferToImage2KHR = (PFN_vkCmdCopyBufferToImage2KHR)gdpa(dev, "vkCmdCopyBufferToImage2KHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdCopyBufferToImage
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:602:71: error: expected ';' before 'gdpa'
|   602 |     table->CmdCopyBufferToImage2KHR = (PFN_vkCmdCopyBufferToImage2KHR)gdpa(dev, "vkCmdCopyBufferToImage2KHR");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:603:40: error: 'PFN_vkCmdCopyImageToBuffer2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdCopyImageToBuffer'?
|   603 |     table->CmdCopyImageToBuffer2KHR = (PFN_vkCmdCopyImageToBuffer2KHR)gdpa(dev, "vkCmdCopyImageToBuffer2KHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdCopyImageToBuffer
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:603:71: error: expected ';' before 'gdpa'
|   603 |     table->CmdCopyImageToBuffer2KHR = (PFN_vkCmdCopyImageToBuffer2KHR)gdpa(dev, "vkCmdCopyImageToBuffer2KHR");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:604:32: error: 'PFN_vkCmdBlitImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdBlitImage'?
|   604 |     table->CmdBlitImage2KHR = (PFN_vkCmdBlitImage2KHR)gdpa(dev, "vkCmdBlitImage2KHR");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkCmdBlitImage
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:604:55: error: expected ';' before 'gdpa'
|   604 |     table->CmdBlitImage2KHR = (PFN_vkCmdBlitImage2KHR)gdpa(dev, "vkCmdBlitImage2KHR");
|       |                                                       ^~~~
|       |                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:605:35: error: 'PFN_vkCmdResolveImage2KHR' undeclared (first use in this function); did you mean 'PFN_vkCmdResolveImage'?
|   605 |     table->CmdResolveImage2KHR = (PFN_vkCmdResolveImage2KHR)gdpa(dev, "vkCmdResolveImage2KHR");
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                   PFN_vkCmdResolveImage
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:605:61: error: expected ';' before 'gdpa'
|   605 |     table->CmdResolveImage2KHR = (PFN_vkCmdResolveImage2KHR)gdpa(dev, "vkCmdResolveImage2KHR");
|       |                                                             ^~~~
|       |                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:624:38: error: 'PFN_vkGetImageViewAddressNVX' undeclared (first use in this function); did you mean 'PFN_vkGetImageViewHandleNVX'?
|   624 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      PFN_vkGetImageViewHandleNVX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:624:67: error: expected ';' before 'gdpa'
|   624 |     table->GetImageViewAddressNVX = (PFN_vkGetImageViewAddressNVX)gdpa(dev, "vkGetImageViewAddressNVX");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:770:33: error: 'PFN_vkCmdSetCullModeEXT' undeclared (first use in this function)
|   770 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:770:57: error: expected ';' before 'gdpa'
|   770 |     table->CmdSetCullModeEXT = (PFN_vkCmdSetCullModeEXT)gdpa(dev, "vkCmdSetCullModeEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:771:34: error: 'PFN_vkCmdSetFrontFaceEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   771 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCmdSetLineStippleEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:771:59: error: expected ';' before 'gdpa'
|   771 |     table->CmdSetFrontFaceEXT = (PFN_vkCmdSetFrontFaceEXT)gdpa(dev, "vkCmdSetFrontFaceEXT");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:772:42: error: 'PFN_vkCmdSetPrimitiveTopologyEXT' undeclared (first use in this function)
|   772 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:772:75: error: expected ';' before 'gdpa'
|   772 |     table->CmdSetPrimitiveTopologyEXT = (PFN_vkCmdSetPrimitiveTopologyEXT)gdpa(dev, "vkCmdSetPrimitiveTopologyEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:773:42: error: 'PFN_vkCmdSetViewportWithCountEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetViewportWScalingNV'?
|   773 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkCmdSetViewportWScalingNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:773:75: error: expected ';' before 'gdpa'
|   773 |     table->CmdSetViewportWithCountEXT = (PFN_vkCmdSetViewportWithCountEXT)gdpa(dev, "vkCmdSetViewportWithCountEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:774:41: error: 'PFN_vkCmdSetScissorWithCountEXT' undeclared (first use in this function)
|   774 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:774:73: error: expected ';' before 'gdpa'
|   774 |     table->CmdSetScissorWithCountEXT = (PFN_vkCmdSetScissorWithCountEXT)gdpa(dev, "vkCmdSetScissorWithCountEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:775:40: error: 'PFN_vkCmdBindVertexBuffers2EXT' undeclared (first use in this function); did you mean 'PFN_vkCmdBindVertexBuffers'?
|   775 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdBindVertexBuffers
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:775:71: error: expected ';' before 'gdpa'
|   775 |     table->CmdBindVertexBuffers2EXT = (PFN_vkCmdBindVertexBuffers2EXT)gdpa(dev, "vkCmdBindVertexBuffers2EXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:776:40: error: 'PFN_vkCmdSetDepthTestEnableEXT' undeclared (first use in this function)
|   776 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:776:71: error: expected ';' before 'gdpa'
|   776 |     table->CmdSetDepthTestEnableEXT = (PFN_vkCmdSetDepthTestEnableEXT)gdpa(dev, "vkCmdSetDepthTestEnableEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:777:41: error: 'PFN_vkCmdSetDepthWriteEnableEXT' undeclared (first use in this function)
|   777 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:777:73: error: expected ';' before 'gdpa'
|   777 |     table->CmdSetDepthWriteEnableEXT = (PFN_vkCmdSetDepthWriteEnableEXT)gdpa(dev, "vkCmdSetDepthWriteEnableEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:778:39: error: 'PFN_vkCmdSetDepthCompareOpEXT' undeclared (first use in this function)
|   778 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:778:69: error: expected ';' before 'gdpa'
|   778 |     table->CmdSetDepthCompareOpEXT = (PFN_vkCmdSetDepthCompareOpEXT)gdpa(dev, "vkCmdSetDepthCompareOpEXT");
|       |                                                                     ^~~~
|       |                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:779:46: error: 'PFN_vkCmdSetDepthBoundsTestEnableEXT' undeclared (first use in this function)
|   779 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:779:83: error: expected ';' before 'gdpa'
|   779 |     table->CmdSetDepthBoundsTestEnableEXT = (PFN_vkCmdSetDepthBoundsTestEnableEXT)gdpa(dev, "vkCmdSetDepthBoundsTestEnableEXT");
|       |                                                                                   ^~~~
|       |                                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:780:42: error: 'PFN_vkCmdSetStencilTestEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilReference'?
|   780 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          PFN_vkCmdSetStencilReference
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:780:75: error: expected ';' before 'gdpa'
|   780 |     table->CmdSetStencilTestEnableEXT = (PFN_vkCmdSetStencilTestEnableEXT)gdpa(dev, "vkCmdSetStencilTestEnableEXT");
|       |                                                                           ^~~~
|       |                                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:781:34: error: 'PFN_vkCmdSetStencilOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetLineStippleEXT'?
|   781 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
|       |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                                  PFN_vkCmdSetLineStippleEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:781:59: error: expected ';' before 'gdpa'
|   781 |     table->CmdSetStencilOpEXT = (PFN_vkCmdSetStencilOpEXT)gdpa(dev, "vkCmdSetStencilOpEXT");
|       |                                                           ^~~~
|       |                                                           ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:792:40: error: 'PFN_vkCreatePrivateDataSlotEXT' undeclared (first use in this function)
|   792 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:792:71: error: expected ';' before 'gdpa'
|   792 |     table->CreatePrivateDataSlotEXT = (PFN_vkCreatePrivateDataSlotEXT)gdpa(dev, "vkCreatePrivateDataSlotEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:793:41: error: 'PFN_vkDestroyPrivateDataSlotEXT' undeclared (first use in this function)
|   793 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:793:73: error: expected ';' before 'gdpa'
|   793 |     table->DestroyPrivateDataSlotEXT = (PFN_vkDestroyPrivateDataSlotEXT)gdpa(dev, "vkDestroyPrivateDataSlotEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:794:33: error: 'PFN_vkSetPrivateDataEXT' undeclared (first use in this function); did you mean 'PFN_vkSetHdrMetadataEXT'?
|   794 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkSetHdrMetadataEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:794:57: error: expected ';' before 'gdpa'
|   794 |     table->SetPrivateDataEXT = (PFN_vkSetPrivateDataEXT)gdpa(dev, "vkSetPrivateDataEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:795:33: error: 'PFN_vkGetPrivateDataEXT' undeclared (first use in this function)
|   795 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:795:57: error: expected ';' before 'gdpa'
|   795 |     table->GetPrivateDataEXT = (PFN_vkGetPrivateDataEXT)gdpa(dev, "vkGetPrivateDataEXT");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2412:11: error: unknown type name 'VkCopyBufferInfo2KHR'
|  2412 |     const VkCopyBufferInfo2KHR*                 pCopyBufferInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyBuffer2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2414:5: error: called object is not a function or function pointer
|  2414 |     disp->CmdCopyBuffer2KHR(commandBuffer, pCopyBufferInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2419:11: error: unknown type name 'VkCopyImageInfo2KHR'
|  2419 |     const VkCopyImageInfo2KHR*                  pCopyImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyImage2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2421:5: error: called object is not a function or function pointer
|  2421 |     disp->CmdCopyImage2KHR(commandBuffer, pCopyImageInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2426:11: error: unknown type name 'VkCopyBufferToImageInfo2KHR'
|  2426 |     const VkCopyBufferToImageInfo2KHR*          pCopyBufferToImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyBufferToImage2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2428:5: error: called object is not a function or function pointer
|  2428 |     disp->CmdCopyBufferToImage2KHR(commandBuffer, pCopyBufferToImageInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2433:11: error: unknown type name 'VkCopyImageToBufferInfo2KHR'
|  2433 |     const VkCopyImageToBufferInfo2KHR*          pCopyImageToBufferInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdCopyImageToBuffer2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2435:5: error: called object is not a function or function pointer
|  2435 |     disp->CmdCopyImageToBuffer2KHR(commandBuffer, pCopyImageToBufferInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2440:11: error: unknown type name 'VkBlitImageInfo2KHR'
|  2440 |     const VkBlitImageInfo2KHR*                  pBlitImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBlitImage2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2442:5: error: called object is not a function or function pointer
|  2442 |     disp->CmdBlitImage2KHR(commandBuffer, pBlitImageInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2447:11: error: unknown type name 'VkResolveImageInfo2KHR'
|  2447 |     const VkResolveImageInfo2KHR*               pResolveImageInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdResolveImage2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2449:5: error: called object is not a function or function pointer
|  2449 |     disp->CmdResolveImage2KHR(commandBuffer, pResolveImageInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:2637:5: error: unknown type name 'VkImageViewAddressPropertiesNVX'
|  2637 |     VkImageViewAddressPropertiesNVX*            pProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:89:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetCullModeEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3701:5: error: called object is not a function or function pointer
|  3701 |     disp->CmdSetCullModeEXT(commandBuffer, cullMode);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetFrontFaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3708:5: error: called object is not a function or function pointer
|  3708 |     disp->CmdSetFrontFaceEXT(commandBuffer, frontFace);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveTopologyEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3715:5: error: called object is not a function or function pointer
|  3715 |     disp->CmdSetPrimitiveTopologyEXT(commandBuffer, primitiveTopology);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetViewportWithCountEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3723:5: error: called object is not a function or function pointer
|  3723 |     disp->CmdSetViewportWithCountEXT(commandBuffer, viewportCount, pViewports);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetScissorWithCountEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3731:5: error: called object is not a function or function pointer
|  3731 |     disp->CmdSetScissorWithCountEXT(commandBuffer, scissorCount, pScissors);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBindVertexBuffers2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3743:5: error: called object is not a function or function pointer
|  3743 |     disp->CmdBindVertexBuffers2EXT(commandBuffer, firstBinding, bindingCount, pBuffers, pOffsets, pSizes, pStrides);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3750:5: error: called object is not a function or function pointer
|  3750 |     disp->CmdSetDepthTestEnableEXT(commandBuffer, depthTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthWriteEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3757:5: error: called object is not a function or function pointer
|  3757 |     disp->CmdSetDepthWriteEnableEXT(commandBuffer, depthWriteEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthCompareOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3764:5: error: called object is not a function or function pointer
|  3764 |     disp->CmdSetDepthCompareOpEXT(commandBuffer, depthCompareOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBoundsTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3771:5: error: called object is not a function or function pointer
|  3771 |     disp->CmdSetDepthBoundsTestEnableEXT(commandBuffer, depthBoundsTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilTestEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3778:5: error: called object is not a function or function pointer
|  3778 |     disp->CmdSetStencilTestEnableEXT(commandBuffer, stencilTestEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetStencilOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3789:5: error: called object is not a function or function pointer
|  3789 |     disp->CmdSetStencilOpEXT(commandBuffer, faceMask, failOp, passOp, depthFailOp, compareOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3849:11: error: unknown type name 'VkPrivateDataSlotCreateInfoEXT'
|  3849 |     const VkPrivateDataSlotCreateInfoEXT*       pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3851:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3851 |     VkPrivateDataSlotEXT*                       pPrivateDataSlot) {
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3858:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3858 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3868:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3868 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:3878:5: error: unknown type name 'VkPrivateDataSlotEXT'
|  3878 |     VkPrivateDataSlotEXT                        privateDataSlot,
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:4526:25: error: 'GetImageViewAddressNVX' undeclared (first use in this function); did you mean 'GetImageViewHandleNVX'?
|  4526 |         *addr = (void *)GetImageViewAddressNVX;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
|       |                         GetImageViewHandleNVX
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5096:25: error: 'CreatePrivateDataSlotEXT' undeclared (first use in this function)
|  5096 |         *addr = (void *)CreatePrivateDataSlotEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5100:25: error: 'DestroyPrivateDataSlotEXT' undeclared (first use in this function)
|  5100 |         *addr = (void *)DestroyPrivateDataSlotEXT;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5104:25: error: 'SetPrivateDataEXT' undeclared (first use in this function)
|  5104 |         *addr = (void *)SetPrivateDataEXT;
|       |                         ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/generated/vk_loader_extensions.c:5108:25: error: 'GetPrivateDataEXT' undeclared (first use in this function)
|  5108 |         *addr = (void *)GetPrivateDataEXT;
|       |                         ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c: In function 'loader_create_instance_chain':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6037:5: error: unknown type name 'VkLoaderFeatureFlags'; did you mean 'VkFormatFeatureFlags'?
|  6037 |     VkLoaderFeatureFlags feature_flags = 0;
|       |     ^~~~~~~~~~~~~~~~~~~~
|       |     VkFormatFeatureFlags
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6071:25: error: 'VK_LOADER_FEATURES' undeclared (first use in this function); did you mean 'VK_LOADER_DATA'?
|  6071 |             .function = VK_LOADER_FEATURES,
|       |                         ^~~~~~~~~~~~~~~~~~
|       |                         VK_LOADER_DATA
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:18: error: 'union <anonymous>' has no member named 'loaderFeatures'
|  6073 |                 .loaderFeatures = feature_flags,
|       |                  ^~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:35: warning: initialization of 'VkLayerInstanceLink *' {aka 'struct VkLayerInstanceLink_ *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
|  6073 |                 .loaderFeatures = feature_flags,
|       |                                   ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/git/loader/loader.c:6073:35: note: (near initialization for 'loader_features.u.pLayerInfo')
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038:155 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 155
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 149
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 144
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.154.1-r0/temp/run.do_compile.3468038, line 168
| 
| Backtrace (metadata-relative locations):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 205
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 209
| 	#3: do_compile, autogenerated, line 2
NOTE: recipe vulkan-loader-1.2.154.1-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2254 tasks of which 2245 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5055312706133856728==--
