Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56253C41535
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:38 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.883.1667349635957141288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SXNPJfn4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018435c860a3-976e2d84-eacb-470b-a37d-873b1d44e879-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RPeNFM+M7EagaN8w6yepg8L3hfvRfv258wWBpuiq3yY=;
	b=SXNPJfn4t5AVQ3GR4C1WNtnmHXFvJ6gNS/8otceVtCjEhJ0BufDnteDYqXjY85ks
	W9uk+Qk/8KoD+rwfRdjsg9/8FLUr1FbGTX7MGpaOQWNchhVqZWoXzuJ1p+8m6MHt60D
	3s10EiYP02o3Qb/sbrtG9uOxwQZLfZoA5LuHB8oI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349635;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RPeNFM+M7EagaN8w6yepg8L3hfvRfv258wWBpuiq3yY=;
	b=AD7aaFs9Q4SJKY8S4Ie7djoUfiqdYVGajy317N6HQzS9NVJ90c+eFKNXhLXwYEhh
	gAuTGa2A2S2SEcN7jOm7N2YTtpUDdQLIrTwwG40EGJjDFQfVRkhroRY+BBzKzovd1vl
	UMt4EP8R24fnmNJwHszj9ICrz0g5GvUToFIBjAzk=
Content-Type: multipart/mixed; boundary="===============6600024515519194852=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.231.1 FAILED
Message-ID: <0101018435c860a3-976e2d84-eacb-470b-a37d-873b1d44e879-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172502

--===============6600024515519194852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.231.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.224.1-1.3.231.1.patch
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
--===============6600024515519194852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:25c8a8df482ec2f5e70d09cfcb3875b9adce9f5c"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 94 Local 87 Mirrors 0 Missed 7 Current 229 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1136 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_fetch: Succeeded
NOTE: Running task 1191 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_unpack)
NOTE: Running task 1192 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_unpack: Succeeded
NOTE: Running task 1193 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1195 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_generate_toolchain_file)
NOTE: Running task 1196 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 1197 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_configure: Succeeded
NOTE: Running task 1198 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-tools/1.3.231.1-r0/git=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/rec
 ipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-too
 ls/1.3.231.1-r0/git=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sy
 sroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/vulkaninfo.cpp:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkFormatString(VkFormat)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:357:15: error: 'VK_FORMAT_R16G16_S10_5_NV' was not declared in this scope; did you mean 'VK_FORMAT_R16G16_SINT'?
