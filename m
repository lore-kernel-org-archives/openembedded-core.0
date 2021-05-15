Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.4453.1621074783574671062
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id B263E38C1297
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.2.176.0 FAILED
Message-ID: <MADEUP.167F36EDA6DD0B8C.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151824
Content-Type: multipart/mixed; boundary="===============3380820667834816654=="

--===============3380820667834816654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.2.176.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.2.170.0-1.2.176.0.patch
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

--===============3380820667834816654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.2.170.0-1.2.176.0.patch"

From 35440ad806473ceb8570dafd3af94d8424ac7cf1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 07:17:45 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.2.170.0 -> 1.2.176.0

---
 ...vulkan-loader_1.2.170.0.bb => vulkan-loader_1.2.176.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.170.0.bb => vulkan-loader_1.2.176.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb
index 6b6ed06dbb..1d047f4221 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb
@@ -9,9 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
-           "
-SRCREV = "c5678a03db383fd0dc5bfb8e9a383043bdbcb57b"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.176"
+SRCREV = "d4ef0ad0049ccc1a11bad2311faffe5426cd81d6"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============3380820667834816654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-e798f0418dbdf1a82baf7acc6661f9425c1c908b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e798f0418dbdf1a82baf7acc6661f9425c1c908b"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 246 Local 237 Network 0 Missed 9 Current 546 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1700 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_fetch: Succeeded
NOTE: Running task 2109 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_unpack)
NOTE: Running task 2110 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_unpack: Succeeded
NOTE: Running task 2452 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_patch: Succeeded
NOTE: Running task 2453 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_generate_toolchain_file)
NOTE: Running task 2454 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2455 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2456 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_configure: Started
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2464 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_compile)
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_compile: Started
ERROR: vulkan-loader-1.2.176.0-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782' failed with exit code 1:
[1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/murmurhash.c
[2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c
FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
  447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
  450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
  453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
  456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
  459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
  462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
  465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
  468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
  471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
  474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
  479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
  595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
  807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
  826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
  827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
  828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
  829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
  830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
  833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c
FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
  447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
  450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
  453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
  456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
  459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
  462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
  465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
  468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
  471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
  474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
  479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
  595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
  807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
  826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
  827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
  828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
  829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
  830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
  833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c
FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
  447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
  450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
  453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
  456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
  459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
  462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
  465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
  468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
  471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
  474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
  479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
  595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
  807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
  826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
  827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
  828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
  829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
  830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
  833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                   ^
[5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c
FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
  447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
  450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
  453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
  456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
  459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
  462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
  465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
  468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
  471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
  474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
  479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
  595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
  807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
  826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
  827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
  828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
  829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
  830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
  833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c
FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
  447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
  450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
  453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
  456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
  459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
  462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
  465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
  468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
  471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
  474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
  479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
  595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
  807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
  826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
  827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
  828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
  829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
  830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
  833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:226:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  226 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
      |                                                                         ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:228:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  228 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
      |                                                             ^
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:37,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:234:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  234 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
      |                            ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:284:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  284 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:330:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  330 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:378:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  378 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:428:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  428 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
      |                                                   ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:456:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  456 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:698:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  698 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:706:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  706 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:813:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  813 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:821:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  821 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:930:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  930 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:938:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
  938 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1198:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1198 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1206:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1206 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1845:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1845 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1853:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1853 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
      |                     ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1886:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1886 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1930:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
 1930 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1960:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1960 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1962:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 1962 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
      |                                                           ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2260:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2260 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2276:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2276 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2300:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2300 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2338:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2338 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
      |                                 ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2343:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2343 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2365:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
 2365 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
      |                                                       ^
[7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c
FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
  447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
  450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
  453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
  456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
  459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
  462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
  465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
  468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
  471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
  474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
  479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
  595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
  807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
  826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
  827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
  828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
  829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
  830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
  833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c
FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
  447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
  450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
  453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
  456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
  459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
  462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
  465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
  468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
  471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
  474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
  479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
  595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
  807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
  826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
  827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
  828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
  829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
  830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
  833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:39:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_object_types.h:216:5: error: 'VK_OBJECT_TYPE_VIDEO_SESSION_KHR' undeclared here (not in a function); did you mean 'VK_OBJECT_TYPE_DISPLAY_KHR'?
  216 |     VK_OBJECT_TYPE_VIDEO_SESSION_KHR,   // kVulkanObjectTypeVideoSessionKHR
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |     VK_OBJECT_TYPE_DISPLAY_KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_object_types.h:217:5: error: 'VK_OBJECT_TYPE_VIDEO_SESSION_PARAMETERS_KHR' undeclared here (not in a function)
  217 |     VK_OBJECT_TYPE_VIDEO_SESSION_PARAMETERS_KHR,   // kVulkanObjectTypeVideoSessionParametersKHR
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
[9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yoc
 to-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/cJSON.c
[10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/
 work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yo
 cto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c
FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cor
 e2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-work
 er/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
  447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
  450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
  453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
  456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
  459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
  462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
  465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
  468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
  471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
  474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
  479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
  595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
  807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
  826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
  827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
  828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
  829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
  830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
  833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
  304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
  307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_icd_init_entries':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: error: 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
   57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
      |                                    ^~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
  156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
      |     ^~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: note: each undeclared identifier is reported only once for each function it appears in
   57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
      |                                    ^~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
  156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
      |     ^~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:49: error: expected ';' before 'fp_gipa'
   57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
      |                                                 ^~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
  156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
      |     ^~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: error: 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceImageFormatProperties2KHR'?
   57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
      |                                    ^~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:159:5: note: in expansion of macro 'LOOKUP_GIPA'
  159 |     LOOKUP_GIPA(GetPhysicalDeviceVideoFormatPropertiesKHR, false);
      |     ^~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:49: error: expected ';' before 'fp_gipa'
   57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
      |                                                 ^~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:159:5: note: in expansion of macro 'LOOKUP_GIPA'
  159 |     LOOKUP_GIPA(GetPhysicalDeviceVideoFormatPropertiesKHR, false);
      |     ^~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:510:37: error: 'PFN_vkCreateVideoSessionKHR' undeclared (first use in this function); did you mean 'PFN_vkCreateRenderPass2KHR'?
  510 |     table->CreateVideoSessionKHR = (PFN_vkCreateVideoSessionKHR)gdpa(dev, "vkCreateVideoSessionKHR");
      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                     PFN_vkCreateRenderPass2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:510:65: error: expected ';' before 'gdpa'
  510 |     table->CreateVideoSessionKHR = (PFN_vkCreateVideoSessionKHR)gdpa(dev, "vkCreateVideoSessionKHR");
      |                                                                 ^~~~
      |                                                                 ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:513:38: error: 'PFN_vkDestroyVideoSessionKHR' undeclared (first use in this function); did you mean 'PFN_vkDestroySwapchainKHR'?
  513 |     table->DestroyVideoSessionKHR = (PFN_vkDestroyVideoSessionKHR)gdpa(dev, "vkDestroyVideoSessionKHR");
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                      PFN_vkDestroySwapchainKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:513:67: error: expected ';' before 'gdpa'
  513 |     table->DestroyVideoSessionKHR = (PFN_vkDestroyVideoSessionKHR)gdpa(dev, "vkDestroyVideoSessionKHR");
      |                                                                   ^~~~
      |                                                                   ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:516:52: error: 'PFN_vkGetVideoSessionMemoryRequirementsKHR' undeclared (first use in this function); did you mean 'PFN_vkGetImageSparseMemoryRequirements2KHR'?
  516 |     table->GetVideoSessionMemoryRequirementsKHR = (PFN_vkGetVideoSessionMemoryRequirementsKHR)gdpa(dev, "vkGetVideoSessionMemoryRequirementsKHR");
      |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                    PFN_vkGetImageSparseMemoryRequirements2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:516:95: error: expected ';' before 'gdpa'
  516 |     table->GetVideoSessionMemoryRequirementsKHR = (PFN_vkGetVideoSessionMemoryRequirementsKHR)gdpa(dev, "vkGetVideoSessionMemoryRequirementsKHR");
      |                                                                                               ^~~~
      |                                                                                               ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:519:41: error: 'PFN_vkBindVideoSessionMemoryKHR' undeclared (first use in this function)
  519 |     table->BindVideoSessionMemoryKHR = (PFN_vkBindVideoSessionMemoryKHR)gdpa(dev, "vkBindVideoSessionMemoryKHR");
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:519:73: error: expected ';' before 'gdpa'
  519 |     table->BindVideoSessionMemoryKHR = (PFN_vkBindVideoSessionMemoryKHR)gdpa(dev, "vkBindVideoSessionMemoryKHR");
      |                                                                         ^~~~
      |                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:522:47: error: 'PFN_vkCreateVideoSessionParametersKHR' undeclared (first use in this function)
  522 |     table->CreateVideoSessionParametersKHR = (PFN_vkCreateVideoSessionParametersKHR)gdpa(dev, "vkCreateVideoSessionParametersKHR");
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:522:85: error: expected ';' before 'gdpa'
  522 |     table->CreateVideoSessionParametersKHR = (PFN_vkCreateVideoSessionParametersKHR)gdpa(dev, "vkCreateVideoSessionParametersKHR");
      |                                                                                     ^~~~
      |                                                                                     ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:525:47: error: 'PFN_vkUpdateVideoSessionParametersKHR' undeclared (first use in this function)
  525 |     table->UpdateVideoSessionParametersKHR = (PFN_vkUpdateVideoSessionParametersKHR)gdpa(dev, "vkUpdateVideoSessionParametersKHR");
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:525:85: error: expected ';' before 'gdpa'
  525 |     table->UpdateVideoSessionParametersKHR = (PFN_vkUpdateVideoSessionParametersKHR)gdpa(dev, "vkUpdateVideoSessionParametersKHR");
      |                                                                                     ^~~~
      |                                                                                     ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:528:48: error: 'PFN_vkDestroyVideoSessionParametersKHR' undeclared (first use in this function)
  528 |     table->DestroyVideoSessionParametersKHR = (PFN_vkDestroyVideoSessionParametersKHR)gdpa(dev, "vkDestroyVideoSessionParametersKHR");
      |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:528:87: error: expected ';' before 'gdpa'
  528 |     table->DestroyVideoSessionParametersKHR = (PFN_vkDestroyVideoSessionParametersKHR)gdpa(dev, "vkDestroyVideoSessionParametersKHR");
      |                                                                                       ^~~~
      |                                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:531:38: error: 'PFN_vkCmdBeginVideoCodingKHR' undeclared (first use in this function)
  531 |     table->CmdBeginVideoCodingKHR = (PFN_vkCmdBeginVideoCodingKHR)gdpa(dev, "vkCmdBeginVideoCodingKHR");
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:531:67: error: expected ';' before 'gdpa'
  531 |     table->CmdBeginVideoCodingKHR = (PFN_vkCmdBeginVideoCodingKHR)gdpa(dev, "vkCmdBeginVideoCodingKHR");
      |                                                                   ^~~~
      |                                                                   ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:534:36: error: 'PFN_vkCmdEndVideoCodingKHR' undeclared (first use in this function)
  534 |     table->CmdEndVideoCodingKHR = (PFN_vkCmdEndVideoCodingKHR)gdpa(dev, "vkCmdEndVideoCodingKHR");
      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:534:63: error: expected ';' before 'gdpa'
  534 |     table->CmdEndVideoCodingKHR = (PFN_vkCmdEndVideoCodingKHR)gdpa(dev, "vkCmdEndVideoCodingKHR");
      |                                                               ^~~~
      |                                                               ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:537:40: error: 'PFN_vkCmdControlVideoCodingKHR' undeclared (first use in this function)
  537 |     table->CmdControlVideoCodingKHR = (PFN_vkCmdControlVideoCodingKHR)gdpa(dev, "vkCmdControlVideoCodingKHR");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:537:71: error: expected ';' before 'gdpa'
  537 |     table->CmdControlVideoCodingKHR = (PFN_vkCmdControlVideoCodingKHR)gdpa(dev, "vkCmdControlVideoCodingKHR");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:542:33: error: 'PFN_vkCmdDecodeVideoKHR' undeclared (first use in this function); did you mean 'PFN_vkCmdResolveImage2KHR'?
  542 |     table->CmdDecodeVideoKHR = (PFN_vkCmdDecodeVideoKHR)gdpa(dev, "vkCmdDecodeVideoKHR");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
      |                                 PFN_vkCmdResolveImage2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:542:57: error: expected ';' before 'gdpa'
  542 |     table->CmdDecodeVideoKHR = (PFN_vkCmdDecodeVideoKHR)gdpa(dev, "vkCmdDecodeVideoKHR");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:658:33: error: 'PFN_vkCmdEncodeVideoKHR' undeclared (first use in this function)
  658 |     table->CmdEncodeVideoKHR = (PFN_vkCmdEncodeVideoKHR)gdpa(dev, "vkCmdEncodeVideoKHR");
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:658:57: error: expected ';' before 'gdpa'
  658 |     table->CmdEncodeVideoKHR = (PFN_vkCmdEncodeVideoKHR)gdpa(dev, "vkCmdEncodeVideoKHR");
      |                                                         ^~~~
      |                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:870:36: error: 'PFN_vkCmdSetVertexInputEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilOpEXT'?
  870 |     table->CmdSetVertexInputEXT = (PFN_vkCmdSetVertexInputEXT)gdpa(dev, "vkCmdSetVertexInputEXT");
      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                    PFN_vkCmdSetStencilOpEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:870:63: error: expected ';' before 'gdpa'
  870 |     table->CmdSetVertexInputEXT = (PFN_vkCmdSetVertexInputEXT)gdpa(dev, "vkCmdSetVertexInputEXT");
      |                                                               ^~~~
      |                                                               ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:889:43: error: 'PFN_vkCmdSetPatchControlPointsEXT' undeclared (first use in this function)
  889 |     table->CmdSetPatchControlPointsEXT = (PFN_vkCmdSetPatchControlPointsEXT)gdpa(dev, "vkCmdSetPatchControlPointsEXT");
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:889:77: error: expected ';' before 'gdpa'
  889 |     table->CmdSetPatchControlPointsEXT = (PFN_vkCmdSetPatchControlPointsEXT)gdpa(dev, "vkCmdSetPatchControlPointsEXT");
      |                                                                             ^~~~
      |                                                                             ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:890:48: error: 'PFN_vkCmdSetRasterizerDiscardEnableEXT' undeclared (first use in this function)
  890 |     table->CmdSetRasterizerDiscardEnableEXT = (PFN_vkCmdSetRasterizerDiscardEnableEXT)gdpa(dev, "vkCmdSetRasterizerDiscardEnableEXT");
      |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:890:87: error: expected ';' before 'gdpa'
  890 |     table->CmdSetRasterizerDiscardEnableEXT = (PFN_vkCmdSetRasterizerDiscardEnableEXT)gdpa(dev, "vkCmdSetRasterizerDiscardEnableEXT");
      |                                                                                       ^~~~
      |                                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:891:40: error: 'PFN_vkCmdSetDepthBiasEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetDepthWriteEnableEXT'?
  891 |     table->CmdSetDepthBiasEnableEXT = (PFN_vkCmdSetDepthBiasEnableEXT)gdpa(dev, "vkCmdSetDepthBiasEnableEXT");
      |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                        PFN_vkCmdSetDepthWriteEnableEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:891:71: error: expected ';' before 'gdpa'
  891 |     table->CmdSetDepthBiasEnableEXT = (PFN_vkCmdSetDepthBiasEnableEXT)gdpa(dev, "vkCmdSetDepthBiasEnableEXT");
      |                                                                       ^~~~
      |                                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:892:32: error: 'PFN_vkCmdSetLogicOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilOpEXT'?
  892 |     table->CmdSetLogicOpEXT = (PFN_vkCmdSetLogicOpEXT)gdpa(dev, "vkCmdSetLogicOpEXT");
      |                                ^~~~~~~~~~~~~~~~~~~~~~
      |                                PFN_vkCmdSetStencilOpEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:892:55: error: expected ';' before 'gdpa'
  892 |     table->CmdSetLogicOpEXT = (PFN_vkCmdSetLogicOpEXT)gdpa(dev, "vkCmdSetLogicOpEXT");
      |                                                       ^~~~
      |                                                       ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:893:47: error: 'PFN_vkCmdSetPrimitiveRestartEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilTestEnableEXT'?
  893 |     table->CmdSetPrimitiveRestartEnableEXT = (PFN_vkCmdSetPrimitiveRestartEnableEXT)gdpa(dev, "vkCmdSetPrimitiveRestartEnableEXT");
      |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                               PFN_vkCmdSetStencilTestEnableEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:893:85: error: expected ';' before 'gdpa'
  893 |     table->CmdSetPrimitiveRestartEnableEXT = (PFN_vkCmdSetPrimitiveRestartEnableEXT)gdpa(dev, "vkCmdSetPrimitiveRestartEnableEXT");
      |                                                                                     ^~~~
      |                                                                                     ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:896:41: error: 'PFN_vkCmdSetColorWriteEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetDepthWriteEnableEXT'?
  896 |     table->CmdSetColorWriteEnableEXT = (PFN_vkCmdSetColorWriteEnableEXT)gdpa(dev, "vkCmdSetColorWriteEnableEXT");
      |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                         PFN_vkCmdSetDepthWriteEnableEXT
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:896:73: error: expected ';' before 'gdpa'
  896 |     table->CmdSetColorWriteEnableEXT = (PFN_vkCmdSetColorWriteEnableEXT)gdpa(dev, "vkCmdSetColorWriteEnableEXT");
      |                                                                         ^~~~
      |                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_instance_extension_dispatch_table':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1019:53: error: 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
 1019 |     table->GetPhysicalDeviceVideoCapabilitiesKHR = (PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoCapabilitiesKHR");
      |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                     PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1019:97: error: expected ';' before 'gpa'
 1019 |     table->GetPhysicalDeviceVideoCapabilitiesKHR = (PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoCapabilitiesKHR");
      |                                                                                                 ^~~
      |                                                                                                 ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1022:57: error: 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceImageFormatProperties2KHR'?
 1022 |     table->GetPhysicalDeviceVideoFormatPropertiesKHR = (PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoFormatPropertiesKHR");
      |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                         PFN_vkGetPhysicalDeviceImageFormatProperties2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1022:105: error: expected ';' before 'gpa'
 1022 |     table->GetPhysicalDeviceVideoFormatPropertiesKHR = (PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoFormatPropertiesKHR");
      |                                                                                                         ^~~
      |                                                                                                         ;
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2016:11: error: unknown type name 'VkVideoProfileKHR'
 2016 |     const VkVideoProfileKHR*                    pVideoProfile,
      |           ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2017:5: error: unknown type name 'VkVideoCapabilitiesKHR'; did you mean 'VkSurfaceCapabilitiesKHR'?
 2017 |     VkVideoCapabilitiesKHR*                     pCapabilities) {
      |     ^~~~~~~~~~~~~~~~~~~~~~
      |     VkSurfaceCapabilitiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2026:11: error: unknown type name 'VkVideoProfileKHR'
 2026 |     const VkVideoProfileKHR*                    pVideoProfile,
      |           ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2027:5: error: unknown type name 'VkVideoCapabilitiesKHR'; did you mean 'VkSurfaceCapabilitiesKHR'?
 2027 |     VkVideoCapabilitiesKHR*                     pCapabilities) {
      |     ^~~~~~~~~~~~~~~~~~~~~~
      |     VkSurfaceCapabilitiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2041:11: error: unknown type name 'VkPhysicalDeviceVideoFormatInfoKHR'
 2041 |     const VkPhysicalDeviceVideoFormatInfoKHR*   pVideoFormatInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2043:5: error: unknown type name 'VkVideoFormatPropertiesKHR'; did you mean 'VkImageFormatProperties2KHR'?
 2043 |     VkVideoFormatPropertiesKHR*                 pVideoFormatProperties) {
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |     VkImageFormatProperties2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2052:11: error: unknown type name 'VkPhysicalDeviceVideoFormatInfoKHR'
 2052 |     const VkPhysicalDeviceVideoFormatInfoKHR*   pVideoFormatInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2054:5: error: unknown type name 'VkVideoFormatPropertiesKHR'; did you mean 'VkImageFormatProperties2KHR'?
 2054 |     VkVideoFormatPropertiesKHR*                 pVideoFormatProperties) {
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |     VkImageFormatProperties2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2068:11: error: unknown type name 'VkVideoSessionCreateInfoKHR'
 2068 |     const VkVideoSessionCreateInfoKHR*          pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2070:5: error: unknown type name 'VkVideoSessionKHR'
 2070 |     VkVideoSessionKHR*                          pVideoSession) {
      |     ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2079:5: error: unknown type name 'VkVideoSessionKHR'
 2079 |     VkVideoSessionKHR                           videoSession,
      |     ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2089:5: error: unknown type name 'VkVideoSessionKHR'
 2089 |     VkVideoSessionKHR                           videoSession,
      |     ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2091:5: error: unknown type name 'VkVideoGetMemoryPropertiesKHR'; did you mean 'VkExternalMemoryPropertiesKHR'?
 2091 |     VkVideoGetMemoryPropertiesKHR*              pVideoSessionMemoryRequirements) {
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |     VkExternalMemoryPropertiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2100:5: error: unknown type name 'VkVideoSessionKHR'
 2100 |     VkVideoSessionKHR                           videoSession,
      |     ^~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2102:11: error: unknown type name 'VkVideoBindMemoryKHR'
 2102 |     const VkVideoBindMemoryKHR*                 pVideoSessionBindMemories) {
      |           ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2111:11: error: unknown type name 'VkVideoSessionParametersCreateInfoKHR'
 2111 |     const VkVideoSessionParametersCreateInfoKHR* pCreateInfo,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2113:5: error: unknown type name 'VkVideoSessionParametersKHR'
 2113 |     VkVideoSessionParametersKHR*                pVideoSessionParameters) {
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2122:5: error: unknown type name 'VkVideoSessionParametersKHR'
 2122 |     VkVideoSessionParametersKHR                 videoSessionParameters,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2123:11: error: unknown type name 'VkVideoSessionParametersUpdateInfoKHR'
 2123 |     const VkVideoSessionParametersUpdateInfoKHR* pUpdateInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2132:5: error: unknown type name 'VkVideoSessionParametersKHR'
 2132 |     VkVideoSessionParametersKHR                 videoSessionParameters,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2142:11: error: unknown type name 'VkVideoBeginCodingInfoKHR'
 2142 |     const VkVideoBeginCodingInfoKHR*            pBeginInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBeginVideoCodingKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2144:5: error: called object is not a function or function pointer
 2144 |     disp->CmdBeginVideoCodingKHR(commandBuffer, pBeginInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2151:11: error: unknown type name 'VkVideoEndCodingInfoKHR'
 2151 |     const VkVideoEndCodingInfoKHR*              pEndCodingInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdEndVideoCodingKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2153:5: error: called object is not a function or function pointer
 2153 |     disp->CmdEndVideoCodingKHR(commandBuffer, pEndCodingInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2160:11: error: unknown type name 'VkVideoCodingControlInfoKHR'
 2160 |     const VkVideoCodingControlInfoKHR*          pCodingControlInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdControlVideoCodingKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2162:5: error: called object is not a function or function pointer
 2162 |     disp->CmdControlVideoCodingKHR(commandBuffer, pCodingControlInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2172:11: error: unknown type name 'VkVideoDecodeInfoKHR'
 2172 |     const VkVideoDecodeInfoKHR*                 pFrameInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdDecodeVideoKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2174:5: error: called object is not a function or function pointer
 2174 |     disp->CmdDecodeVideoKHR(commandBuffer, pFrameInfo);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2774:11: error: unknown type name 'VkVideoEncodeInfoKHR'
 2774 |     const VkVideoEncodeInfoKHR*                 pEncodeInfo) {
      |           ^~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdEncodeVideoKHR':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2776:5: error: called object is not a function or function pointer
 2776 |     disp->CmdEncodeVideoKHR(commandBuffer, pEncodeInfo);
      |     ^~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4325:11: error: unknown type name 'VkVertexInputBindingDescription2EXT'
 4325 |     const VkVertexInputBindingDescription2EXT*  pVertexBindingDescriptions,
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4327:11: error: unknown type name 'VkVertexInputAttributeDescription2EXT'
 4327 |     const VkVertexInputAttributeDescription2EXT* pVertexAttributeDescriptions) {
      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetVertexInputEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4329:5: error: called object is not a function or function pointer
 4329 |     disp->CmdSetVertexInputEXT(commandBuffer, vertexBindingDescriptionCount, pVertexBindingDescriptions, vertexAttributeDescriptionCount, pVertexAttributeDescriptions);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPatchControlPointsEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4385:5: error: called object is not a function or function pointer
 4385 |     disp->CmdSetPatchControlPointsEXT(commandBuffer, patchControlPoints);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetRasterizerDiscardEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4392:5: error: called object is not a function or function pointer
 4392 |     disp->CmdSetRasterizerDiscardEnableEXT(commandBuffer, rasterizerDiscardEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBiasEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4399:5: error: called object is not a function or function pointer
 4399 |     disp->CmdSetDepthBiasEnableEXT(commandBuffer, depthBiasEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetLogicOpEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4406:5: error: called object is not a function or function pointer
 4406 |     disp->CmdSetLogicOpEXT(commandBuffer, logicOp);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveRestartEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4413:5: error: called object is not a function or function pointer
 4413 |     disp->CmdSetPrimitiveRestartEnableEXT(commandBuffer, primitiveRestartEnable);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetColorWriteEnableEXT':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4424:5: error: called object is not a function or function pointer
 4424 |     disp->CmdSetColorWriteEnableEXT(commandBuffer, attachmentCount, pColorWriteEnables);
      |     ^~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4644:25: error: 'GetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
 4644 |         *addr = (void *)GetPhysicalDeviceVideoCapabilitiesKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                         vkGetPhysicalDeviceSurfaceCapabilitiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4650:25: error: 'GetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceImageFormatProperties2KHR'?
 4650 |         *addr = (void *)GetPhysicalDeviceVideoFormatPropertiesKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                         vkGetPhysicalDeviceImageFormatProperties2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4656:25: error: 'CreateVideoSessionKHR' undeclared (first use in this function)
 4656 |         *addr = (void *)CreateVideoSessionKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4662:25: error: 'DestroyVideoSessionKHR' undeclared (first use in this function)
 4662 |         *addr = (void *)DestroyVideoSessionKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4668:25: error: 'GetVideoSessionMemoryRequirementsKHR' undeclared (first use in this function); did you mean 'GetImageSparseMemoryRequirements2KHR'?
 4668 |         *addr = (void *)GetVideoSessionMemoryRequirementsKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                         GetImageSparseMemoryRequirements2KHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4674:25: error: 'BindVideoSessionMemoryKHR' undeclared (first use in this function)
 4674 |         *addr = (void *)BindVideoSessionMemoryKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4680:25: error: 'CreateVideoSessionParametersKHR' undeclared (first use in this function)
 4680 |         *addr = (void *)CreateVideoSessionParametersKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4686:25: error: 'UpdateVideoSessionParametersKHR' undeclared (first use in this function)
 4686 |         *addr = (void *)UpdateVideoSessionParametersKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4692:25: error: 'DestroyVideoSessionParametersKHR' undeclared (first use in this function)
 4692 |         *addr = (void *)DestroyVideoSessionParametersKHR;
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:6141:46: error: 'terminator_GetPhysicalDeviceVideoCapabilitiesKHR' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR'?
 6141 |     .GetPhysicalDeviceVideoCapabilitiesKHR = terminator_GetPhysicalDeviceVideoCapabilitiesKHR,
      |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                              terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:6144:50: error: 'terminator_GetPhysicalDeviceVideoFormatPropertiesKHR' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceImageFormatProperties2'?
 6144 |     .GetPhysicalDeviceVideoFormatPropertiesKHR = terminator_GetPhysicalDeviceVideoFormatPropertiesKHR,
      |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                                  terminator_GetPhysicalDeviceImageFormatProperties2
ninja: build stopped: subcommand failed.
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782:157 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
WARNING: Backtrace (BB generated script): 
	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 157
	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 151
	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 146
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 170

Backtrace (metadata-relative locations):
	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 207
	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 211
	#3: do_compile, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/log.do_compile.1554782
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/build --target all --
| [1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/murmurhash.c
| [2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c
| FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                   ^
| [5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:226:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   226 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:228:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   228 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
|       |                                                             ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:234:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   234 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
|       |                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:284:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   284 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:330:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   330 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:378:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   378 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:428:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   428 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:456:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   456 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:698:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   698 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:706:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   706 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:813:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   813 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:821:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   821 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:930:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   930 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:938:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   938 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1198:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1198 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1206:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1206 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1845:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1845 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1853:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1853 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1886:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1886 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1930:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1930 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1960:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1960 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1962:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1962 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2260:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2260 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2276:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2276 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2300:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2300 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2338:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2338 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2343:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2343 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2365:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2365 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| [7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_object_types.h:216:5: error: 'VK_OBJECT_TYPE_VIDEO_SESSION_KHR' undeclared here (not in a function); did you mean 'VK_OBJECT_TYPE_DISPLAY_KHR'?
|   216 |     VK_OBJECT_TYPE_VIDEO_SESSION_KHR,   // kVulkanObjectTypeVideoSessionKHR
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VK_OBJECT_TYPE_DISPLAY_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_object_types.h:217:5: error: 'VK_OBJECT_TYPE_VIDEO_SESSION_PARAMETERS_KHR' undeclared here (not in a function)
|   217 |     VK_OBJECT_TYPE_VIDEO_SESSION_PARAMETERS_KHR,   // kVulkanObjectTypeVideoSessionParametersKHR
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/cJSON.c
| [10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/
 yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_icd_init_entries':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: error: 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
|   156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: note: each undeclared identifier is reported only once for each function it appears in
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
|   156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:49: error: expected ';' before 'fp_gipa'
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                                 ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
|   156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: error: 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceImageFormatProperties2KHR'?
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:159:5: note: in expansion of macro 'LOOKUP_GIPA'
|   159 |     LOOKUP_GIPA(GetPhysicalDeviceVideoFormatPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:49: error: expected ';' before 'fp_gipa'
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                                 ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:159:5: note: in expansion of macro 'LOOKUP_GIPA'
|   159 |     LOOKUP_GIPA(GetPhysicalDeviceVideoFormatPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:510:37: error: 'PFN_vkCreateVideoSessionKHR' undeclared (first use in this function); did you mean 'PFN_vkCreateRenderPass2KHR'?
|   510 |     table->CreateVideoSessionKHR = (PFN_vkCreateVideoSessionKHR)gdpa(dev, "vkCreateVideoSessionKHR");
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     PFN_vkCreateRenderPass2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:510:65: error: expected ';' before 'gdpa'
|   510 |     table->CreateVideoSessionKHR = (PFN_vkCreateVideoSessionKHR)gdpa(dev, "vkCreateVideoSessionKHR");
|       |                                                                 ^~~~
|       |                                                                 ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:513:38: error: 'PFN_vkDestroyVideoSessionKHR' undeclared (first use in this function); did you mean 'PFN_vkDestroySwapchainKHR'?
|   513 |     table->DestroyVideoSessionKHR = (PFN_vkDestroyVideoSessionKHR)gdpa(dev, "vkDestroyVideoSessionKHR");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      PFN_vkDestroySwapchainKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:513:67: error: expected ';' before 'gdpa'
|   513 |     table->DestroyVideoSessionKHR = (PFN_vkDestroyVideoSessionKHR)gdpa(dev, "vkDestroyVideoSessionKHR");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:516:52: error: 'PFN_vkGetVideoSessionMemoryRequirementsKHR' undeclared (first use in this function); did you mean 'PFN_vkGetImageSparseMemoryRequirements2KHR'?
|   516 |     table->GetVideoSessionMemoryRequirementsKHR = (PFN_vkGetVideoSessionMemoryRequirementsKHR)gdpa(dev, "vkGetVideoSessionMemoryRequirementsKHR");
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    PFN_vkGetImageSparseMemoryRequirements2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:516:95: error: expected ';' before 'gdpa'
|   516 |     table->GetVideoSessionMemoryRequirementsKHR = (PFN_vkGetVideoSessionMemoryRequirementsKHR)gdpa(dev, "vkGetVideoSessionMemoryRequirementsKHR");
|       |                                                                                               ^~~~
|       |                                                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:519:41: error: 'PFN_vkBindVideoSessionMemoryKHR' undeclared (first use in this function)
|   519 |     table->BindVideoSessionMemoryKHR = (PFN_vkBindVideoSessionMemoryKHR)gdpa(dev, "vkBindVideoSessionMemoryKHR");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:519:73: error: expected ';' before 'gdpa'
|   519 |     table->BindVideoSessionMemoryKHR = (PFN_vkBindVideoSessionMemoryKHR)gdpa(dev, "vkBindVideoSessionMemoryKHR");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:522:47: error: 'PFN_vkCreateVideoSessionParametersKHR' undeclared (first use in this function)
|   522 |     table->CreateVideoSessionParametersKHR = (PFN_vkCreateVideoSessionParametersKHR)gdpa(dev, "vkCreateVideoSessionParametersKHR");
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:522:85: error: expected ';' before 'gdpa'
|   522 |     table->CreateVideoSessionParametersKHR = (PFN_vkCreateVideoSessionParametersKHR)gdpa(dev, "vkCreateVideoSessionParametersKHR");
|       |                                                                                     ^~~~
|       |                                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:525:47: error: 'PFN_vkUpdateVideoSessionParametersKHR' undeclared (first use in this function)
|   525 |     table->UpdateVideoSessionParametersKHR = (PFN_vkUpdateVideoSessionParametersKHR)gdpa(dev, "vkUpdateVideoSessionParametersKHR");
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:525:85: error: expected ';' before 'gdpa'
|   525 |     table->UpdateVideoSessionParametersKHR = (PFN_vkUpdateVideoSessionParametersKHR)gdpa(dev, "vkUpdateVideoSessionParametersKHR");
|       |                                                                                     ^~~~
|       |                                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:528:48: error: 'PFN_vkDestroyVideoSessionParametersKHR' undeclared (first use in this function)
|   528 |     table->DestroyVideoSessionParametersKHR = (PFN_vkDestroyVideoSessionParametersKHR)gdpa(dev, "vkDestroyVideoSessionParametersKHR");
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:528:87: error: expected ';' before 'gdpa'
|   528 |     table->DestroyVideoSessionParametersKHR = (PFN_vkDestroyVideoSessionParametersKHR)gdpa(dev, "vkDestroyVideoSessionParametersKHR");
|       |                                                                                       ^~~~
|       |                                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:531:38: error: 'PFN_vkCmdBeginVideoCodingKHR' undeclared (first use in this function)
|   531 |     table->CmdBeginVideoCodingKHR = (PFN_vkCmdBeginVideoCodingKHR)gdpa(dev, "vkCmdBeginVideoCodingKHR");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:531:67: error: expected ';' before 'gdpa'
|   531 |     table->CmdBeginVideoCodingKHR = (PFN_vkCmdBeginVideoCodingKHR)gdpa(dev, "vkCmdBeginVideoCodingKHR");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:534:36: error: 'PFN_vkCmdEndVideoCodingKHR' undeclared (first use in this function)
|   534 |     table->CmdEndVideoCodingKHR = (PFN_vkCmdEndVideoCodingKHR)gdpa(dev, "vkCmdEndVideoCodingKHR");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:534:63: error: expected ';' before 'gdpa'
|   534 |     table->CmdEndVideoCodingKHR = (PFN_vkCmdEndVideoCodingKHR)gdpa(dev, "vkCmdEndVideoCodingKHR");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:537:40: error: 'PFN_vkCmdControlVideoCodingKHR' undeclared (first use in this function)
|   537 |     table->CmdControlVideoCodingKHR = (PFN_vkCmdControlVideoCodingKHR)gdpa(dev, "vkCmdControlVideoCodingKHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:537:71: error: expected ';' before 'gdpa'
|   537 |     table->CmdControlVideoCodingKHR = (PFN_vkCmdControlVideoCodingKHR)gdpa(dev, "vkCmdControlVideoCodingKHR");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:542:33: error: 'PFN_vkCmdDecodeVideoKHR' undeclared (first use in this function); did you mean 'PFN_vkCmdResolveImage2KHR'?
|   542 |     table->CmdDecodeVideoKHR = (PFN_vkCmdDecodeVideoKHR)gdpa(dev, "vkCmdDecodeVideoKHR");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkCmdResolveImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:542:57: error: expected ';' before 'gdpa'
|   542 |     table->CmdDecodeVideoKHR = (PFN_vkCmdDecodeVideoKHR)gdpa(dev, "vkCmdDecodeVideoKHR");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:658:33: error: 'PFN_vkCmdEncodeVideoKHR' undeclared (first use in this function)
|   658 |     table->CmdEncodeVideoKHR = (PFN_vkCmdEncodeVideoKHR)gdpa(dev, "vkCmdEncodeVideoKHR");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:658:57: error: expected ';' before 'gdpa'
|   658 |     table->CmdEncodeVideoKHR = (PFN_vkCmdEncodeVideoKHR)gdpa(dev, "vkCmdEncodeVideoKHR");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:870:36: error: 'PFN_vkCmdSetVertexInputEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilOpEXT'?
|   870 |     table->CmdSetVertexInputEXT = (PFN_vkCmdSetVertexInputEXT)gdpa(dev, "vkCmdSetVertexInputEXT");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkCmdSetStencilOpEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:870:63: error: expected ';' before 'gdpa'
|   870 |     table->CmdSetVertexInputEXT = (PFN_vkCmdSetVertexInputEXT)gdpa(dev, "vkCmdSetVertexInputEXT");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:889:43: error: 'PFN_vkCmdSetPatchControlPointsEXT' undeclared (first use in this function)
|   889 |     table->CmdSetPatchControlPointsEXT = (PFN_vkCmdSetPatchControlPointsEXT)gdpa(dev, "vkCmdSetPatchControlPointsEXT");
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:889:77: error: expected ';' before 'gdpa'
|   889 |     table->CmdSetPatchControlPointsEXT = (PFN_vkCmdSetPatchControlPointsEXT)gdpa(dev, "vkCmdSetPatchControlPointsEXT");
|       |                                                                             ^~~~
|       |                                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:890:48: error: 'PFN_vkCmdSetRasterizerDiscardEnableEXT' undeclared (first use in this function)
|   890 |     table->CmdSetRasterizerDiscardEnableEXT = (PFN_vkCmdSetRasterizerDiscardEnableEXT)gdpa(dev, "vkCmdSetRasterizerDiscardEnableEXT");
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:890:87: error: expected ';' before 'gdpa'
|   890 |     table->CmdSetRasterizerDiscardEnableEXT = (PFN_vkCmdSetRasterizerDiscardEnableEXT)gdpa(dev, "vkCmdSetRasterizerDiscardEnableEXT");
|       |                                                                                       ^~~~
|       |                                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:891:40: error: 'PFN_vkCmdSetDepthBiasEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetDepthWriteEnableEXT'?
|   891 |     table->CmdSetDepthBiasEnableEXT = (PFN_vkCmdSetDepthBiasEnableEXT)gdpa(dev, "vkCmdSetDepthBiasEnableEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdSetDepthWriteEnableEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:891:71: error: expected ';' before 'gdpa'
|   891 |     table->CmdSetDepthBiasEnableEXT = (PFN_vkCmdSetDepthBiasEnableEXT)gdpa(dev, "vkCmdSetDepthBiasEnableEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:892:32: error: 'PFN_vkCmdSetLogicOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilOpEXT'?
|   892 |     table->CmdSetLogicOpEXT = (PFN_vkCmdSetLogicOpEXT)gdpa(dev, "vkCmdSetLogicOpEXT");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkCmdSetStencilOpEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:892:55: error: expected ';' before 'gdpa'
|   892 |     table->CmdSetLogicOpEXT = (PFN_vkCmdSetLogicOpEXT)gdpa(dev, "vkCmdSetLogicOpEXT");
|       |                                                       ^~~~
|       |                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:893:47: error: 'PFN_vkCmdSetPrimitiveRestartEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilTestEnableEXT'?
|   893 |     table->CmdSetPrimitiveRestartEnableEXT = (PFN_vkCmdSetPrimitiveRestartEnableEXT)gdpa(dev, "vkCmdSetPrimitiveRestartEnableEXT");
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                               PFN_vkCmdSetStencilTestEnableEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:893:85: error: expected ';' before 'gdpa'
|   893 |     table->CmdSetPrimitiveRestartEnableEXT = (PFN_vkCmdSetPrimitiveRestartEnableEXT)gdpa(dev, "vkCmdSetPrimitiveRestartEnableEXT");
|       |                                                                                     ^~~~
|       |                                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:896:41: error: 'PFN_vkCmdSetColorWriteEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetDepthWriteEnableEXT'?
|   896 |     table->CmdSetColorWriteEnableEXT = (PFN_vkCmdSetColorWriteEnableEXT)gdpa(dev, "vkCmdSetColorWriteEnableEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         PFN_vkCmdSetDepthWriteEnableEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:896:73: error: expected ';' before 'gdpa'
|   896 |     table->CmdSetColorWriteEnableEXT = (PFN_vkCmdSetColorWriteEnableEXT)gdpa(dev, "vkCmdSetColorWriteEnableEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_instance_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1019:53: error: 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
|  1019 |     table->GetPhysicalDeviceVideoCapabilitiesKHR = (PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoCapabilitiesKHR");
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1019:97: error: expected ';' before 'gpa'
|  1019 |     table->GetPhysicalDeviceVideoCapabilitiesKHR = (PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoCapabilitiesKHR");
|       |                                                                                                 ^~~
|       |                                                                                                 ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1022:57: error: 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceImageFormatProperties2KHR'?
|  1022 |     table->GetPhysicalDeviceVideoFormatPropertiesKHR = (PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoFormatPropertiesKHR");
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         PFN_vkGetPhysicalDeviceImageFormatProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1022:105: error: expected ';' before 'gpa'
|  1022 |     table->GetPhysicalDeviceVideoFormatPropertiesKHR = (PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoFormatPropertiesKHR");
|       |                                                                                                         ^~~
|       |                                                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2016:11: error: unknown type name 'VkVideoProfileKHR'
|  2016 |     const VkVideoProfileKHR*                    pVideoProfile,
|       |           ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2017:5: error: unknown type name 'VkVideoCapabilitiesKHR'; did you mean 'VkSurfaceCapabilitiesKHR'?
|  2017 |     VkVideoCapabilitiesKHR*                     pCapabilities) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     VkSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2026:11: error: unknown type name 'VkVideoProfileKHR'
|  2026 |     const VkVideoProfileKHR*                    pVideoProfile,
|       |           ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2027:5: error: unknown type name 'VkVideoCapabilitiesKHR'; did you mean 'VkSurfaceCapabilitiesKHR'?
|  2027 |     VkVideoCapabilitiesKHR*                     pCapabilities) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     VkSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2041:11: error: unknown type name 'VkPhysicalDeviceVideoFormatInfoKHR'
|  2041 |     const VkPhysicalDeviceVideoFormatInfoKHR*   pVideoFormatInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2043:5: error: unknown type name 'VkVideoFormatPropertiesKHR'; did you mean 'VkImageFormatProperties2KHR'?
|  2043 |     VkVideoFormatPropertiesKHR*                 pVideoFormatProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkImageFormatProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2052:11: error: unknown type name 'VkPhysicalDeviceVideoFormatInfoKHR'
|  2052 |     const VkPhysicalDeviceVideoFormatInfoKHR*   pVideoFormatInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2054:5: error: unknown type name 'VkVideoFormatPropertiesKHR'; did you mean 'VkImageFormatProperties2KHR'?
|  2054 |     VkVideoFormatPropertiesKHR*                 pVideoFormatProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkImageFormatProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2068:11: error: unknown type name 'VkVideoSessionCreateInfoKHR'
|  2068 |     const VkVideoSessionCreateInfoKHR*          pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2070:5: error: unknown type name 'VkVideoSessionKHR'
|  2070 |     VkVideoSessionKHR*                          pVideoSession) {
|       |     ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2079:5: error: unknown type name 'VkVideoSessionKHR'
|  2079 |     VkVideoSessionKHR                           videoSession,
|       |     ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2089:5: error: unknown type name 'VkVideoSessionKHR'
|  2089 |     VkVideoSessionKHR                           videoSession,
|       |     ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2091:5: error: unknown type name 'VkVideoGetMemoryPropertiesKHR'; did you mean 'VkExternalMemoryPropertiesKHR'?
|  2091 |     VkVideoGetMemoryPropertiesKHR*              pVideoSessionMemoryRequirements) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkExternalMemoryPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2100:5: error: unknown type name 'VkVideoSessionKHR'
|  2100 |     VkVideoSessionKHR                           videoSession,
|       |     ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2102:11: error: unknown type name 'VkVideoBindMemoryKHR'
|  2102 |     const VkVideoBindMemoryKHR*                 pVideoSessionBindMemories) {
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2111:11: error: unknown type name 'VkVideoSessionParametersCreateInfoKHR'
|  2111 |     const VkVideoSessionParametersCreateInfoKHR* pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2113:5: error: unknown type name 'VkVideoSessionParametersKHR'
|  2113 |     VkVideoSessionParametersKHR*                pVideoSessionParameters) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2122:5: error: unknown type name 'VkVideoSessionParametersKHR'
|  2122 |     VkVideoSessionParametersKHR                 videoSessionParameters,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2123:11: error: unknown type name 'VkVideoSessionParametersUpdateInfoKHR'
|  2123 |     const VkVideoSessionParametersUpdateInfoKHR* pUpdateInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2132:5: error: unknown type name 'VkVideoSessionParametersKHR'
|  2132 |     VkVideoSessionParametersKHR                 videoSessionParameters,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2142:11: error: unknown type name 'VkVideoBeginCodingInfoKHR'
|  2142 |     const VkVideoBeginCodingInfoKHR*            pBeginInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBeginVideoCodingKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2144:5: error: called object is not a function or function pointer
|  2144 |     disp->CmdBeginVideoCodingKHR(commandBuffer, pBeginInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2151:11: error: unknown type name 'VkVideoEndCodingInfoKHR'
|  2151 |     const VkVideoEndCodingInfoKHR*              pEndCodingInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdEndVideoCodingKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2153:5: error: called object is not a function or function pointer
|  2153 |     disp->CmdEndVideoCodingKHR(commandBuffer, pEndCodingInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2160:11: error: unknown type name 'VkVideoCodingControlInfoKHR'
|  2160 |     const VkVideoCodingControlInfoKHR*          pCodingControlInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdControlVideoCodingKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2162:5: error: called object is not a function or function pointer
|  2162 |     disp->CmdControlVideoCodingKHR(commandBuffer, pCodingControlInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2172:11: error: unknown type name 'VkVideoDecodeInfoKHR'
|  2172 |     const VkVideoDecodeInfoKHR*                 pFrameInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdDecodeVideoKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2174:5: error: called object is not a function or function pointer
|  2174 |     disp->CmdDecodeVideoKHR(commandBuffer, pFrameInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2774:11: error: unknown type name 'VkVideoEncodeInfoKHR'
|  2774 |     const VkVideoEncodeInfoKHR*                 pEncodeInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdEncodeVideoKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2776:5: error: called object is not a function or function pointer
|  2776 |     disp->CmdEncodeVideoKHR(commandBuffer, pEncodeInfo);
|       |     ^~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4325:11: error: unknown type name 'VkVertexInputBindingDescription2EXT'
|  4325 |     const VkVertexInputBindingDescription2EXT*  pVertexBindingDescriptions,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4327:11: error: unknown type name 'VkVertexInputAttributeDescription2EXT'
|  4327 |     const VkVertexInputAttributeDescription2EXT* pVertexAttributeDescriptions) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetVertexInputEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4329:5: error: called object is not a function or function pointer
|  4329 |     disp->CmdSetVertexInputEXT(commandBuffer, vertexBindingDescriptionCount, pVertexBindingDescriptions, vertexAttributeDescriptionCount, pVertexAttributeDescriptions);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPatchControlPointsEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4385:5: error: called object is not a function or function pointer
|  4385 |     disp->CmdSetPatchControlPointsEXT(commandBuffer, patchControlPoints);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetRasterizerDiscardEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4392:5: error: called object is not a function or function pointer
|  4392 |     disp->CmdSetRasterizerDiscardEnableEXT(commandBuffer, rasterizerDiscardEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBiasEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4399:5: error: called object is not a function or function pointer
|  4399 |     disp->CmdSetDepthBiasEnableEXT(commandBuffer, depthBiasEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetLogicOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4406:5: error: called object is not a function or function pointer
|  4406 |     disp->CmdSetLogicOpEXT(commandBuffer, logicOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveRestartEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4413:5: error: called object is not a function or function pointer
|  4413 |     disp->CmdSetPrimitiveRestartEnableEXT(commandBuffer, primitiveRestartEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetColorWriteEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4424:5: error: called object is not a function or function pointer
|  4424 |     disp->CmdSetColorWriteEnableEXT(commandBuffer, attachmentCount, pColorWriteEnables);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4644:25: error: 'GetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
|  4644 |         *addr = (void *)GetPhysicalDeviceVideoCapabilitiesKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetPhysicalDeviceSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4650:25: error: 'GetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceImageFormatProperties2KHR'?
|  4650 |         *addr = (void *)GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetPhysicalDeviceImageFormatProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4656:25: error: 'CreateVideoSessionKHR' undeclared (first use in this function)
|  4656 |         *addr = (void *)CreateVideoSessionKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4662:25: error: 'DestroyVideoSessionKHR' undeclared (first use in this function)
|  4662 |         *addr = (void *)DestroyVideoSessionKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4668:25: error: 'GetVideoSessionMemoryRequirementsKHR' undeclared (first use in this function); did you mean 'GetImageSparseMemoryRequirements2KHR'?
|  4668 |         *addr = (void *)GetVideoSessionMemoryRequirementsKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         GetImageSparseMemoryRequirements2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4674:25: error: 'BindVideoSessionMemoryKHR' undeclared (first use in this function)
|  4674 |         *addr = (void *)BindVideoSessionMemoryKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4680:25: error: 'CreateVideoSessionParametersKHR' undeclared (first use in this function)
|  4680 |         *addr = (void *)CreateVideoSessionParametersKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4686:25: error: 'UpdateVideoSessionParametersKHR' undeclared (first use in this function)
|  4686 |         *addr = (void *)UpdateVideoSessionParametersKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4692:25: error: 'DestroyVideoSessionParametersKHR' undeclared (first use in this function)
|  4692 |         *addr = (void *)DestroyVideoSessionParametersKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:6141:46: error: 'terminator_GetPhysicalDeviceVideoCapabilitiesKHR' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR'?
|  6141 |     .GetPhysicalDeviceVideoCapabilitiesKHR = terminator_GetPhysicalDeviceVideoCapabilitiesKHR,
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:6144:50: error: 'terminator_GetPhysicalDeviceVideoFormatPropertiesKHR' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceImageFormatProperties2'?
|  6144 |     .GetPhysicalDeviceVideoFormatPropertiesKHR = terminator_GetPhysicalDeviceVideoFormatPropertiesKHR,
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  terminator_GetPhysicalDeviceImageFormatProperties2
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782:157 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 157
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 151
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 146
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 170
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782' failed with exit code 1:
| [1/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/murmurhash.c.o -MF loader/CMakeFiles/vulkan.dir/murmurhash.c.o.d -o loader/CMakeFiles/vulkan.dir/murmurhash.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/murmurhash.c
| [2/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/dev_ext_trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/dev_ext_trampoline.c:23:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [3/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c
| FAILED: loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -MF loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o.d -o loader/CMakeFiles/vulkan.dir/phys_dev_ext.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/phys_dev_ext.c:31:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [4/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c
| FAILED: loader/CMakeFiles/vulkan.dir/extension_manual.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/extension_manual.c.o -MF loader/CMakeFiles/vulkan.dir/extension_manual.c.o.d -o loader/CMakeFiles/vulkan.dir/extension_manual.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2EXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:105:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   105 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/extension_manual.c:110:51: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|   110 |     if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                   ^
| [5/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c
| FAILED: loader/CMakeFiles/vulkan.dir/trampoline.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/trampoline.c.o -MF loader/CMakeFiles/vulkan.dir/trampoline.c.o.d -o loader/CMakeFiles/vulkan.dir/trampoline.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/trampoline.c:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [6/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c
| FAILED: loader/CMakeFiles/vulkan.dir/wsi.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/wsi.c.o -MF loader/CMakeFiles/vulkan.dir/wsi.c.o.d -o loader/CMakeFiles/vulkan.dir/wsi.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_DestroySurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:226:73: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   226 |                     if (NULL != icd_term->dispatch.DestroySurfaceKHR && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[i]) {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:228:61: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   228 |                         icd_surface->real_icd_surfaces[i] = (VkSurfaceKHR)NULL;
|       |                                                             ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:37,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:32:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:234:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   234 |                     assert((VkSurfaceKHR)NULL == icd_surface->real_icd_surfaces[i]);
|       |                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceSupportKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:284:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   284 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:330:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   330 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormatsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:378:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   378 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:428:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   428 |     if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[phys_dev_term->icd_index]) {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateSwapchainKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:456:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   456 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateWaylandSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:698:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   698 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:706:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   706 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateXcbSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:813:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   813 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:821:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   821 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateXlibSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:930:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   930 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:938:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|   938 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateHeadlessSurfaceEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1198:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1198 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1206:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1206 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateDisplayPlaneSurfaceKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1845:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1845 |     *pSurface = (VkSurfaceKHR)pIcdSurface;
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1853:21: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1853 |                 if ((VkSurfaceKHR)NULL != pIcdSurface->real_icd_surfaces[i] && NULL != icd_term->dispatch.DestroySurfaceKHR) {
|       |                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_CreateSharedSwapchainsKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1886:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1886 |             if ((VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetDeviceGroupSurfacePresentModesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1930:55: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
|  1930 |         if (NULL != icd_surface->real_icd_surfaces && (VkSurfaceKHR)NULL != icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDevicePresentRectanglesKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1960:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1960 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:1962:59: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  1962 |     if (NULL != icd_surface->real_icd_surfaces && NULL != (void *)icd_surface->real_icd_surfaces[icd_index]) {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceCapabilities2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2260:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2260 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2276:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2276 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2300:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2300 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c: In function 'terminator_GetPhysicalDeviceSurfaceFormats2KHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2338:33: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2338 |     VkIcdSurface *icd_surface = (VkIcdSurface *)(pSurfaceInfo->surface);
|       |                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2343:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2343 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/wsi.c:2365:55: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
|  2365 |         if (icd_surface->real_icd_surfaces != NULL && (void *)icd_surface->real_icd_surfaces[icd_index] != NULL) {
|       |                                                       ^
| [7/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c
| FAILED: loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -MF loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o.d -o loader/CMakeFiles/vulkan.dir/unknown_ext_chain.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/unknown_ext_chain.c:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [8/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c
| FAILED: loader/CMakeFiles/vulkan.dir/debug_utils.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/debug_utils.c.o -MF loader/CMakeFiles/vulkan.dir/debug_utils.c.o.d -o loader/CMakeFiles/vulkan.dir/debug_utils.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.h:26,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:37:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/debug_utils.c:39:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_object_types.h:216:5: error: 'VK_OBJECT_TYPE_VIDEO_SESSION_KHR' undeclared here (not in a function); did you mean 'VK_OBJECT_TYPE_DISPLAY_KHR'?
|   216 |     VK_OBJECT_TYPE_VIDEO_SESSION_KHR,   // kVulkanObjectTypeVideoSessionKHR
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VK_OBJECT_TYPE_DISPLAY_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_object_types.h:217:5: error: 'VK_OBJECT_TYPE_VIDEO_SESSION_PARAMETERS_KHR' undeclared here (not in a function)
|   217 |     VK_OBJECT_TYPE_VIDEO_SESSION_PARAMETERS_KHR,   // kVulkanObjectTypeVideoSessionParametersKHR
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [9/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/y
 octo-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/cJSON.c.o -MF loader/CMakeFiles/vulkan.dir/cJSON.c.o.d -o loader/CMakeFiles/vulkan.dir/cJSON.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/cJSON.c
| [10/12] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/
 yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c
| FAILED: loader/CMakeFiles/vulkan.dir/loader.c.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc -DAPI_NAME=\"Vulkan\" -DFALLBACK_CONFIG_DIRS=\"/etc/xdg\" -DFALLBACK_DATA_DIRS=\"/usr/local/share:/usr/share\" -DHAVE_CET_H -DSYSCONFDIR=\"/etc\" -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -D_XOPEN_SOURCE=500 -Dvulkan_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated -Iloader -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/c
 ore2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0=/usr/src/debug/vulkan-loader/1.2.176.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot-native=   -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -Wdate-time  --sysroot=/home/pokybuild/yocto-wo
 rker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/recipe-sysroot -std=c99 -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wno-stringop-overflow -Wimplicit-fallthrough=0 -fvisibility=hidden -Wpointer-arith -fPIC -MD -MT loader/CMakeFiles/vulkan.dir/loader.c.o -MF loader/CMakeFiles/vulkan.dir/loader.c.o.d -o loader/CMakeFiles/vulkan.dir/loader.c.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:124:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   124 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:127:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   127 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:447:5: error: unknown type name 'PFN_vkCreateVideoSessionKHR'
|   447 |     PFN_vkCreateVideoSessionKHR CreateVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:450:5: error: unknown type name 'PFN_vkDestroyVideoSessionKHR'
|   450 |     PFN_vkDestroyVideoSessionKHR DestroyVideoSessionKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:453:5: error: unknown type name 'PFN_vkGetVideoSessionMemoryRequirementsKHR'
|   453 |     PFN_vkGetVideoSessionMemoryRequirementsKHR GetVideoSessionMemoryRequirementsKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:456:5: error: unknown type name 'PFN_vkBindVideoSessionMemoryKHR'
|   456 |     PFN_vkBindVideoSessionMemoryKHR BindVideoSessionMemoryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:459:5: error: unknown type name 'PFN_vkCreateVideoSessionParametersKHR'
|   459 |     PFN_vkCreateVideoSessionParametersKHR CreateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:462:5: error: unknown type name 'PFN_vkUpdateVideoSessionParametersKHR'
|   462 |     PFN_vkUpdateVideoSessionParametersKHR UpdateVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:465:5: error: unknown type name 'PFN_vkDestroyVideoSessionParametersKHR'
|   465 |     PFN_vkDestroyVideoSessionParametersKHR DestroyVideoSessionParametersKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:468:5: error: unknown type name 'PFN_vkCmdBeginVideoCodingKHR'
|   468 |     PFN_vkCmdBeginVideoCodingKHR CmdBeginVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:471:5: error: unknown type name 'PFN_vkCmdEndVideoCodingKHR'
|   471 |     PFN_vkCmdEndVideoCodingKHR CmdEndVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:474:5: error: unknown type name 'PFN_vkCmdControlVideoCodingKHR'
|   474 |     PFN_vkCmdControlVideoCodingKHR CmdControlVideoCodingKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:479:5: error: unknown type name 'PFN_vkCmdDecodeVideoKHR'
|   479 |     PFN_vkCmdDecodeVideoKHR CmdDecodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:595:5: error: unknown type name 'PFN_vkCmdEncodeVideoKHR'
|   595 |     PFN_vkCmdEncodeVideoKHR CmdEncodeVideoKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:807:5: error: unknown type name 'PFN_vkCmdSetVertexInputEXT'
|   807 |     PFN_vkCmdSetVertexInputEXT CmdSetVertexInputEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:826:5: error: unknown type name 'PFN_vkCmdSetPatchControlPointsEXT'
|   826 |     PFN_vkCmdSetPatchControlPointsEXT CmdSetPatchControlPointsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:827:5: error: unknown type name 'PFN_vkCmdSetRasterizerDiscardEnableEXT'
|   827 |     PFN_vkCmdSetRasterizerDiscardEnableEXT CmdSetRasterizerDiscardEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:828:5: error: unknown type name 'PFN_vkCmdSetDepthBiasEnableEXT'
|   828 |     PFN_vkCmdSetDepthBiasEnableEXT CmdSetDepthBiasEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:829:5: error: unknown type name 'PFN_vkCmdSetLogicOpEXT'
|   829 |     PFN_vkCmdSetLogicOpEXT CmdSetLogicOpEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:830:5: error: unknown type name 'PFN_vkCmdSetPrimitiveRestartEnableEXT'
|   830 |     PFN_vkCmdSetPrimitiveRestartEnableEXT CmdSetPrimitiveRestartEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_layer_dispatch_table.h:833:5: error: unknown type name 'PFN_vkCmdSetColorWriteEnableEXT'
|   833 |     PFN_vkCmdSetColorWriteEnableEXT CmdSetColorWriteEnableEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.h:39,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:60:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:304:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR'
|   304 |     PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR GetPhysicalDeviceVideoCapabilitiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.h:307:5: error: unknown type name 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR'
|   307 |     PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_icd_init_entries':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: error: 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
|   156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: note: each undeclared identifier is reported only once for each function it appears in
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
|   156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:49: error: expected ';' before 'fp_gipa'
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                                 ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:156:5: note: in expansion of macro 'LOOKUP_GIPA'
|   156 |     LOOKUP_GIPA(GetPhysicalDeviceVideoCapabilitiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:36: error: 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceImageFormatProperties2KHR'?
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                    ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:159:5: note: in expansion of macro 'LOOKUP_GIPA'
|   159 |     LOOKUP_GIPA(GetPhysicalDeviceVideoFormatPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:57:49: error: expected ';' before 'fp_gipa'
|    57 |         icd_term->dispatch.func = (PFN_vk##func)fp_gipa(inst, "vk" #func);                 \
|       |                                                 ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:159:5: note: in expansion of macro 'LOOKUP_GIPA'
|   159 |     LOOKUP_GIPA(GetPhysicalDeviceVideoFormatPropertiesKHR, false);
|       |     ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_device_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:510:37: error: 'PFN_vkCreateVideoSessionKHR' undeclared (first use in this function); did you mean 'PFN_vkCreateRenderPass2KHR'?
|   510 |     table->CreateVideoSessionKHR = (PFN_vkCreateVideoSessionKHR)gdpa(dev, "vkCreateVideoSessionKHR");
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     PFN_vkCreateRenderPass2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:510:65: error: expected ';' before 'gdpa'
|   510 |     table->CreateVideoSessionKHR = (PFN_vkCreateVideoSessionKHR)gdpa(dev, "vkCreateVideoSessionKHR");
|       |                                                                 ^~~~
|       |                                                                 ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:513:38: error: 'PFN_vkDestroyVideoSessionKHR' undeclared (first use in this function); did you mean 'PFN_vkDestroySwapchainKHR'?
|   513 |     table->DestroyVideoSessionKHR = (PFN_vkDestroyVideoSessionKHR)gdpa(dev, "vkDestroyVideoSessionKHR");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      PFN_vkDestroySwapchainKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:513:67: error: expected ';' before 'gdpa'
|   513 |     table->DestroyVideoSessionKHR = (PFN_vkDestroyVideoSessionKHR)gdpa(dev, "vkDestroyVideoSessionKHR");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:516:52: error: 'PFN_vkGetVideoSessionMemoryRequirementsKHR' undeclared (first use in this function); did you mean 'PFN_vkGetImageSparseMemoryRequirements2KHR'?
|   516 |     table->GetVideoSessionMemoryRequirementsKHR = (PFN_vkGetVideoSessionMemoryRequirementsKHR)gdpa(dev, "vkGetVideoSessionMemoryRequirementsKHR");
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    PFN_vkGetImageSparseMemoryRequirements2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:516:95: error: expected ';' before 'gdpa'
|   516 |     table->GetVideoSessionMemoryRequirementsKHR = (PFN_vkGetVideoSessionMemoryRequirementsKHR)gdpa(dev, "vkGetVideoSessionMemoryRequirementsKHR");
|       |                                                                                               ^~~~
|       |                                                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:519:41: error: 'PFN_vkBindVideoSessionMemoryKHR' undeclared (first use in this function)
|   519 |     table->BindVideoSessionMemoryKHR = (PFN_vkBindVideoSessionMemoryKHR)gdpa(dev, "vkBindVideoSessionMemoryKHR");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:519:73: error: expected ';' before 'gdpa'
|   519 |     table->BindVideoSessionMemoryKHR = (PFN_vkBindVideoSessionMemoryKHR)gdpa(dev, "vkBindVideoSessionMemoryKHR");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:522:47: error: 'PFN_vkCreateVideoSessionParametersKHR' undeclared (first use in this function)
|   522 |     table->CreateVideoSessionParametersKHR = (PFN_vkCreateVideoSessionParametersKHR)gdpa(dev, "vkCreateVideoSessionParametersKHR");
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:522:85: error: expected ';' before 'gdpa'
|   522 |     table->CreateVideoSessionParametersKHR = (PFN_vkCreateVideoSessionParametersKHR)gdpa(dev, "vkCreateVideoSessionParametersKHR");
|       |                                                                                     ^~~~
|       |                                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:525:47: error: 'PFN_vkUpdateVideoSessionParametersKHR' undeclared (first use in this function)
|   525 |     table->UpdateVideoSessionParametersKHR = (PFN_vkUpdateVideoSessionParametersKHR)gdpa(dev, "vkUpdateVideoSessionParametersKHR");
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:525:85: error: expected ';' before 'gdpa'
|   525 |     table->UpdateVideoSessionParametersKHR = (PFN_vkUpdateVideoSessionParametersKHR)gdpa(dev, "vkUpdateVideoSessionParametersKHR");
|       |                                                                                     ^~~~
|       |                                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:528:48: error: 'PFN_vkDestroyVideoSessionParametersKHR' undeclared (first use in this function)
|   528 |     table->DestroyVideoSessionParametersKHR = (PFN_vkDestroyVideoSessionParametersKHR)gdpa(dev, "vkDestroyVideoSessionParametersKHR");
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:528:87: error: expected ';' before 'gdpa'
|   528 |     table->DestroyVideoSessionParametersKHR = (PFN_vkDestroyVideoSessionParametersKHR)gdpa(dev, "vkDestroyVideoSessionParametersKHR");
|       |                                                                                       ^~~~
|       |                                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:531:38: error: 'PFN_vkCmdBeginVideoCodingKHR' undeclared (first use in this function)
|   531 |     table->CmdBeginVideoCodingKHR = (PFN_vkCmdBeginVideoCodingKHR)gdpa(dev, "vkCmdBeginVideoCodingKHR");
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:531:67: error: expected ';' before 'gdpa'
|   531 |     table->CmdBeginVideoCodingKHR = (PFN_vkCmdBeginVideoCodingKHR)gdpa(dev, "vkCmdBeginVideoCodingKHR");
|       |                                                                   ^~~~
|       |                                                                   ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:534:36: error: 'PFN_vkCmdEndVideoCodingKHR' undeclared (first use in this function)
|   534 |     table->CmdEndVideoCodingKHR = (PFN_vkCmdEndVideoCodingKHR)gdpa(dev, "vkCmdEndVideoCodingKHR");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:534:63: error: expected ';' before 'gdpa'
|   534 |     table->CmdEndVideoCodingKHR = (PFN_vkCmdEndVideoCodingKHR)gdpa(dev, "vkCmdEndVideoCodingKHR");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:537:40: error: 'PFN_vkCmdControlVideoCodingKHR' undeclared (first use in this function)
|   537 |     table->CmdControlVideoCodingKHR = (PFN_vkCmdControlVideoCodingKHR)gdpa(dev, "vkCmdControlVideoCodingKHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:537:71: error: expected ';' before 'gdpa'
|   537 |     table->CmdControlVideoCodingKHR = (PFN_vkCmdControlVideoCodingKHR)gdpa(dev, "vkCmdControlVideoCodingKHR");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:542:33: error: 'PFN_vkCmdDecodeVideoKHR' undeclared (first use in this function); did you mean 'PFN_vkCmdResolveImage2KHR'?
|   542 |     table->CmdDecodeVideoKHR = (PFN_vkCmdDecodeVideoKHR)gdpa(dev, "vkCmdDecodeVideoKHR");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 PFN_vkCmdResolveImage2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:542:57: error: expected ';' before 'gdpa'
|   542 |     table->CmdDecodeVideoKHR = (PFN_vkCmdDecodeVideoKHR)gdpa(dev, "vkCmdDecodeVideoKHR");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:658:33: error: 'PFN_vkCmdEncodeVideoKHR' undeclared (first use in this function)
|   658 |     table->CmdEncodeVideoKHR = (PFN_vkCmdEncodeVideoKHR)gdpa(dev, "vkCmdEncodeVideoKHR");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:658:57: error: expected ';' before 'gdpa'
|   658 |     table->CmdEncodeVideoKHR = (PFN_vkCmdEncodeVideoKHR)gdpa(dev, "vkCmdEncodeVideoKHR");
|       |                                                         ^~~~
|       |                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:870:36: error: 'PFN_vkCmdSetVertexInputEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilOpEXT'?
|   870 |     table->CmdSetVertexInputEXT = (PFN_vkCmdSetVertexInputEXT)gdpa(dev, "vkCmdSetVertexInputEXT");
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    PFN_vkCmdSetStencilOpEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:870:63: error: expected ';' before 'gdpa'
|   870 |     table->CmdSetVertexInputEXT = (PFN_vkCmdSetVertexInputEXT)gdpa(dev, "vkCmdSetVertexInputEXT");
|       |                                                               ^~~~
|       |                                                               ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:889:43: error: 'PFN_vkCmdSetPatchControlPointsEXT' undeclared (first use in this function)
|   889 |     table->CmdSetPatchControlPointsEXT = (PFN_vkCmdSetPatchControlPointsEXT)gdpa(dev, "vkCmdSetPatchControlPointsEXT");
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:889:77: error: expected ';' before 'gdpa'
|   889 |     table->CmdSetPatchControlPointsEXT = (PFN_vkCmdSetPatchControlPointsEXT)gdpa(dev, "vkCmdSetPatchControlPointsEXT");
|       |                                                                             ^~~~
|       |                                                                             ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:890:48: error: 'PFN_vkCmdSetRasterizerDiscardEnableEXT' undeclared (first use in this function)
|   890 |     table->CmdSetRasterizerDiscardEnableEXT = (PFN_vkCmdSetRasterizerDiscardEnableEXT)gdpa(dev, "vkCmdSetRasterizerDiscardEnableEXT");
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:890:87: error: expected ';' before 'gdpa'
|   890 |     table->CmdSetRasterizerDiscardEnableEXT = (PFN_vkCmdSetRasterizerDiscardEnableEXT)gdpa(dev, "vkCmdSetRasterizerDiscardEnableEXT");
|       |                                                                                       ^~~~
|       |                                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:891:40: error: 'PFN_vkCmdSetDepthBiasEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetDepthWriteEnableEXT'?
|   891 |     table->CmdSetDepthBiasEnableEXT = (PFN_vkCmdSetDepthBiasEnableEXT)gdpa(dev, "vkCmdSetDepthBiasEnableEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdSetDepthWriteEnableEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:891:71: error: expected ';' before 'gdpa'
|   891 |     table->CmdSetDepthBiasEnableEXT = (PFN_vkCmdSetDepthBiasEnableEXT)gdpa(dev, "vkCmdSetDepthBiasEnableEXT");
|       |                                                                       ^~~~
|       |                                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:892:32: error: 'PFN_vkCmdSetLogicOpEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilOpEXT'?
|   892 |     table->CmdSetLogicOpEXT = (PFN_vkCmdSetLogicOpEXT)gdpa(dev, "vkCmdSetLogicOpEXT");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                PFN_vkCmdSetStencilOpEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:892:55: error: expected ';' before 'gdpa'
|   892 |     table->CmdSetLogicOpEXT = (PFN_vkCmdSetLogicOpEXT)gdpa(dev, "vkCmdSetLogicOpEXT");
|       |                                                       ^~~~
|       |                                                       ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:893:47: error: 'PFN_vkCmdSetPrimitiveRestartEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetStencilTestEnableEXT'?
|   893 |     table->CmdSetPrimitiveRestartEnableEXT = (PFN_vkCmdSetPrimitiveRestartEnableEXT)gdpa(dev, "vkCmdSetPrimitiveRestartEnableEXT");
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                               PFN_vkCmdSetStencilTestEnableEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:893:85: error: expected ';' before 'gdpa'
|   893 |     table->CmdSetPrimitiveRestartEnableEXT = (PFN_vkCmdSetPrimitiveRestartEnableEXT)gdpa(dev, "vkCmdSetPrimitiveRestartEnableEXT");
|       |                                                                                     ^~~~
|       |                                                                                     ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:896:41: error: 'PFN_vkCmdSetColorWriteEnableEXT' undeclared (first use in this function); did you mean 'PFN_vkCmdSetDepthWriteEnableEXT'?
|   896 |     table->CmdSetColorWriteEnableEXT = (PFN_vkCmdSetColorWriteEnableEXT)gdpa(dev, "vkCmdSetColorWriteEnableEXT");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         PFN_vkCmdSetDepthWriteEnableEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:896:73: error: expected ';' before 'gdpa'
|   896 |     table->CmdSetColorWriteEnableEXT = (PFN_vkCmdSetColorWriteEnableEXT)gdpa(dev, "vkCmdSetColorWriteEnableEXT");
|       |                                                                         ^~~~
|       |                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'loader_init_instance_extension_dispatch_table':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1019:53: error: 'PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
|  1019 |     table->GetPhysicalDeviceVideoCapabilitiesKHR = (PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoCapabilitiesKHR");
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     PFN_vkGetPhysicalDeviceSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1019:97: error: expected ';' before 'gpa'
|  1019 |     table->GetPhysicalDeviceVideoCapabilitiesKHR = (PFN_vkGetPhysicalDeviceVideoCapabilitiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoCapabilitiesKHR");
|       |                                                                                                 ^~~
|       |                                                                                                 ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1022:57: error: 'PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'PFN_vkGetPhysicalDeviceImageFormatProperties2KHR'?
|  1022 |     table->GetPhysicalDeviceVideoFormatPropertiesKHR = (PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoFormatPropertiesKHR");
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         PFN_vkGetPhysicalDeviceImageFormatProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:1022:105: error: expected ';' before 'gpa'
|  1022 |     table->GetPhysicalDeviceVideoFormatPropertiesKHR = (PFN_vkGetPhysicalDeviceVideoFormatPropertiesKHR)gpa(inst, "vkGetPhysicalDeviceVideoFormatPropertiesKHR");
|       |                                                                                                         ^~~
|       |                                                                                                         ;
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2016:11: error: unknown type name 'VkVideoProfileKHR'
|  2016 |     const VkVideoProfileKHR*                    pVideoProfile,
|       |           ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2017:5: error: unknown type name 'VkVideoCapabilitiesKHR'; did you mean 'VkSurfaceCapabilitiesKHR'?
|  2017 |     VkVideoCapabilitiesKHR*                     pCapabilities) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     VkSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2026:11: error: unknown type name 'VkVideoProfileKHR'
|  2026 |     const VkVideoProfileKHR*                    pVideoProfile,
|       |           ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2027:5: error: unknown type name 'VkVideoCapabilitiesKHR'; did you mean 'VkSurfaceCapabilitiesKHR'?
|  2027 |     VkVideoCapabilitiesKHR*                     pCapabilities) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~
|       |     VkSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2041:11: error: unknown type name 'VkPhysicalDeviceVideoFormatInfoKHR'
|  2041 |     const VkPhysicalDeviceVideoFormatInfoKHR*   pVideoFormatInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2043:5: error: unknown type name 'VkVideoFormatPropertiesKHR'; did you mean 'VkImageFormatProperties2KHR'?
|  2043 |     VkVideoFormatPropertiesKHR*                 pVideoFormatProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkImageFormatProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2052:11: error: unknown type name 'VkPhysicalDeviceVideoFormatInfoKHR'
|  2052 |     const VkPhysicalDeviceVideoFormatInfoKHR*   pVideoFormatInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2054:5: error: unknown type name 'VkVideoFormatPropertiesKHR'; did you mean 'VkImageFormatProperties2KHR'?
|  2054 |     VkVideoFormatPropertiesKHR*                 pVideoFormatProperties) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkImageFormatProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2068:11: error: unknown type name 'VkVideoSessionCreateInfoKHR'
|  2068 |     const VkVideoSessionCreateInfoKHR*          pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2070:5: error: unknown type name 'VkVideoSessionKHR'
|  2070 |     VkVideoSessionKHR*                          pVideoSession) {
|       |     ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2079:5: error: unknown type name 'VkVideoSessionKHR'
|  2079 |     VkVideoSessionKHR                           videoSession,
|       |     ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2089:5: error: unknown type name 'VkVideoSessionKHR'
|  2089 |     VkVideoSessionKHR                           videoSession,
|       |     ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2091:5: error: unknown type name 'VkVideoGetMemoryPropertiesKHR'; did you mean 'VkExternalMemoryPropertiesKHR'?
|  2091 |     VkVideoGetMemoryPropertiesKHR*              pVideoSessionMemoryRequirements) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkExternalMemoryPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2100:5: error: unknown type name 'VkVideoSessionKHR'
|  2100 |     VkVideoSessionKHR                           videoSession,
|       |     ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2102:11: error: unknown type name 'VkVideoBindMemoryKHR'
|  2102 |     const VkVideoBindMemoryKHR*                 pVideoSessionBindMemories) {
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2111:11: error: unknown type name 'VkVideoSessionParametersCreateInfoKHR'
|  2111 |     const VkVideoSessionParametersCreateInfoKHR* pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2113:5: error: unknown type name 'VkVideoSessionParametersKHR'
|  2113 |     VkVideoSessionParametersKHR*                pVideoSessionParameters) {
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2122:5: error: unknown type name 'VkVideoSessionParametersKHR'
|  2122 |     VkVideoSessionParametersKHR                 videoSessionParameters,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2123:11: error: unknown type name 'VkVideoSessionParametersUpdateInfoKHR'
|  2123 |     const VkVideoSessionParametersUpdateInfoKHR* pUpdateInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2132:5: error: unknown type name 'VkVideoSessionParametersKHR'
|  2132 |     VkVideoSessionParametersKHR                 videoSessionParameters,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2142:11: error: unknown type name 'VkVideoBeginCodingInfoKHR'
|  2142 |     const VkVideoBeginCodingInfoKHR*            pBeginInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdBeginVideoCodingKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2144:5: error: called object is not a function or function pointer
|  2144 |     disp->CmdBeginVideoCodingKHR(commandBuffer, pBeginInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2151:11: error: unknown type name 'VkVideoEndCodingInfoKHR'
|  2151 |     const VkVideoEndCodingInfoKHR*              pEndCodingInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdEndVideoCodingKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2153:5: error: called object is not a function or function pointer
|  2153 |     disp->CmdEndVideoCodingKHR(commandBuffer, pEndCodingInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2160:11: error: unknown type name 'VkVideoCodingControlInfoKHR'
|  2160 |     const VkVideoCodingControlInfoKHR*          pCodingControlInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdControlVideoCodingKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2162:5: error: called object is not a function or function pointer
|  2162 |     disp->CmdControlVideoCodingKHR(commandBuffer, pCodingControlInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2172:11: error: unknown type name 'VkVideoDecodeInfoKHR'
|  2172 |     const VkVideoDecodeInfoKHR*                 pFrameInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdDecodeVideoKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2174:5: error: called object is not a function or function pointer
|  2174 |     disp->CmdDecodeVideoKHR(commandBuffer, pFrameInfo);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2774:11: error: unknown type name 'VkVideoEncodeInfoKHR'
|  2774 |     const VkVideoEncodeInfoKHR*                 pEncodeInfo) {
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdEncodeVideoKHR':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:2776:5: error: called object is not a function or function pointer
|  2776 |     disp->CmdEncodeVideoKHR(commandBuffer, pEncodeInfo);
|       |     ^~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/loader.c:92:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4325:11: error: unknown type name 'VkVertexInputBindingDescription2EXT'
|  4325 |     const VkVertexInputBindingDescription2EXT*  pVertexBindingDescriptions,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4327:11: error: unknown type name 'VkVertexInputAttributeDescription2EXT'
|  4327 |     const VkVertexInputAttributeDescription2EXT* pVertexAttributeDescriptions) {
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetVertexInputEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4329:5: error: called object is not a function or function pointer
|  4329 |     disp->CmdSetVertexInputEXT(commandBuffer, vertexBindingDescriptionCount, pVertexBindingDescriptions, vertexAttributeDescriptionCount, pVertexAttributeDescriptions);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPatchControlPointsEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4385:5: error: called object is not a function or function pointer
|  4385 |     disp->CmdSetPatchControlPointsEXT(commandBuffer, patchControlPoints);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetRasterizerDiscardEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4392:5: error: called object is not a function or function pointer
|  4392 |     disp->CmdSetRasterizerDiscardEnableEXT(commandBuffer, rasterizerDiscardEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetDepthBiasEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4399:5: error: called object is not a function or function pointer
|  4399 |     disp->CmdSetDepthBiasEnableEXT(commandBuffer, depthBiasEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetLogicOpEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4406:5: error: called object is not a function or function pointer
|  4406 |     disp->CmdSetLogicOpEXT(commandBuffer, logicOp);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetPrimitiveRestartEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4413:5: error: called object is not a function or function pointer
|  4413 |     disp->CmdSetPrimitiveRestartEnableEXT(commandBuffer, primitiveRestartEnable);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'CmdSetColorWriteEnableEXT':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4424:5: error: called object is not a function or function pointer
|  4424 |     disp->CmdSetColorWriteEnableEXT(commandBuffer, attachmentCount, pColorWriteEnables);
|       |     ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: In function 'extension_instance_gpa':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4644:25: error: 'GetPhysicalDeviceVideoCapabilitiesKHR' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceSurfaceCapabilitiesKHR'?
|  4644 |         *addr = (void *)GetPhysicalDeviceVideoCapabilitiesKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetPhysicalDeviceSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4650:25: error: 'GetPhysicalDeviceVideoFormatPropertiesKHR' undeclared (first use in this function); did you mean 'vkGetPhysicalDeviceImageFormatProperties2KHR'?
|  4650 |         *addr = (void *)GetPhysicalDeviceVideoFormatPropertiesKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         vkGetPhysicalDeviceImageFormatProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4656:25: error: 'CreateVideoSessionKHR' undeclared (first use in this function)
|  4656 |         *addr = (void *)CreateVideoSessionKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4662:25: error: 'DestroyVideoSessionKHR' undeclared (first use in this function)
|  4662 |         *addr = (void *)DestroyVideoSessionKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4668:25: error: 'GetVideoSessionMemoryRequirementsKHR' undeclared (first use in this function); did you mean 'GetImageSparseMemoryRequirements2KHR'?
|  4668 |         *addr = (void *)GetVideoSessionMemoryRequirementsKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         GetImageSparseMemoryRequirements2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4674:25: error: 'BindVideoSessionMemoryKHR' undeclared (first use in this function)
|  4674 |         *addr = (void *)BindVideoSessionMemoryKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4680:25: error: 'CreateVideoSessionParametersKHR' undeclared (first use in this function)
|  4680 |         *addr = (void *)CreateVideoSessionParametersKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4686:25: error: 'UpdateVideoSessionParametersKHR' undeclared (first use in this function)
|  4686 |         *addr = (void *)UpdateVideoSessionParametersKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:4692:25: error: 'DestroyVideoSessionParametersKHR' undeclared (first use in this function)
|  4692 |         *addr = (void *)DestroyVideoSessionParametersKHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c: At top level:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:6141:46: error: 'terminator_GetPhysicalDeviceVideoCapabilitiesKHR' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR'?
|  6141 |     .GetPhysicalDeviceVideoCapabilitiesKHR = terminator_GetPhysicalDeviceVideoCapabilitiesKHR,
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              terminator_GetPhysicalDeviceSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/git/loader/generated/vk_loader_extensions.c:6144:50: error: 'terminator_GetPhysicalDeviceVideoFormatPropertiesKHR' undeclared here (not in a function); did you mean 'terminator_GetPhysicalDeviceImageFormatProperties2'?
|  6144 |     .GetPhysicalDeviceVideoFormatPropertiesKHR = terminator_GetPhysicalDeviceVideoFormatPropertiesKHR,
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  terminator_GetPhysicalDeviceImageFormatProperties2
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782:157 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 157
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 151
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 146
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.176.0-r0/temp/run.do_compile.1554782, line 170
| 
| Backtrace (metadata-relative locations):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 207
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/cmake.bbclass, line 211
| 	#3: do_compile, autogenerated, line 2
NOTE: recipe vulkan-loader-1.2.176.0-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2457 tasks of which 2448 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.176.0.bb:do_compile
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============3380820667834816654==--
