Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558B2C54EBA
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 22:05:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.36630.1709330716679427090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 14:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QdD6UHcQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=O1cJRxye;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018dfc0cd9b9-4c834c54-4207-406c-b9ce-c4bdc8970989-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/ChHWRYaRbu/DxOeq3UCAn9OS51Crt5WK7iKJvlWDvQ=;
	b=QdD6UHcQOxDxu1Aa0qtY2VmIPzC4S8ib70UyJQXGGu+ZlIN43h8kpefFG7vSRND7
	h6S/Ezv6t7Zc0XCrPyhjzBQ3es1l5nlItllbLZNd3rbLiQOBsykS2kqEYBP0BCgG/ow
	BpWIcPAL7mHhHEJb+LW4kiUxkHDPnFLGaiwU8UYY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1709330717;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/ChHWRYaRbu/DxOeq3UCAn9OS51Crt5WK7iKJvlWDvQ=;
	b=O1cJRxyeId6pRZJk3GJjFt1TEhgA2NyVy2Ff80kBWL6jmDjgio1li+SLWO90MbyL
	E+TimYYuQ8kZBaaIiESr8hKRIWugcIGbMX/6h5R2QcAzczFe3dJGzdcv+leMpmrreYc
	m8igvrNG6fs8cCPesgrQi7KV1VQuSIJGsVjp0lgc=
Content-Type: multipart/mixed; boundary="===============8223328862663874898=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-utility-libraries: upgrading to 1.3.275.0 FAILED
Message-ID: <0101018dfc0cd9b9-4c834c54-4207-406c-b9ce-c4bdc8970989-000000@us-west-2.amazonses.com>
Date: Fri, 1 Mar 2024 22:05:17 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 22:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196516

--===============8223328862663874898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-utility-libraries* to *1.3.275.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-utility-libraries-upgrade-1.3.268.0-1.3.275.0.patch
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
From 8caa90d6f926051fac1c745b716237c2e293dcfd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Mar 2024 17:17:49 +0000
Subject: [PATCH] vulkan-utility-libraries: upgrade 1.3.268.0 -> 1.3.275.0

---
 ...aries_1.3.268.0.bb => vulkan-utility-libraries_1.3.275.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.268.0.bb => vulkan-utility-libraries_1.3.275.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
index fee4ba6cc9..759a03926b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.268.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "c9ca4ac620a238a93c65d864f2eaa33954d74509"
+SRCREV = "4cfc176e3242b4dbdfd3f6c5680c5d8f2cb7db45"
 
 S = "${WORKDIR}/git"
 
-- 
2.42.0


--===============8223328862663874898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1863 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1863 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-0c8e63bfa5822d6b5c170f9a515324b8f1afbfb5"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0c8e63bfa5822d6b5c170f9a515324b8f1afbfb5"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 72 Local 60 Mirrors 0 Missed 12 Current 236 (83% match, 96% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 794 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_recipe_qa)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_recipe_qa unihash changed to 5e98ffdd549fa384286dc6e33bd8d138a7c04b1200d79557ab660a021a72556b
NOTE: Setscene tasks completed
NOTE: Running task 903 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_fetch)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_fetch: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_fetch: Succeeded
NOTE: Running task 904 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_unpack)
NOTE: Running task 905 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_unpack: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_unpack: Succeeded
NOTE: Running task 906 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_patch)
NOTE: Running task 907 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_patch: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_patch: Succeeded
NOTE: Running task 908 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 909 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_generate_toolchain_file)
NOTE: Running task 910 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_populate_lic)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_populate_lic unihash changed to 68366f7b62099cba754d0569d51e92a540e5a2b3986bec95295f5097ed880992
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_deploy_source_date_epoch unihash changed to 3892b60472bb8bae0b30d14e8f66dec995473bcfe9d678a3d31b4d4ebb2e76c0
NOTE: Setscene tasks completed
NOTE: Running task 911 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_configure)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_configure: Started
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_configure: Succeeded
NOTE: Running task 912 of 923 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_compile)
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build --target all --
| Change Dir: '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.
 3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-na
 tive=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings_helper.cpp