|   357 |         case (VK_FORMAT_R16G16_S10_5_NV): return "FORMAT_R16G16_S10_5_NV";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R16G16_SINT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkFormatFeatureFlagBits2GetStrings(VkFormatFeatureFlagBits2)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:704:9: error: 'VK_FORMAT_FEATURE_2_OPTICAL_FLOW_IMAGE_BIT_NV' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR'?
|   704 |     if (VK_FORMAT_FEATURE_2_OPTICAL_FLOW_IMAGE_BIT_NV & value) strings.push_back("FORMAT_FEATURE_2_OPTICAL_FLOW_IMAGE_BIT_NV");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:705:9: error: 'VK_FORMAT_FEATURE_2_OPTICAL_FLOW_VECTOR_BIT_NV' was not declared in this scope
|   705 |     if (VK_FORMAT_FEATURE_2_OPTICAL_FLOW_VECTOR_BIT_NV & value) strings.push_back("FORMAT_FEATURE_2_OPTICAL_FLOW_VECTOR_BIT_NV");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:706:9: error: 'VK_FORMAT_FEATURE_2_OPTICAL_FLOW_COST_BIT_NV' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_TRANSFER_DST_BIT_KHR'?
|   706 |     if (VK_FORMAT_FEATURE_2_OPTICAL_FLOW_COST_BIT_NV & value) strings.push_back("FORMAT_FEATURE_2_OPTICAL_FLOW_COST_BIT_NV");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_TRANSFER_DST_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkQueueFlagBitsGetStrings(VkQueueFlagBits)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:853:9: error: 'VK_QUEUE_OPTICAL_FLOW_BIT_NV' was not declared in this scope
|   853 |     if (VK_QUEUE_OPTICAL_FLOW_BIT_NV & value) strings.push_back("QUEUE_OPTICAL_FLOW_BIT_NV");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkQueueFlagsString(VkQueueFlags)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:909:9: error: 'VK_QUEUE_OPTICAL_FLOW_BIT_NV' was not declared in this scope
|   909 |     if (VK_QUEUE_OPTICAL_FLOW_BIT_NV & value) {
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkShaderStageFlagBitsGetStrings(VkShaderStageFlagBits)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:997:9: error: 'VK_SHADER_STAGE_TASK_BIT_EXT' was not declared in this scope; did you mean 'VK_SHADER_STAGE_TASK_BIT_NV'?
|   997 |     if (VK_SHADER_STAGE_TASK_BIT_EXT & value) strings.push_back("SHADER_STAGE_TASK_BIT_EXT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_SHADER_STAGE_TASK_BIT_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:998:9: error: 'VK_SHADER_STAGE_MESH_BIT_EXT' was not declared in this scope; did you mean 'VK_SHADER_STAGE_MESH_BIT_NV'?
|   998 |     if (VK_SHADER_STAGE_MESH_BIT_EXT & value) strings.push_back("SHADER_STAGE_MESH_BIT_EXT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_SHADER_STAGE_MESH_BIT_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoCodecOperationFlagBitsKHRGetStrings(VkVideoCodecOperationFlagBitsKHR)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1160:9: error: 'VK_VIDEO_CODEC_OPERATION_NONE_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_INVALID_BIT_KHR'?
|  1160 |     if (VK_VIDEO_CODEC_OPERATION_NONE_KHR & value) strings.push_back("VIDEO_CODEC_OPERATION_NONE_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_CODEC_OPERATION_INVALID_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1280:94: error: 'VkPhysicalDeviceAddressBindingReportFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
|  1280 | void DumpVkPhysicalDeviceAddressBindingReportFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceAddressBindingReportFeaturesEXT &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkPhysicalDeviceDeviceMemoryReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceAddressBindingReportFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1283:66: error: request for member 'reportAddressBinding' in 'obj', which is of non-class type 'const int'
|  1283 |     p.PrintKeyBool("reportAddressBinding", static_cast<bool>(obj.reportAddressBinding));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1360:91: error: 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDepthClipEnableFeaturesEXT'?
|  1360 | void DumpVkPhysicalDeviceDepthClampZeroOneFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceDepthClampZeroOneFeaturesEXT &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceDepthClipEnableFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDepthClampZeroOneFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1363:63: error: request for member 'depthClampZeroOne' in 'obj', which is of non-class type 'const int'
|  1363 |     p.PrintKeyBool("depthClampZeroOne", static_cast<bool>(obj.depthClampZeroOne));
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1474:95: error: 'VkPhysicalDeviceExtendedDynamicState3FeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  1474 | void DumpVkPhysicalDeviceExtendedDynamicState3FeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceExtendedDynamicState3FeaturesEXT &obj) {
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceExtendedDynamicState3FeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1477:91: error: request for member 'extendedDynamicState3TessellationDomainOrigin' in 'obj', which is of non-class type 'const int'
|  1477 |     p.PrintKeyBool("extendedDynamicState3TessellationDomainOrigin", static_cast<bool>(obj.extendedDynamicState3TessellationDomainOrigin));
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1478:83: error: request for member 'extendedDynamicState3DepthClampEnable' in 'obj', which is of non-class type 'const int'
|  1478 |     p.PrintKeyBool("extendedDynamicState3DepthClampEnable", static_cast<bool>(obj.extendedDynamicState3DepthClampEnable));
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1479:78: error: request for member 'extendedDynamicState3PolygonMode' in 'obj', which is of non-class type 'const int'
|  1479 |     p.PrintKeyBool("extendedDynamicState3PolygonMode", static_cast<bool>(obj.extendedDynamicState3PolygonMode));
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1480:87: error: request for member 'extendedDynamicState3RasterizationSamples' in 'obj', which is of non-class type 'const int'
|  1480 |     p.PrintKeyBool("extendedDynamicState3RasterizationSamples", static_cast<bool>(obj.extendedDynamicState3RasterizationSamples));
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1481:77: error: request for member 'extendedDynamicState3SampleMask' in 'obj', which is of non-class type 'const int'
|  1481 |     p.PrintKeyBool("extendedDynamicState3SampleMask", static_cast<bool>(obj.extendedDynamicState3SampleMask));
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1482:88: error: request for member 'extendedDynamicState3AlphaToCoverageEnable' in 'obj', which is of non-class type 'const int'
|  1482 |     p.PrintKeyBool("extendedDynamicState3AlphaToCoverageEnable", static_cast<bool>(obj.extendedDynamicState3AlphaToCoverageEnable));
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1483:83: error: request for member 'extendedDynamicState3AlphaToOneEnable' in 'obj', which is of non-class type 'const int'
|  1483 |     p.PrintKeyBool("extendedDynamicState3AlphaToOneEnable", static_cast<bool>(obj.extendedDynamicState3AlphaToOneEnable));
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1484:80: error: request for member 'extendedDynamicState3LogicOpEnable' in 'obj', which is of non-class type 'const int'
|  1484 |     p.PrintKeyBool("extendedDynamicState3LogicOpEnable", static_cast<bool>(obj.extendedDynamicState3LogicOpEnable));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1485:83: error: request for member 'extendedDynamicState3ColorBlendEnable' in 'obj', which is of non-class type 'const int'
|  1485 |     p.PrintKeyBool("extendedDynamicState3ColorBlendEnable", static_cast<bool>(obj.extendedDynamicState3ColorBlendEnable));
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1486:85: error: request for member 'extendedDynamicState3ColorBlendEquation' in 'obj', which is of non-class type 'const int'
|  1486 |     p.PrintKeyBool("extendedDynamicState3ColorBlendEquation", static_cast<bool>(obj.extendedDynamicState3ColorBlendEquation));
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1487:81: error: request for member 'extendedDynamicState3ColorWriteMask' in 'obj', which is of non-class type 'const int'
|  1487 |     p.PrintKeyBool("extendedDynamicState3ColorWriteMask", static_cast<bool>(obj.extendedDynamicState3ColorWriteMask));
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1488:86: error: request for member 'extendedDynamicState3RasterizationStream' in 'obj', which is of non-class type 'const int'
|  1488 |     p.PrintKeyBool("extendedDynamicState3RasterizationStream", static_cast<bool>(obj.extendedDynamicState3RasterizationStream));
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1489:96: error: request for member 'extendedDynamicState3ConservativeRasterizationMode' in 'obj', which is of non-class type 'const int'
|  1489 |     p.PrintKeyBool("extendedDynamicState3ConservativeRasterizationMode", static_cast<bool>(obj.extendedDynamicState3ConservativeRasterizationMode));
|       |                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1490:99: error: request for member 'extendedDynamicState3ExtraPrimitiveOverestimationSize' in 'obj', which is of non-class type 'const int'
|  1490 |     p.PrintKeyBool("extendedDynamicState3ExtraPrimitiveOverestimationSize", static_cast<bool>(obj.extendedDynamicState3ExtraPrimitiveOverestimationSize));
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1491:82: error: request for member 'extendedDynamicState3DepthClipEnable' in 'obj', which is of non-class type 'const int'
|  1491 |     p.PrintKeyBool("extendedDynamicState3DepthClipEnable", static_cast<bool>(obj.extendedDynamicState3DepthClipEnable));
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1492:88: error: request for member 'extendedDynamicState3SampleLocationsEnable' in 'obj', which is of non-class type 'const int'
|  1492 |     p.PrintKeyBool("extendedDynamicState3SampleLocationsEnable", static_cast<bool>(obj.extendedDynamicState3SampleLocationsEnable));
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1493:85: error: request for member 'extendedDynamicState3ColorBlendAdvanced' in 'obj', which is of non-class type 'const int'
|  1493 |     p.PrintKeyBool("extendedDynamicState3ColorBlendAdvanced", static_cast<bool>(obj.extendedDynamicState3ColorBlendAdvanced));
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1494:86: error: request for member 'extendedDynamicState3ProvokingVertexMode' in 'obj', which is of non-class type 'const int'
|  1494 |     p.PrintKeyBool("extendedDynamicState3ProvokingVertexMode", static_cast<bool>(obj.extendedDynamicState3ProvokingVertexMode));
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1495:88: error: request for member 'extendedDynamicState3LineRasterizationMode' in 'obj', which is of non-class type 'const int'
|  1495 |     p.PrintKeyBool("extendedDynamicState3LineRasterizationMode", static_cast<bool>(obj.extendedDynamicState3LineRasterizationMode));
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1496:84: error: request for member 'extendedDynamicState3LineStippleEnable' in 'obj', which is of non-class type 'const int'
|  1496 |     p.PrintKeyBool("extendedDynamicState3LineStippleEnable", static_cast<bool>(obj.extendedDynamicState3LineStippleEnable));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1497:92: error: request for member 'extendedDynamicState3DepthClipNegativeOneToOne' in 'obj', which is of non-class type 'const int'
|  1497 |     p.PrintKeyBool("extendedDynamicState3DepthClipNegativeOneToOne", static_cast<bool>(obj.extendedDynamicState3DepthClipNegativeOneToOne));
|       |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1498:89: error: request for member 'extendedDynamicState3ViewportWScalingEnable' in 'obj', which is of non-class type 'const int'
|  1498 |     p.PrintKeyBool("extendedDynamicState3ViewportWScalingEnable", static_cast<bool>(obj.extendedDynamicState3ViewportWScalingEnable));
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1499:82: error: request for member 'extendedDynamicState3ViewportSwizzle' in 'obj', which is of non-class type 'const int'
|  1499 |     p.PrintKeyBool("extendedDynamicState3ViewportSwizzle", static_cast<bool>(obj.extendedDynamicState3ViewportSwizzle));
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1500:88: error: request for member 'extendedDynamicState3CoverageToColorEnable' in 'obj', which is of non-class type 'const int'
|  1500 |     p.PrintKeyBool("extendedDynamicState3CoverageToColorEnable", static_cast<bool>(obj.extendedDynamicState3CoverageToColorEnable));
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1501:90: error: request for member 'extendedDynamicState3CoverageToColorLocation' in 'obj', which is of non-class type 'const int'
|  1501 |     p.PrintKeyBool("extendedDynamicState3CoverageToColorLocation", static_cast<bool>(obj.extendedDynamicState3CoverageToColorLocation));
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1502:89: error: request for member 'extendedDynamicState3CoverageModulationMode' in 'obj', which is of non-class type 'const int'
|  1502 |     p.PrintKeyBool("extendedDynamicState3CoverageModulationMode", static_cast<bool>(obj.extendedDynamicState3CoverageModulationMode));
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1503:96: error: request for member 'extendedDynamicState3CoverageModulationTableEnable' in 'obj', which is of non-class type 'const int'
|  1503 |     p.PrintKeyBool("extendedDynamicState3CoverageModulationTableEnable", static_cast<bool>(obj.extendedDynamicState3CoverageModulationTableEnable));
|       |                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1504:90: error: request for member 'extendedDynamicState3CoverageModulationTable' in 'obj', which is of non-class type 'const int'
|  1504 |     p.PrintKeyBool("extendedDynamicState3CoverageModulationTable", static_cast<bool>(obj.extendedDynamicState3CoverageModulationTable));
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1505:88: error: request for member 'extendedDynamicState3CoverageReductionMode' in 'obj', which is of non-class type 'const int'
|  1505 |     p.PrintKeyBool("extendedDynamicState3CoverageReductionMode", static_cast<bool>(obj.extendedDynamicState3CoverageReductionMode));
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1506:99: error: request for member 'extendedDynamicState3RepresentativeFragmentTestEnable' in 'obj', which is of non-class type 'const int'
|  1506 |     p.PrintKeyBool("extendedDynamicState3RepresentativeFragmentTestEnable", static_cast<bool>(obj.extendedDynamicState3RepresentativeFragmentTestEnable));
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1507:89: error: request for member 'extendedDynamicState3ShadingRateImageEnable' in 'obj', which is of non-class type 'const int'
|  1507 |     p.PrintKeyBool("extendedDynamicState3ShadingRateImageEnable", static_cast<bool>(obj.extendedDynamicState3ShadingRateImageEnable));
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1509:97: error: 'VkPhysicalDeviceExtendedDynamicState3PropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  1509 | void DumpVkPhysicalDeviceExtendedDynamicState3PropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceExtendedDynamicState3PropertiesEXT &obj) {
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                 VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceExtendedDynamicState3PropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1512:82: error: request for member 'dynamicPrimitiveTopologyUnrestricted' in 'obj', which is of non-class type 'const int'
|  1512 |     p.PrintKeyBool("dynamicPrimitiveTopologyUnrestricted", static_cast<bool>(obj.dynamicPrimitiveTopologyUnrestricted));
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1524:79: error: 'VkPhysicalDeviceFaultFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|  1524 | void DumpVkPhysicalDeviceFaultFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceFaultFeaturesEXT &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                               VkPhysicalDeviceMultiDrawFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceFaultFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1527:57: error: request for member 'deviceFault' in 'obj', which is of non-class type 'const int'
|  1527 |     p.PrintKeyBool("deviceFault", static_cast<bool>(obj.deviceFault));
|       |                                                         ^~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1528:69: error: request for member 'deviceFaultVendorBinary' in 'obj', which is of non-class type 'const int'
|  1528 |     p.PrintKeyBool("deviceFaultVendorBinary", static_cast<bool>(obj.deviceFaultVendorBinary));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1777:89: error: 'VkPhysicalDeviceLegacyDitheringFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  1777 | void DumpVkPhysicalDeviceLegacyDitheringFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceLegacyDitheringFeaturesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLegacyDitheringFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1780:61: error: request for member 'legacyDithering' in 'obj', which is of non-class type 'const int'
|  1780 |     p.PrintKeyBool("legacyDithering", static_cast<bool>(obj.legacyDithering));
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1992:84: error: 'VkPhysicalDeviceMeshShaderFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMeshShaderFeaturesNV'?
|  1992 | void DumpVkPhysicalDeviceMeshShaderFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceMeshShaderFeaturesEXT &obj) {
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    VkPhysicalDeviceMeshShaderFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMeshShaderFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1995:56: error: request for member 'taskShader' in 'obj', which is of non-class type 'const int'
|  1995 |     p.PrintKeyBool("taskShader", static_cast<bool>(obj.taskShader));
|       |                                                        ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1996:56: error: request for member 'meshShader' in 'obj', which is of non-class type 'const int'
|  1996 |     p.PrintKeyBool("meshShader", static_cast<bool>(obj.meshShader));
|       |                                                        ^~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1997:65: error: request for member 'multiviewMeshShader' in 'obj', which is of non-class type 'const int'
|  1997 |     p.PrintKeyBool("multiviewMeshShader", static_cast<bool>(obj.multiviewMeshShader));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1998:84: error: request for member 'primitiveFragmentShadingRateMeshShader' in 'obj', which is of non-class type 'const int'
|  1998 |     p.PrintKeyBool("primitiveFragmentShadingRateMeshShader", static_cast<bool>(obj.primitiveFragmentShadingRateMeshShader));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1999:63: error: request for member 'meshShaderQueries' in 'obj', which is of non-class type 'const int'
|  1999 |     p.PrintKeyBool("meshShaderQueries", static_cast<bool>(obj.meshShaderQueries));
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2001:86: error: 'VkPhysicalDeviceMeshShaderPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceMeshShaderPropertiesNV'?
|  2001 | void DumpVkPhysicalDeviceMeshShaderPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceMeshShaderPropertiesEXT &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceMeshShaderPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMeshShaderPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2004:55: error: request for member 'maxTaskWorkGroupTotalCount' in 'obj', which is of non-class type 'const int'
|  2004 |     p.PrintKeyValue("maxTaskWorkGroupTotalCount", obj.maxTaskWorkGroupTotalCount);
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2006:28: error: request for member 'maxTaskWorkGroupCount' in 'obj', which is of non-class type 'const int'
|  2006 |         p.PrintElement(obj.maxTaskWorkGroupCount[0]);
|       |                            ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2007:28: error: request for member 'maxTaskWorkGroupCount' in 'obj', which is of non-class type 'const int'
|  2007 |         p.PrintElement(obj.maxTaskWorkGroupCount[1]);
|       |                            ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2008:28: error: request for member 'maxTaskWorkGroupCount' in 'obj', which is of non-class type 'const int'
|  2008 |         p.PrintElement(obj.maxTaskWorkGroupCount[2]);
|       |                            ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2010:56: error: request for member 'maxTaskWorkGroupInvocations' in 'obj', which is of non-class type 'const int'
|  2010 |     p.PrintKeyValue("maxTaskWorkGroupInvocations", obj.maxTaskWorkGroupInvocations);
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2012:28: error: request for member 'maxTaskWorkGroupSize' in 'obj', which is of non-class type 'const int'
|  2012 |         p.PrintElement(obj.maxTaskWorkGroupSize[0]);
|       |                            ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2013:28: error: request for member 'maxTaskWorkGroupSize' in 'obj', which is of non-class type 'const int'
|  2013 |         p.PrintElement(obj.maxTaskWorkGroupSize[1]);
|       |                            ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2014:28: error: request for member 'maxTaskWorkGroupSize' in 'obj', which is of non-class type 'const int'
|  2014 |         p.PrintElement(obj.maxTaskWorkGroupSize[2]);
|       |                            ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2016:47: error: request for member 'maxTaskPayloadSize' in 'obj', which is of non-class type 'const int'
|  2016 |     p.PrintKeyValue("maxTaskPayloadSize", obj.maxTaskPayloadSize);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2017:52: error: request for member 'maxTaskSharedMemorySize' in 'obj', which is of non-class type 'const int'
|  2017 |     p.PrintKeyValue("maxTaskSharedMemorySize", obj.maxTaskSharedMemorySize);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2018:62: error: request for member 'maxTaskPayloadAndSharedMemorySize' in 'obj', which is of non-class type 'const int'
|  2018 |     p.PrintKeyValue("maxTaskPayloadAndSharedMemorySize", obj.maxTaskPayloadAndSharedMemorySize);
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2019:55: error: request for member 'maxMeshWorkGroupTotalCount' in 'obj', which is of non-class type 'const int'
|  2019 |     p.PrintKeyValue("maxMeshWorkGroupTotalCount", obj.maxMeshWorkGroupTotalCount);
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2021:28: error: request for member 'maxMeshWorkGroupCount' in 'obj', which is of non-class type 'const int'
|  2021 |         p.PrintElement(obj.maxMeshWorkGroupCount[0]);
|       |                            ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2022:28: error: request for member 'maxMeshWorkGroupCount' in 'obj', which is of non-class type 'const int'
|  2022 |         p.PrintElement(obj.maxMeshWorkGroupCount[1]);
|       |                            ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2023:28: error: request for member 'maxMeshWorkGroupCount' in 'obj', which is of non-class type 'const int'
|  2023 |         p.PrintElement(obj.maxMeshWorkGroupCount[2]);
|       |                            ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2025:56: error: request for member 'maxMeshWorkGroupInvocations' in 'obj', which is of non-class type 'const int'
|  2025 |     p.PrintKeyValue("maxMeshWorkGroupInvocations", obj.maxMeshWorkGroupInvocations);
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2027:28: error: request for member 'maxMeshWorkGroupSize' in 'obj', which is of non-class type 'const int'
|  2027 |         p.PrintElement(obj.maxMeshWorkGroupSize[0]);
|       |                            ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2028:28: error: request for member 'maxMeshWorkGroupSize' in 'obj', which is of non-class type 'const int'
|  2028 |         p.PrintElement(obj.maxMeshWorkGroupSize[1]);
|       |                            ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2029:28: error: request for member 'maxMeshWorkGroupSize' in 'obj', which is of non-class type 'const int'
|  2029 |         p.PrintElement(obj.maxMeshWorkGroupSize[2]);
|       |                            ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2031:52: error: request for member 'maxMeshSharedMemorySize' in 'obj', which is of non-class type 'const int'
|  2031 |     p.PrintKeyValue("maxMeshSharedMemorySize", obj.maxMeshSharedMemorySize);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2032:62: error: request for member 'maxMeshPayloadAndSharedMemorySize' in 'obj', which is of non-class type 'const int'
|  2032 |     p.PrintKeyValue("maxMeshPayloadAndSharedMemorySize", obj.maxMeshPayloadAndSharedMemorySize);
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2033:52: error: request for member 'maxMeshOutputMemorySize' in 'obj', which is of non-class type 'const int'
|  2033 |     p.PrintKeyValue("maxMeshOutputMemorySize", obj.maxMeshOutputMemorySize);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2034:62: error: request for member 'maxMeshPayloadAndOutputMemorySize' in 'obj', which is of non-class type 'const int'
|  2034 |     p.PrintKeyValue("maxMeshPayloadAndOutputMemorySize", obj.maxMeshPayloadAndOutputMemorySize);
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2035:52: error: request for member 'maxMeshOutputComponents' in 'obj', which is of non-class type 'const int'
|  2035 |     p.PrintKeyValue("maxMeshOutputComponents", obj.maxMeshOutputComponents);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2036:50: error: request for member 'maxMeshOutputVertices' in 'obj', which is of non-class type 'const int'
|  2036 |     p.PrintKeyValue("maxMeshOutputVertices", obj.maxMeshOutputVertices);
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2037:52: error: request for member 'maxMeshOutputPrimitives' in 'obj', which is of non-class type 'const int'
|  2037 |     p.PrintKeyValue("maxMeshOutputPrimitives", obj.maxMeshOutputPrimitives);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2038:48: error: request for member 'maxMeshOutputLayers' in 'obj', which is of non-class type 'const int'
|  2038 |     p.PrintKeyValue("maxMeshOutputLayers", obj.maxMeshOutputLayers);
|       |                                                ^~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2039:54: error: request for member 'maxMeshMultiviewViewCount' in 'obj', which is of non-class type 'const int'
|  2039 |     p.PrintKeyValue("maxMeshMultiviewViewCount", obj.maxMeshMultiviewViewCount);
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2040:59: error: request for member 'meshOutputPerVertexGranularity' in 'obj', which is of non-class type 'const int'
|  2040 |     p.PrintKeyValue("meshOutputPerVertexGranularity", obj.meshOutputPerVertexGranularity);
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2041:62: error: request for member 'meshOutputPerPrimitiveGranularity' in 'obj', which is of non-class type 'const int'
|  2041 |     p.PrintKeyValue("meshOutputPerPrimitiveGranularity", obj.meshOutputPerPrimitiveGranularity);
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2042:65: error: request for member 'maxPreferredTaskWorkGroupInvocations' in 'obj', which is of non-class type 'const int'
|  2042 |     p.PrintKeyValue("maxPreferredTaskWorkGroupInvocations", obj.maxPreferredTaskWorkGroupInvocations);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2043:65: error: request for member 'maxPreferredMeshWorkGroupInvocations' in 'obj', which is of non-class type 'const int'
|  2043 |     p.PrintKeyValue("maxPreferredMeshWorkGroupInvocations", obj.maxPreferredMeshWorkGroupInvocations);
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2044:80: error: request for member 'prefersLocalInvocationVertexOutput' in 'obj', which is of non-class type 'const int'
|  2044 |     p.PrintKeyBool("prefersLocalInvocationVertexOutput", static_cast<bool>(obj.prefersLocalInvocationVertexOutput));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2045:83: error: request for member 'prefersLocalInvocationPrimitiveOutput' in 'obj', which is of non-class type 'const int'
|  2045 |     p.PrintKeyBool("prefersLocalInvocationPrimitiveOutput", static_cast<bool>(obj.prefersLocalInvocationPrimitiveOutput));
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2046:72: error: request for member 'prefersCompactVertexOutput' in 'obj', which is of non-class type 'const int'
|  2046 |     p.PrintKeyBool("prefersCompactVertexOutput", static_cast<bool>(obj.prefersCompactVertexOutput));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2047:75: error: request for member 'prefersCompactPrimitiveOutput' in 'obj', which is of non-class type 'const int'
|  2047 |     p.PrintKeyBool("prefersCompactPrimitiveOutput", static_cast<bool>(obj.prefersCompactPrimitiveOutput));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2077:95: error: 'VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE'?
|  2077 | void DumpVkPhysicalDeviceMutableDescriptorTypeFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT &obj) {
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMutableDescriptorTypeFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2080:67: error: request for member 'mutableDescriptorType' in 'obj', which is of non-class type 'const int'
|  2080 |     p.PrintKeyBool("mutableDescriptorType", static_cast<bool>(obj.mutableDescriptorType));
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2087:89: error: 'VkPhysicalDeviceOpacityMicromapFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|  2087 | void DumpVkPhysicalDeviceOpacityMicromapFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceOpacityMicromapFeaturesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDeviceMultiDrawFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceOpacityMicromapFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2090:54: error: request for member 'micromap' in 'obj', which is of non-class type 'const int'
|  2090 |     p.PrintKeyBool("micromap", static_cast<bool>(obj.micromap));
|       |                                                      ^~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2091:67: error: request for member 'micromapCaptureReplay' in 'obj', which is of non-class type 'const int'
|  2091 |     p.PrintKeyBool("micromapCaptureReplay", static_cast<bool>(obj.micromapCaptureReplay));
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2092:66: error: request for member 'micromapHostCommands' in 'obj', which is of non-class type 'const int'
|  2092 |     p.PrintKeyBool("micromapHostCommands", static_cast<bool>(obj.micromapHostCommands));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2094:91: error: 'VkPhysicalDeviceOpacityMicromapPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceMultiDrawPropertiesEXT'?
|  2094 | void DumpVkPhysicalDeviceOpacityMicromapPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceOpacityMicromapPropertiesEXT &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceMultiDrawPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceOpacityMicromapPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2097:61: error: request for member 'maxOpacity2StateSubdivisionLevel' in 'obj', which is of non-class type 'const int'
|  2097 |     p.PrintKeyValue("maxOpacity2StateSubdivisionLevel", obj.maxOpacity2StateSubdivisionLevel);
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2098:61: error: request for member 'maxOpacity4StateSubdivisionLevel' in 'obj', which is of non-class type 'const int'
|  2098 |     p.PrintKeyValue("maxOpacity4StateSubdivisionLevel", obj.maxOpacity4StateSubdivisionLevel);
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2139:97: error: 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  2139 | void DumpVkPhysicalDevicePipelineProtectedAccessFeaturesEXT(Printer &p, std::string name, const VkPhysicalDevicePipelineProtectedAccessFeaturesEXT &obj) {
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                 VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineProtectedAccessFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2142:69: error: request for member 'pipelineProtectedAccess' in 'obj', which is of non-class type 'const int'
|  2142 |     p.PrintKeyBool("pipelineProtectedAccess", static_cast<bool>(obj.pipelineProtectedAccess));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2248:108: error: 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM'?
|  2248 | void DumpVkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT &obj) {
|       |                                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                            VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2251:85: error: request for member 'rasterizationOrderColorAttachmentAccess' in 'obj', which is of non-class type 'const int'
|  2251 |     p.PrintKeyBool("rasterizationOrderColorAttachmentAccess", static_cast<bool>(obj.rasterizationOrderColorAttachmentAccess));
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2252:85: error: request for member 'rasterizationOrderDepthAttachmentAccess' in 'obj', which is of non-class type 'const int'
|  2252 |     p.PrintKeyBool("rasterizationOrderDepthAttachmentAccess", static_cast<bool>(obj.rasterizationOrderDepthAttachmentAccess));
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2253:87: error: request for member 'rasterizationOrderStencilAttachmentAccess' in 'obj', which is of non-class type 'const int'
|  2253 |     p.PrintKeyBool("rasterizationOrderStencilAttachmentAccess", static_cast<bool>(obj.rasterizationOrderStencilAttachmentAccess));
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2863:90: error: 'VkQueueFamilyQueryResultStatusPropertiesKHR' does not name a type; did you mean 'VkQueueFamilyQueryResultStatusProperties2KHR'?
|  2863 | void DumpVkQueueFamilyQueryResultStatusPropertiesKHR(Printer &p, std::string name, const VkQueueFamilyQueryResultStatusPropertiesKHR &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkQueueFamilyQueryResultStatusProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkQueueFamilyQueryResultStatusPropertiesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2866:70: error: request for member 'queryResultStatusSupport' in 'obj', which is of non-class type 'const int'
|  2866 |     p.PrintKeyBool("queryResultStatusSupport", static_cast<bool>(obj.queryResultStatusSupport));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2870:78: error: 'VkQueueFamilyVideoPropertiesKHR' does not name a type; did you mean 'VkQueueFamilyProperties2KHR'?
|  2870 | void DumpVkQueueFamilyVideoPropertiesKHR(Printer &p, std::string name, const VkQueueFamilyVideoPropertiesKHR &obj) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              VkQueueFamilyProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkQueueFamilyVideoPropertiesKHR(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2872:70: error: request for member 'videoCodecOperations' in 'obj', which is of non-class type 'const int'
|  2872 |     DumpVkVideoCodecOperationFlagsKHR(p, "videoCodecOperations", obj.videoCodecOperations);
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2931:5: error: 'VkPhysicalDeviceExtendedDynamicState3PropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  2931 |     VkPhysicalDeviceExtendedDynamicState3PropertiesEXT PhysicalDeviceExtendedDynamicState3PropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2944:5: error: 'VkPhysicalDeviceMeshShaderPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceMeshShaderPropertiesNV'?
|  2944 |     VkPhysicalDeviceMeshShaderPropertiesEXT PhysicalDeviceMeshShaderPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMeshShaderPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2947:5: error: 'VkPhysicalDeviceOpacityMicromapPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceMultiDrawPropertiesEXT'?
|  2947 |     VkPhysicalDeviceOpacityMicromapPropertiesEXT PhysicalDeviceOpacityMicromapPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMultiDrawPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2983:9: error: 'PhysicalDeviceExtendedDynamicState3PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicState3PropertiesEXT'?
|  2983 |         PhysicalDeviceExtendedDynamicState3PropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceExtendedDynamicState3PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2983:66: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT'?
|  2983 |         PhysicalDeviceExtendedDynamicState3PropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2996:9: error: 'PhysicalDeviceMeshShaderPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderPropertiesNV'?
|  2996 |         PhysicalDeviceMeshShaderPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceMeshShaderPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2996:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV'?
|  2996 |         PhysicalDeviceMeshShaderPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2999:9: error: 'PhysicalDeviceOpacityMicromapPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceOpacityMicromapPropertiesEXT'?
|  2999 |         PhysicalDeviceOpacityMicromapPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceOpacityMicromapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2999:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT'?
|  2999 |         PhysicalDeviceOpacityMicromapPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3125:5: error: 'VkPhysicalDeviceAddressBindingReportFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
|  3125 |     VkPhysicalDeviceAddressBindingReportFeaturesEXT PhysicalDeviceAddressBindingReportFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDeviceMemoryReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3134:5: error: 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDepthClipEnableFeaturesEXT'?
|  3134 |     VkPhysicalDeviceDepthClampZeroOneFeaturesEXT PhysicalDeviceDepthClampZeroOneFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDepthClipEnableFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3141:5: error: 'VkPhysicalDeviceExtendedDynamicState3FeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  3141 |     VkPhysicalDeviceExtendedDynamicState3FeaturesEXT PhysicalDeviceExtendedDynamicState3FeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3143:5: error: 'VkPhysicalDeviceFaultFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|  3143 |     VkPhysicalDeviceFaultFeaturesEXT PhysicalDeviceFaultFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMultiDrawFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3160:5: error: 'VkPhysicalDeviceLegacyDitheringFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  3160 |     VkPhysicalDeviceLegacyDitheringFeaturesEXT PhysicalDeviceLegacyDitheringFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3164:5: error: 'VkPhysicalDeviceMeshShaderFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMeshShaderFeaturesNV'?
|  3164 |     VkPhysicalDeviceMeshShaderFeaturesEXT PhysicalDeviceMeshShaderFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMeshShaderFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3168:5: error: 'VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE'?
|  3168 |     VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT PhysicalDeviceMutableDescriptorTypeFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3170:5: error: 'VkPhysicalDeviceOpacityMicromapFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|  3170 |     VkPhysicalDeviceOpacityMicromapFeaturesEXT PhysicalDeviceOpacityMicromapFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMultiDrawFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3176:5: error: 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  3176 |     VkPhysicalDevicePipelineProtectedAccessFeaturesEXT PhysicalDevicePipelineProtectedAccessFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3189:5: error: 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM'?
|  3189 |     VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3236:9: error: 'PhysicalDeviceAddressBindingReportFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAddressBindingReportFeaturesEXT'?
|  3236 |         PhysicalDeviceAddressBindingReportFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceAddressBindingReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3236:63: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT'?
|  3236 |         PhysicalDeviceAddressBindingReportFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3245:9: error: 'PhysicalDeviceDepthClampZeroOneFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDepthClampZeroOneFeaturesEXT'?
|  3245 |         PhysicalDeviceDepthClampZeroOneFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceDepthClampZeroOneFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3245:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT'?
|  3245 |         PhysicalDeviceDepthClampZeroOneFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3252:9: error: 'PhysicalDeviceExtendedDynamicState3FeaturesEXT' was not declared in this scope; did you mean 'PhysicalDeviceExtendedDynamicState2FeaturesEXT'?
|  3252 |         PhysicalDeviceExtendedDynamicState3FeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceExtendedDynamicState2FeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3252:64: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT'?
|  3252 |         PhysicalDeviceExtendedDynamicState3FeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3254:9: error: 'PhysicalDeviceFaultFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFaultFeaturesEXT'?
|  3254 |         PhysicalDeviceFaultFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceFaultFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3254:48: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT'?
|  3254 |         PhysicalDeviceFaultFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT;
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3271:9: error: 'PhysicalDeviceLegacyDitheringFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLegacyDitheringFeaturesEXT'?
|  3271 |         PhysicalDeviceLegacyDitheringFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceLegacyDitheringFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3271:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  3271 |         PhysicalDeviceLegacyDitheringFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3275:9: error: 'PhysicalDeviceMeshShaderFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderFeaturesNV'?
|  3275 |         PhysicalDeviceMeshShaderFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceMeshShaderFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3275:53: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV'?
|  3275 |         PhysicalDeviceMeshShaderFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3279:9: error: 'PhysicalDeviceMutableDescriptorTypeFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceMutableDescriptorTypeFeaturesEXT'?
|  3279 |         PhysicalDeviceMutableDescriptorTypeFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceMutableDescriptorTypeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3279:64: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE'?
|  3279 |         PhysicalDeviceMutableDescriptorTypeFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3281:9: error: 'PhysicalDeviceOpacityMicromapFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceOpacityMicromapFeaturesEXT'?
|  3281 |         PhysicalDeviceOpacityMicromapFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceOpacityMicromapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3281:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  3281 |         PhysicalDeviceOpacityMicromapFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3287:9: error: 'PhysicalDevicePipelineProtectedAccessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  3287 |         PhysicalDevicePipelineProtectedAccessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3287:66: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  3287 |         PhysicalDevicePipelineProtectedAccessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3300:9: error: 'PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM'?
|  3300 |         PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3300:77: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM'?
|  3300 |         PhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3534:5: error: 'VkQueueFamilyQueryResultStatusPropertiesKHR' does not name a type; did you mean 'VkQueueFamilyQueryResultStatusProperties2KHR'?
|  3534 |     VkQueueFamilyQueryResultStatusPropertiesKHR QueueFamilyQueryResultStatusPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyQueryResultStatusProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3537:5: error: 'VkQueueFamilyVideoPropertiesKHR' does not name a type; did you mean 'VkQueueFamilyProperties2KHR'?
|  3537 |     VkQueueFamilyVideoPropertiesKHR QueueFamilyVideoPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void queue_properties2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3542:9: error: 'QueueFamilyQueryResultStatusPropertiesKHR' was not declared in this scope; did you mean 'VkQueueFamilyQueryResultStatusProperties2KHR'?
|  3542 |         QueueFamilyQueryResultStatusPropertiesKHR.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkQueueFamilyQueryResultStatusProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3542:59: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_2_KHR'?
|  3542 |         QueueFamilyQueryResultStatusPropertiesKHR.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3545:9: error: 'QueueFamilyVideoPropertiesKHR' was not declared in this scope; did you mean 'DumpVkQueueFamilyVideoPropertiesKHR'?
|  3545 |         QueueFamilyVideoPropertiesKHR.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkQueueFamilyVideoPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3545:47: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR'?
|  3545 |         QueueFamilyVideoPropertiesKHR.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR;
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                               VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3628:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT'?
|  3628 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3629:54: error: 'VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_EXTENDED_DYNAMIC_STATE_2_EXTENSION_NAME'?
|  3629 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_EXTENDED_DYNAMIC_STATE_2_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3630:13: error: 'VkPhysicalDeviceExtendedDynamicState3PropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceExtendedDynamicState3PropertiesEXT'?
|  3630 |             VkPhysicalDeviceExtendedDynamicState3PropertiesEXT* props = (VkPhysicalDeviceExtendedDynamicState3PropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceExtendedDynamicState3PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3630:65: error: 'props' was not declared in this scope
|  3630 |             VkPhysicalDeviceExtendedDynamicState3PropertiesEXT* props = (VkPhysicalDeviceExtendedDynamicState3PropertiesEXT*)structure;
|       |                                                                 ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3630:125: error: expected primary-expression before ')' token
|  3630 |             VkPhysicalDeviceExtendedDynamicState3PropertiesEXT* props = (VkPhysicalDeviceExtendedDynamicState3PropertiesEXT*)structure;
|       |                                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3711:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV'?
|  3711 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3712:54: error: 'VK_EXT_MESH_SHADER_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_MESH_SHADER_EXTENSION_NAME'?
|  3712 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MESH_SHADER_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_MESH_SHADER_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3713:13: error: 'VkPhysicalDeviceMeshShaderPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderPropertiesNV'?
|  3713 |             VkPhysicalDeviceMeshShaderPropertiesEXT* props = (VkPhysicalDeviceMeshShaderPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMeshShaderPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3713:54: error: 'props' was not declared in this scope
|  3713 |             VkPhysicalDeviceMeshShaderPropertiesEXT* props = (VkPhysicalDeviceMeshShaderPropertiesEXT*)structure;
|       |                                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3713:103: error: expected primary-expression before ')' token
|  3713 |             VkPhysicalDeviceMeshShaderPropertiesEXT* props = (VkPhysicalDeviceMeshShaderPropertiesEXT*)structure;
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3730:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT'?
|  3730 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3731:54: error: 'VK_EXT_OPACITY_MICROMAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_PCI_BUS_INFO_EXTENSION_NAME'?
|  3731 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_OPACITY_MICROMAP_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_PCI_BUS_INFO_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3732:13: error: 'VkPhysicalDeviceOpacityMicromapPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceOpacityMicromapPropertiesEXT'?
|  3732 |             VkPhysicalDeviceOpacityMicromapPropertiesEXT* props = (VkPhysicalDeviceOpacityMicromapPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceOpacityMicromapPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3732:59: error: 'props' was not declared in this scope
|  3732 |             VkPhysicalDeviceOpacityMicromapPropertiesEXT* props = (VkPhysicalDeviceOpacityMicromapPropertiesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3732:113: error: expected primary-expression before ')' token
|  3732 |             VkPhysicalDeviceOpacityMicromapPropertiesEXT* props = (VkPhysicalDeviceOpacityMicromapPropertiesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3921:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT'?
|  3921 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3922:54: error: 'VK_EXT_DEVICE_ADDRESS_BINDING_REPORT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME'?
|  3922 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEVICE_ADDRESS_BINDING_REPORT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEVICE_MEMORY_REPORT_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3923:13: error: 'VkPhysicalDeviceAddressBindingReportFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAddressBindingReportFeaturesEXT'?
|  3923 |             VkPhysicalDeviceAddressBindingReportFeaturesEXT* props = (VkPhysicalDeviceAddressBindingReportFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceAddressBindingReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3923:62: error: 'props' was not declared in this scope
|  3923 |             VkPhysicalDeviceAddressBindingReportFeaturesEXT* props = (VkPhysicalDeviceAddressBindingReportFeaturesEXT*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3923:119: error: expected primary-expression before ')' token
|  3923 |             VkPhysicalDeviceAddressBindingReportFeaturesEXT* props = (VkPhysicalDeviceAddressBindingReportFeaturesEXT*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3976:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT'?
|  3976 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3977:54: error: 'VK_EXT_DEPTH_CLAMP_ZERO_ONE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEPTH_CLIP_ENABLE_EXTENSION_NAME'?
|  3977 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEPTH_CLAMP_ZERO_ONE_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEPTH_CLIP_ENABLE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3978:13: error: 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceDepthClampZeroOneFeaturesEXT'?
|  3978 |             VkPhysicalDeviceDepthClampZeroOneFeaturesEXT* props = (VkPhysicalDeviceDepthClampZeroOneFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceDepthClampZeroOneFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3978:59: error: 'props' was not declared in this scope
|  3978 |             VkPhysicalDeviceDepthClampZeroOneFeaturesEXT* props = (VkPhysicalDeviceDepthClampZeroOneFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3978:113: error: expected primary-expression before ')' token
|  3978 |             VkPhysicalDeviceDepthClampZeroOneFeaturesEXT* props = (VkPhysicalDeviceDepthClampZeroOneFeaturesEXT*)structure;
|       |                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4020:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT'?
|  4020 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4021:54: error: 'VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_EXTENDED_DYNAMIC_STATE_2_EXTENSION_NAME'?
|  4021 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_EXTENDED_DYNAMIC_STATE_2_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4022:13: error: 'VkPhysicalDeviceExtendedDynamicState3FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  4022 |             VkPhysicalDeviceExtendedDynamicState3FeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicState3FeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4022:63: error: 'props' was not declared in this scope
|  4022 |             VkPhysicalDeviceExtendedDynamicState3FeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicState3FeaturesEXT*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4022:121: error: expected primary-expression before ')' token
|  4022 |             VkPhysicalDeviceExtendedDynamicState3FeaturesEXT* props = (VkPhysicalDeviceExtendedDynamicState3FeaturesEXT*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4032:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT'?
|  4032 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4033:54: error: 'VK_EXT_DEVICE_FAULT_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_DEVICE_GROUP_EXTENSION_NAME'?
|  4033 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEVICE_FAULT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_DEVICE_GROUP_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4034:13: error: 'VkPhysicalDeviceFaultFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceFaultFeaturesEXT'?
|  4034 |             VkPhysicalDeviceFaultFeaturesEXT* props = (VkPhysicalDeviceFaultFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceFaultFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4034:47: error: 'props' was not declared in this scope
|  4034 |             VkPhysicalDeviceFaultFeaturesEXT* props = (VkPhysicalDeviceFaultFeaturesEXT*)structure;
|       |                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4034:89: error: expected primary-expression before ')' token
|  4034 |             VkPhysicalDeviceFaultFeaturesEXT* props = (VkPhysicalDeviceFaultFeaturesEXT*)structure;
|       |                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4138:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  4138 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4139:54: error: 'VK_EXT_LEGACY_DITHERING_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_MEMORY_PRIORITY_EXTENSION_NAME'?
|  4139 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_LEGACY_DITHERING_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_MEMORY_PRIORITY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4140:13: error: 'VkPhysicalDeviceLegacyDitheringFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceLegacyDitheringFeaturesEXT'?
|  4140 |             VkPhysicalDeviceLegacyDitheringFeaturesEXT* props = (VkPhysicalDeviceLegacyDitheringFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceLegacyDitheringFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4140:57: error: 'props' was not declared in this scope
|  4140 |             VkPhysicalDeviceLegacyDitheringFeaturesEXT* props = (VkPhysicalDeviceLegacyDitheringFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4140:109: error: expected primary-expression before ')' token
|  4140 |             VkPhysicalDeviceLegacyDitheringFeaturesEXT* props = (VkPhysicalDeviceLegacyDitheringFeaturesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4163:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV'?
|  4163 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4164:54: error: 'VK_EXT_MESH_SHADER_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_MESH_SHADER_EXTENSION_NAME'?
|  4164 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MESH_SHADER_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_MESH_SHADER_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4165:13: error: 'VkPhysicalDeviceMeshShaderFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderFeaturesNV'?
|  4165 |             VkPhysicalDeviceMeshShaderFeaturesEXT* props = (VkPhysicalDeviceMeshShaderFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMeshShaderFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4165:52: error: 'props' was not declared in this scope
|  4165 |             VkPhysicalDeviceMeshShaderFeaturesEXT* props = (VkPhysicalDeviceMeshShaderFeaturesEXT*)structure;
|       |                                                    ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4165:99: error: expected primary-expression before ')' token
|  4165 |             VkPhysicalDeviceMeshShaderFeaturesEXT* props = (VkPhysicalDeviceMeshShaderFeaturesEXT*)structure;
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4188:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE'?
|  4188 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4189:147: error: 'VK_EXT_MUTABLE_DESCRIPTOR_TYPE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_VALVE_MUTABLE_DESCRIPTOR_TYPE_EXTENSION_NAME'?
|  4189 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_VALVE_MUTABLE_DESCRIPTOR_TYPE_EXTENSION_NAME) || gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MUTABLE_DESCRIPTOR_TYPE_EXTENSION_NAME))) {
|       |                                                                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                                                   VK_VALVE_MUTABLE_DESCRIPTOR_TYPE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4190:13: error: 'VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceMutableDescriptorTypeFeaturesEXT'?
|  4190 |             VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT* props = (VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceMutableDescriptorTypeFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4190:63: error: 'props' was not declared in this scope
|  4190 |             VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT* props = (VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT*)structure;
|       |                                                               ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4190:121: error: expected primary-expression before ')' token
|  4190 |             VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT* props = (VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT*)structure;
|       |                                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4200:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  4200 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4201:54: error: 'VK_EXT_OPACITY_MICROMAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_PCI_BUS_INFO_EXTENSION_NAME'?
|  4201 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_OPACITY_MICROMAP_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_PCI_BUS_INFO_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4202:13: error: 'VkPhysicalDeviceOpacityMicromapFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceOpacityMicromapFeaturesEXT'?
|  4202 |             VkPhysicalDeviceOpacityMicromapFeaturesEXT* props = (VkPhysicalDeviceOpacityMicromapFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceOpacityMicromapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4202:57: error: 'props' was not declared in this scope
|  4202 |             VkPhysicalDeviceOpacityMicromapFeaturesEXT* props = (VkPhysicalDeviceOpacityMicromapFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4202:109: error: expected primary-expression before ')' token
|  4202 |             VkPhysicalDeviceOpacityMicromapFeaturesEXT* props = (VkPhysicalDeviceOpacityMicromapFeaturesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4237:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  4237 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4238:54: error: 'VK_EXT_PIPELINE_PROTECTED_ACCESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_PIPELINE_PROPERTIES_EXTENSION_NAME'?
|  4238 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PIPELINE_PROTECTED_ACCESS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_PIPELINE_PROPERTIES_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4239:13: error: 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  4239 |             VkPhysicalDevicePipelineProtectedAccessFeaturesEXT* props = (VkPhysicalDevicePipelineProtectedAccessFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4239:65: error: 'props' was not declared in this scope
|  4239 |             VkPhysicalDevicePipelineProtectedAccessFeaturesEXT* props = (VkPhysicalDevicePipelineProtectedAccessFeaturesEXT*)structure;
|       |                                                                 ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4239:125: error: expected primary-expression before ')' token
|  4239 |             VkPhysicalDevicePipelineProtectedAccessFeaturesEXT* props = (VkPhysicalDevicePipelineProtectedAccessFeaturesEXT*)structure;
|       |                                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4306:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM'?
|  4306 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4307:159: error: 'VK_EXT_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_ARM_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_EXTENSION_NAME'?
|  4307 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_ARM_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_EXTENSION_NAME) || gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_EXTENSION_NAME))) {
|       |                                                                                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                                                               VK_ARM_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4308:13: error: 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM'?
|  4308 |             VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT* props = (VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4308:76: error: 'props' was not declared in this scope
|  4308 |             VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT* props = (VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT*)structure;
|       |                                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4308:147: error: expected primary-expression before ')' token
|  4308 |             VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT* props = (VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT*)structure;
|       |                                                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_queue_properties2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4624:33: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_2_KHR'?
|  4624 |         if (structure->sType == VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4626:13: error: 'VkQueueFamilyQueryResultStatusPropertiesKHR' was not declared in this scope; did you mean 'VkQueueFamilyQueryResultStatusProperties2KHR'?
|  4626 |             VkQueueFamilyQueryResultStatusPropertiesKHR* props = (VkQueueFamilyQueryResultStatusPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkQueueFamilyQueryResultStatusProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4626:58: error: 'props' was not declared in this scope
|  4626 |             VkQueueFamilyQueryResultStatusPropertiesKHR* props = (VkQueueFamilyQueryResultStatusPropertiesKHR*)structure;
|       |                                                          ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4626:111: error: expected primary-expression before ')' token
|  4626 |             VkQueueFamilyQueryResultStatusPropertiesKHR* props = (VkQueueFamilyQueryResultStatusPropertiesKHR*)structure;
|       |                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4632:33: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR'?
|  4632 |         if (structure->sType == VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4634:13: error: 'VkQueueFamilyVideoPropertiesKHR' was not declared in this scope; did you mean 'DumpVkQueueFamilyVideoPropertiesKHR'?
|  4634 |             VkQueueFamilyVideoPropertiesKHR* props = (VkQueueFamilyVideoPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkQueueFamilyVideoPropertiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4634:46: error: 'props' was not declared in this scope
|  4634 |             VkQueueFamilyVideoPropertiesKHR* props = (VkQueueFamilyVideoPropertiesKHR*)structure;
|       |                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4634:87: error: expected primary-expression before ')' token
|  4634 |             VkQueueFamilyVideoPropertiesKHR* props = (VkQueueFamilyVideoPropertiesKHR*)structure;
|       |                                                                                       ^
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/
 core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build=/usr/src/debug/vulkan-tools/1.3.231.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:1758:11: error: 'VkVideoProfileInfoKHR' does not name a type; did you mean 'VkVideoProfilesKHR'?
|  1758 |     const VkVideoProfileInfoKHR*                pVideoProfile,
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkVideoProfilesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:1782:5: error: 'VkVideoSessionMemoryRequirementsKHR' has not been declared
|  1782 |     VkVideoSessionMemoryRequirementsKHR*        pMemoryRequirements);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:1788:11: error: 'VkBindVideoSessionMemoryInfoKHR' does not name a type; did you mean 'PFN_vkBindVideoSessionMemoryKHR'?
|  1788 |     const VkBindVideoSessionMemoryInfoKHR*      pBindSessionMemoryInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           PFN_vkBindVideoSessionMemoryKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3384:5: error: 'VkDeviceFaultCountsEXT' has not been declared
|  3384 |     VkDeviceFaultCountsEXT*                     pFaultCounts,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3385:5: error: 'VkDeviceFaultInfoEXT' has not been declared
|  3385 |     VkDeviceFaultInfoEXT*                       pFaultInfo);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3577:11: error: 'VkMicromapCreateInfoEXT' does not name a type
|  3577 |     const VkMicromapCreateInfoEXT*              pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3579:5: error: 'VkMicromapEXT' has not been declared
|  3579 |     VkMicromapEXT*                              pMicromap);
|       |     ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3583:5: error: 'VkMicromapEXT' has not been declared
|  3583 |     VkMicromapEXT                               micromap,
|       |     ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3589:11: error: 'VkMicromapBuildInfoEXT' does not name a type
|  3589 |     const VkMicromapBuildInfoEXT*               pInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3595:11: error: 'VkMicromapBuildInfoEXT' does not name a type
|  3595 |     const VkMicromapBuildInfoEXT*               pInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3600:11: error: 'VkCopyMicromapInfoEXT' does not name a type
|  3600 |     const VkCopyMicromapInfoEXT*                pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3605:11: error: 'VkCopyMicromapToMemoryInfoEXT' does not name a type
|  3605 |     const VkCopyMicromapToMemoryInfoEXT*        pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3610:11: error: 'VkCopyMemoryToMicromapInfoEXT' does not name a type
|  3610 |     const VkCopyMemoryToMicromapInfoEXT*        pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3615:11: error: 'VkMicromapEXT' does not name a type
|  3615 |     const VkMicromapEXT*                        pMicromaps,
|       |           ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3623:11: error: 'VkCopyMicromapInfoEXT' does not name a type
|  3623 |     const VkCopyMicromapInfoEXT*                pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3627:11: error: 'VkCopyMicromapToMemoryInfoEXT' does not name a type
|  3627 |     const VkCopyMicromapToMemoryInfoEXT*        pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3631:11: error: 'VkCopyMemoryToMicromapInfoEXT' does not name a type
|  3631 |     const VkCopyMemoryToMicromapInfoEXT*        pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3636:11: error: 'VkMicromapEXT' does not name a type
|  3636 |     const VkMicromapEXT*                        pMicromaps,
|       |           ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3643:11: error: 'VkMicromapVersionInfoEXT' does not name a type
|  3643 |     const VkMicromapVersionInfoEXT*             pVersionInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3649:11: error: 'VkMicromapBuildInfoEXT' does not name a type
|  3649 |     const VkMicromapBuildInfoEXT*               pBuildInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3650:5: error: 'VkMicromapBuildSizesInfoEXT' has not been declared
|  3650 |     VkMicromapBuildSizesInfoEXT*                pSizeInfo);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3722:11: error: 'VkColorBlendEquationEXT' does not name a type
|  3722 |     const VkColorBlendEquationEXT*              pColorBlendEquations);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3754:11: error: 'VkColorBlendAdvancedEXT' does not name a type
|  3754 |     const VkColorBlendAdvancedEXT*              pColorBlendAdvanced);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3831:11: error: 'VkOpticalFlowImageFormatInfoNV' does not name a type
|  3831 |     const VkOpticalFlowImageFormatInfoNV*       pOpticalFlowImageFormatInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3833:5: error: 'VkOpticalFlowImageFormatPropertiesNV' has not been declared
|  3833 |     VkOpticalFlowImageFormatPropertiesNV*       pImageFormatProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3837:11: error: 'VkOpticalFlowSessionCreateInfoNV' does not name a type
|  3837 |     const VkOpticalFlowSessionCreateInfoNV*     pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3839:5: error: 'VkOpticalFlowSessionNV' has not been declared
|  3839 |     VkOpticalFlowSessionNV*                     pSession);
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3843:5: error: 'VkOpticalFlowSessionNV' has not been declared
|  3843 |     VkOpticalFlowSessionNV                      session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3848:5: error: 'VkOpticalFlowSessionNV' has not been declared
|  3848 |     VkOpticalFlowSessionNV                      session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3849:5: error: 'VkOpticalFlowSessionBindingPointNV' has not been declared
|  3849 |     VkOpticalFlowSessionBindingPointNV          bindingPoint,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3855:5: error: 'VkOpticalFlowSessionNV' has not been declared
|  3855 |     VkOpticalFlowSessionNV                      session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.h:3856:11: error: 'VkOpticalFlowExecuteInfoNV' does not name a type
|  3856 |     const VkOpticalFlowExecuteInfoNV*           pExecuteInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2124:31: error: 'VkQueueFamilyQueryResultStatusPropertiesKHR' was not declared in this scope; did you mean 'VkQueueFamilyQueryResultStatusProperties2KHR'?
|  2124 | template <> struct LvlTypeMap<VkQueueFamilyQueryResultStatusPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkQueueFamilyQueryResultStatusProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2124:74: error: template argument 1 is invalid
|  2124 | template <> struct LvlTypeMap<VkQueueFamilyQueryResultStatusPropertiesKHR> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2128:32: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_2_KHR'?
|  2128 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2128:97: error: template argument 1 is invalid
|  2128 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR> {
|       |                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2135:31: error: 'VkQueueFamilyVideoPropertiesKHR' was not declared in this scope; did you mean 'VkQueueFamilyProperties2KHR'?
|  2135 | template <> struct LvlTypeMap<VkQueueFamilyVideoPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkQueueFamilyProperties2KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2135:62: error: template argument 1 is invalid
|  2135 | template <> struct LvlTypeMap<VkQueueFamilyVideoPropertiesKHR> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2139:32: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR'?
|  2139 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2139:83: error: template argument 1 is invalid
|  2139 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_VIDEO_PROPERTIES_KHR> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2146:31: error: 'VkVideoProfileInfoKHR' was not declared in this scope; did you mean 'VkVideoProfilesKHR'?
|  2146 | template <> struct LvlTypeMap<VkVideoProfileInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoProfilesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2146:52: error: template argument 1 is invalid
|  2146 | template <> struct LvlTypeMap<VkVideoProfileInfoKHR> {
|       |                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2150:32: error: 'VK_STRUCTURE_TYPE_VIDEO_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_PROFILE_KHR'?
|  2150 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_PROFILE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_PROFILE_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2150:72: error: template argument 1 is invalid
|  2150 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_PROFILE_INFO_KHR> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2157:31: error: 'VkVideoProfileListInfoKHR' was not declared in this scope; did you mean 'VkVideoProfilesKHR'?
|  2157 | template <> struct LvlTypeMap<VkVideoProfileListInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoProfilesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2157:56: error: template argument 1 is invalid
|  2157 | template <> struct LvlTypeMap<VkVideoProfileListInfoKHR> {
|       |                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2161:32: error: 'VK_STRUCTURE_TYPE_VIDEO_PROFILE_LIST_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_PROFILES_KHR'?
|  2161 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_PROFILE_LIST_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_PROFILES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2161:77: error: template argument 1 is invalid
|  2161 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_PROFILE_LIST_INFO_KHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2201:31: error: 'VkVideoPictureResourceInfoKHR' was not declared in this scope; did you mean 'VkVideoPictureResourceKHR'?
|  2201 | template <> struct LvlTypeMap<VkVideoPictureResourceInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoPictureResourceKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2201:60: error: template argument 1 is invalid
|  2201 | template <> struct LvlTypeMap<VkVideoPictureResourceInfoKHR> {
|       |                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2205:32: error: 'VK_STRUCTURE_TYPE_VIDEO_PICTURE_RESOURCE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_PICTURE_RESOURCE_KHR'?
|  2205 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_PICTURE_RESOURCE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_PICTURE_RESOURCE_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2205:81: error: template argument 1 is invalid
|  2205 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_PICTURE_RESOURCE_INFO_KHR> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2212:31: error: 'VkVideoReferenceSlotInfoKHR' was not declared in this scope; did you mean 'VkVideoReferenceSlotKHR'?
|  2212 | template <> struct LvlTypeMap<VkVideoReferenceSlotInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoReferenceSlotKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2212:58: error: template argument 1 is invalid
|  2212 | template <> struct LvlTypeMap<VkVideoReferenceSlotInfoKHR> {
|       |                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2216:32: error: 'VK_STRUCTURE_TYPE_VIDEO_REFERENCE_SLOT_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_REFERENCE_SLOT_KHR'?
|  2216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_REFERENCE_SLOT_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_REFERENCE_SLOT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2216:79: error: template argument 1 is invalid
|  2216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_REFERENCE_SLOT_INFO_KHR> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2223:31: error: 'VkVideoSessionMemoryRequirementsKHR' was not declared in this scope; did you mean 'vkGetVideoSessionMemoryRequirementsKHR'?
|  2223 | template <> struct LvlTypeMap<VkVideoSessionMemoryRequirementsKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               vkGetVideoSessionMemoryRequirementsKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2223:66: error: template argument 1 is invalid
|  2223 | template <> struct LvlTypeMap<VkVideoSessionMemoryRequirementsKHR> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2227:32: error: 'VK_STRUCTURE_TYPE_VIDEO_SESSION_MEMORY_REQUIREMENTS_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS_KHR'?
|  2227 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_SESSION_MEMORY_REQUIREMENTS_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_IMAGE_MEMORY_REQUIREMENTS_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2227:87: error: template argument 1 is invalid
|  2227 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_SESSION_MEMORY_REQUIREMENTS_KHR> {
|       |                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2234:31: error: 'VkBindVideoSessionMemoryInfoKHR' was not declared in this scope; did you mean 'vkBindVideoSessionMemoryKHR'?
|  2234 | template <> struct LvlTypeMap<VkBindVideoSessionMemoryInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               vkBindVideoSessionMemoryKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2234:62: error: template argument 1 is invalid
|  2234 | template <> struct LvlTypeMap<VkBindVideoSessionMemoryInfoKHR> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2238:32: error: 'VK_STRUCTURE_TYPE_BIND_VIDEO_SESSION_MEMORY_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_SESSION_CREATE_INFO_KHR'?
|  2238 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_VIDEO_SESSION_MEMORY_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_SESSION_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2238:84: error: template argument 1 is invalid
|  2238 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_VIDEO_SESSION_MEMORY_INFO_KHR> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2322:31: error: 'VkVideoDecodeUsageInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeInfoKHR'?
|  2322 | template <> struct LvlTypeMap<VkVideoDecodeUsageInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2322:56: error: template argument 1 is invalid
|  2322 | template <> struct LvlTypeMap<VkVideoDecodeUsageInfoKHR> {
|       |                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2326:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_USAGE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_INFO_KHR'?
|  2326 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_USAGE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2326:77: error: template argument 1 is invalid
|  2326 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_USAGE_INFO_KHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2961:31: error: 'VkVideoEncodeUsageInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeInfoKHR'?
|  2961 | template <> struct LvlTypeMap<VkVideoEncodeUsageInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeInfoKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2961:56: error: template argument 1 is invalid
|  2961 | template <> struct LvlTypeMap<VkVideoEncodeUsageInfoKHR> {
|       |                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2965:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_USAGE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_INFO_KHR'?
|  2965 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_USAGE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:2965:77: error: template argument 1 is invalid
|  2965 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_USAGE_INFO_KHR> {
|       |                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3245:31: error: 'VkVideoEncodeH264ReferenceListsInfoEXT' was not declared in this scope; did you mean 'VkVideoEncodeH264ReferenceListsEXT'?
|  3245 | template <> struct LvlTypeMap<VkVideoEncodeH264ReferenceListsInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH264ReferenceListsEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3245:69: error: template argument 1 is invalid
|  3245 | template <> struct LvlTypeMap<VkVideoEncodeH264ReferenceListsInfoEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3249:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_REFERENCE_LISTS_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_REFERENCE_LISTS_EXT'?
|  3249 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_REFERENCE_LISTS_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_REFERENCE_LISTS_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3249:92: error: template argument 1 is invalid
|  3249 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_REFERENCE_LISTS_INFO_EXT> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3256:31: error: 'VkVideoEncodeH264NaluSliceInfoEXT' was not declared in this scope; did you mean 'VkVideoEncodeH264NaluSliceEXT'?
|  3256 | template <> struct LvlTypeMap<VkVideoEncodeH264NaluSliceInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH264NaluSliceEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3256:64: error: template argument 1 is invalid
|  3256 | template <> struct LvlTypeMap<VkVideoEncodeH264NaluSliceInfoEXT> {
|       |                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3260:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_NALU_SLICE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_NALU_SLICE_EXT'?
|  3260 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_NALU_SLICE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_NALU_SLICE_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3260:87: error: template argument 1 is invalid
|  3260 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_NALU_SLICE_INFO_EXT> {
|       |                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3278:31: error: 'VkVideoEncodeH264EmitPictureParametersInfoEXT' was not declared in this scope; did you mean 'VkVideoEncodeH264EmitPictureParametersEXT'?
|  3278 | template <> struct LvlTypeMap<VkVideoEncodeH264EmitPictureParametersInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH264EmitPictureParametersEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3278:76: error: template argument 1 is invalid
|  3278 | template <> struct LvlTypeMap<VkVideoEncodeH264EmitPictureParametersInfoEXT> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3282:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_EMIT_PICTURE_PARAMETERS_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_EMIT_PICTURE_PARAMETERS_EXT'?
|  3282 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_EMIT_PICTURE_PARAMETERS_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_EMIT_PICTURE_PARAMETERS_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3282:100: error: template argument 1 is invalid
|  3282 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_EMIT_PICTURE_PARAMETERS_INFO_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3289:31: error: 'VkVideoEncodeH264ProfileInfoEXT' was not declared in this scope; did you mean 'VkVideoEncodeH264ProfileEXT'?
|  3289 | template <> struct LvlTypeMap<VkVideoEncodeH264ProfileInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH264ProfileEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3289:62: error: template argument 1 is invalid
|  3289 | template <> struct LvlTypeMap<VkVideoEncodeH264ProfileInfoEXT> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3293:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_PROFILE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_PROFILE_EXT'?
|  3293 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_PROFILE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_PROFILE_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3293:84: error: template argument 1 is invalid
|  3293 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_PROFILE_INFO_EXT> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3366:31: error: 'VkVideoEncodeH265ReferenceListsInfoEXT' was not declared in this scope; did you mean 'VkVideoEncodeH265ReferenceListsEXT'?
|  3366 | template <> struct LvlTypeMap<VkVideoEncodeH265ReferenceListsInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265ReferenceListsEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3366:69: error: template argument 1 is invalid
|  3366 | template <> struct LvlTypeMap<VkVideoEncodeH265ReferenceListsInfoEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3370:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_REFERENCE_LISTS_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_REFERENCE_LISTS_EXT'?
|  3370 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_REFERENCE_LISTS_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_REFERENCE_LISTS_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3370:92: error: template argument 1 is invalid
|  3370 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_REFERENCE_LISTS_INFO_EXT> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3377:31: error: 'VkVideoEncodeH265NaluSliceSegmentInfoEXT' was not declared in this scope; did you mean 'VkVideoEncodeH265NaluSliceSegmentEXT'?
|  3377 | template <> struct LvlTypeMap<VkVideoEncodeH265NaluSliceSegmentInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265NaluSliceSegmentEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3377:71: error: template argument 1 is invalid
|  3377 | template <> struct LvlTypeMap<VkVideoEncodeH265NaluSliceSegmentInfoEXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3381:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_EXT'?
|  3381 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3381:95: error: template argument 1 is invalid
|  3381 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_INFO_EXT> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3399:31: error: 'VkVideoEncodeH265EmitPictureParametersInfoEXT' was not declared in this scope; did you mean 'VkVideoEncodeH265EmitPictureParametersEXT'?
|  3399 | template <> struct LvlTypeMap<VkVideoEncodeH265EmitPictureParametersInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265EmitPictureParametersEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3399:76: error: template argument 1 is invalid
|  3399 | template <> struct LvlTypeMap<VkVideoEncodeH265EmitPictureParametersInfoEXT> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3403:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_EMIT_PICTURE_PARAMETERS_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_EMIT_PICTURE_PARAMETERS_EXT'?
|  3403 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_EMIT_PICTURE_PARAMETERS_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_EMIT_PICTURE_PARAMETERS_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3403:100: error: template argument 1 is invalid
|  3403 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_EMIT_PICTURE_PARAMETERS_INFO_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3410:31: error: 'VkVideoEncodeH265ProfileInfoEXT' was not declared in this scope; did you mean 'VkVideoEncodeH265ProfileEXT'?
|  3410 | template <> struct LvlTypeMap<VkVideoEncodeH265ProfileInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265ProfileEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3410:62: error: template argument 1 is invalid
|  3410 | template <> struct LvlTypeMap<VkVideoEncodeH265ProfileInfoEXT> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3414:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_PROFILE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_PROFILE_EXT'?
|  3414 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_PROFILE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_PROFILE_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3414:84: error: template argument 1 is invalid
|  3414 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_PROFILE_INFO_EXT> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3443:31: error: 'VkVideoDecodeH264ProfileInfoEXT' was not declared in this scope; did you mean 'VkVideoDecodeH264ProfileEXT'?
|  3443 | template <> struct LvlTypeMap<VkVideoDecodeH264ProfileInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH264ProfileEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3443:62: error: template argument 1 is invalid
|  3443 | template <> struct LvlTypeMap<VkVideoDecodeH264ProfileInfoEXT> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3447:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_PROFILE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_PROFILE_EXT'?
|  3447 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_PROFILE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_PROFILE_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:3447:84: error: template argument 1 is invalid
|  3447 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_PROFILE_INFO_EXT> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:4374:31: error: 'VkVideoDecodeH265ProfileInfoEXT' was not declared in this scope; did you mean 'VkVideoDecodeH265ProfileEXT'?
|  4374 | template <> struct LvlTypeMap<VkVideoDecodeH265ProfileInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH265ProfileEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:4374:62: error: template argument 1 is invalid
|  4374 | template <> struct LvlTypeMap<VkVideoDecodeH265ProfileInfoEXT> {
|       |                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:4378:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PROFILE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PROFILE_EXT'?
|  4378 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PROFILE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PROFILE_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:4378:84: error: template argument 1 is invalid
|  4378 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_PROFILE_INFO_EXT> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5180:31: error: 'VkPhysicalDevicePresentBarrierFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDevicePresentWaitFeaturesKHR'?
|  5180 | template <> struct LvlTypeMap<VkPhysicalDevicePresentBarrierFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePresentWaitFeaturesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5180:71: error: template argument 1 is invalid
|  5180 | template <> struct LvlTypeMap<VkPhysicalDevicePresentBarrierFeaturesNV> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5184:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_BARRIER_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR'?
|  5184 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_BARRIER_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5184:93: error: template argument 1 is invalid
|  5184 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_BARRIER_FEATURES_NV> {
|       |                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5189:31: error: 'VkSurfaceCapabilitiesPresentBarrierNV' was not declared in this scope
|  5189 | template <> struct LvlTypeMap<VkSurfaceCapabilitiesPresentBarrierNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5189:68: error: template argument 1 is invalid
|  5189 | template <> struct LvlTypeMap<VkSurfaceCapabilitiesPresentBarrierNV> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5193:32: error: 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR'?
|  5193 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5193:89: error: template argument 1 is invalid
|  5193 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_PRESENT_BARRIER_NV> {
|       |                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5198:31: error: 'VkSwapchainPresentBarrierCreateInfoNV' was not declared in this scope; did you mean 'VkSwapchainCounterCreateInfoEXT'?
|  5198 | template <> struct LvlTypeMap<VkSwapchainPresentBarrierCreateInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSwapchainCounterCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5198:68: error: template argument 1 is invalid
|  5198 | template <> struct LvlTypeMap<VkSwapchainPresentBarrierCreateInfoNV> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5202:32: error: 'VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_BARRIER_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT'?
|  5202 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_BARRIER_CREATE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_COUNTER_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5202:90: error: template argument 1 is invalid
|  5202 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SWAPCHAIN_PRESENT_BARRIER_CREATE_INFO_NV> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5546:31: error: 'VkPhysicalDeviceFaultFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|  5546 | template <> struct LvlTypeMap<VkPhysicalDeviceFaultFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMultiDrawFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5546:63: error: template argument 1 is invalid
|  5546 | template <> struct LvlTypeMap<VkPhysicalDeviceFaultFeaturesEXT> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5550:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT'?
|  5550 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5550:84: error: template argument 1 is invalid
|  5550 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FAULT_FEATURES_EXT> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5555:31: error: 'VkDeviceFaultCountsEXT' was not declared in this scope
|  5555 | template <> struct LvlTypeMap<VkDeviceFaultCountsEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5555:53: error: template argument 1 is invalid
|  5555 | template <> struct LvlTypeMap<VkDeviceFaultCountsEXT> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5559:32: error: 'VK_STRUCTURE_TYPE_DEVICE_FAULT_COUNTS_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT'?
|  5559 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_FAULT_COUNTS_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5559:73: error: template argument 1 is invalid
|  5559 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_FAULT_COUNTS_EXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5564:31: error: 'VkDeviceFaultInfoEXT' was not declared in this scope; did you mean 'VkDeviceEventInfoEXT'?
|  5564 | template <> struct LvlTypeMap<VkDeviceFaultInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~
|       |                               VkDeviceEventInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5564:51: error: template argument 1 is invalid
|  5564 | template <> struct LvlTypeMap<VkDeviceFaultInfoEXT> {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5568:32: error: 'VK_STRUCTURE_TYPE_DEVICE_FAULT_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT'?
|  5568 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_FAULT_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_EVENT_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5568:71: error: template argument 1 is invalid
|  5568 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_FAULT_INFO_EXT> {
|       |                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5573:31: error: 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM'?
|  5573 | template <> struct LvlTypeMap<VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5573:92: error: template argument 1 is invalid
|  5573 | template <> struct LvlTypeMap<VkPhysicalDeviceRasterizationOrderAttachmentAccessFeaturesEXT> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5577:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM'?
|  5577 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_ARM
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5577:116: error: template argument 1 is invalid
|  5577 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT> {
|       |                                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5602:31: error: 'VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE'?
|  5602 | template <> struct LvlTypeMap<VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMutableDescriptorTypeFeaturesVALVE
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5602:79: error: template argument 1 is invalid
|  5602 | template <> struct LvlTypeMap<VkPhysicalDeviceMutableDescriptorTypeFeaturesEXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5606:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE'?
|  5606 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_VALVE
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5606:102: error: template argument 1 is invalid
|  5606 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT> {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5611:31: error: 'VkMutableDescriptorTypeCreateInfoEXT' was not declared in this scope; did you mean 'VkMutableDescriptorTypeCreateInfoVALVE'?
|  5611 | template <> struct LvlTypeMap<VkMutableDescriptorTypeCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkMutableDescriptorTypeCreateInfoVALVE
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5611:67: error: template argument 1 is invalid
|  5611 | template <> struct LvlTypeMap<VkMutableDescriptorTypeCreateInfoEXT> {
|       |                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5615:32: error: 'VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_VALVE'?
|  5615 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_VALVE
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5615:89: error: template argument 1 is invalid
|  5615 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_EXT> {
|       |                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5656:31: error: 'VkPhysicalDeviceAddressBindingReportFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceMemoryReportFeaturesEXT'?
|  5656 | template <> struct LvlTypeMap<VkPhysicalDeviceAddressBindingReportFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDeviceMemoryReportFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5656:78: error: template argument 1 is invalid
|  5656 | template <> struct LvlTypeMap<VkPhysicalDeviceAddressBindingReportFeaturesEXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5660:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT'?
|  5660 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5660:101: error: template argument 1 is invalid
|  5660 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5665:31: error: 'VkDeviceAddressBindingCallbackDataEXT' was not declared in this scope
|  5665 | template <> struct LvlTypeMap<VkDeviceAddressBindingCallbackDataEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5665:68: error: template argument 1 is invalid
|  5665 | template <> struct LvlTypeMap<VkDeviceAddressBindingCallbackDataEXT> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5669:32: error: 'VK_STRUCTURE_TYPE_DEVICE_ADDRESS_BINDING_CALLBACK_DATA_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT'?
|  5669 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_ADDRESS_BINDING_CALLBACK_DATA_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:5669:90: error: template argument 1 is invalid
|  5669 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_ADDRESS_BINDING_CALLBACK_DATA_EXT> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6057:31: error: 'VkMicromapBuildInfoEXT' was not declared in this scope
|  6057 | template <> struct LvlTypeMap<VkMicromapBuildInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6057:53: error: template argument 1 is invalid
|  6057 | template <> struct LvlTypeMap<VkMicromapBuildInfoEXT> {
|       |                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6061:32: error: 'VK_STRUCTURE_TYPE_MICROMAP_BUILD_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT'?
|  6061 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MICROMAP_BUILD_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6061:73: error: template argument 1 is invalid
|  6061 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MICROMAP_BUILD_INFO_EXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6066:31: error: 'VkMicromapCreateInfoEXT' was not declared in this scope
|  6066 | template <> struct LvlTypeMap<VkMicromapCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6066:54: error: template argument 1 is invalid
|  6066 | template <> struct LvlTypeMap<VkMicromapCreateInfoEXT> {
|       |                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6070:32: error: 'VK_STRUCTURE_TYPE_MICROMAP_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO'?
|  6070 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MICROMAP_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6070:74: error: template argument 1 is invalid
|  6070 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MICROMAP_CREATE_INFO_EXT> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6075:31: error: 'VkPhysicalDeviceOpacityMicromapFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|  6075 | template <> struct LvlTypeMap<VkPhysicalDeviceOpacityMicromapFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMultiDrawFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6075:73: error: template argument 1 is invalid
|  6075 | template <> struct LvlTypeMap<VkPhysicalDeviceOpacityMicromapFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6079:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT'?
|  6079 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6079:95: error: template argument 1 is invalid
|  6079 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6084:31: error: 'VkPhysicalDeviceOpacityMicromapPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiDrawPropertiesEXT'?
|  6084 | template <> struct LvlTypeMap<VkPhysicalDeviceOpacityMicromapPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMultiDrawPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6084:75: error: template argument 1 is invalid
|  6084 | template <> struct LvlTypeMap<VkPhysicalDeviceOpacityMicromapPropertiesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6088:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT'?
|  6088 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6088:97: error: template argument 1 is invalid
|  6088 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT> {
|       |                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6093:31: error: 'VkMicromapVersionInfoEXT' was not declared in this scope
|  6093 | template <> struct LvlTypeMap<VkMicromapVersionInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6093:55: error: template argument 1 is invalid
|  6093 | template <> struct LvlTypeMap<VkMicromapVersionInfoEXT> {
|       |                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6097:32: error: 'VK_STRUCTURE_TYPE_MICROMAP_VERSION_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT'?
|  6097 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MICROMAP_VERSION_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6097:75: error: template argument 1 is invalid
|  6097 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MICROMAP_VERSION_INFO_EXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6102:31: error: 'VkCopyMicromapToMemoryInfoEXT' was not declared in this scope
|  6102 | template <> struct LvlTypeMap<VkCopyMicromapToMemoryInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6102:60: error: template argument 1 is invalid
|  6102 | template <> struct LvlTypeMap<VkCopyMicromapToMemoryInfoEXT> {
|       |                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6106:32: error: 'VK_STRUCTURE_TYPE_COPY_MICROMAP_TO_MEMORY_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2'?
|  6106 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MICROMAP_TO_MEMORY_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_IMAGE_TO_BUFFER_INFO_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6106:82: error: template argument 1 is invalid
|  6106 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MICROMAP_TO_MEMORY_INFO_EXT> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6111:31: error: 'VkCopyMemoryToMicromapInfoEXT' was not declared in this scope
|  6111 | template <> struct LvlTypeMap<VkCopyMemoryToMicromapInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6111:60: error: template argument 1 is invalid
|  6111 | template <> struct LvlTypeMap<VkCopyMemoryToMicromapInfoEXT> {
|       |                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6115:32: error: 'VK_STRUCTURE_TYPE_COPY_MEMORY_TO_MICROMAP_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2'?
|  6115 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MEMORY_TO_MICROMAP_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_BUFFER_TO_IMAGE_INFO_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6115:82: error: template argument 1 is invalid
|  6115 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MEMORY_TO_MICROMAP_INFO_EXT> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6120:31: error: 'VkCopyMicromapInfoEXT' was not declared in this scope
|  6120 | template <> struct LvlTypeMap<VkCopyMicromapInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6120:52: error: template argument 1 is invalid
|  6120 | template <> struct LvlTypeMap<VkCopyMicromapInfoEXT> {
|       |                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6124:32: error: 'VK_STRUCTURE_TYPE_COPY_MICROMAP_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2'?
|  6124 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MICROMAP_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_IMAGE_INFO_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6124:72: error: template argument 1 is invalid
|  6124 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MICROMAP_INFO_EXT> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6129:31: error: 'VkMicromapBuildSizesInfoEXT' was not declared in this scope
|  6129 | template <> struct LvlTypeMap<VkMicromapBuildSizesInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6129:58: error: template argument 1 is invalid
|  6129 | template <> struct LvlTypeMap<VkMicromapBuildSizesInfoEXT> {
|       |                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6133:32: error: 'VK_STRUCTURE_TYPE_MICROMAP_BUILD_SIZES_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT'?
|  6133 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MICROMAP_BUILD_SIZES_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6133:79: error: template argument 1 is invalid
|  6133 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MICROMAP_BUILD_SIZES_INFO_EXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6138:31: error: 'VkAccelerationStructureTrianglesOpacityMicromapEXT' was not declared in this scope
|  6138 | template <> struct LvlTypeMap<VkAccelerationStructureTrianglesOpacityMicromapEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6138:81: error: template argument 1 is invalid
|  6138 | template <> struct LvlTypeMap<VkAccelerationStructureTrianglesOpacityMicromapEXT> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6142:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_OPACITY_MICROMAP_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV'?
|  6142 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_OPACITY_MICROMAP_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6142:103: error: template argument 1 is invalid
|  6142 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_TRIANGLES_OPACITY_MICROMAP_EXT> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6201:31: error: 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClipEnableFeaturesEXT'?
|  6201 | template <> struct LvlTypeMap<VkPhysicalDeviceDepthClampZeroOneFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDepthClipEnableFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6201:75: error: template argument 1 is invalid
|  6201 | template <> struct LvlTypeMap<VkPhysicalDeviceDepthClampZeroOneFeaturesEXT> {
|       |                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6205:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT'?
|  6205 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6205:99: error: template argument 1 is invalid
|  6205 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6291:31: error: 'VkPhysicalDeviceExtendedDynamicState3FeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  6291 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicState3FeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6291:79: error: template argument 1 is invalid
|  6291 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicState3FeaturesEXT> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6295:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT'?
|  6295 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6295:103: error: template argument 1 is invalid
|  6295 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6300:31: error: 'VkPhysicalDeviceExtendedDynamicState3PropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceExtendedDynamicStateFeaturesEXT'?
|  6300 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicState3PropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceExtendedDynamicStateFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6300:81: error: template argument 1 is invalid
|  6300 | template <> struct LvlTypeMap<VkPhysicalDeviceExtendedDynamicState3PropertiesEXT> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6304:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT'?
|  6304 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6304:105: error: template argument 1 is invalid
|  6304 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6381:31: error: 'VkPhysicalDeviceOpticalFlowFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiviewFeatures'?
|  6381 | template <> struct LvlTypeMap<VkPhysicalDeviceOpticalFlowFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMultiviewFeatures
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6381:68: error: template argument 1 is invalid
|  6381 | template <> struct LvlTypeMap<VkPhysicalDeviceOpticalFlowFeaturesNV> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6385:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPTICAL_FLOW_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT'?
|  6385 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPTICAL_FLOW_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6385:90: error: template argument 1 is invalid
|  6385 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPTICAL_FLOW_FEATURES_NV> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6390:31: error: 'VkPhysicalDeviceOpticalFlowPropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingPropertiesNV'?
|  6390 | template <> struct LvlTypeMap<VkPhysicalDeviceOpticalFlowPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6390:70: error: template argument 1 is invalid
|  6390 | template <> struct LvlTypeMap<VkPhysicalDeviceOpticalFlowPropertiesNV> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6394:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPTICAL_FLOW_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV'?
|  6394 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPTICAL_FLOW_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6394:92: error: template argument 1 is invalid
|  6394 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPTICAL_FLOW_PROPERTIES_NV> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6399:31: error: 'VkOpticalFlowImageFormatInfoNV' was not declared in this scope
|  6399 | template <> struct LvlTypeMap<VkOpticalFlowImageFormatInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6399:61: error: template argument 1 is invalid
|  6399 | template <> struct LvlTypeMap<VkOpticalFlowImageFormatInfoNV> {
|       |                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6403:32: error: 'VK_STRUCTURE_TYPE_OPTICAL_FLOW_IMAGE_FORMAT_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2'?
|  6403 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_IMAGE_FORMAT_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6403:83: error: template argument 1 is invalid
|  6403 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_IMAGE_FORMAT_INFO_NV> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6408:31: error: 'VkOpticalFlowImageFormatPropertiesNV' was not declared in this scope; did you mean 'VkExternalImageFormatPropertiesNV'?
|  6408 | template <> struct LvlTypeMap<VkOpticalFlowImageFormatPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkExternalImageFormatPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6408:67: error: template argument 1 is invalid
|  6408 | template <> struct LvlTypeMap<VkOpticalFlowImageFormatPropertiesNV> {
|       |                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6412:32: error: 'VK_STRUCTURE_TYPE_OPTICAL_FLOW_IMAGE_FORMAT_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2'?
|  6412 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_IMAGE_FORMAT_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6412:89: error: template argument 1 is invalid
|  6412 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_IMAGE_FORMAT_PROPERTIES_NV> {
|       |                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6417:31: error: 'VkOpticalFlowSessionCreateInfoNV' was not declared in this scope
|  6417 | template <> struct LvlTypeMap<VkOpticalFlowSessionCreateInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6417:63: error: template argument 1 is invalid
|  6417 | template <> struct LvlTypeMap<VkOpticalFlowSessionCreateInfoNV> {
|       |                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6421:32: error: 'VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_SESSION_CREATE_INFO_KHR'?
|  6421 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_SESSION_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6421:85: error: template argument 1 is invalid
|  6421 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_INFO_NV> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6426:31: error: 'VkOpticalFlowSessionCreatePrivateDataInfoNV' was not declared in this scope
|  6426 | template <> struct LvlTypeMap<VkOpticalFlowSessionCreatePrivateDataInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6426:74: error: template argument 1 is invalid
|  6426 | template <> struct LvlTypeMap<VkOpticalFlowSessionCreatePrivateDataInfoNV> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6430:32: error: 'VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_PRIVATE_DATA_INFO_NV' was not declared in this scope
|  6430 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_PRIVATE_DATA_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6430:98: error: template argument 1 is invalid
|  6430 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_SESSION_CREATE_PRIVATE_DATA_INFO_NV> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6435:31: error: 'VkOpticalFlowExecuteInfoNV' was not declared in this scope
|  6435 | template <> struct LvlTypeMap<VkOpticalFlowExecuteInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6435:57: error: template argument 1 is invalid
|  6435 | template <> struct LvlTypeMap<VkOpticalFlowExecuteInfoNV> {
|       |                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6439:32: error: 'VK_STRUCTURE_TYPE_OPTICAL_FLOW_EXECUTE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN'?
|  6439 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_EXECUTE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VI_SURFACE_CREATE_INFO_NN
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6439:78: error: template argument 1 is invalid
|  6439 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_OPTICAL_FLOW_EXECUTE_INFO_NV> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6444:31: error: 'VkPhysicalDeviceLegacyDitheringFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMemoryPriorityFeaturesEXT'?
|  6444 | template <> struct LvlTypeMap<VkPhysicalDeviceLegacyDitheringFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMemoryPriorityFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6444:73: error: template argument 1 is invalid
|  6444 | template <> struct LvlTypeMap<VkPhysicalDeviceLegacyDitheringFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6448:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  6448 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6448:95: error: template argument 1 is invalid
|  6448 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6453:31: error: 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  6453 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineProtectedAccessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6453:81: error: template argument 1 is invalid
|  6453 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineProtectedAccessFeaturesEXT> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6457:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  6457 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6457:104: error: template argument 1 is invalid
|  6457 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT> {
|       |                                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6498:31: error: 'VkPhysicalDeviceShaderCoreBuiltinsFeaturesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSMBuiltinsFeaturesNV'?
|  6498 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderCoreBuiltinsFeaturesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderSMBuiltinsFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6498:76: error: template argument 1 is invalid
|  6498 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderCoreBuiltinsFeaturesARM> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6502:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_FEATURES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV'?
|  6502 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_FEATURES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6502:99: error: template argument 1 is invalid
|  6502 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_FEATURES_ARM> {
|       |                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6507:31: error: 'VkPhysicalDeviceShaderCoreBuiltinsPropertiesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSMBuiltinsPropertiesNV'?
|  6507 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderCoreBuiltinsPropertiesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderSMBuiltinsPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6507:78: error: template argument 1 is invalid
|  6507 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderCoreBuiltinsPropertiesARM> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6511:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_PROPERTIES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV'?
|  6511 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_PROPERTIES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6511:101: error: template argument 1 is invalid
|  6511 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_PROPERTIES_ARM> {
|       |                                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6705:31: error: 'VkPhysicalDeviceMeshShaderFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderFeaturesNV'?
|  6705 | template <> struct LvlTypeMap<VkPhysicalDeviceMeshShaderFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMeshShaderFeaturesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6705:68: error: template argument 1 is invalid
|  6705 | template <> struct LvlTypeMap<VkPhysicalDeviceMeshShaderFeaturesEXT> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6709:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV'?
|  6709 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6709:90: error: template argument 1 is invalid
|  6709 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6714:31: error: 'VkPhysicalDeviceMeshShaderPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceMeshShaderPropertiesNV'?
|  6714 | template <> struct LvlTypeMap<VkPhysicalDeviceMeshShaderPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMeshShaderPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6714:70: error: template argument 1 is invalid
|  6714 | template <> struct LvlTypeMap<VkPhysicalDeviceMeshShaderPropertiesEXT> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6718:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV'?
|  6718 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/vk_typemap_helper.h:6718:92: error: template argument 1 is invalid
|  6718 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT> {
|       |                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:2799:11: error: 'VkVideoProfileInfoKHR' does not name a type; did you mean 'VkVideoProfilesKHR'?
|  2799 |     const VkVideoProfileInfoKHR*                pVideoProfile,
|       |           ^~~~~~~~~~~~~~~~~~~~~
|       |           VkVideoProfilesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:2839:5: error: 'VkVideoSessionMemoryRequirementsKHR' has not been declared
|  2839 |     VkVideoSessionMemoryRequirementsKHR*        pMemoryRequirements)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:2849:11: error: 'VkBindVideoSessionMemoryInfoKHR' does not name a type; did you mean 'PFN_vkBindVideoSessionMemoryKHR'?
|  2849 |     const VkBindVideoSessionMemoryInfoKHR*      pBindSessionMemoryInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           PFN_vkBindVideoSessionMemoryKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5403:5: error: 'VkDeviceFaultCountsEXT' has not been declared
|  5403 |     VkDeviceFaultCountsEXT*                     pFaultCounts,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5404:5: error: 'VkDeviceFaultInfoEXT' has not been declared
|  5404 |     VkDeviceFaultInfoEXT*                       pFaultInfo)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5707:11: error: 'VkMicromapCreateInfoEXT' does not name a type
|  5707 |     const VkMicromapCreateInfoEXT*              pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5709:5: error: 'VkMicromapEXT' has not been declared
|  5709 |     VkMicromapEXT*                              pMicromap)
|       |     ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreateMicromapEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5712:19: error: 'VkMicromapEXT' was not declared in this scope; did you mean 'CopyMicromapEXT'?
|  5712 |     *pMicromap = (VkMicromapEXT)global_unique_handle++;
|       |                   ^~~~~~~~~~~~~
|       |                   CopyMicromapEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5718:5: error: 'VkMicromapEXT' has not been declared
|  5718 |     VkMicromapEXT                               micromap,
|       |     ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5727:11: error: 'VkMicromapBuildInfoEXT' does not name a type
|  5727 |     const VkMicromapBuildInfoEXT*               pInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5736:11: error: 'VkMicromapBuildInfoEXT' does not name a type
|  5736 |     const VkMicromapBuildInfoEXT*               pInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5745:11: error: 'VkCopyMicromapInfoEXT' does not name a type
|  5745 |     const VkCopyMicromapInfoEXT*                pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5754:11: error: 'VkCopyMicromapToMemoryInfoEXT' does not name a type
|  5754 |     const VkCopyMicromapToMemoryInfoEXT*        pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5763:11: error: 'VkCopyMemoryToMicromapInfoEXT' does not name a type
|  5763 |     const VkCopyMemoryToMicromapInfoEXT*        pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5772:11: error: 'VkMicromapEXT' does not name a type
|  5772 |     const VkMicromapEXT*                        pMicromaps,
|       |           ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5784:11: error: 'VkCopyMicromapInfoEXT' does not name a type
|  5784 |     const VkCopyMicromapInfoEXT*                pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5791:11: error: 'VkCopyMicromapToMemoryInfoEXT' does not name a type
|  5791 |     const VkCopyMicromapToMemoryInfoEXT*        pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5798:11: error: 'VkCopyMemoryToMicromapInfoEXT' does not name a type
|  5798 |     const VkCopyMemoryToMicromapInfoEXT*        pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5806:11: error: 'VkMicromapEXT' does not name a type
|  5806 |     const VkMicromapEXT*                        pMicromaps,
|       |           ^~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5816:11: error: 'VkMicromapVersionInfoEXT' does not name a type
|  5816 |     const VkMicromapVersionInfoEXT*             pVersionInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5825:11: error: 'VkMicromapBuildInfoEXT' does not name a type
|  5825 |     const VkMicromapBuildInfoEXT*               pBuildInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5826:5: error: 'VkMicromapBuildSizesInfoEXT' has not been declared
|  5826 |     VkMicromapBuildSizesInfoEXT*                pSizeInfo)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5937:11: error: 'VkColorBlendEquationEXT' does not name a type
|  5937 |     const VkColorBlendEquationEXT*              pColorBlendEquations)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:5990:11: error: 'VkColorBlendAdvancedEXT' does not name a type
|  5990 |     const VkColorBlendAdvancedEXT*              pColorBlendAdvanced)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6118:11: error: 'VkOpticalFlowImageFormatInfoNV' does not name a type
|  6118 |     const VkOpticalFlowImageFormatInfoNV*       pOpticalFlowImageFormatInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6120:5: error: 'VkOpticalFlowImageFormatPropertiesNV' has not been declared
|  6120 |     VkOpticalFlowImageFormatPropertiesNV*       pImageFormatProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6128:11: error: 'VkOpticalFlowSessionCreateInfoNV' does not name a type
|  6128 |     const VkOpticalFlowSessionCreateInfoNV*     pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6130:5: error: 'VkOpticalFlowSessionNV' has not been declared
|  6130 |     VkOpticalFlowSessionNV*                     pSession)
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp: In function 'VkResult vkmock::CreateOpticalFlowSessionNV(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6133:18: error: 'VkOpticalFlowSessionNV' was not declared in this scope; did you mean 'CreateOpticalFlowSessionNV'?
|  6133 |     *pSession = (VkOpticalFlowSessionNV)global_unique_handle++;
|       |                  ^~~~~~~~~~~~~~~~~~~~~~
|       |                  CreateOpticalFlowSessionNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6139:5: error: 'VkOpticalFlowSessionNV' has not been declared
|  6139 |     VkOpticalFlowSessionNV                      session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6147:5: error: 'VkOpticalFlowSessionNV' has not been declared
|  6147 |     VkOpticalFlowSessionNV                      session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6148:5: error: 'VkOpticalFlowSessionBindingPointNV' has not been declared
|  6148 |     VkOpticalFlowSessionBindingPointNV          bindingPoint,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6158:5: error: 'VkOpticalFlowSessionNV' has not been declared
|  6158 |     VkOpticalFlowSessionNV                      session,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/git/icd/generated/mock_icd.cpp:6159:11: error: 'VkOpticalFlowExecuteInfoNV' does not name a type
|  6159 |     const VkOpticalFlowExecuteInfoNV*           pExecuteInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/temp/run.do_compile.2951664:154 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/temp/run.do_compile.2951664, line 154
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/temp/run.do_compile.2951664, line 148
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/temp/run.do_compile.2951664, line 143
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/temp/run.do_compile.2951664, line 167
NOTE: recipe vulkan-tools-1.3.231.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1198 tasks of which 1189 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-tools-1.3.231.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/temp/run.do_compile.2951664', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.231.1-r0/temp/log.do_compile.2951664
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.231.1.bb:do_compile) failed with exit code '1'

--===============6600024515519194852==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.224.1-1.3.231.1.patch"

RnJvbSBjYmY3ZDQxMmQ2YzUwNDQzM2QwYjY5M2Q1NWQyZDI2MmVlNTVkZWIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxNjo1OTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjI0LjEgLT4gMS4zLjIzMS4xCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yMjQuMS5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjIzMS4xLmJifSAgfCA0
ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi97dnVsa2FuLXRvb2xzXzEuMy4yMjQu
MS5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjIzMS4xLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yMjQuMS5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yMzEuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2Fu
L3Z1bGthbi10b29sc18xLjMuMjI0LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yMzEuMS5iYgppbmRleCBiZWQxMGFmZWYxLi45MDY2
ODIxZGUwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10
b29sc18xLjMuMjI0LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxr
YW4tdG9vbHNfMS4zLjIzMS4xLmJiCkBAIC02LDggKzYsOCBAQCBTRUNUSU9OID0gImxpYnMiCiAK
IExJQ0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UudHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKLVNSQ19VUkkgPSAi
Z2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9bWFz
dGVyO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gIjQ5N2YyMzI2ODBiMDQ2ZGIzNGJhOWU5ZGEw
NjVlNjMwM2ExMjU4NTEiCitTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3Vw
L1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPXNkay0xLjMuMjMxO3Byb3RvY29sPWh0dHBzIgorU1JD
UkVWID0gIjhkMmQzZTIyZDY4NDU0MGZkYzVhNzZjMTVlNDU2ZmMyZmQxMWU0YjciCiAKIFMgPSAi
JHtXT1JLRElSfS9naXQiCiAKLS0gCjIuMzEuMQoK

--===============6600024515519194852==--

