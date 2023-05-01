Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D0ECA9EBF
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.107906.1682976353335345527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Sl1fRmyN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010187d93529a9-29cfb580-6cc9-4eb6-a597-1b6bfa4a1525-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U8iG/C3/fZhK7wlr1nfmnOQPv8IgWvb5uyaIjbkEvgQ=;
	b=Sl1fRmyNy+HgFPXUGy8c3UWUnJjynGaq6S3Sg44EcysRowSs89fgGTE4SPsWR6XK
	5lsktKpRhkbpp0cjtdZ4kdgUl6xr5q2PWsK1CogEkNFmpzRYkacfPJR6dlXJp5JexhM
	r2yJRn+znbuqpKXQWYlo1vvHa3Pec1isU0FvVjSE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U8iG/C3/fZhK7wlr1nfmnOQPv8IgWvb5uyaIjbkEvgQ=;
	b=kRAw4i2zEph7KLRAQlLrnxUKwIpIV8Www9TbvB/e+QyXDoqQjZKqcmkf8TVJoiBn
	S5cAvXCXF9D/Sbwxu81IfdLTO4d4CN4Xyrb55BZVgQLgisuf3XfLAq9R1u/8ciJgkaM
	HWHByZ/PiGw4B/iZGW3yurK9GAt/GoN47NkwXi80=
Content-Type: multipart/mixed; boundary="===============3860310516722092569=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.243.0 FAILED
Message-ID: <01010187d93529a9-29cfb580-6cc9-4eb6-a597-1b6bfa4a1525-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180672

--===============3860310516722092569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.243.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.239.0-1.3.243.0.patch
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
--===============3860310516722092569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:b6e22ad448dafdc26379ad44369dc498df0eb5be"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 87 Mirrors 0 Missed 7 Current 232 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1146 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 1201 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_unpack)
NOTE: Running task 1202 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 1203 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 1204 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1205 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 1206 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1207 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 1208 of 1215 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FO
 RTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/bu
 ild/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_
 SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tm
 p/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:3029:31: error: 'VkQueryPoolVideoEncodeFeedbackCreateInfoKHR' was not declared in this scope
