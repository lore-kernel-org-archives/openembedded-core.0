Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EB5C54FC4
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.14637.1700059032835247323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aysBUMMr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fYwzQR1q;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018bd36a2a9e-1f4fad45-8a8a-4bd8-bc88-ab750a2b6d24-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UOP9huYiljQ4FF8GLek8K2eR1qKQJwqy6XH32gTcHl8=;
	b=aysBUMMrgGJudm+8KfhXl8mkI/dXda/7HLTDLtYZETyWVOafjvQ8oPqIDFVTaVoU
	0OVAgMBqZ31Z2YRdvAMDUsOdrhsDtbx7ga1cJKMh6OyKtFJBPOqF1/PSaw3PDUGrGaO
	gPKHSs7hQQ+83C6+s0SUMiyqWnHYqPIbSmNQMBqQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UOP9huYiljQ4FF8GLek8K2eR1qKQJwqy6XH32gTcHl8=;
	b=fYwzQR1qonDpjVYf+QK/JLYFjMpFShsK/q7GOoETmzdBdKjxg/cci/Va1tAp/Gp/
	s26/7AmlF8PpWvbHDPEqYRymGO6k5laNYdJrIi2+DshtEs/B/efvJMuTuEwHphzc6EA
	V0R1UF76CMnP9FP1Td0HWQSgsNDyzqR5+MrZRdZg=
Content-Type: multipart/mixed; boundary="===============8373093163938366498=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.268.0 FAILED
Message-ID: <0101018bd36a2a9e-1f4fad45-8a8a-4bd8-bc88-ab750a2b6d24-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190697

--===============8373093163938366498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.268.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.261.1-1.3.268.0.patch
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
From fbe7362c79c2bd43a9414efa840e866854b6c97a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 12:09:05 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.261.1 -> 1.3.268.0

---
 .../{vulkan-tools_1.3.261.1.bb => vulkan-tools_1.3.268.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.261.1.bb => vulkan-tools_1.3.268.0.bb} (96%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
similarity index 96%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
index 7a7edc9ebd..5f0d52bb6e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.261.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "a7da7027ca9fd0901639f02619c226da9c6036f1"
+SRCREV = "1532001f7edae559af1988293eec90bc5e2607d5"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


--===============8373093163938366498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6595ec965105d192d2ea1f9a51464ea3bca8bb7b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6595ec965105d192d2ea1f9a51464ea3bca8bb7b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 174 Local 162 Mirrors 0 Missed 12 Current 389 (93% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_recipe_qa)
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_recipe_qa unihash changed to 41f918d80fb0a7e6d7fb48008413a22c950a4e8e1742c1de63e68b47139605d2
NOTE: Setscene tasks completed
NOTE: Running task 1561 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_unpack)
NOTE: Running task 1563 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_unpack: Succeeded
NOTE: Running task 1564 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_patch)
NOTE: Running task 1565 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_patch: Succeeded
NOTE: Running task 1566 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1567 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_generate_toolchain_file)
NOTE: Running task 1568 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_populate_lic unihash changed to f6bcafb9089684b0b7bfb00f585d63d7479a2e2017b047c980d6559ff1f1cacb
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_deploy_source_date_epoch unihash changed to bb2fbc17c1bea432043c86e122369dbb804a3f68232843215afe6b5d3f6f75cf
NOTE: Setscene tasks completed
NOTE: Running task 1569 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_configure: Succeeded
NOTE: Running task 1570 of 1581 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/4] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefi
 x-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work
 /core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot-native=  -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map 
  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2
 -64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot-native=  -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/vulkaninfo.cpp:33:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:101:15: error: 'VK_DRIVER_ID_MESA_AGXV' was not declared in this scope; did you mean 'VK_DRIVER_ID_MESA_V3DV'?
