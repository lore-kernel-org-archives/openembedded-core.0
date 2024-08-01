Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BEDC5B541
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:27 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.75477.1722536821621086683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=bc1kOIka;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=mz7veFzh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101910f3233cc-dbafa41b-9c38-493e-9c60-af4e518b1197-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/yUQxUr+7Huh7LR+CBv4WqIFl2fW45PBvWd71K7n+dE=;
	b=bc1kOIkaNlv/i8+a3sWKQ7wgysgk/SlK0tbqd61HMnjENn5PYkE5zQujjUW5A3Mv
	8tv7AiCC9sX4to+5XX2fSNs0xthZM85UP+8EFO079v6Qmo/q8m9o/HmR+W4bY0K0w+3
	2NuBsYrE9kGxqug5j/mFeYxqjKIFwhX7NTKn02bw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536834;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/yUQxUr+7Huh7LR+CBv4WqIFl2fW45PBvWd71K7n+dE=;
	b=mz7veFzhx5S6Jd7amNnHkolUL/jZOGqooUhxyoW6sb3d2O+/0m0J8jX3QJLzadUG
	wkVS6SAVB9YsgpW8Wqx3F8J+Y39MMKNtvex2iPLGqOY8HMCMGrlU9IjqPjytSkO9tM0
	VYPv8S06TLTGb0RKjql8H53Yg9HZ5fR69AFLLD6w=
Content-Type: multipart/mixed; boundary="===============3740815931800736282=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.290.0 FAILED
Message-ID: <010101910f3233cc-dbafa41b-9c38-493e-9c60-af4e518b1197-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202855

--===============3740815931800736282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-validation-layers* to *1.3.290.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-validation-layers-upgrade-1.3.283.0-1.3.290.0.patch
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
From ed8cfe2c1e098c49b5139b47f301036e9379f435 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 14:44:23 +0000
Subject: [PATCH] vulkan-validation-layers: upgrade 1.3.283.0 -> 1.3.290.0

---
 ...ers_1.3.283.0.bb => vulkan-validation-layers_1.3.290.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.283.0.bb => vulkan-validation-layers_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
index 2f1efba856..cfb8954f87 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.283;protocol=https"
-SRCREV = "d5bed3e26b3d487e8d21f0cc39039351eac921a7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.290;protocol=https"
+SRCREV = "a92629196a4fed15e59c74aa965dd47bd5ece3b7"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============3740815931800736282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1883 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1883 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-27a65f0dc33cd76a9bcabbd04b8e07db1fd95145"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:27a65f0dc33cd76a9bcabbd04b8e07db1fd95145"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 202 Local 193 Mirrors 0 Missed 9 Current 385 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 468 of 587 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 470 of 587 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 587 of 587 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1629 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_fetch: Succeeded
NOTE: Running task 1630 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_unpack)
NOTE: Running task 1631 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_unpack: Succeeded
NOTE: Running task 1632 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_patch)
NOTE: Running task 1633 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_patch: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_patch: Succeeded
NOTE: Running task 1635 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1637 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_configure: Succeeded
NOTE: Running task 1638 of 1649 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_compile)
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=for
 mat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-pok
 y-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_extension_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_extension_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_extension_utils.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/utils/vk_layer_extension_utils.cpp
