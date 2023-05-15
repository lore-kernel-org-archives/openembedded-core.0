Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D30C88C97
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.3710.1684186747558305946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Cj9OWRJz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188215a5d37-12664d6f-9789-43f8-a87d-b6dfc7c57ff0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aPmDW+8rAXk/slyQVpKp6kX8nDZzZNyz2GHf3Nw+iZ0=;
	b=Cj9OWRJzQ0W5Mgsx5lEdabyogqQ+OjCMf3Qu8UgnvPfXBY1QlPNJAIU/KCeJWNtQ
	8uW5o65hc+OL6rCvujQB1fRVzzkdUFvedyLrsKXn9AeM13jNXbIGTgL9330atoXz4+s
	lMmKQu/eJgAo5gxDZUzat/f8cISaxx9rZtAamAgs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aPmDW+8rAXk/slyQVpKp6kX8nDZzZNyz2GHf3Nw+iZ0=;
	b=TkOlF0fLfEZ+CEAbdi6XrKVB4e/5uHykOwOVk7A3Y2ng8tO+hwmdKkbLRh7MfQfw
	qmUGE1shzsnGLkjbzI+EjCrRopA5vLxqd1w4aaSvZXYEzQ0wr7TWeuRDTFlbMfU2hCp
	TlyqcyahOa/t/YtUwZ8+NUREtQcZ2Ix4bOq6Z+M4=
Content-Type: multipart/mixed; boundary="===============3295379038124296797=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.246.1 FAILED
Message-ID: <01010188215a5d37-12664d6f-9789-43f8-a87d-b6dfc7c57ff0-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181357

--===============3295379038124296797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.246.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.243.0-1.3.246.1.patch
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
--===============3295379038124296797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:96efd0209546a1ac7ead7d4f899e731848b5a02b"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 106 Local 99 Mirrors 0 Missed 7 Current 222 (93% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1155 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_fetch: Succeeded
NOTE: Running task 1210 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_unpack)
NOTE: Running task 1211 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_unpack: Succeeded
NOTE: Running task 1212 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_patch: Succeeded
NOTE: Running task 1213 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1214 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_generate_toolchain_file)
NOTE: Running task 1215 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1216 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_configure: Succeeded
NOTE: Running task 1217 of 1224 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FO
 RTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/bu
 ild/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_
 SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.h:2317:11: error: 'VkMemoryMapInfoKHR' does not name a type; did you mean 'VkMemoryGetFdInfoKHR'?