| FAILED: src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native= 
  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings_helper.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings_helper.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.hpp:12,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings_helper.cpp:9:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:19:37: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope
|    19 |     VKU_LAYER_SETTING_TYPE_BOOL32 = VK_LAYER_SETTING_TYPE_BOOL32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:20:36: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|    20 |     VKU_LAYER_SETTING_TYPE_INT32 = VK_LAYER_SETTING_TYPE_INT32_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:21:36: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    21 |     VKU_LAYER_SETTING_TYPE_INT64 = VK_LAYER_SETTING_TYPE_INT64_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:22:37: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    22 |     VKU_LAYER_SETTING_TYPE_UINT32 = VK_LAYER_SETTING_TYPE_UINT32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:23:37: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|    23 |     VKU_LAYER_SETTING_TYPE_UINT64 = VK_LAYER_SETTING_TYPE_UINT64_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:24:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|    24 |     VKU_LAYER_SETTING_TYPE_FLOAT32 = VK_LAYER_SETTING_TYPE_FLOAT32_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:25:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|    25 |     VKU_LAYER_SETTING_TYPE_FLOAT64 = VK_LAYER_SETTING_TYPE_FLOAT64_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:26:37: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|    26 |     VKU_LAYER_SETTING_TYPE_STRING = VK_LAYER_SETTING_TYPE_STRING_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:50:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    50 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:67:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    67 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:70:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    70 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:73:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    73 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.hpp:61:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    61 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings_helper.cpp:200:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   200 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.
 3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-na
 tive=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp
| FAILED: src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native= 
  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_manager.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:11,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:9:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:19:37: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope
|    19 |     VKU_LAYER_SETTING_TYPE_BOOL32 = VK_LAYER_SETTING_TYPE_BOOL32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:20:36: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|    20 |     VKU_LAYER_SETTING_TYPE_INT32 = VK_LAYER_SETTING_TYPE_INT32_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:21:36: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    21 |     VKU_LAYER_SETTING_TYPE_INT64 = VK_LAYER_SETTING_TYPE_INT64_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:22:37: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    22 |     VKU_LAYER_SETTING_TYPE_UINT32 = VK_LAYER_SETTING_TYPE_UINT32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:23:37: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|    23 |     VKU_LAYER_SETTING_TYPE_UINT64 = VK_LAYER_SETTING_TYPE_UINT64_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:24:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|    24 |     VKU_LAYER_SETTING_TYPE_FLOAT32 = VK_LAYER_SETTING_TYPE_FLOAT32_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:25:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|    25 |     VKU_LAYER_SETTING_TYPE_FLOAT64 = VK_LAYER_SETTING_TYPE_FLOAT64_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:26:37: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|    26 |     VKU_LAYER_SETTING_TYPE_STRING = VK_LAYER_SETTING_TYPE_STRING_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:50:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    50 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:67:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    67 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:70:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    70 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:73:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    73 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:21:49: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    21 |     LayerSettings(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:39:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    39 |     const VkLayerSettingEXT *GetAPISetting(const char *pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:46:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    46 |     const VkLayerSettingEXT *FindLayerSettingValue(const char *pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:60:11: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    60 |     const VkLayerSettingsCreateInfoEXT *first_create_info{nullptr};
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:60:67: warning: extra ';' [-Wpedantic]
|    60 |     const VkLayerSettingsCreateInfoEXT *first_create_info{nullptr};
|       |                                                                   ^
|       |                                                                   -
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:10:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.hpp:19:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    19 | const VkLayerSettingsCreateInfoEXT *FindSettingsInChain(const void *next);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:113:60: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   113 | LayerSettings::LayerSettings(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp: In constructor 'vl::LayerSettings::LayerSettings(const char*, const int*, const VkAllocationCallbacks*, VkuLayerSettingLogCallback)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:115:31: error: class 'vl::LayerSettings' does not have any field named 'first_create_info'
|   115 |     : layer_name(pLayerName), first_create_info(pFirstCreateInfo), pCallback(pCallback) {
|       |                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:227:7: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|   227 | const VkLayerSettingEXT *LayerSettings::FindLayerSettingValue(const char *pSettingName) {
|       |       ^~~~~~~~~~~~~~~~~
|       |       VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp: In member function 'bool vl::LayerSettings::HasAPISetting(const char*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:293:18: error: 'class vl::LayerSettings' has no member named 'FindLayerSettingValue'
|   293 |     return this->FindLayerSettingValue(pSettingName) != nullptr;
|       |                  ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.cpp:342:7: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|   342 | const VkLayerSettingEXT *LayerSettings::GetAPISetting(const char *pSettingName) {
|       |       ^~~~~~~~~~~~~~~~~
|       |       VkuLayerSettingSet
| [3/5] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.
 3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-na
 tive=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.cpp
| FAILED: src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native= 
  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/layer_settings_util.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.hpp:11,
|                  from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.cpp:9:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:19:37: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope
|    19 |     VKU_LAYER_SETTING_TYPE_BOOL32 = VK_LAYER_SETTING_TYPE_BOOL32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:20:36: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|    20 |     VKU_LAYER_SETTING_TYPE_INT32 = VK_LAYER_SETTING_TYPE_INT32_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:21:36: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    21 |     VKU_LAYER_SETTING_TYPE_INT64 = VK_LAYER_SETTING_TYPE_INT64_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:22:37: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    22 |     VKU_LAYER_SETTING_TYPE_UINT32 = VK_LAYER_SETTING_TYPE_UINT32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:23:37: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|    23 |     VKU_LAYER_SETTING_TYPE_UINT64 = VK_LAYER_SETTING_TYPE_UINT64_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:24:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|    24 |     VKU_LAYER_SETTING_TYPE_FLOAT32 = VK_LAYER_SETTING_TYPE_FLOAT32_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:25:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|    25 |     VKU_LAYER_SETTING_TYPE_FLOAT64 = VK_LAYER_SETTING_TYPE_FLOAT64_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:26:37: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|    26 |     VKU_LAYER_SETTING_TYPE_STRING = VK_LAYER_SETTING_TYPE_STRING_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:50:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    50 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:67:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    67 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:70:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    70 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:73:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    73 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.hpp:19:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    19 | const VkLayerSettingsCreateInfoEXT *FindSettingsInChain(const void *next);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| [4/5] /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.
 3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-na
 tive=  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp
| FAILED: src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -I/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.
 0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build=/usr/src/debug/vulkan-utility-libraries/1.3.275.0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/recipe-sysroot-native= 
  -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wpedantic -Wunreachable-code -Wunused-function -Wall -Wextra -Wpointer-arith -Wextra-semi -MD -MT src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -MF src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o.d -o src/layer/CMakeFiles/VulkanLayerSettings.dir/vk_layer_settings.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:9:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:19:37: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope
|    19 |     VKU_LAYER_SETTING_TYPE_BOOL32 = VK_LAYER_SETTING_TYPE_BOOL32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:20:36: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|    20 |     VKU_LAYER_SETTING_TYPE_INT32 = VK_LAYER_SETTING_TYPE_INT32_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:21:36: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    21 |     VKU_LAYER_SETTING_TYPE_INT64 = VK_LAYER_SETTING_TYPE_INT64_EXT,
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:22:37: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|    22 |     VKU_LAYER_SETTING_TYPE_UINT32 = VK_LAYER_SETTING_TYPE_UINT32_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:23:37: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|    23 |     VKU_LAYER_SETTING_TYPE_UINT64 = VK_LAYER_SETTING_TYPE_UINT64_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:24:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|    24 |     VKU_LAYER_SETTING_TYPE_FLOAT32 = VK_LAYER_SETTING_TYPE_FLOAT32_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:25:38: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|    25 |     VKU_LAYER_SETTING_TYPE_FLOAT64 = VK_LAYER_SETTING_TYPE_FLOAT64_EXT,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:26:37: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|    26 |     VKU_LAYER_SETTING_TYPE_STRING = VK_LAYER_SETTING_TYPE_STRING_EXT,
|       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                     VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:50:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    50 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:67:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    67 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:70:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    70 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/include/vulkan/layer/vk_layer_settings.h:73:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    73 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:10:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_util.hpp:19:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    19 | const VkLayerSettingsCreateInfoEXT *FindSettingsInChain(const void *next);
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| In file included from /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:11:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:21:49: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    21 |     LayerSettings(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:39:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    39 |     const VkLayerSettingEXT *GetAPISetting(const char *pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:46:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    46 |     const VkLayerSettingEXT *FindLayerSettingValue(const char *pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:60:11: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    60 |     const VkLayerSettingsCreateInfoEXT *first_create_info{nullptr};
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/layer_settings_manager.hpp:60:67: warning: extra ';' [-Wpedantic]
|    60 |     const VkLayerSettingsCreateInfoEXT *first_create_info{nullptr};
|       |                                                                   ^
|       |                                                                   -
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:34:65: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|    34 | VkResult vkuCreateLayerSettingSet(const char *pLayerName, const VkLayerSettingsCreateInfoEXT *pFirstCreateInfo,
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp: In function 'VkResult vkuGetLayerSettingValues(VkuLayerSettingSet, const char*, VkuLayerSettingType, uint32_t*, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:98:11: error: 'VkLayerSettingEXT' does not name a type; did you mean 'VkuLayerSettingSet'?
|    98 |     const VkLayerSettingEXT *api_setting = layer_setting_set->GetAPISetting(pSettingName);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkuLayerSettingSet
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:103:33: error: 'api_setting' was not declared in this scope
|   103 |     if (setting_list.empty() && api_setting == nullptr) {
|       |                                 ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:146:24: error: 'api_setting' was not declared in this scope
|   146 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:191:24: error: 'api_setting' was not declared in this scope
|   191 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:245:24: error: 'api_setting' was not declared in this scope
|   245 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:299:24: error: 'api_setting' was not declared in this scope
|   299 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:353:24: error: 'api_setting' was not declared in this scope
|   353 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:398:24: error: 'api_setting' was not declared in this scope
|   398 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:443:24: error: 'api_setting' was not declared in this scope
|   443 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:488:24: error: 'api_setting' was not declared in this scope
|   488 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:491:42: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|   491 |                 if (api_setting->type != VK_LAYER_SETTING_TYPE_UINT32_EXT) {
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:526:24: error: 'api_setting' was not declared in this scope
|   526 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:535:30: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_STRING'?
|   535 |                         case VK_LAYER_SETTING_TYPE_STRING_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_STRING
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:540:30: error: 'VK_LAYER_SETTING_TYPE_BOOL32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_BOOL32'?
|   540 |                         case VK_LAYER_SETTING_TYPE_BOOL32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_BOOL32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:546:30: error: 'VK_LAYER_SETTING_TYPE_INT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT32'?
|   546 |                         case VK_LAYER_SETTING_TYPE_INT32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_INT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:551:30: error: 'VK_LAYER_SETTING_TYPE_INT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_INT64'?
|   551 |                         case VK_LAYER_SETTING_TYPE_INT64_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_INT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:556:30: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|   556 |                         case VK_LAYER_SETTING_TYPE_UINT32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:561:30: error: 'VK_LAYER_SETTING_TYPE_UINT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT64'?
|   561 |                         case VK_LAYER_SETTING_TYPE_UINT64_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_UINT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:567:30: error: 'VK_LAYER_SETTING_TYPE_FLOAT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT32'?
|   567 |                         case VK_LAYER_SETTING_TYPE_FLOAT32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_FLOAT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:572:30: error: 'VK_LAYER_SETTING_TYPE_FLOAT64_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_FLOAT64'?
|   572 |                         case VK_LAYER_SETTING_TYPE_FLOAT64_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_FLOAT64
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:609:24: error: 'api_setting' was not declared in this scope
|   609 |             } else if (api_setting != nullptr) {  // From Vulkan Layer Setting API
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:621:30: error: 'VK_LAYER_SETTING_TYPE_STRING_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_STRING'?
|   621 |                         case VK_LAYER_SETTING_TYPE_STRING_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_STRING
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:626:30: error: 'VK_LAYER_SETTING_TYPE_UINT32_EXT' was not declared in this scope; did you mean 'VKU_LAYER_SETTING_TYPE_UINT32'?
|   626 |                         case VK_LAYER_SETTING_TYPE_UINT32_EXT:
|       |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                              VKU_LAYER_SETTING_TYPE_UINT32
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:653:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   653 | const VkLayerSettingsCreateInfoEXT *vkuFindLayerSettingsCreateInfo(const VkInstanceCreateInfo *pCreateInfo) {
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:667:7: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   667 | const VkLayerSettingsCreateInfoEXT *vkuNextLayerSettingsCreateInfo(const VkLayerSettingsCreateInfoEXT *pCreateInfo) {
|       |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |       VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:691:38: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   691 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                      VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp: In function 'VkResult vkuGetUnknownSettings(const int*, uint32_t, const char**, uint32_t*, const char**)':
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:695:11: error: 'VkLayerSettingsCreateInfoEXT' does not name a type; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|   695 |     const VkLayerSettingsCreateInfoEXT *current_create_info = pCreateInfo;
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:698:12: error: 'current_create_info' was not declared in this scope; did you mean 'VkEventCreateInfo'?
|   698 |     while (current_create_info != nullptr) {
|       |            ^~~~~~~~~~~~~~~~~~~
|       |            VkEventCreateInfo
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:710:31: error: 'vkuNextLayerSettingsCreateInfo' was not declared in this scope
|   710 |         current_create_info = vkuNextLayerSettingsCreateInfo(current_create_info);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/git/src/layer/vk_layer_settings.cpp:691:68: warning: unused parameter 'pCreateInfo' [-Wunused-parameter]
|   691 | VkResult vkuGetUnknownSettings(const VkLayerSettingsCreateInfoEXT *pCreateInfo, uint32_t settingsCount, const char **pSettings,
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
| ninja: build stopped: subcommand failed.
| 
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3130771:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3130771, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3130771, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3130771, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3130771, line 166
NOTE: recipe vulkan-utility-libraries-1.3.275.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 912 tasks of which 901 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301171726.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240301171726.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-utility-libraries-1.3.275.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/run.do_compile.3130771', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-utility-libraries/1.3.275.0/temp/log.do_compile.3130771
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.275.0.bb:do_compile) failed with exit code '1'

--===============8223328862663874898==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-utility-libraries-upgrade-1.3.268.0-1.3.275.0.patch"

RnJvbSA4Y2FhOTBkNmY5MjYwNTFmYWMxYzc0NWI3MTYyMzdjMmUyOTNkY2ZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBNYXIgMjAyNCAxNzoxNzo0OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi11dGlsaXR5LWxpYnJhcmllczogdXBncmFkZSAxLjMuMjY4LjAgLT4gMS4zLjI3NS4wCgot
LS0KIC4uLmFyaWVzXzEuMy4yNjguMC5iYiA9PiB2dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4z
LjI3NS4wLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi11dGls
aXR5LWxpYnJhcmllc18xLjMuMjY4LjAuYmIgPT4gdnVsa2FuLXV0aWxpdHktbGlicmFyaWVzXzEu
My4yNzUuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVs
a2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjY4LjAuYmIgYi9tZXRhL3JlY2lwZXMt
Z3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjc1LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI2OC4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi11dGlsaXR5LWxpYnJhcmllc18xLjMuMjc1LjAu
YmIKaW5kZXggZmVlNGJhNmNjOS4uNzU5YTAzOTI2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdXRpbGl0eS1saWJyYXJpZXNfMS4zLjI2OC4wLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXV0aWxpdHktbGlicmFyaWVz
XzEuMy4yNzUuMC5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT00Y2EyZDY3OTkwOTFhYWE5
OGE4NTIwZjFiNzkzOTM5YiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL0tocm9ub3NH
cm91cC9WdWxrYW4tVXRpbGl0eS1MaWJyYXJpZXMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0
dHBzIgotU1JDUkVWID0gImM5Y2E0YWM2MjBhMjM4YTkzYzY1ZDg2NGYyZWFhMzM5NTRkNzQ1MDki
CitTUkNSRVYgPSAiNGNmYzE3NmUzMjQyYjRkYmRmZDNmNmM1NjgwYzVkOGYyY2I3ZGI0NSIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40Mi4wCgo=

--===============8223328862663874898==--