| [2/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=for
 mat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-pok
 y-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/image_layout_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/image_layout_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/image_layout_utils.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/utils/image_layout_utils.cpp
| [3/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=for
 mat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-pok
 y-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/vk_object_types.cpp
| [4/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=for
 mat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-pok
 y-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/utils/ray_tracing_utils.cpp
| [5/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -m64 -march=core2 -mt
 une=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vul
 kan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o -MF layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o.d -o layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/bindless_descri
 ptor_pass.cpp
| FAILED: layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -m64 -march=core2 -mtune=core
 2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-vali
 dation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o -MF layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o.d -o layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/bindless_descriptor_pas
 s.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/type_manager.h:20,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/module.h:23,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/bindless_descriptor_pass.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr bool OpcodeHasType(uint32_t)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:273:19: error: 'OpExtInstWithForwardRefsKHR' is not a member of 'spv'
|   273 |         case spv::OpExtInstWithForwardRefsKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:284:19: error: 'OpConstantCompositeReplicateEXT' is not a member of 'spv'
|   284 |         case spv::OpConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:285:19: error: 'OpSpecConstantCompositeReplicateEXT' is not a member of 'spv'; did you mean 'OpSpecConstantCompositeContinuedINTEL'?
|   285 |         case spv::OpSpecConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpSpecConstantCompositeContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:286:19: error: 'OpCompositeConstructReplicateEXT' is not a member of 'spv'; did you mean 'OpCompositeConstructContinuedINTEL'?
|   286 |         case spv::OpCompositeConstructReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpCompositeConstructContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr bool OpcodeHasResult(uint32_t)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:647:19: error: 'OpExtInstWithForwardRefsKHR' is not a member of 'spv'
|   647 |         case spv::OpExtInstWithForwardRefsKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:659:19: error: 'OpConstantCompositeReplicateEXT' is not a member of 'spv'
|   659 |         case spv::OpConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:660:19: error: 'OpSpecConstantCompositeReplicateEXT' is not a member of 'spv'; did you mean 'OpSpecConstantCompositeContinuedINTEL'?
|   660 |         case spv::OpSpecConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpSpecConstantCompositeContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:661:19: error: 'OpCompositeConstructReplicateEXT' is not a member of 'spv'; did you mean 'OpCompositeConstructContinuedINTEL'?
|   661 |         case spv::OpCompositeConstructReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpCompositeConstructContinuedINTEL
| [6/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=for
 mat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-pok
 y-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-secu
 rity  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/
 vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp: In function 'vkt::FeatureAndName vkt::AddFeature(APIVersion, Feature, void**)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2731:41: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'VkPhysicalDeviceImageCompressionControlFeaturesEXT'?
|  2731 |             auto vk_struct = const_cast<VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceImageCompressionControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2731:91: error: expected '>' before '*' token
|  2731 |             auto vk_struct = const_cast<VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2731:91: error: expected '(' before '*' token
|  2731 |             auto vk_struct = const_cast<VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(
|       |                                                                                           ^
|       |                                                                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2731:92: error: expected primary-expression before '>' token
|  2731 |             auto vk_struct = const_cast<VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2732:45: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'VkPhysicalDeviceImageCompressionControlFeaturesEXT'?
|  2732 |                 vku::FindStructInPNextChain<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceImageCompressionControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2732:95: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|  2732 |                 vku::FindStructInPNextChain<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   970 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2732:95: error: template argument 1 is invalid
|  2732 |                 vku::FindStructInPNextChain<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   984 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2732:95: error: template argument 1 is invalid
|  2732 |                 vku::FindStructInPNextChain<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2732:116: error: expected ')' before ';' token
|  2732 |                 vku::FindStructInPNextChain<VkPhysicalDeviceImageAlignmentControlFeaturesMESA>(*inout_pnext_chain));
|       |                                                                                                                    ^
|       |                                                                                                                    )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2734:33: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' does not name a type; did you mean 'VkPhysicalDeviceImageCompressionControlFeaturesEXT'?
|  2734 |                 vk_struct = new VkPhysicalDeviceImageAlignmentControlFeaturesMESA;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceImageCompressionControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:2742:130: error: could not convert '{<expression error>, "VkPhysicalDeviceImageAlignmentControlFeaturesMESA::imageAlignmentControl"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|  2742 |             return {&vk_struct->imageAlignmentControl, "VkPhysicalDeviceImageAlignmentControlFeaturesMESA::imageAlignmentControl"};
|       |                                                                                                                                  ^
|       |                                                                                                                                  |
|       |                                                                                                                                  <brace-enclosed initializer list>
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3033:41: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  3033 |             auto vk_struct = const_cast<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3033:91: error: expected '>' before '*' token
|  3033 |             auto vk_struct = const_cast<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3033:91: error: expected '(' before '*' token
|  3033 |             auto vk_struct = const_cast<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(
|       |                                                                                           ^
|       |                                                                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3033:92: error: expected primary-expression before '>' token
|  3033 |             auto vk_struct = const_cast<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3034:45: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  3034 |                 vku::FindStructInPNextChain<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3034:95: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|  3034 |                 vku::FindStructInPNextChain<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   970 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3034:95: error: template argument 1 is invalid
|  3034 |                 vku::FindStructInPNextChain<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   984 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3034:95: error: template argument 1 is invalid
|  3034 |                 vku::FindStructInPNextChain<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3034:116: error: expected ')' before ';' token
|  3034 |                 vku::FindStructInPNextChain<VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT>(*inout_pnext_chain));
|       |                                                                                                                    ^
|       |                                                                                                                    )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3036:33: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  3036 |                 vk_struct = new VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3045:96: error: could not convert '{<expression error>, "VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT::legacyVertexAttributes"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|  3045 |                     "VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT::legacyVertexAttributes"};
|       |                                                                                                ^
|       |                                                                                                |
|       |                                                                                                <brace-enclosed initializer list>
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3203:41: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  3203 |             auto vk_struct = const_cast<VkPhysicalDeviceMaintenance7FeaturesKHR *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3203:81: error: expected '>' before '*' token
|  3203 |             auto vk_struct = const_cast<VkPhysicalDeviceMaintenance7FeaturesKHR *>(
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3203:81: error: expected '(' before '*' token
|  3203 |             auto vk_struct = const_cast<VkPhysicalDeviceMaintenance7FeaturesKHR *>(
|       |                                                                                 ^
|       |                                                                                 (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3203:82: error: expected primary-expression before '>' token
|  3203 |             auto vk_struct = const_cast<VkPhysicalDeviceMaintenance7FeaturesKHR *>(
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3204:45: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  3204 |                 vku::FindStructInPNextChain<VkPhysicalDeviceMaintenance7FeaturesKHR>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3204:85: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|  3204 |                 vku::FindStructInPNextChain<VkPhysicalDeviceMaintenance7FeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   970 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3204:85: error: template argument 1 is invalid
|  3204 |                 vku::FindStructInPNextChain<VkPhysicalDeviceMaintenance7FeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   984 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3204:85: error: template argument 1 is invalid
|  3204 |                 vku::FindStructInPNextChain<VkPhysicalDeviceMaintenance7FeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3204:106: error: expected ')' before ';' token
|  3204 |                 vku::FindStructInPNextChain<VkPhysicalDeviceMaintenance7FeaturesKHR>(*inout_pnext_chain));
|       |                                                                                                          ^
|       |                                                                                                          )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3206:33: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  3206 |                 vk_struct = new VkPhysicalDeviceMaintenance7FeaturesKHR;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3214:102: error: could not convert '{<expression error>, "VkPhysicalDeviceMaintenance7FeaturesKHR::maintenance7"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|  3214 |             return {&vk_struct->maintenance7, "VkPhysicalDeviceMaintenance7FeaturesKHR::maintenance7"};
|       |                                                                                                      ^
|       |                                                                                                      |
|       |                                                                                                      <brace-enclosed initializer list>
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5506:41: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  5506 |             auto vk_struct = const_cast<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5506:101: error: expected '>' before '*' token
|  5506 |             auto vk_struct = const_cast<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5506:101: error: expected '(' before '*' token
|  5506 |             auto vk_struct = const_cast<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(
|       |                                                                                                     ^
|       |                                                                                                     (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5506:102: error: expected primary-expression before '>' token
|  5506 |             auto vk_struct = const_cast<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5507:45: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  5507 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5507:105: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|  5507 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   970 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5507:105: error: template argument 1 is invalid
|  5507 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   984 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5507:105: error: template argument 1 is invalid
|  5507 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5507:126: error: expected ')' before ';' token
|  5507 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR>(*inout_pnext_chain));
|       |                                                                                                                              ^
|       |                                                                                                                              )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5509:33: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  5509 |                 vk_struct = new VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5518:116: error: could not convert '{<expression error>, "VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR::shaderRelaxedExtendedInstruction"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|  5518 |                     "VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR::shaderRelaxedExtendedInstruction"};
|       |                                                                                                                    ^
|       |                                                                                                                    |
|       |                                                                                                                    <brace-enclosed initializer list>
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5521:41: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  5521 |             auto vk_struct = const_cast<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5521:95: error: expected '>' before '*' token
|  5521 |             auto vk_struct = const_cast<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5521:95: error: expected '(' before '*' token
|  5521 |             auto vk_struct = const_cast<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(
|       |                                                                                               ^
|       |                                                                                               (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5521:96: error: expected primary-expression before '>' token
|  5521 |             auto vk_struct = const_cast<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5522:45: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  5522 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5522:99: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|  5522 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   970 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:970:32: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5522:99: error: template argument 1 is invalid
|  5522 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   984 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:984:26: note:   template argument deduction/substitution failed:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5522:99: error: template argument 1 is invalid
|  5522 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5522:120: error: expected ')' before ';' token
|  5522 |                 vku::FindStructInPNextChain<VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT>(*inout_pnext_chain));
|       |                                                                                                                        ^
|       |                                                                                                                        )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5524:33: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  5524 |                 vk_struct = new VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:5533:104: error: could not convert '{<expression error>, "VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT::shaderReplicatedComposites"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|  5533 |                     "VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT::shaderReplicatedComposites"};
|       |                                                                                                        ^
|       |                                                                                                        |
|       |                                                                                                        <brace-enclosed initializer list>
| [7/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=for
 mat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-pok
 y-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/convert_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/convert_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/convert_utils.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/utils/convert_utils.cpp
| [8/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -m64 -march=core2 -mt
 une=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vul
 kan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/buffer_device_address_pass.cpp.o -MF layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/buffer_device_address_pass.cpp.o.d -o layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/buffer_device_address_pass.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/buffer_de
 vice_address_pass.cpp
| FAILED: layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/buffer_device_address_pass.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -m64 -march=core2 -mtune=core
 2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-vali
 dation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/buffer_device_address_pass.cpp.o -MF layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/buffer_device_address_pass.cpp.o.d -o layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/buffer_device_address_pass.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/buffer_device_add
 ress_pass.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/type_manager.h:20,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/module.h:23,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/buffer_device_address_pass.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr bool OpcodeHasType(uint32_t)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:273:19: error: 'OpExtInstWithForwardRefsKHR' is not a member of 'spv'
|   273 |         case spv::OpExtInstWithForwardRefsKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:284:19: error: 'OpConstantCompositeReplicateEXT' is not a member of 'spv'
|   284 |         case spv::OpConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:285:19: error: 'OpSpecConstantCompositeReplicateEXT' is not a member of 'spv'; did you mean 'OpSpecConstantCompositeContinuedINTEL'?
|   285 |         case spv::OpSpecConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpSpecConstantCompositeContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:286:19: error: 'OpCompositeConstructReplicateEXT' is not a member of 'spv'; did you mean 'OpCompositeConstructContinuedINTEL'?
|   286 |         case spv::OpCompositeConstructReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpCompositeConstructContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr bool OpcodeHasResult(uint32_t)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:647:19: error: 'OpExtInstWithForwardRefsKHR' is not a member of 'spv'
|   647 |         case spv::OpExtInstWithForwardRefsKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:659:19: error: 'OpConstantCompositeReplicateEXT' is not a member of 'spv'
|   659 |         case spv::OpConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:660:19: error: 'OpSpecConstantCompositeReplicateEXT' is not a member of 'spv'; did you mean 'OpSpecConstantCompositeContinuedINTEL'?
|   660 |         case spv::OpSpecConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpSpecConstantCompositeContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:661:19: error: 'OpCompositeConstructReplicateEXT' is not a member of 'spv'; did you mean 'OpCompositeConstructContinuedINTEL'?
|   661 |         case spv::OpCompositeConstructReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpCompositeConstructContinuedINTEL
| [9/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=for
 mat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-pok
 y-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-secu
 rity  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/
 vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp: In function 'void vvl::PnextChainFree(void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1236:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR'?
|  1236 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1239:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1239 |             delete reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1239:43: error: expected '>' before 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1239:43: error: expected '(' before 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR'
|  1239 |             delete reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1239:43: error: 'VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR'?
|  1239 |             delete reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceShaderTerminateInvocationFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1239:104: error: expected primary-expression before '>' token
|  1239 |             delete reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(header);
|       |                                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1239:113: error: expected ')' before ';' token
|  1239 |             delete reinterpret_cast<const VkPhysicalDeviceShaderRelaxedExtendedInstructionFeaturesKHR *>(header);
|       |                                                                                                                 ^
|       |                                                                                                                 )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1241:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR'?
|  1241 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1244:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1244 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1244:43: error: expected '>' before 'VkPhysicalDeviceMaintenance7FeaturesKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1244:43: error: expected '(' before 'VkPhysicalDeviceMaintenance7FeaturesKHR'
|  1244 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1244:43: error: 'VkPhysicalDeviceMaintenance7FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6FeaturesKHR'?
|  1244 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceMaintenance6FeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1244:84: error: expected primary-expression before '>' token
|  1244 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(header);
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1244:93: error: expected ')' before ';' token
|  1244 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7FeaturesKHR *>(header);
|       |                                                                                             ^
|       |                                                                                             )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1246:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR'?
|  1246 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1249:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1249 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1249:43: error: expected '>' before 'VkPhysicalDeviceMaintenance7PropertiesKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1249:43: error: expected '(' before 'VkPhysicalDeviceMaintenance7PropertiesKHR'
|  1249 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1249:43: error: 'VkPhysicalDeviceMaintenance7PropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance6PropertiesKHR'?
|  1249 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceMaintenance6PropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1249:86: error: expected primary-expression before '>' token
|  1249 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(header);
|       |                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1249:95: error: expected ')' before ';' token
|  1249 |             delete reinterpret_cast<const VkPhysicalDeviceMaintenance7PropertiesKHR *>(header);
|       |                                                                                               ^
|       |                                                                                               )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1251:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  1251 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1254:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1254 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1254:43: error: expected '>' before 'VkPhysicalDeviceLayeredApiPropertiesListKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1254:43: error: expected '(' before 'VkPhysicalDeviceLayeredApiPropertiesListKHR'
|  1254 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1254:43: error: 'VkPhysicalDeviceLayeredApiPropertiesListKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLayeredDriverPropertiesMSFT'?
|  1254 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceLayeredDriverPropertiesMSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1254:88: error: expected primary-expression before '>' token
|  1254 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(header);
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1254:97: error: expected ')' before ';' token
|  1254 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiPropertiesListKHR *>(header);
|       |                                                                                                 ^
|       |                                                                                                 )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1256:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT'?
|  1256 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1259:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1259 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1259:43: error: expected '>' before 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1259:43: error: expected '(' before 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR'
|  1259 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1259:43: error: 'VkPhysicalDeviceLayeredApiVulkanPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceLayeredDriverPropertiesMSFT'?
|  1259 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceLayeredDriverPropertiesMSFT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1259:90: error: expected primary-expression before '>' token
|  1259 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(header);
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1259:99: error: expected ')' before ';' token
|  1259 |             delete reinterpret_cast<const VkPhysicalDeviceLayeredApiVulkanPropertiesKHR *>(header);
|       |                                                                                                   ^
|       |                                                                                                   )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2794:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  2794 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2797:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2797 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2797:43: error: expected '>' before 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2797:43: error: expected '(' before 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT'
|  2797 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2797:43: error: 'VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  2797 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2797:94: error: expected primary-expression before '>' token
|  2797 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(header);
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2797:103: error: expected ')' before ';' token
|  2797 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesFeaturesEXT *>(header);
|       |                                                                                                       ^
|       |                                                                                                       )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2799:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT'?
|  2799 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2802:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2802 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2802:43: error: expected '>' before 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2802:43: error: expected '(' before 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT'
|  2802 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2802:43: error: 'VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT'?
|  2802 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceVertexAttributeDivisorPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2802:96: error: expected primary-expression before '>' token
|  2802 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(header);
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2802:105: error: expected ')' before ';' token
|  2802 |             delete reinterpret_cast<const VkPhysicalDeviceLegacyVertexAttributesPropertiesEXT *>(header);
|       |                                                                                                         ^
|       |                                                                                                         )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2951:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT'?
|  2951 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2954:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2954 |             delete reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2954:43: error: expected '>' before 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2954:43: error: expected '(' before 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT'
|  2954 |             delete reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2954:43: error: 'VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT'?
|  2954 |             delete reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceShaderImageAtomicInt64FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2954:98: error: expected primary-expression before '>' token
|  2954 |             delete reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(header);
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2954:107: error: expected ')' before ';' token
|  2954 |             delete reinterpret_cast<const VkPhysicalDeviceShaderReplicatedCompositesFeaturesEXT *>(header);
|       |                                                                                                           ^
|       |                                                                                                           )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2961:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT'?
|  2961 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2964:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2964 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2964:43: error: expected '>' before 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2964:43: error: expected '(' before 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA'
|  2964 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2964:43: error: 'VkPhysicalDeviceImageAlignmentControlFeaturesMESA' was not declared in this scope; did you mean 'VkPhysicalDeviceImageCompressionControlFeaturesEXT'?
|  2964 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceImageCompressionControlFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2964:94: error: expected primary-expression before '>' token
|  2964 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(header);
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2964:103: error: expected ')' before ';' token
|  2964 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlFeaturesMESA *>(header);
|       |                                                                                                       ^
|       |                                                                                                       )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2966:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT'?
|  2966 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2969:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2969 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2969:43: error: expected '>' before 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2969:43: error: expected '(' before 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA'
|  2969 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2969:43: error: 'VkPhysicalDeviceImageAlignmentControlPropertiesMESA' was not declared in this scope; did you mean 'VkPhysicalDeviceSubgroupSizeControlPropertiesEXT'?
|  2969 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceSubgroupSizeControlPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2969:96: error: expected primary-expression before '>' token
|  2969 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(header);
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2969:105: error: expected ')' before ';' token
|  2969 |             delete reinterpret_cast<const VkPhysicalDeviceImageAlignmentControlPropertiesMESA *>(header);
|       |                                                                                                         ^
|       |                                                                                                         )
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2971:14: error: 'VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT'?
|  2971 |         case VK_STRUCTURE_TYPE_IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2974:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2974 |             delete reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2974:43: error: expected '>' before 'VkImageAlignmentControlCreateInfoMESA'
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2974:43: error: expected '(' before 'VkImageAlignmentControlCreateInfoMESA'
|  2974 |             delete reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2974:43: error: 'VkImageAlignmentControlCreateInfoMESA' was not declared in this scope
|  2974 |             delete reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2974:82: error: expected primary-expression before '>' token
|  2974 |             delete reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(header);
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2974:91: error: expected ')' before ';' token
|  2974 |             delete reinterpret_cast<const VkImageAlignmentControlCreateInfoMESA *>(header);
|       |                                                                                           ^
|       |                                                                                           )
| [10/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/error_location_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/error_location_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/error_location_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/error_location_helper.cpp
| [11/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/utils/vk_struct_compare.cpp
| [12/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/error_message/error_location.cpp
| [13/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -m64 -march=core2 -m
 tune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vu
 lkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/ray_query_pass.cpp.o -MF layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/ray_query_pass.cpp.o.d -o layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/ray_query_pass.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/ray_query_pass.cpp
| FAILED: layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/ray_query_pass.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -m64 -march=core2 -mtune=core
 2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-vali
 dation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/ray_query_pass.cpp.o -MF layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/ray_query_pass.cpp.o.d -o layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/ray_query_pass.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/ray_query_pass.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/type_manager.h:20,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/module.h:23,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/gpu/spirv/ray_query_pass.cpp:17:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr bool OpcodeHasType(uint32_t)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:273:19: error: 'OpExtInstWithForwardRefsKHR' is not a member of 'spv'
|   273 |         case spv::OpExtInstWithForwardRefsKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:284:19: error: 'OpConstantCompositeReplicateEXT' is not a member of 'spv'
|   284 |         case spv::OpConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:285:19: error: 'OpSpecConstantCompositeReplicateEXT' is not a member of 'spv'; did you mean 'OpSpecConstantCompositeContinuedINTEL'?
|   285 |         case spv::OpSpecConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpSpecConstantCompositeContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:286:19: error: 'OpCompositeConstructReplicateEXT' is not a member of 'spv'; did you mean 'OpCompositeConstructContinuedINTEL'?
|   286 |         case spv::OpCompositeConstructReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpCompositeConstructContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr bool OpcodeHasResult(uint32_t)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:647:19: error: 'OpExtInstWithForwardRefsKHR' is not a member of 'spv'
|   647 |         case spv::OpExtInstWithForwardRefsKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:659:19: error: 'OpConstantCompositeReplicateEXT' is not a member of 'spv'
|   659 |         case spv::OpConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:660:19: error: 'OpSpecConstantCompositeReplicateEXT' is not a member of 'spv'; did you mean 'OpSpecConstantCompositeContinuedINTEL'?
|   660 |         case spv::OpSpecConstantCompositeReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpSpecConstantCompositeContinuedINTEL
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/spirv_grammar_helper.h:661:19: error: 'OpCompositeConstructReplicateEXT' is not a member of 'spv'; did you mean 'OpCompositeConstructContinuedINTEL'?
|   661 |         case spv::OpCompositeConstructReplicateEXT:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpCompositeConstructContinuedINTEL
| [14/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/hash_util.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/hash_util.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/hash_util.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/utils/hash_util.cpp
| [15/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/utils/vk_layer_utils.cpp
| [16/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vk_layer_config.cpp
| [17/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/error_message/logging.cpp
| [18/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/vk_function_pointers.cpp
| [19/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_extension_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_extension_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_extension_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/vk_extension_helper.cpp
| [20/170] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/. -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan -isystem /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=fo
 rmat-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build=/usr/src/debug/vulkan-validation-layers/1.3.290.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-po
 ky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/temp/run.do_compile.3758310:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/temp/run.do_compile.3758310, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/temp/run.do_compile.3758310, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/temp/run.do_compile.3758310, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/temp/run.do_compile.3758310, line 166
NOTE: recipe vulkan-validation-layers-1.3.290.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1638 tasks of which 1630 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801144340.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240801144340.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-validation-layers-1.3.290.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/temp/run.do_compile.3758310', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.290.0/temp/log.do_compile.3758310
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb:do_compile) failed with exit code '1'

--===============3740815931800736282==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.3.283.0-1.3.290.0.patch"

RnJvbSBlZDhjZmUyYzFlMDk4YzQ5YjUxMzliNDdmMzAxMDM2ZTkzNzlmNDM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxNDo0NDoyMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi12YWxpZGF0aW9uLWxheWVyczogdXBncmFkZSAxLjMuMjgzLjAgLT4gMS4zLjI5MC4wCgot
LS0KIC4uLmVyc18xLjMuMjgzLjAuYmIgPT4gdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuMy4y
OTAuMC5iYn0gfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXZh
bGlkYXRpb24tbGF5ZXJzXzEuMy4yODMuMC5iYiA9PiB2dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNf
MS4zLjI5MC4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92
dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuMy4yODMuMC5iYiBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuMy4yOTAuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjgzLjAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJzXzEuMy4yOTAu
MC5iYgppbmRleCAyZjFlZmJhODU2Li5jZmI4OTU0Zjg3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjgzLjAuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXll
cnNfMS4zLjI5MC4wLmJiCkBAIC04LDggKzgsOCBAQCBTRUNUSU9OID0gImxpYnMiCiBMSUNFTlNF
ID0gIkFwYWNoZS0yLjAgJiBNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNF
LnR4dDttZDU9Y2QzYzBiYzM2NmNkOWI2YTkwNmUyMmYwYmNiNTkxMGYiCiAKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVZhbGlkYXRpb25MYXllcnMuZ2l0
O2JyYW5jaD12dWxrYW4tc2RrLTEuMy4yODM7cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiZDVi
ZWQzZTI2YjNkNDg3ZThkMjFmMGNjMzkwMzkzNTFlYWM5MjFhNyIKK1NSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVZhbGlkYXRpb25MYXllcnMuZ2l0O2JyYW5j
aD12dWxrYW4tc2RrLTEuMy4yOTA7cHJvdG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiYTkyNjI5MTk2
YTRmZWQxNWU1OWM3NGFhOTY1ZGQ0N2JkNWVjZTNiNyIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIK
IAotLSAKMi40NC4wCgo=

--===============3740815931800736282==--