|  3029 | template <> struct LvlTypeMap<VkQueryPoolVideoEncodeFeedbackCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:3029:74: error: template argument 1 is invalid
|  3029 | template <> struct LvlTypeMap<VkQueryPoolVideoEncodeFeedbackCreateInfoKHR> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:3033:32: error: 'VK_STRUCTURE_TYPE_QUERY_POOL_VIDEO_ENCODE_FEEDBACK_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR'?
|  3033 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_VIDEO_ENCODE_FEEDBACK_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:3033:98: error: template argument 1 is invalid
|  3033 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_POOL_VIDEO_ENCODE_FEEDBACK_CREATE_INFO_KHR> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:5209:31: error: 'VkQueryLowLatencySupportNV' was not declared in this scope
|  5209 | template <> struct LvlTypeMap<VkQueryLowLatencySupportNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:5209:57: error: template argument 1 is invalid
|  5209 | template <> struct LvlTypeMap<VkQueryLowLatencySupportNV> {
|       |                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:5213:32: error: 'VK_STRUCTURE_TYPE_QUERY_LOW_LATENCY_SUPPORT_NV' was not declared in this scope
|  5213 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_LOW_LATENCY_SUPPORT_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:5213:78: error: template argument 1 is invalid
|  5213 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUERY_LOW_LATENCY_SUPPORT_NV> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6302:31: error: 'VkPhysicalDeviceShaderCorePropertiesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderCorePropertiesAMD'?
|  6302 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderCorePropertiesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderCorePropertiesAMD
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6302:70: error: template argument 1 is invalid
|  6302 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderCorePropertiesARM> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6306:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD'?
|  6306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6306:92: error: template argument 1 is invalid
|  6306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6311:31: error: 'VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceImage2DViewOf3DFeaturesEXT'?
|  6311 | template <> struct LvlTypeMap<VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceImage2DViewOf3DFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6311:77: error: template argument 1 is invalid
|  6311 | template <> struct LvlTypeMap<VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6315:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT'?
|  6315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6315:102: error: template argument 1 is invalid
|  6315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT> {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6320:31: error: 'VkImageViewSlicedCreateInfoEXT' was not declared in this scope; did you mean 'VkImageViewMinLodCreateInfoEXT'?
|  6320 | template <> struct LvlTypeMap<VkImageViewSlicedCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkImageViewMinLodCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6320:61: error: template argument 1 is invalid
|  6320 | template <> struct LvlTypeMap<VkImageViewSlicedCreateInfoEXT> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6324:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_SLICED_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT'?
|  6324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_SLICED_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6324:83: error: template argument 1 is invalid
|  6324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_SLICED_CREATE_INFO_EXT> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6752:31: error: 'VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  6752 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6752:85: error: template argument 1 is invalid
|  6752 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6756:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  6756 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6756:109: error: template argument 1 is invalid
|  6756 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT> {
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6761:31: error: 'VkPhysicalDeviceMultiviewPerViewRenderAreasFeaturesQCOM' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiviewPerViewViewportsFeaturesQCOM'?
|  6761 | template <> struct LvlTypeMap<VkPhysicalDeviceMultiviewPerViewRenderAreasFeaturesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMultiviewPerViewViewportsFeaturesQCOM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6761:86: error: template argument 1 is invalid
|  6761 | template <> struct LvlTypeMap<VkPhysicalDeviceMultiviewPerViewRenderAreasFeaturesQCOM> {
|       |                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6765:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_RENDER_AREAS_FEATURES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_VIEWPORTS_FEATURES_QCOM'?
|  6765 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_RENDER_AREAS_FEATURES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_VIEWPORTS_FEATURES_QCOM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6765:111: error: template argument 1 is invalid
|  6765 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_RENDER_AREAS_FEATURES_QCOM> {
|       |                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6770:31: error: 'VkMultiviewPerViewRenderAreasRenderPassBeginInfoQCOM' was not declared in this scope
|  6770 | template <> struct LvlTypeMap<VkMultiviewPerViewRenderAreasRenderPassBeginInfoQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6770:83: error: template argument 1 is invalid
|  6770 | template <> struct LvlTypeMap<VkMultiviewPerViewRenderAreasRenderPassBeginInfoQCOM> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6774:32: error: 'VK_STRUCTURE_TYPE_MULTIVIEW_PER_VIEW_RENDER_AREAS_RENDER_PASS_BEGIN_INFO_QCOM' was not declared in this scope
|  6774 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MULTIVIEW_PER_VIEW_RENDER_AREAS_RENDER_PASS_BEGIN_INFO_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/icd/generated/vk_typemap_helper.h:6774:109: error: template argument 1 is invalid
|  6774 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MULTIVIEW_PER_VIEW_RENDER_AREAS_RENDER_PASS_BEGIN_INFO_QCOM> {
|       |                                                                                                             ^
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot  -O2 -pipe -g -fe
 liminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot
 =  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot  -O2 -pipe -g -felimina
 te-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build=/usr/src/debug/vulkan-tools/1.3.243.0-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot=  -fd
 ebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/vulkaninfo.cpp:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkResultString(VkResult)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:520:15: error: 'VK_ERROR_INVALID_VIDEO_STD_PARAMETERS_KHR' was not declared in this scope
|   520 |         case (VK_ERROR_INVALID_VIDEO_STD_PARAMETERS_KHR): return "ERROR_INVALID_VIDEO_STD_PARAMETERS_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1845:93: error: 'VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceImage2DViewOf3DFeaturesEXT'?
|  1845 | void DumpVkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             VkPhysicalDeviceImage2DViewOf3DFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1848:65: error: request for member 'imageSlicedViewOf3D' in 'obj', which is of non-class type 'const int'
|  1848 |     p.PrintKeyBool("imageSlicedViewOf3D", static_cast<bool>(obj.imageSlicedViewOf3D));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2203:101: error: 'VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  2203 | void DumpVkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT(Printer &p, std::string name, const VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT &obj) {
|       |                                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                     VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2206:73: error: request for member 'pipelineLibraryGroupHandles' in 'obj', which is of non-class type 'const int'
|  2206 |     p.PrintKeyBool("pipelineLibraryGroupHandles", static_cast<bool>(obj.pipelineLibraryGroupHandles));
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3242:5: error: 'VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceImage2DViewOf3DFeaturesEXT'?
|  3242 |     VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT PhysicalDeviceImageSlicedViewOf3DFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceImage2DViewOf3DFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3262:5: error: 'VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  3262 |     VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3357:9: error: 'PhysicalDeviceImageSlicedViewOf3DFeaturesEXT' was not declared in this scope; did you mean 'PhysicalDeviceImage2DViewOf3DFeaturesEXT'?
|  3357 |         PhysicalDeviceImageSlicedViewOf3DFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceImage2DViewOf3DFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3357:62: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT'?
|  3357 |         PhysicalDeviceImageSlicedViewOf3DFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3377:9: error: 'PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT'?
|  3377 |         PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3377:70: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  3377 |         PhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT;
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4221:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT'?
|  4221 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4222:54: error: 'VK_EXT_IMAGE_SLICED_VIEW_OF_3D_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_IMAGE_2D_VIEW_OF_3D_EXTENSION_NAME'?
|  4222 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_SLICED_VIEW_OF_3D_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_IMAGE_2D_VIEW_OF_3D_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4223:13: error: 'VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT'?
|  4223 |             VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT* props = (VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4223:61: error: 'props' was not declared in this scope
|  4223 |             VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT* props = (VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT*)structure;
|       |                                                             ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4223:117: error: expected primary-expression before ')' token
|  4223 |             VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT* props = (VkPhysicalDeviceImageSlicedViewOf3DFeaturesEXT*)structure;
|       |                                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4346:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  4346 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4347:54: error: 'VK_EXT_PIPELINE_LIBRARY_GROUP_HANDLES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_PIPELINE_PROPERTIES_EXTENSION_NAME'?
|  4347 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PIPELINE_LIBRARY_GROUP_HANDLES_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_PIPELINE_PROPERTIES_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4348:13: error: 'VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT'?
|  4348 |             VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT* props = (VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4348:69: error: 'props' was not declared in this scope
|  4348 |             VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT* props = (VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT*)structure;
|       |                                                                     ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4348:133: error: expected primary-expression before ')' token
|  4348 |             VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT* props = (VkPhysicalDevicePipelineLibraryGroupHandlesFeaturesEXT*)structure;
|       |                                                                                                                                     ^
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/temp/run.do_compile.2218129:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/temp/run.do_compile.2218129, line 153
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/temp/run.do_compile.2218129, line 147
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/temp/run.do_compile.2218129, line 142
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/temp/run.do_compile.2218129, line 166
NOTE: recipe vulkan-tools-1.3.243.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1208 tasks of which 1199 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.243.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/temp/run.do_compile.2218129', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.243.0-r0/temp/log.do_compile.2218129
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.243.0.bb:do_compile) failed with exit code '1'

--===============3860310516722092569==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.239.0-1.3.243.0.patch"

RnJvbSA3MTJhNmRkOTFjYzliNDcyYjU3MzJkMmNkNmQwNTJjZmMzNTFjMDhkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxODozNTowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjM5LjAgLT4gMS4zLjI0My4wCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yMzkuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI0My4wLmJifSAgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXRvb2xzXzEuMy4yMzku
MC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI0My4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yMzkuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNDMuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi10b29sc18xLjMuMjM5LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNDMuMC5iYgppbmRleCA5MzRiZDUzZWUxLi44NThh
YTQ4YmExIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10
b29sc18xLjMuMjM5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tdG9vbHNfMS4zLjI0My4wLmJiCkBAIC02LDggKzYsOCBAQCBTRUNUSU9OID0gImxpYnMiCiAK
IExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9c2Rr
LTEuMy4yMzk7cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiODRjNjFjNDYzYWVjZGRhMzg1ZGUz
M2IwMTQ5YzczNjgxMTljMjNmNiIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9z
R3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9c2RrLTEuMy4yNDM7cHJvdG9jb2w9aHR0cHMi
CitTUkNSRVYgPSAiMThiZGY1NTY1ZjVkMDI4MzE4Njk3ODVjYmY3NThmYTdiMjk1YjdkNSIKIAog
UyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zOS4yCgo=

--===============3860310516722092569==--