|   101 |         case (VK_DRIVER_ID_MESA_AGXV): return "DRIVER_ID_MESA_AGXV";
|       |               ^~~~~~~~~~~~~~~~~~~~~~
|       |               VK_DRIVER_ID_MESA_V3DV
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkResolveModeFlagBitsGetStrings(VkResolveModeFlagBits)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:1070:9: error: 'VK_RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_ANDROID' was not declared in this scope
|  1070 |     if (VK_RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_ANDROID & value) strings.push_back("RESOLVE_MODE_EXTERNAL_FORMAT_DOWNSAMPLE_ANDROID");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:1951:87: error: 'VkPhysicalDeviceFrameBoundaryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceFaultFeaturesEXT'?
|  1951 | void DumpVkPhysicalDeviceFrameBoundaryFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceFrameBoundaryFeaturesEXT &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       VkPhysicalDeviceFaultFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFrameBoundaryFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:1954:59: error: request for member 'frameBoundary' in 'obj', which is of non-class type 'const int'
|  1954 |     p.PrintKeyBool("frameBoundary", static_cast<bool>(obj.frameBoundary));
|       |                                                           ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:2367:93: error: 'VkPhysicalDeviceNestedCommandBufferFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDescriptorBufferFeaturesEXT'?
|  2367 | void DumpVkPhysicalDeviceNestedCommandBufferFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceNestedCommandBufferFeaturesEXT &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             VkPhysicalDeviceDescriptorBufferFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceNestedCommandBufferFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:2370:65: error: request for member 'nestedCommandBuffer' in 'obj', which is of non-class type 'const int'
|  2370 |     p.PrintKeyBool("nestedCommandBuffer", static_cast<bool>(obj.nestedCommandBuffer));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:2371:74: error: request for member 'nestedCommandBufferRendering' in 'obj', which is of non-class type 'const int'
|  2371 |     p.PrintKeyBool("nestedCommandBufferRendering", static_cast<bool>(obj.nestedCommandBufferRendering));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:2372:80: error: request for member 'nestedCommandBufferSimultaneousUse' in 'obj', which is of non-class type 'const int'
|  2372 |     p.PrintKeyBool("nestedCommandBufferSimultaneousUse", static_cast<bool>(obj.nestedCommandBufferSimultaneousUse));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:2374:95: error: 'VkPhysicalDeviceNestedCommandBufferPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceDescriptorBufferPropertiesEXT'?
|  2374 | void DumpVkPhysicalDeviceNestedCommandBufferPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceNestedCommandBufferPropertiesEXT &obj) {
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               VkPhysicalDeviceDescriptorBufferPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceNestedCommandBufferPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:2377:57: error: request for member 'maxCommandBufferNestingLevel' in 'obj', which is of non-class type 'const int'
|  2377 |     p.PrintKeyValue("maxCommandBufferNestingLevel", obj.maxCommandBufferNestingLevel);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3293:5: error: 'VkPhysicalDeviceNestedCommandBufferPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceDescriptorBufferPropertiesEXT'?
|  3293 |     VkPhysicalDeviceNestedCommandBufferPropertiesEXT PhysicalDeviceNestedCommandBufferPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDescriptorBufferPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3352:9: error: 'PhysicalDeviceNestedCommandBufferPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceNestedCommandBufferPropertiesEXT'?
|  3352 |         PhysicalDeviceNestedCommandBufferPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceNestedCommandBufferPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3352:64: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT'?
|  3352 |         PhysicalDeviceNestedCommandBufferPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3517:5: error: 'VkPhysicalDeviceFrameBoundaryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceFaultFeaturesEXT'?
|  3517 |     VkPhysicalDeviceFrameBoundaryFeaturesEXT PhysicalDeviceFrameBoundaryFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFaultFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3542:5: error: 'VkPhysicalDeviceNestedCommandBufferFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDescriptorBufferFeaturesEXT'?
|  3542 |     VkPhysicalDeviceNestedCommandBufferFeaturesEXT PhysicalDeviceNestedCommandBufferFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDescriptorBufferFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3644:9: error: 'PhysicalDeviceFrameBoundaryFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFrameBoundaryFeaturesEXT'?
|  3644 |         PhysicalDeviceFrameBoundaryFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceFrameBoundaryFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3644:56: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT'?
|  3644 |         PhysicalDeviceFrameBoundaryFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3668:9: error: 'PhysicalDeviceNestedCommandBufferFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceNestedCommandBufferFeaturesEXT'?
|  3668 |         PhysicalDeviceNestedCommandBufferFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceNestedCommandBufferFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:3668:62: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT'?
|  3668 |         PhysicalDeviceNestedCommandBufferFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4151:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT'?
|  4151 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4152:54: error: 'VK_EXT_NESTED_COMMAND_BUFFER_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DESCRIPTOR_BUFFER_EXTENSION_NAME'?
|  4152 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_NESTED_COMMAND_BUFFER_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DESCRIPTOR_BUFFER_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4153:13: error: 'VkPhysicalDeviceNestedCommandBufferPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceNestedCommandBufferPropertiesEXT'?
|  4153 |             VkPhysicalDeviceNestedCommandBufferPropertiesEXT* props = (VkPhysicalDeviceNestedCommandBufferPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceNestedCommandBufferPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4153:63: error: 'props' was not declared in this scope
|  4153 |             VkPhysicalDeviceNestedCommandBufferPropertiesEXT* props = (VkPhysicalDeviceNestedCommandBufferPropertiesEXT*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4153:121: error: expected primary-expression before ')' token
|  4153 |             VkPhysicalDeviceNestedCommandBufferPropertiesEXT* props = (VkPhysicalDeviceNestedCommandBufferPropertiesEXT*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4537:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT'?
|  4537 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4538:54: error: 'VK_EXT_FRAME_BOUNDARY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_PRIVATE_DATA_EXTENSION_NAME'?
|  4538 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_FRAME_BOUNDARY_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_PRIVATE_DATA_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4539:13: error: 'VkPhysicalDeviceFrameBoundaryFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFrameBoundaryFeaturesEXT'?
|  4539 |             VkPhysicalDeviceFrameBoundaryFeaturesEXT* props = (VkPhysicalDeviceFrameBoundaryFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceFrameBoundaryFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4539:55: error: 'props' was not declared in this scope
|  4539 |             VkPhysicalDeviceFrameBoundaryFeaturesEXT* props = (VkPhysicalDeviceFrameBoundaryFeaturesEXT*)structure;
|       |                                                       ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4539:105: error: expected primary-expression before ')' token
|  4539 |             VkPhysicalDeviceFrameBoundaryFeaturesEXT* props = (VkPhysicalDeviceFrameBoundaryFeaturesEXT*)structure;
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4687:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT'?
|  4687 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4688:54: error: 'VK_EXT_NESTED_COMMAND_BUFFER_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DESCRIPTOR_BUFFER_EXTENSION_NAME'?
|  4688 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_NESTED_COMMAND_BUFFER_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DESCRIPTOR_BUFFER_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4689:13: error: 'VkPhysicalDeviceNestedCommandBufferFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceNestedCommandBufferFeaturesEXT'?
|  4689 |             VkPhysicalDeviceNestedCommandBufferFeaturesEXT* props = (VkPhysicalDeviceNestedCommandBufferFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceNestedCommandBufferFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4689:61: error: 'props' was not declared in this scope
|  4689 |             VkPhysicalDeviceNestedCommandBufferFeaturesEXT* props = (VkPhysicalDeviceNestedCommandBufferFeaturesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/vulkaninfo/generated/vulkaninfo.hpp:4689:117: error: expected primary-expression before ')' token
|  4689 |             VkPhysicalDeviceNestedCommandBufferFeaturesEXT* props = (VkPhysicalDeviceNestedCommandBufferFeaturesEXT*)structure;
|       |                                                                                                                     ^
| [2/4] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot -DGIT_BRANCH_NAME=\"main\" -DGIT_TAG_INFO=\"v1.3.268\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh
 /build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp
 /work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot-native=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot -DGIT_BRANCH_NAME=\"main\" -DGIT_TAG_INFO=\"v1.3.268\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build
 /build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build=/usr/src/debug/vulkan-tools/1.3.268.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/
 core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/recipe-sysroot-native=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/mock_icd.h:31,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/mock_icd.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:6493:31: error: 'VkPhysicalDeviceFrameBoundaryFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFaultFeaturesEXT'?
|  6493 | template <> struct LvlTypeMap<VkPhysicalDeviceFrameBoundaryFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFaultFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:6493:71: error: template argument 1 is invalid
|  6493 | template <> struct LvlTypeMap<VkPhysicalDeviceFrameBoundaryFeaturesEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:6497:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT'?
|  6497 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:6497:93: error: template argument 1 is invalid
|  6497 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:6502:31: error: 'VkFrameBoundaryEXT' was not declared in this scope
|  6502 | template <> struct LvlTypeMap<VkFrameBoundaryEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:6502:49: error: template argument 1 is invalid
|  6502 | template <> struct LvlTypeMap<VkFrameBoundaryEXT> {
|       |                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:6506:32: error: 'VK_STRUCTURE_TYPE_FRAME_BOUNDARY_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_HDR_METADATA_EXT'?
|  6506 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAME_BOUNDARY_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_HDR_METADATA_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:6506:68: error: template argument 1 is invalid
|  6506 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_FRAME_BOUNDARY_EXT> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7023:31: error: 'VkPhysicalDeviceNestedCommandBufferFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDescriptorBufferFeaturesEXT'?
|  7023 | template <> struct LvlTypeMap<VkPhysicalDeviceNestedCommandBufferFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDescriptorBufferFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7023:77: error: template argument 1 is invalid
|  7023 | template <> struct LvlTypeMap<VkPhysicalDeviceNestedCommandBufferFeaturesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7027:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT'?
|  7027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7027:100: error: template argument 1 is invalid
|  7027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7032:31: error: 'VkPhysicalDeviceNestedCommandBufferPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDescriptorBufferPropertiesEXT'?
|  7032 | template <> struct LvlTypeMap<VkPhysicalDeviceNestedCommandBufferPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDescriptorBufferPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7032:79: error: template argument 1 is invalid
|  7032 | template <> struct LvlTypeMap<VkPhysicalDeviceNestedCommandBufferPropertiesEXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7036:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT'?
|  7036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7036:102: error: template argument 1 is invalid
|  7036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT> {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7362:31: error: 'VkPhysicalDeviceExtendedSparseAddressSpaceFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  7362 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedSparseAddressSpaceFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7362:83: error: template argument 1 is invalid
|  7362 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedSparseAddressSpaceFeaturesNV> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7366:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT'?
|  7366 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7366:107: error: template argument 1 is invalid
|  7366 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_FEATURES_NV> {
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7371:31: error: 'VkPhysicalDeviceExtendedSparseAddressSpacePropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceExtendedDynamicState3PropertiesEXT'?
|  7371 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedSparseAddressSpacePropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceExtendedDynamicState3PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7371:85: error: template argument 1 is invalid
|  7371 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedSparseAddressSpacePropertiesNV> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7375:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT'?
|  7375 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7375:109: error: template argument 1 is invalid
|  7375 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_PROPERTIES_NV> {
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7416:31: error: 'VkLatencySleepModeInfoNV' was not declared in this scope
|  7416 | template <> struct LvlTypeMap<VkLatencySleepModeInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7416:55: error: template argument 1 is invalid
|  7416 | template <> struct LvlTypeMap<VkLatencySleepModeInfoNV> {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7420:32: error: 'VK_STRUCTURE_TYPE_LATENCY_SLEEP_MODE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_FENCE_GET_FD_INFO_KHR'?
|  7420 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_SLEEP_MODE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_FENCE_GET_FD_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7420:76: error: template argument 1 is invalid
|  7420 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_SLEEP_MODE_INFO_NV> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7425:31: error: 'VkLatencySleepInfoNV' was not declared in this scope
|  7425 | template <> struct LvlTypeMap<VkLatencySleepInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7425:51: error: template argument 1 is invalid
|  7425 | template <> struct LvlTypeMap<VkLatencySleepInfoNV> {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7429:32: error: 'VK_STRUCTURE_TYPE_LATENCY_SLEEP_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_FENCE_CREATE_INFO'?
|  7429 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_SLEEP_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_FENCE_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7429:71: error: template argument 1 is invalid
|  7429 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_SLEEP_INFO_NV> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7434:31: error: 'VkSetLatencyMarkerInfoNV' was not declared in this scope
|  7434 | template <> struct LvlTypeMap<VkSetLatencyMarkerInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7434:55: error: template argument 1 is invalid
|  7434 | template <> struct LvlTypeMap<VkSetLatencyMarkerInfoNV> {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7438:32: error: 'VK_STRUCTURE_TYPE_SET_LATENCY_MARKER_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL'?
|  7438 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SET_LATENCY_MARKER_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7438:76: error: template argument 1 is invalid
|  7438 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SET_LATENCY_MARKER_INFO_NV> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7443:31: error: 'VkLatencyTimingsFrameReportNV' was not declared in this scope
|  7443 | template <> struct LvlTypeMap<VkLatencyTimingsFrameReportNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7443:60: error: template argument 1 is invalid
|  7443 | template <> struct LvlTypeMap<VkLatencyTimingsFrameReportNV> {
|       |                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7447:32: error: 'VK_STRUCTURE_TYPE_LATENCY_TIMINGS_FRAME_REPORT_NV' was not declared in this scope
|  7447 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_TIMINGS_FRAME_REPORT_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7447:81: error: template argument 1 is invalid
|  7447 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_TIMINGS_FRAME_REPORT_NV> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7452:31: error: 'VkGetLatencyMarkerInfoNV' was not declared in this scope
|  7452 | template <> struct LvlTypeMap<VkGetLatencyMarkerInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7452:55: error: template argument 1 is invalid
|  7452 | template <> struct LvlTypeMap<VkGetLatencyMarkerInfoNV> {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7456:32: error: 'VK_STRUCTURE_TYPE_GET_LATENCY_MARKER_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV'?
|  7456 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GET_LATENCY_MARKER_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7456:76: error: template argument 1 is invalid
|  7456 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GET_LATENCY_MARKER_INFO_NV> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7461:31: error: 'VkLatencySubmissionPresentIdNV' was not declared in this scope
|  7461 | template <> struct LvlTypeMap<VkLatencySubmissionPresentIdNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7461:61: error: template argument 1 is invalid
|  7461 | template <> struct LvlTypeMap<VkLatencySubmissionPresentIdNV> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7465:32: error: 'VK_STRUCTURE_TYPE_LATENCY_SUBMISSION_PRESENT_ID_NV' was not declared in this scope
|  7465 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_SUBMISSION_PRESENT_ID_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7465:82: error: template argument 1 is invalid
|  7465 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_SUBMISSION_PRESENT_ID_NV> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7470:31: error: 'VkSwapchainLatencyCreateInfoNV' was not declared in this scope; did you mean 'VkSwapchainCreateInfoKHR'?
|  7470 | template <> struct LvlTypeMap<VkSwapchainLatencyCreateInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSwapchainCreateInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7470:61: error: template argument 1 is invalid
|  7470 | template <> struct LvlTypeMap<VkSwapchainLatencyCreateInfoNV> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7474:32: error: 'VK_STRUCTURE_TYPE_SWAPCHAIN_LATENCY_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT'?
|  7474 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_LATENCY_CREATE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7474:82: error: template argument 1 is invalid
|  7474 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_LATENCY_CREATE_INFO_NV> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7479:31: error: 'VkOutOfBandQueueTypeInfoNV' was not declared in this scope
|  7479 | template <> struct LvlTypeMap<VkOutOfBandQueueTypeInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7479:57: error: template argument 1 is invalid
|  7479 | template <> struct LvlTypeMap<VkOutOfBandQueueTypeInfoNV> {
|       |                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7483:32: error: 'VK_STRUCTURE_TYPE_OUT_OF_BAND_QUEUE_TYPE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_OPTICAL_FLOW_EXECUTE_INFO_NV'?
|  7483 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OUT_OF_BAND_QUEUE_TYPE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_OPTICAL_FLOW_EXECUTE_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7483:80: error: template argument 1 is invalid
|  7483 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OUT_OF_BAND_QUEUE_TYPE_INFO_NV> {
|       |                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7488:31: error: 'VkLatencySurfaceCapabilitiesNV' was not declared in this scope; did you mean 'VkSurfaceCapabilitiesKHR'?
|  7488 | template <> struct LvlTypeMap<VkLatencySurfaceCapabilitiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSurfaceCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7488:61: error: template argument 1 is invalid
|  7488 | template <> struct LvlTypeMap<VkLatencySurfaceCapabilitiesNV> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7492:32: error: 'VK_STRUCTURE_TYPE_LATENCY_SURFACE_CAPABILITIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES2_EXT'?
|  7492 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_SURFACE_CAPABILITIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES2_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7492:81: error: template argument 1 is invalid
|  7492 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_LATENCY_SURFACE_CAPABILITIES_NV> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7515:31: error: 'VkPhysicalDeviceImageProcessing2FeaturesQCOM' was not declared in this scope; did you mean 'VkPhysicalDeviceImageProcessingFeaturesQCOM'?
|  7515 | template <> struct LvlTypeMap<VkPhysicalDeviceImageProcessing2FeaturesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceImageProcessingFeaturesQCOM
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7515:75: error: template argument 1 is invalid
|  7515 | template <> struct LvlTypeMap<VkPhysicalDeviceImageProcessing2FeaturesQCOM> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7519:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_2_FEATURES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_FEATURES_QCOM'?
|  7519 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_2_FEATURES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_FEATURES_QCOM
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7519:98: error: template argument 1 is invalid
|  7519 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_2_FEATURES_QCOM> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7524:31: error: 'VkPhysicalDeviceImageProcessing2PropertiesQCOM' was not declared in this scope; did you mean 'VkPhysicalDeviceImageProcessingPropertiesQCOM'?
|  7524 | template <> struct LvlTypeMap<VkPhysicalDeviceImageProcessing2PropertiesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceImageProcessingPropertiesQCOM
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7524:77: error: template argument 1 is invalid
|  7524 | template <> struct LvlTypeMap<VkPhysicalDeviceImageProcessing2PropertiesQCOM> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7528:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_2_PROPERTIES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_PROPERTIES_QCOM'?
|  7528 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_2_PROPERTIES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_PROPERTIES_QCOM
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7528:100: error: template argument 1 is invalid
|  7528 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_2_PROPERTIES_QCOM> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7533:31: error: 'VkSamplerBlockMatchWindowCreateInfoQCOM' was not declared in this scope
|  7533 | template <> struct LvlTypeMap<VkSamplerBlockMatchWindowCreateInfoQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7533:70: error: template argument 1 is invalid
|  7533 | template <> struct LvlTypeMap<VkSamplerBlockMatchWindowCreateInfoQCOM> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7537:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_BLOCK_MATCH_WINDOW_CREATE_INFO_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR'?
|  7537 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_BLOCK_MATCH_WINDOW_CREATE_INFO_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7537:93: error: template argument 1 is invalid
|  7537 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_BLOCK_MATCH_WINDOW_CREATE_INFO_QCOM> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7542:31: error: 'VkPhysicalDeviceCubicWeightsFeaturesQCOM' was not declared in this scope; did you mean 'VkPhysicalDeviceTilePropertiesFeaturesQCOM'?
|  7542 | template <> struct LvlTypeMap<VkPhysicalDeviceCubicWeightsFeaturesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTilePropertiesFeaturesQCOM
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7542:71: error: template argument 1 is invalid
|  7542 | template <> struct LvlTypeMap<VkPhysicalDeviceCubicWeightsFeaturesQCOM> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7546:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUBIC_WEIGHTS_FEATURES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TILE_PROPERTIES_FEATURES_QCOM'?
|  7546 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUBIC_WEIGHTS_FEATURES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TILE_PROPERTIES_FEATURES_QCOM
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7546:93: error: template argument 1 is invalid
|  7546 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUBIC_WEIGHTS_FEATURES_QCOM> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7551:31: error: 'VkSamplerCubicWeightsCreateInfoQCOM' was not declared in this scope
|  7551 | template <> struct LvlTypeMap<VkSamplerCubicWeightsCreateInfoQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7551:66: error: template argument 1 is invalid
|  7551 | template <> struct LvlTypeMap<VkSamplerCubicWeightsCreateInfoQCOM> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7555:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_CUBIC_WEIGHTS_CREATE_INFO_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_SAMPLE_WEIGHT_CREATE_INFO_QCOM'?
|  7555 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUBIC_WEIGHTS_CREATE_INFO_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_VIEW_SAMPLE_WEIGHT_CREATE_INFO_QCOM
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7555:88: error: template argument 1 is invalid
|  7555 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_CUBIC_WEIGHTS_CREATE_INFO_QCOM> {
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7560:31: error: 'VkBlitImageCubicWeightsInfoQCOM' was not declared in this scope
|  7560 | template <> struct LvlTypeMap<VkBlitImageCubicWeightsInfoQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7560:62: error: template argument 1 is invalid
|  7560 | template <> struct LvlTypeMap<VkBlitImageCubicWeightsInfoQCOM> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7564:32: error: 'VK_STRUCTURE_TYPE_BLIT_IMAGE_CUBIC_WEIGHTS_INFO_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2'?
|  7564 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BLIT_IMAGE_CUBIC_WEIGHTS_INFO_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BLIT_IMAGE_INFO_2
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7564:84: error: template argument 1 is invalid
|  7564 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BLIT_IMAGE_CUBIC_WEIGHTS_INFO_QCOM> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7569:31: error: 'VkPhysicalDeviceYcbcrDegammaFeaturesQCOM' was not declared in this scope; did you mean 'VkPhysicalDeviceTilePropertiesFeaturesQCOM'?
|  7569 | template <> struct LvlTypeMap<VkPhysicalDeviceYcbcrDegammaFeaturesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTilePropertiesFeaturesQCOM
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7569:71: error: template argument 1 is invalid
|  7569 | template <> struct LvlTypeMap<VkPhysicalDeviceYcbcrDegammaFeaturesQCOM> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7573:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_DEGAMMA_FEATURES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  7573 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_DEGAMMA_FEATURES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7573:93: error: template argument 1 is invalid
|  7573 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_DEGAMMA_FEATURES_QCOM> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7578:31: error: 'VkSamplerYcbcrConversionYcbcrDegammaCreateInfoQCOM' was not declared in this scope; did you mean 'VkSamplerYcbcrConversionCreateInfoKHR'?
|  7578 | template <> struct LvlTypeMap<VkSamplerYcbcrConversionYcbcrDegammaCreateInfoQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSamplerYcbcrConversionCreateInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7578:81: error: template argument 1 is invalid
|  7578 | template <> struct LvlTypeMap<VkSamplerYcbcrConversionYcbcrDegammaCreateInfoQCOM> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7582:32: error: 'VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_YCBCR_DEGAMMA_CREATE_INFO_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR'?
|  7582 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_YCBCR_DEGAMMA_CREATE_INFO_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7582:105: error: template argument 1 is invalid
|  7582 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_YCBCR_DEGAMMA_CREATE_INFO_QCOM> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7587:31: error: 'VkPhysicalDeviceCubicClampFeaturesQCOM' was not declared in this scope; did you mean 'VkPhysicalDeviceOpticalFlowFeaturesNV'?
|  7587 | template <> struct LvlTypeMap<VkPhysicalDeviceCubicClampFeaturesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceOpticalFlowFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7587:69: error: template argument 1 is invalid
|  7587 | template <> struct LvlTypeMap<VkPhysicalDeviceCubicClampFeaturesQCOM> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7591:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUBIC_CLAMP_FEATURES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT'?
|  7591 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUBIC_CLAMP_FEATURES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7591:91: error: template argument 1 is invalid
|  7591 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CUBIC_CLAMP_FEATURES_QCOM> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7660:31: error: 'VkPhysicalDeviceLayeredDriverPropertiesMSFT' was not declared in this scope; did you mean 'VkPhysicalDeviceDriverPropertiesKHR'?
|  7660 | template <> struct LvlTypeMap<VkPhysicalDeviceLayeredDriverPropertiesMSFT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDriverPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7660:74: error: template argument 1 is invalid
|  7660 | template <> struct LvlTypeMap<VkPhysicalDeviceLayeredDriverPropertiesMSFT> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7664:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR'?
|  7664 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DRIVER_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7664:96: error: template argument 1 is invalid
|  7664 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7669:31: error: 'VkPhysicalDeviceDescriptorPoolOverallocationFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceDescriptorIndexingFeatures'?
|  7669 | template <> struct LvlTypeMap<VkPhysicalDeviceDescriptorPoolOverallocationFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDescriptorIndexingFeatures
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7669:85: error: template argument 1 is invalid
|  7669 | template <> struct LvlTypeMap<VkPhysicalDeviceDescriptorPoolOverallocationFeaturesNV> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7673:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_POOL_OVERALLOCATION_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES_EXT'?
|  7673 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_POOL_OVERALLOCATION_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/vk_typemap_helper.h:7673:108: error: template argument 1 is invalid
|  7673 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_POOL_OVERALLOCATION_FEATURES_NV> {
|       |                                                                                                            ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_definitions.h:25,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/mock_icd.cpp:18:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_declarations.h:4192:11: error: 'VkLatencySleepModeInfoNV' does not name a type
|  4192 |     const VkLatencySleepModeInfoNV*             pSleepModeInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_declarations.h:4197:11: error: 'VkLatencySleepInfoNV' does not name a type
|  4197 |     const VkLatencySleepInfoNV*                 pSleepInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_declarations.h:4202:11: error: 'VkSetLatencyMarkerInfoNV' does not name a type
|  4202 |     const VkSetLatencyMarkerInfoNV*             pLatencyMarkerInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_declarations.h:4208:5: error: 'VkGetLatencyMarkerInfoNV' has not been declared
|  4208 |     VkGetLatencyMarkerInfoNV*                   pLatencyMarkerInfo);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_declarations.h:4212:11: error: 'VkOutOfBandQueueTypeInfoNV' does not name a type
|  4212 |     const VkOutOfBandQueueTypeInfoNV*           pQueueTypeInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_definitions.h:6809:11: error: 'VkLatencySleepModeInfoNV' does not name a type
|  6809 |     const VkLatencySleepModeInfoNV*             pSleepModeInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_definitions.h:6818:11: error: 'VkLatencySleepInfoNV' does not name a type
|  6818 |     const VkLatencySleepInfoNV*                 pSleepInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_definitions.h:6827:11: error: 'VkSetLatencyMarkerInfoNV' does not name a type
|  6827 |     const VkSetLatencyMarkerInfoNV*             pLatencyMarkerInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_definitions.h:6836:5: error: 'VkGetLatencyMarkerInfoNV' has not been declared
|  6836 |     VkGetLatencyMarkerInfoNV*                   pLatencyMarkerInfo)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/git/icd/generated/function_definitions.h:6843:11: error: 'VkOutOfBandQueueTypeInfoNV' does not name a type
|  6843 |     const VkOutOfBandQueueTypeInfoNV*           pQueueTypeInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/temp/run.do_compile.410145:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/temp/run.do_compile.410145, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/temp/run.do_compile.410145, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/temp/run.do_compile.410145, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/temp/run.do_compile.410145, line 166
NOTE: recipe vulkan-tools-1.3.268.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1570 tasks of which 1559 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115120842.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115120842.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.268.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/temp/run.do_compile.410145', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.268.0/temp/log.do_compile.410145
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.268.0.bb:do_compile) failed with exit code '1'

--===============8373093163938366498==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.261.1-1.3.268.0.patch"

RnJvbSBmYmU3MzYyYzc5YzJiZDQzYTk0MTRlZmE4NDBlODY2ODU0YjZjOTdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTI6MDk6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjI2MS4xIC0+IDEuMy4yNjguMAoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjMuMjYxLjEuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yNjguMC5iYn0gICAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdG9vbHNfMS4zLjI2MS4x
LmJiID0+IHZ1bGthbi10b29sc18xLjMuMjY4LjAuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS4zLjI2MS4xLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS4zLjI2OC4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXRvb2xzXzEuMy4yNjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3Z1bGthbi92dWxrYW4tdG9vbHNfMS4zLjI2OC4wLmJiCmluZGV4IDdhN2VkYzllYmQuLjVmMGQ1
MmJiNmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRv
b2xzXzEuMy4yNjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi10b29sc18xLjMuMjY4LjAuYmIKQEAgLTcsNyArNyw3IEBAIFNFQ1RJT04gPSAibGlicyIKIExJ
Q0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
dHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9bWFpbjtw
cm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICJhN2RhNzAyN2NhOWZkMDkwMTYzOWYwMjYxOWMyMjZk
YTljNjAzNmYxIgorU1JDUkVWID0gIjE1MzIwMDFmN2VkYWU1NTlhZjE5ODgyOTNlZWM5MGJjNWUy
NjA3ZDUiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzkuMgoK

--===============8373093163938366498==--