|  2317 |     const VkMemoryMapInfoKHR*                   pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~~~~
|       |           VkMemoryGetFdInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.h:2322:11: error: 'VkMemoryUnmapInfoKHR' does not name a type; did you mean 'VkMemoryGetFdInfoKHR'?
|  2322 |     const VkMemoryUnmapInfoKHR*                 pMemoryUnmapInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~
|       |           VkMemoryGetFdInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.h:4021:11: error: 'VkShaderCreateInfoEXT' does not name a type; did you mean 'VkSamplerCreateInfo'?
|  4021 |     const VkShaderCreateInfoEXT*                pCreateInfos,
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkSamplerCreateInfo
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.h:4023:5: error: 'VkShaderEXT' has not been declared
|  4023 |     VkShaderEXT*                                pShaders);
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.h:4027:5: error: 'VkShaderEXT' has not been declared
|  4027 |     VkShaderEXT                                 shader,
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.h:4032:5: error: 'VkShaderEXT' has not been declared
|  4032 |     VkShaderEXT                                 shader,
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.h:4040:11: error: 'VkShaderEXT' does not name a type
|  4040 |     const VkShaderEXT*                          pShaders);
|       |           ^~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:2979:31: error: 'VkMemoryMapInfoKHR' was not declared in this scope; did you mean 'VkMemoryGetFdInfoKHR'?
|  2979 | template <> struct LvlTypeMap<VkMemoryMapInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~
|       |                               VkMemoryGetFdInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:2979:49: error: template argument 1 is invalid
|  2979 | template <> struct LvlTypeMap<VkMemoryMapInfoKHR> {
|       |                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:2983:32: error: 'VK_STRUCTURE_TYPE_MEMORY_MAP_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR'?
|  2983 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_MAP_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:2983:69: error: template argument 1 is invalid
|  2983 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_MAP_INFO_KHR> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:2988:31: error: 'VkMemoryUnmapInfoKHR' was not declared in this scope; did you mean 'VkMemoryGetFdInfoKHR'?
|  2988 | template <> struct LvlTypeMap<VkMemoryUnmapInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~
|       |                               VkMemoryGetFdInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:2988:51: error: template argument 1 is invalid
|  2988 | template <> struct LvlTypeMap<VkMemoryUnmapInfoKHR> {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:2992:32: error: 'VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR'?
|  2992 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_GET_FD_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:2992:71: error: template argument 1 is invalid
|  2992 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO_KHR> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6185:31: error: 'VkPhysicalDeviceShaderTileImageFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShadingRateImageFeaturesNV'?
|  6185 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTileImageFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShadingRateImageFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6185:73: error: template argument 1 is invalid
|  6185 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTileImageFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6189:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV'?
|  6189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6189:96: error: template argument 1 is invalid
|  6189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6194:31: error: 'VkPhysicalDeviceShaderTileImagePropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShadingRateImagePropertiesNV'?
|  6194 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTileImagePropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShadingRateImagePropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6194:75: error: template argument 1 is invalid
|  6194 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderTileImagePropertiesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6198:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV'?
|  6198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6198:98: error: template argument 1 is invalid
|  6198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6294:31: error: 'VkPhysicalDeviceDisplacementMicromapFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceOpacityMicromapFeaturesEXT'?
|  6294 | template <> struct LvlTypeMap<VkPhysicalDeviceDisplacementMicromapFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceOpacityMicromapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6294:77: error: template argument 1 is invalid
|  6294 | template <> struct LvlTypeMap<VkPhysicalDeviceDisplacementMicromapFeaturesNV> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6298:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT'?
|  6298 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6298:99: error: template argument 1 is invalid
|  6298 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_FEATURES_NV> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6305:31: error: 'VkPhysicalDeviceDisplacementMicromapPropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceOpacityMicromapPropertiesEXT'?
|  6305 | template <> struct LvlTypeMap<VkPhysicalDeviceDisplacementMicromapPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceOpacityMicromapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6305:79: error: template argument 1 is invalid
|  6305 | template <> struct LvlTypeMap<VkPhysicalDeviceDisplacementMicromapPropertiesNV> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6309:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT'?
|  6309 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6309:101: error: template argument 1 is invalid
|  6309 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_PROPERTIES_NV> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6316:31: error: 'VkAccelerationStructureTrianglesDisplacementMicromapNV' was not declared in this scope; did you mean 'VkAccelerationStructureTrianglesOpacityMicromapEXT'?
|  6316 | template <> struct LvlTypeMap<VkAccelerationStructureTrianglesDisplacementMicromapNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureTrianglesOpacityMicromapEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6316:85: error: template argument 1 is invalid
|  6316 | template <> struct LvlTypeMap<VkAccelerationStructureTrianglesDisplacementMicromapNV> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6320:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_DISPLACEMENT_MICROMAP_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_OPACITY_MICROMAP_EXT'?
|  6320 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_DISPLACEMENT_MICROMAP_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_OPACITY_MICROMAP_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6320:107: error: template argument 1 is invalid
|  6320 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_DISPLACEMENT_MICROMAP_NV> {
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6740:31: error: 'VkPhysicalDeviceShaderObjectFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderClockFeaturesKHR'?
|  6740 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderObjectFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderClockFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6740:70: error: template argument 1 is invalid
|  6740 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderObjectFeaturesEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6744:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR'?
|  6744 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6744:92: error: template argument 1 is invalid
|  6744 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6749:31: error: 'VkPhysicalDeviceShaderObjectPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderCorePropertiesARM'?
|  6749 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderObjectPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderCorePropertiesARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6749:72: error: template argument 1 is invalid
|  6749 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderObjectPropertiesEXT> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6753:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM'?
|  6753 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6753:94: error: template argument 1 is invalid
|  6753 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT> {
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6758:31: error: 'VkShaderCreateInfoEXT' was not declared in this scope; did you mean 'VkSamplerCreateInfo'?
|  6758 | template <> struct LvlTypeMap<VkShaderCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~
|       |                               VkSamplerCreateInfo
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6758:52: error: template argument 1 is invalid
|  6758 | template <> struct LvlTypeMap<VkShaderCreateInfoEXT> {
|       |                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6762:32: error: 'VK_STRUCTURE_TYPE_SHADER_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO'?
|  6762 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SHADER_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/vk_typemap_helper.h:6762:72: error: template argument 1 is invalid
|  6762 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SHADER_CREATE_INFO_EXT> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:3923:11: error: 'VkMemoryMapInfoKHR' does not name a type; did you mean 'VkMemoryGetFdInfoKHR'?
|  3923 |     const VkMemoryMapInfoKHR*                   pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~~~~
|       |           VkMemoryGetFdInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::MapMemory2KHR(VkDevice, const int*, void**)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:3926:46: error: request for member 'memory' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  3926 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                              ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:3926:70: error: request for member 'offset' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  3926 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                      ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:3926:94: error: request for member 'size' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  3926 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                                              ^~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:3926:116: error: request for member 'flags' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  3926 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                                                                    ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:3931:11: error: 'VkMemoryUnmapInfoKHR' does not name a type; did you mean 'VkMemoryGetFdInfoKHR'?
|  3931 |     const VkMemoryUnmapInfoKHR*                 pMemoryUnmapInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~
|       |           VkMemoryGetFdInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::UnmapMemory2KHR(VkDevice, const int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:3933:43: error: request for member 'memory' in '* pMemoryUnmapInfo', which is of non-class type 'const int'
|  3933 |     UnmapMemory(device, pMemoryUnmapInfo->memory);
|       |                                           ^~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:6571:11: error: 'VkShaderCreateInfoEXT' does not name a type; did you mean 'VkSamplerCreateInfo'?
|  6571 |     const VkShaderCreateInfoEXT*                pCreateInfos,
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkSamplerCreateInfo
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:6573:5: error: 'VkShaderEXT' has not been declared
|  6573 |     VkShaderEXT*                                pShaders)
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreateShadersEXT(VkDevice, uint32_t, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:6577:24: error: 'VkShaderEXT' was not declared in this scope
|  6577 |         pShaders[i] = (VkShaderEXT)global_unique_handle++;
|       |                        ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:6584:5: error: 'VkShaderEXT' has not been declared
|  6584 |     VkShaderEXT                                 shader,
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:6592:5: error: 'VkShaderEXT' has not been declared
|  6592 |     VkShaderEXT                                 shader,
|       |     ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/icd/generated/mock_icd.cpp:6604:11: error: 'VkShaderEXT' does not name a type
|  6604 |     const VkShaderEXT*                          pShaders)
|       |           ^~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot  -O2 -pipe -g -fe
 liminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot
 =  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot  -O2 -pipe -g -felimina
 te-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build=/usr/src/debug/vulkan-tools/1.3.246.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot=  -fd
 ebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/vulkaninfo.cpp:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkResultString(VkResult)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:522:15: error: 'VK_ERROR_INCOMPATIBLE_SHADER_BINARY_EXT' was not declared in this scope; did you mean 'VK_ERROR_INCOMPATIBLE_DRIVER'?
|   522 |         case (VK_ERROR_INCOMPATIBLE_SHADER_BINARY_EXT): return "ERROR_INCOMPATIBLE_SHADER_BINARY_EXT";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_ERROR_INCOMPATIBLE_DRIVER
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2608:86: error: 'VkPhysicalDeviceShaderObjectFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderClockFeaturesKHR'?
|  2608 | void DumpVkPhysicalDeviceShaderObjectFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceShaderObjectFeaturesEXT &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceShaderClockFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderObjectFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2611:58: error: request for member 'shaderObject' in 'obj', which is of non-class type 'const int'
|  2611 |     p.PrintKeyBool("shaderObject", static_cast<bool>(obj.shaderObject));
|       |                                                          ^~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2613:88: error: 'VkPhysicalDeviceShaderObjectPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderCorePropertiesARM'?
|  2613 | void DumpVkPhysicalDeviceShaderObjectPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceShaderObjectPropertiesEXT &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceShaderCorePropertiesARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderObjectPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2616:45: error: request for member 'shaderBinaryUUID' in 'obj', which is of non-class type 'const int'
|  2616 |     p.PrintKeyValue("shaderBinaryUUID", obj.shaderBinaryUUID);
|       |                                             ^~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2617:48: error: request for member 'shaderBinaryVersion' in 'obj', which is of non-class type 'const int'
|  2617 |     p.PrintKeyValue("shaderBinaryVersion", obj.shaderBinaryVersion);
|       |                                                ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:89: error: 'VkPhysicalDeviceShaderTileImageFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShadingRateImageFeaturesNV'?
|  2634 | void DumpVkPhysicalDeviceShaderTileImageFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceShaderTileImageFeaturesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDeviceShadingRateImageFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderTileImageFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2637:76: error: request for member 'shaderTileImageColorReadAccess' in 'obj', which is of non-class type 'const int'
|  2637 |     p.PrintKeyBool("shaderTileImageColorReadAccess", static_cast<bool>(obj.shaderTileImageColorReadAccess));
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2638:76: error: request for member 'shaderTileImageDepthReadAccess' in 'obj', which is of non-class type 'const int'
|  2638 |     p.PrintKeyBool("shaderTileImageDepthReadAccess", static_cast<bool>(obj.shaderTileImageDepthReadAccess));
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2639:78: error: request for member 'shaderTileImageStencilReadAccess' in 'obj', which is of non-class type 'const int'
|  2639 |     p.PrintKeyBool("shaderTileImageStencilReadAccess", static_cast<bool>(obj.shaderTileImageStencilReadAccess));
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2641:91: error: 'VkPhysicalDeviceShaderTileImagePropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceShadingRateImagePropertiesNV'?
|  2641 | void DumpVkPhysicalDeviceShaderTileImagePropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceShaderTileImagePropertiesEXT &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceShadingRateImagePropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderTileImagePropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2644:84: error: request for member 'shaderTileImageCoherentReadAccelerated' in 'obj', which is of non-class type 'const int'
|  2644 |     p.PrintKeyBool("shaderTileImageCoherentReadAccelerated", static_cast<bool>(obj.shaderTileImageCoherentReadAccelerated));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2645:94: error: request for member 'shaderTileImageReadSampleFromPixelRateInvocation' in 'obj', which is of non-class type 'const int'
|  2645 |     p.PrintKeyBool("shaderTileImageReadSampleFromPixelRateInvocation", static_cast<bool>(obj.shaderTileImageReadSampleFromPixelRateInvocation));
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2646:85: error: request for member 'shaderTileImageReadFromHelperInvocation' in 'obj', which is of non-class type 'const int'
|  2646 |     p.PrintKeyBool("shaderTileImageReadFromHelperInvocation", static_cast<bool>(obj.shaderTileImageReadFromHelperInvocation));
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3156:5: error: 'VkPhysicalDeviceShaderObjectPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderCorePropertiesARM'?
|  3156 |     VkPhysicalDeviceShaderObjectPropertiesEXT PhysicalDeviceShaderObjectPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderCorePropertiesARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3157:5: error: 'VkPhysicalDeviceShaderTileImagePropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceShadingRateImagePropertiesNV'?
|  3157 |     VkPhysicalDeviceShaderTileImagePropertiesEXT PhysicalDeviceShaderTileImagePropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShadingRateImagePropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3212:9: error: 'PhysicalDeviceShaderObjectPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderObjectPropertiesEXT'?
|  3212 |         PhysicalDeviceShaderObjectPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderObjectPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3212:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM'?
|  3212 |         PhysicalDeviceShaderObjectPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3213:9: error: 'PhysicalDeviceShaderTileImagePropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTileImagePropertiesEXT'?
|  3213 |         PhysicalDeviceShaderTileImagePropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderTileImagePropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3213:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV'?
|  3213 |         PhysicalDeviceShaderTileImagePropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3413:5: error: 'VkPhysicalDeviceShaderObjectFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderClockFeaturesKHR'?
|  3413 |     VkPhysicalDeviceShaderObjectFeaturesEXT PhysicalDeviceShaderObjectFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderClockFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3417:5: error: 'VkPhysicalDeviceShaderTileImageFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShadingRateImageFeaturesNV'?
|  3417 |     VkPhysicalDeviceShaderTileImageFeaturesEXT PhysicalDeviceShaderTileImageFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShadingRateImageFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3529:9: error: 'PhysicalDeviceShaderObjectFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderObjectFeaturesEXT'?
|  3529 |         PhysicalDeviceShaderObjectFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderObjectFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3529:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR'?
|  3529 |         PhysicalDeviceShaderObjectFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3533:9: error: 'PhysicalDeviceShaderTileImageFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTileImageFeaturesEXT'?
|  3533 |         PhysicalDeviceShaderTileImageFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderTileImageFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3533:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV'?
|  3533 |         PhysicalDeviceShaderTileImageFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4051:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM'?
|  4051 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4052:54: error: 'VK_EXT_SHADER_OBJECT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_CLOCK_EXTENSION_NAME'?
|  4052 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_OBJECT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_CLOCK_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4053:13: error: 'VkPhysicalDeviceShaderObjectPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderObjectPropertiesEXT'?
|  4053 |             VkPhysicalDeviceShaderObjectPropertiesEXT* props = (VkPhysicalDeviceShaderObjectPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderObjectPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4053:56: error: 'props' was not declared in this scope
|  4053 |             VkPhysicalDeviceShaderObjectPropertiesEXT* props = (VkPhysicalDeviceShaderObjectPropertiesEXT*)structure;
|       |                                                        ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4053:107: error: expected primary-expression before ')' token
|  4053 |             VkPhysicalDeviceShaderObjectPropertiesEXT* props = (VkPhysicalDeviceShaderObjectPropertiesEXT*)structure;
|       |                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4057:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV'?
|  4057 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4058:54: error: 'VK_EXT_SHADER_TILE_IMAGE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_SHADING_RATE_IMAGE_EXTENSION_NAME'?
|  4058 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_TILE_IMAGE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_SHADING_RATE_IMAGE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4059:13: error: 'VkPhysicalDeviceShaderTileImagePropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTileImagePropertiesEXT'?
|  4059 |             VkPhysicalDeviceShaderTileImagePropertiesEXT* props = (VkPhysicalDeviceShaderTileImagePropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderTileImagePropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4059:59: error: 'props' was not declared in this scope
|  4059 |             VkPhysicalDeviceShaderTileImagePropertiesEXT* props = (VkPhysicalDeviceShaderTileImagePropertiesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4059:113: error: expected primary-expression before ')' token
|  4059 |             VkPhysicalDeviceShaderTileImagePropertiesEXT* props = (VkPhysicalDeviceShaderTileImagePropertiesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4677:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR'?
|  4677 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4678:54: error: 'VK_EXT_SHADER_OBJECT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_SHADER_CLOCK_EXTENSION_NAME'?
|  4678 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_OBJECT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_SHADER_CLOCK_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4679:13: error: 'VkPhysicalDeviceShaderObjectFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderObjectFeaturesEXT'?
|  4679 |             VkPhysicalDeviceShaderObjectFeaturesEXT* props = (VkPhysicalDeviceShaderObjectFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderObjectFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4679:54: error: 'props' was not declared in this scope
|  4679 |             VkPhysicalDeviceShaderObjectFeaturesEXT* props = (VkPhysicalDeviceShaderObjectFeaturesEXT*)structure;
|       |                                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4679:103: error: expected primary-expression before ')' token
|  4679 |             VkPhysicalDeviceShaderObjectFeaturesEXT* props = (VkPhysicalDeviceShaderObjectFeaturesEXT*)structure;
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4703:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV'?
|  4703 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4704:54: error: 'VK_EXT_SHADER_TILE_IMAGE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_SHADING_RATE_IMAGE_EXTENSION_NAME'?
|  4704 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_TILE_IMAGE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_SHADING_RATE_IMAGE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4705:13: error: 'VkPhysicalDeviceShaderTileImageFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderTileImageFeaturesEXT'?
|  4705 |             VkPhysicalDeviceShaderTileImageFeaturesEXT* props = (VkPhysicalDeviceShaderTileImageFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderTileImageFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4705:57: error: 'props' was not declared in this scope
|  4705 |             VkPhysicalDeviceShaderTileImageFeaturesEXT* props = (VkPhysicalDeviceShaderTileImageFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4705:109: error: expected primary-expression before ')' token
|  4705 |             VkPhysicalDeviceShaderTileImageFeaturesEXT* props = (VkPhysicalDeviceShaderTileImageFeaturesEXT*)structure;
|       |                                                                                                             ^
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/temp/run.do_compile.363955:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/temp/run.do_compile.363955, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/temp/run.do_compile.363955, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/temp/run.do_compile.363955, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/temp/run.do_compile.363955, line 166
NOTE: recipe vulkan-tools-1.3.246.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1217 tasks of which 1208 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.246.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/temp/run.do_compile.363955', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.246.1-r0/temp/log.do_compile.363955
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.246.1.bb:do_compile) failed with exit code '1'

--===============3295379038124296797==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.243.0-1.3.246.1.patch"

RnJvbSBmZDQzMmFhYTAwNWU5Nzk4NDIzNTg3YmU5ODUzZTFhZDY4NmE3YjdkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTk6MjM6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjI0My4wIC0+IDEuMy4yNDYuMQoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjMuMjQzLjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yNDYuMS5iYn0gIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29sc18xLjMuMjQz
LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yNDYuMS5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjQzLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjQ2LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS4zLjI0My4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjQ2LjEuYmIKaW5kZXggZGZkZDcxNmFiZC4uMTU3
NDQzOTZkYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
dG9vbHNfMS4zLjI0My4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXRvb2xzXzEuMy4yNDYuMS5iYgpAQCAtNiw4ICs2LDggQEAgU0VDVElPTiA9ICJsaWJzIgog
CiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPXNk
ay0xLjMuMjQzO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjE4YmRmNTU2NWY1ZDAyODMxODY5
Nzg1Y2JmNzU4ZmE3YjI5NWI3ZDUiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25v
c0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMiCitTUkNS
RVYgPSAiNGUxN2MyODRkNjdkZTQ2OGQ2MmVjNzlmYjBiNGEzZWZmNzY0NDdlYSIKIAogUyA9ICIk
e1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============3295379038124296797==--

