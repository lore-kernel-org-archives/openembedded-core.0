Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4852FC4167E
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.24221.1665871393170910750
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WbDLXTv3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010183ddac3ccb-90723608-b21a-4bc0-a7da-110fdbd3baca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DoJosS49rxZNZCdGLwOudvLHEspBe9AsBctK4Wgy2Jg=;
	b=WbDLXTv3eKKDSPSHLf8LTNerM38d5cUHQnDLevKOsmdvFV1kXwMfKAhMJvnoWmfl
	h1/e1KpMGwLjCOh3R/ZY9TMDxfwhWvx7nsl1KCZla2cpJx450GWs8sKTYCz+2DjUiBJ
	A6987WCgPoinfMmU/GLXidBN6qTXYkP1EYpr6MHk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DoJosS49rxZNZCdGLwOudvLHEspBe9AsBctK4Wgy2Jg=;
	b=C9zau4yKw9WMZS3QrXa+lotzlgVDUxZ64j4n/3TTYrETl+jix136WV3KCJIIMU0C
	fiiNGUOeqhYzwRjweTP+k9OPIWsN4zUOA6ODiQfodwADvhFQD2/mdQ3cPyliNap/Uxk
	+AmgOkP7lgl84pVBQ/podSwM/UKS4/dmDlwBXni8=
Content-Type: multipart/mixed; boundary="===============4538987502829620133=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.224.1 FAILED
Message-ID: <01010183ddac3ccb-90723608-b21a-4bc0-a7da-110fdbd3baca-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171845

--===============4538987502829620133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.224.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.216.0-1.3.224.1.patch
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
--===============4538987502829620133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:d55f33df1563da6579d57dce4b66e51a398aa198"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 107 Local 100 Mirrors 0 Missed 7 Current 216 (93% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1136 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_fetch: Succeeded
NOTE: Running task 1191 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_unpack)
NOTE: Running task 1192 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_unpack: Succeeded
NOTE: Running task 1193 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1195 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_generate_toolchain_file)
NOTE: Running task 1196 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1197 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_configure: Succeeded
NOTE: Running task 1198 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/
 core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/bui
 ld/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.h:3583:5: error: 'VkShaderModuleIdentifierEXT' has not been declared
|  3583 |     VkShaderModuleIdentifierEXT*                pIdentifier);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.h:3588:5: error: 'VkShaderModuleIdentifierEXT' has not been declared
|  3588 |     VkShaderModuleIdentifierEXT*                pIdentifier);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.h:3595:5: error: 'VkTilePropertiesQCOM' has not been declared
|  3595 |     VkTilePropertiesQCOM*                       pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.h:3600:5: error: 'VkTilePropertiesQCOM' has not been declared
|  3600 |     VkTilePropertiesQCOM*                       pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3615:31: error: 'VkPhysicalDevicePipelineRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  3615 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3615:76: error: template argument 1 is invalid
|  3615 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessFeaturesEXT> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3619:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  3619 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3619:98: error: template argument 1 is invalid
|  3619 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3624:31: error: 'VkPhysicalDevicePipelineRobustnessPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceRobustness2PropertiesEXT'?
|  3624 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3624:78: error: template argument 1 is invalid
|  3624 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessPropertiesEXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3628:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT'?
|  3628 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3628:100: error: template argument 1 is invalid
|  3628 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3633:31: error: 'VkPipelineRobustnessCreateInfoEXT' was not declared in this scope; did you mean 'VkPipelineColorWriteCreateInfoEXT'?
|  3633 | template <> struct LvlTypeMap<VkPipelineRobustnessCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineColorWriteCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3633:64: error: template argument 1 is invalid
|  3633 | template <> struct LvlTypeMap<VkPipelineRobustnessCreateInfoEXT> {
|       |                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3637:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_COLOR_WRITE_CREATE_INFO_EXT'?
|  3637 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_COLOR_WRITE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:3637:85: error: template argument 1 is invalid
|  3637 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO_EXT> {
|       |                                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5490:31: error: 'VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  5490 | template <> struct LvlTypeMap<VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5490:86: error: template argument 1 is invalid
|  5490 | template <> struct LvlTypeMap<VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT> {
|       |                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5494:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT'?
|  5494 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5494:110: error: template argument 1 is invalid
|  5494 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT> {
|       |                                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5855:31: error: 'VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT' was not declared in this scope
|  5855 | template <> struct LvlTypeMap<VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5855:91: error: template argument 1 is invalid
|  5855 | template <> struct LvlTypeMap<VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5859:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT'?
|  5859 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5859:116: error: template argument 1 is invalid
|  5859 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT> {
|       |                                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5864:31: error: 'VkSubpassResolvePerformanceQueryEXT' was not declared in this scope
|  5864 | template <> struct LvlTypeMap<VkSubpassResolvePerformanceQueryEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5864:66: error: template argument 1 is invalid
|  5864 | template <> struct LvlTypeMap<VkSubpassResolvePerformanceQueryEXT> {
|       |                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5868:32: error: 'VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT' was not declared in this scope
|  5868 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5868:87: error: template argument 1 is invalid
|  5868 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT> {
|       |                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5873:31: error: 'VkMultisampledRenderToSingleSampledInfoEXT' was not declared in this scope
|  5873 | template <> struct LvlTypeMap<VkMultisampledRenderToSingleSampledInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5873:73: error: template argument 1 is invalid
|  5873 | template <> struct LvlTypeMap<VkMultisampledRenderToSingleSampledInfoEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5877:32: error: 'VK_STRUCTURE_TYPE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_INFO_EXT' was not declared in this scope
|  5877 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:5877:96: error: template argument 1 is invalid
|  5877 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_INFO_EXT> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6028:31: error: 'VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  6028 | template <> struct LvlTypeMap<VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6028:76: error: template argument 1 is invalid
|  6028 | template <> struct LvlTypeMap<VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6032:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT'?
|  6032 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6032:100: error: template argument 1 is invalid
|  6032 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT> {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6082:31: error: 'VkImageViewSampleWeightCreateInfoQCOM' was not declared in this scope
|  6082 | template <> struct LvlTypeMap<VkImageViewSampleWeightCreateInfoQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6082:68: error: template argument 1 is invalid
|  6082 | template <> struct LvlTypeMap<VkImageViewSampleWeightCreateInfoQCOM> {
|       |                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6086:32: error: 'VK_STRUCTURE_TYPE_IMAGE_VIEW_SAMPLE_WEIGHT_CREATE_INFO_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO_KHR'?
|  6086 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_SAMPLE_WEIGHT_CREATE_INFO_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_VIEW_USAGE_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6086:91: error: template argument 1 is invalid
|  6086 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_VIEW_SAMPLE_WEIGHT_CREATE_INFO_QCOM> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6091:31: error: 'VkPhysicalDeviceImageProcessingFeaturesQCOM' was not declared in this scope; did you mean 'VkPhysicalDeviceImageRobustnessFeaturesEXT'?
|  6091 | template <> struct LvlTypeMap<VkPhysicalDeviceImageProcessingFeaturesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceImageRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6091:74: error: template argument 1 is invalid
|  6091 | template <> struct LvlTypeMap<VkPhysicalDeviceImageProcessingFeaturesQCOM> {
|       |                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6095:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_FEATURES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT'?
|  6095 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_FEATURES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6095:96: error: template argument 1 is invalid
|  6095 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_FEATURES_QCOM> {
|       |                                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6100:31: error: 'VkPhysicalDeviceImageProcessingPropertiesQCOM' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingPropertiesNV'?
|  6100 | template <> struct LvlTypeMap<VkPhysicalDeviceImageProcessingPropertiesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6100:76: error: template argument 1 is invalid
|  6100 | template <> struct LvlTypeMap<VkPhysicalDeviceImageProcessingPropertiesQCOM> {
|       |                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6104:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_PROPERTIES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV'?
|  6104 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_PROPERTIES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6104:98: error: template argument 1 is invalid
|  6104 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_PROCESSING_PROPERTIES_QCOM> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6145:31: error: 'VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  6145 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6145:80: error: template argument 1 is invalid
|  6145 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT> {
|       |                                                                                ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6149:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT'?
|  6149 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6149:103: error: template argument 1 is invalid
|  6149 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT> {
|       |                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6154:31: error: 'VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSMBuiltinsPropertiesNV'?
|  6154 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderSMBuiltinsPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6154:82: error: template argument 1 is invalid
|  6154 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6158:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV'?
|  6158 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6158:105: error: template argument 1 is invalid
|  6158 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6163:31: error: 'VkPipelineShaderStageModuleIdentifierCreateInfoEXT' was not declared in this scope; did you mean 'VkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT'?
|  6163 | template <> struct LvlTypeMap<VkPipelineShaderStageModuleIdentifierCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineShaderStageRequiredSubgroupSizeCreateInfoEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6163:81: error: template argument 1 is invalid
|  6163 | template <> struct LvlTypeMap<VkPipelineShaderStageModuleIdentifierCreateInfoEXT> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6167:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_MODULE_IDENTIFIER_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO_EXT'?
|  6167 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_MODULE_IDENTIFIER_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6167:105: error: template argument 1 is invalid
|  6167 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_MODULE_IDENTIFIER_CREATE_INFO_EXT> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6172:31: error: 'VkShaderModuleIdentifierEXT' was not declared in this scope
|  6172 | template <> struct LvlTypeMap<VkShaderModuleIdentifierEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6172:58: error: template argument 1 is invalid
|  6172 | template <> struct LvlTypeMap<VkShaderModuleIdentifierEXT> {
|       |                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6176:32: error: 'VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO'?
|  6176 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6176:78: error: template argument 1 is invalid
|  6176 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SHADER_MODULE_IDENTIFIER_EXT> {
|       |                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6181:31: error: 'VkPhysicalDeviceTilePropertiesFeaturesQCOM' was not declared in this scope; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  6181 | template <> struct LvlTypeMap<VkPhysicalDeviceTilePropertiesFeaturesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6181:73: error: template argument 1 is invalid
|  6181 | template <> struct LvlTypeMap<VkPhysicalDeviceTilePropertiesFeaturesQCOM> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6185:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TILE_PROPERTIES_FEATURES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  6185 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TILE_PROPERTIES_FEATURES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6185:95: error: template argument 1 is invalid
|  6185 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TILE_PROPERTIES_FEATURES_QCOM> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6190:31: error: 'VkTilePropertiesQCOM' was not declared in this scope
|  6190 | template <> struct LvlTypeMap<VkTilePropertiesQCOM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6190:51: error: template argument 1 is invalid
|  6190 | template <> struct LvlTypeMap<VkTilePropertiesQCOM> {
|       |                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6194:32: error: 'VK_STRUCTURE_TYPE_TILE_PROPERTIES_QCOM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3'?
|  6194 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TILE_PROPERTIES_QCOM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_FORMAT_PROPERTIES_3
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6194:70: error: template argument 1 is invalid
|  6194 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_TILE_PROPERTIES_QCOM> {
|       |                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6199:31: error: 'VkPhysicalDeviceAmigoProfilingFeaturesSEC' was not declared in this scope
|  6199 | template <> struct LvlTypeMap<VkPhysicalDeviceAmigoProfilingFeaturesSEC> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6199:72: error: template argument 1 is invalid
|  6199 | template <> struct LvlTypeMap<VkPhysicalDeviceAmigoProfilingFeaturesSEC> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6203:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_AMIGO_PROFILING_FEATURES_SEC' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT'?
|  6203 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_AMIGO_PROFILING_FEATURES_SEC> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6203:94: error: template argument 1 is invalid
|  6203 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_AMIGO_PROFILING_FEATURES_SEC> {
|       |                                                                                              ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6208:31: error: 'VkAmigoProfilingSubmitInfoSEC' was not declared in this scope
|  6208 | template <> struct LvlTypeMap<VkAmigoProfilingSubmitInfoSEC> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6208:60: error: template argument 1 is invalid
|  6208 | template <> struct LvlTypeMap<VkAmigoProfilingSubmitInfoSEC> {
|       |                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6212:32: error: 'VK_STRUCTURE_TYPE_AMIGO_PROFILING_SUBMIT_INFO_SEC' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACQUIRE_PROFILING_LOCK_INFO_KHR'?
|  6212 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_AMIGO_PROFILING_SUBMIT_INFO_SEC> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACQUIRE_PROFILING_LOCK_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/vk_typemap_helper.h:6212:81: error: template argument 1 is invalid
|  6212 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_AMIGO_PROFILING_SUBMIT_INFO_SEC> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.cpp:5731:5: error: 'VkShaderModuleIdentifierEXT' has not been declared
|  5731 |     VkShaderModuleIdentifierEXT*                pIdentifier)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.cpp:5739:5: error: 'VkShaderModuleIdentifierEXT' has not been declared
|  5739 |     VkShaderModuleIdentifierEXT*                pIdentifier)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.cpp:5749:5: error: 'VkTilePropertiesQCOM' has not been declared
|  5749 |     VkTilePropertiesQCOM*                       pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/icd/generated/mock_icd.cpp:5758:5: error: 'VkTilePropertiesQCOM' has not been declared
|  5758 |     VkTilePropertiesQCOM*                       pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-tools/1.3.224.1-r0/git=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/rec
 ipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-too
 ls/1.3.224.1-r0/git=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build=/usr/src/debug/vulkan-tools/1.3.224.1-r0  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot=  -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sysroot=  -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/recipe-sy
 sroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/vulkaninfo.cpp:33:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkDriverIdString(VkDriverId)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:98:15: error: 'VK_DRIVER_ID_MESA_DOZEN' was not declared in this scope; did you mean 'VK_DRIVER_ID_MESA_VENUS'?
|    98 |         case (VK_DRIVER_ID_MESA_DOZEN): return "DRIVER_ID_MESA_DOZEN";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_DRIVER_ID_MESA_VENUS
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:396:57: error: 'VkPipelineRobustnessBufferBehaviorEXT' was not declared in this scope; did you mean 'VkPipelineRobustnessBufferBehaviorEXTString'?
|   396 | std::string VkPipelineRobustnessBufferBehaviorEXTString(VkPipelineRobustnessBufferBehaviorEXT value) {
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VkPipelineRobustnessBufferBehaviorEXTString
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:396:102: error: expected ',' or ';' before '{' token
|   396 | std::string VkPipelineRobustnessBufferBehaviorEXTString(VkPipelineRobustnessBufferBehaviorEXT value) {
|       |                                                                                                      ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:405:78: error: 'VkPipelineRobustnessBufferBehaviorEXT' has not been declared
|   405 | void DumpVkPipelineRobustnessBufferBehaviorEXT(Printer &p, std::string name, VkPipelineRobustnessBufferBehaviorEXT value) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPipelineRobustnessBufferBehaviorEXT(Printer&, std::string, int)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:407:96: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   407 |         p.PrintKeyString(name, std::string("VK_") + VkPipelineRobustnessBufferBehaviorEXTString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:409:75: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   409 |         p.PrintKeyString(name, VkPipelineRobustnessBufferBehaviorEXTString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:411:56: error: 'VkPipelineRobustnessImageBehaviorEXT' was not declared in this scope; did you mean 'VkPipelineRobustnessImageBehaviorEXTString'?
|   411 | std::string VkPipelineRobustnessImageBehaviorEXTString(VkPipelineRobustnessImageBehaviorEXT value) {
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VkPipelineRobustnessImageBehaviorEXTString
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:411:100: error: expected ',' or ';' before '{' token
|   411 | std::string VkPipelineRobustnessImageBehaviorEXTString(VkPipelineRobustnessImageBehaviorEXT value) {
|       |                                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:420:77: error: 'VkPipelineRobustnessImageBehaviorEXT' has not been declared
|   420 | void DumpVkPipelineRobustnessImageBehaviorEXT(Printer &p, std::string name, VkPipelineRobustnessImageBehaviorEXT value) {
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPipelineRobustnessImageBehaviorEXT(Printer&, std::string, int)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:422:95: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   422 |         p.PrintKeyString(name, std::string("VK_") + VkPipelineRobustnessImageBehaviorEXTString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:424:74: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   424 |         p.PrintKeyString(name, VkPipelineRobustnessImageBehaviorEXTString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkResultString(VkResult)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:504:15: error: 'VK_ERROR_IMAGE_USAGE_NOT_SUPPORTED_KHR' was not declared in this scope
|   504 |         case (VK_ERROR_IMAGE_USAGE_NOT_SUPPORTED_KHR): return "ERROR_IMAGE_USAGE_NOT_SUPPORTED_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:505:15: error: 'VK_ERROR_VIDEO_PICTURE_LAYOUT_NOT_SUPPORTED_KHR' was not declared in this scope
|   505 |         case (VK_ERROR_VIDEO_PICTURE_LAYOUT_NOT_SUPPORTED_KHR): return "ERROR_VIDEO_PICTURE_LAYOUT_NOT_SUPPORTED_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:506:15: error: 'VK_ERROR_VIDEO_PROFILE_OPERATION_NOT_SUPPORTED_KHR' was not declared in this scope
|   506 |         case (VK_ERROR_VIDEO_PROFILE_OPERATION_NOT_SUPPORTED_KHR): return "ERROR_VIDEO_PROFILE_OPERATION_NOT_SUPPORTED_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:507:15: error: 'VK_ERROR_VIDEO_PROFILE_FORMAT_NOT_SUPPORTED_KHR' was not declared in this scope
|   507 |         case (VK_ERROR_VIDEO_PROFILE_FORMAT_NOT_SUPPORTED_KHR): return "ERROR_VIDEO_PROFILE_FORMAT_NOT_SUPPORTED_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:508:15: error: 'VK_ERROR_VIDEO_PROFILE_CODEC_NOT_SUPPORTED_KHR' was not declared in this scope
|   508 |         case (VK_ERROR_VIDEO_PROFILE_CODEC_NOT_SUPPORTED_KHR): return "ERROR_VIDEO_PROFILE_CODEC_NOT_SUPPORTED_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:509:15: error: 'VK_ERROR_VIDEO_STD_VERSION_NOT_SUPPORTED_KHR' was not declared in this scope
|   509 |         case (VK_ERROR_VIDEO_STD_VERSION_NOT_SUPPORTED_KHR): return "ERROR_VIDEO_STD_VERSION_NOT_SUPPORTED_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkFormatFeatureFlagBits2GetStrings(VkFormatFeatureFlagBits2)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:699:9: error: 'VK_FORMAT_FEATURE_2_WEIGHT_IMAGE_BIT_QCOM' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR'?
|   699 |     if (VK_FORMAT_FEATURE_2_WEIGHT_IMAGE_BIT_QCOM & value) strings.push_back("FORMAT_FEATURE_2_WEIGHT_IMAGE_BIT_QCOM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_STORAGE_IMAGE_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:700:9: error: 'VK_FORMAT_FEATURE_2_WEIGHT_SAMPLED_IMAGE_BIT_QCOM' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_BIT_KHR'?
|   700 |     if (VK_FORMAT_FEATURE_2_WEIGHT_SAMPLED_IMAGE_BIT_QCOM & value) strings.push_back("FORMAT_FEATURE_2_WEIGHT_SAMPLED_IMAGE_BIT_QCOM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:701:9: error: 'VK_FORMAT_FEATURE_2_BLOCK_MATCHING_BIT_QCOM' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BIT_KHR'?
|   701 |     if (VK_FORMAT_FEATURE_2_BLOCK_MATCHING_BIT_QCOM & value) strings.push_back("FORMAT_FEATURE_2_BLOCK_MATCHING_BIT_QCOM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BIT_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:702:9: error: 'VK_FORMAT_FEATURE_2_BOX_FILTER_SAMPLED_BIT_QCOM' was not declared in this scope
|   702 |     if (VK_FORMAT_FEATURE_2_BOX_FILTER_SAMPLED_BIT_QCOM & value) strings.push_back("FORMAT_FEATURE_2_BOX_FILTER_SAMPLED_BIT_QCOM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkImageUsageFlagBitsGetStrings(VkImageUsageFlagBits)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:746:9: error: 'VK_IMAGE_USAGE_ATTACHMENT_FEEDBACK_LOOP_BIT_EXT' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_FRAGMENT_DENSITY_MAP_BIT_EXT'?
|   746 |     if (VK_IMAGE_USAGE_ATTACHMENT_FEEDBACK_LOOP_BIT_EXT & value) strings.push_back("IMAGE_USAGE_ATTACHMENT_FEEDBACK_LOOP_BIT_EXT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_FRAGMENT_DENSITY_MAP_BIT_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:748:9: error: 'VK_IMAGE_USAGE_SAMPLE_WEIGHT_BIT_QCOM' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_SAMPLED_BIT'?
|   748 |     if (VK_IMAGE_USAGE_SAMPLE_WEIGHT_BIT_QCOM & value) strings.push_back("IMAGE_USAGE_SAMPLE_WEIGHT_BIT_QCOM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_SAMPLED_BIT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:749:9: error: 'VK_IMAGE_USAGE_SAMPLE_BLOCK_MATCH_BIT_QCOM' was not declared in this scope
|   749 |     if (VK_IMAGE_USAGE_SAMPLE_BLOCK_MATCH_BIT_QCOM & value) strings.push_back("IMAGE_USAGE_SAMPLE_BLOCK_MATCH_BIT_QCOM");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1271:102: error: 'VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  1271 | void DumpVkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT &obj) {
|       |                                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                      VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1274:74: error: request for member 'attachmentFeedbackLoopLayout' in 'obj', which is of non-class type 'const int'
|  1274 |     p.PrintKeyBool("attachmentFeedbackLoopLayout", static_cast<bool>(obj.attachmentFeedbackLoopLayout));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1932:107: error: 'VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT' does not name a type
|  1932 | void DumpVkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT &obj) {
|       |                                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1935:79: error: request for member 'multisampledRenderToSingleSampled' in 'obj', which is of non-class type 'const int'
|  1935 |     p.PrintKeyBool("multisampledRenderToSingleSampled", static_cast<bool>(obj.multisampledRenderToSingleSampled));
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1950:92: error: 'VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  1950 | void DumpVkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT &obj) {
|       |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                            VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1953:64: error: request for member 'nonSeamlessCubeMap' in 'obj', which is of non-class type 'const int'
|  1953 |     p.PrintKeyBool("nonSeamlessCubeMap", static_cast<bool>(obj.nonSeamlessCubeMap));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1994:92: error: 'VkPhysicalDevicePipelineRobustnessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  1994 | void DumpVkPhysicalDevicePipelineRobustnessFeaturesEXT(Printer &p, std::string name, const VkPhysicalDevicePipelineRobustnessFeaturesEXT &obj) {
|       |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                            VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineRobustnessFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1997:64: error: request for member 'pipelineRobustness' in 'obj', which is of non-class type 'const int'
|  1997 |     p.PrintKeyBool("pipelineRobustness", static_cast<bool>(obj.pipelineRobustness));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1999:94: error: 'VkPhysicalDevicePipelineRobustnessPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceRobustness2PropertiesEXT'?
|  1999 | void DumpVkPhysicalDevicePipelineRobustnessPropertiesEXT(Printer &p, std::string name, const VkPhysicalDevicePipelineRobustnessPropertiesEXT &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineRobustnessPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2001:89: error: request for member 'defaultRobustnessStorageBuffers' in 'obj', which is of non-class type 'const int'
|  2001 |     DumpVkPipelineRobustnessBufferBehaviorEXT(p, "defaultRobustnessStorageBuffers", obj.defaultRobustnessStorageBuffers);
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2002:89: error: request for member 'defaultRobustnessUniformBuffers' in 'obj', which is of non-class type 'const int'
|  2002 |     DumpVkPipelineRobustnessBufferBehaviorEXT(p, "defaultRobustnessUniformBuffers", obj.defaultRobustnessUniformBuffers);
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2003:87: error: request for member 'defaultRobustnessVertexInputs' in 'obj', which is of non-class type 'const int'
|  2003 |     DumpVkPipelineRobustnessBufferBehaviorEXT(p, "defaultRobustnessVertexInputs", obj.defaultRobustnessVertexInputs);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2004:80: error: request for member 'defaultRobustnessImages' in 'obj', which is of non-class type 'const int'
|  2004 |     DumpVkPipelineRobustnessImageBehaviorEXT(p, "defaultRobustnessImages", obj.defaultRobustnessImages);
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2281:96: error: 'VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  2281 | void DumpVkPhysicalDeviceShaderModuleIdentifierFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT &obj) {
|       |                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                VkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderModuleIdentifierFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2284:68: error: request for member 'shaderModuleIdentifier' in 'obj', which is of non-class type 'const int'
|  2284 |     p.PrintKeyBool("shaderModuleIdentifier", static_cast<bool>(obj.shaderModuleIdentifier));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2286:98: error: 'VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderSMBuiltinsPropertiesNV'?
|  2286 | void DumpVkPhysicalDeviceShaderModuleIdentifierPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT &obj) {
|       |                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                  VkPhysicalDeviceShaderSMBuiltinsPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderModuleIdentifierPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2291:84: error: request for member 'shaderModuleIdentifierAlgorithmUUID' in 'obj', which is of non-class type 'const int'
|  2291 |         for (uint32_t i = 0; i < 16; i++) p.PrintElement(static_cast<uint32_t>(obj.shaderModuleIdentifierAlgorithmUUID[i]));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2293:82: error: request for member 'shaderModuleIdentifierAlgorithmUUID' in 'obj', which is of non-class type 'const int'
|  2293 |         p.PrintKeyString("shaderModuleIdentifierAlgorithmUUID", to_string_16(obj.shaderModuleIdentifierAlgorithmUUID));
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkQueueFamilyQueryResultStatusProperties2KHR(Printer&, std::string, const VkQueueFamilyQueryResultStatusProperties2KHR&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2709:70: error: 'const VkQueueFamilyQueryResultStatusProperties2KHR' {aka 'const struct VkQueueFamilyQueryResultStatusProperties2KHR'} has no member named 'queryResultStatusSupport'
|  2709 |     p.PrintKeyBool("queryResultStatusSupport", static_cast<bool>(obj.queryResultStatusSupport));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2716:82: error: 'VkSubpassResolvePerformanceQueryEXT' does not name a type
|  2716 | void DumpVkSubpassResolvePerformanceQueryEXT(Printer &p, std::string name, const VkSubpassResolvePerformanceQueryEXT &obj) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkSubpassResolvePerformanceQueryEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2719:53: error: request for member 'optimal' in 'obj', which is of non-class type 'const int'
|  2719 |     p.PrintKeyBool("optimal", static_cast<bool>(obj.optimal));
|       |                                                     ^~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2790:5: error: 'VkPhysicalDevicePipelineRobustnessPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceRobustness2PropertiesEXT'?
|  2790 |     VkPhysicalDevicePipelineRobustnessPropertiesEXT PhysicalDevicePipelineRobustnessPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceRobustness2PropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2803:5: error: 'VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderSMBuiltinsPropertiesNV'?
|  2803 |     VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT PhysicalDeviceShaderModuleIdentifierPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderSMBuiltinsPropertiesNV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2839:9: error: 'PhysicalDevicePipelineRobustnessPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  2839 |         PhysicalDevicePipelineRobustnessPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePipelineRobustnessPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2839:63: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT'?
|  2839 |         PhysicalDevicePipelineRobustnessPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2852:9: error: 'PhysicalDeviceShaderModuleIdentifierPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderModuleIdentifierPropertiesEXT'?
|  2852 |         PhysicalDeviceShaderModuleIdentifierPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderModuleIdentifierPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2852:67: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV'?
|  2852 |         PhysicalDeviceShaderModuleIdentifierPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT;
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2959:5: error: 'VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  2959 |     VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2994:5: error: 'VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT' does not name a type
|  2994 |     VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2996:5: error: 'VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceFragmentDensityMapFeaturesEXT'?
|  2996 |     VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT PhysicalDeviceNonSeamlessCubeMapFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceFragmentDensityMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3002:5: error: 'VkPhysicalDevicePipelineRobustnessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePipelinePropertiesFeaturesEXT'?
|  3002 |     VkPhysicalDevicePipelineRobustnessFeaturesEXT PhysicalDevicePipelineRobustnessFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelinePropertiesFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3031:5: error: 'VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceShaderAtomicFloatFeaturesEXT'?
|  3031 |     VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT PhysicalDeviceShaderModuleIdentifierFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderAtomicFloatFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3060:9: error: 'PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT'?
|  3060 |         PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3060:71: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT'?
|  3060 |         PhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT;
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3095:9: error: 'PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT'?
|  3095 |         PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3095:76: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT'?
|  3095 |         PhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3097:9: error: 'PhysicalDeviceNonSeamlessCubeMapFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT'?
|  3097 |         PhysicalDeviceNonSeamlessCubeMapFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3097:61: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT'?
|  3097 |         PhysicalDeviceNonSeamlessCubeMapFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT;
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3103:9: error: 'PhysicalDevicePipelineRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  3103 |         PhysicalDevicePipelineRobustnessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePipelineRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3103:61: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  3103 |         PhysicalDevicePipelineRobustnessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT;
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3131:9: error: 'PhysicalDeviceShaderModuleIdentifierFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderModuleIdentifierFeaturesEXT'?
|  3131 |         PhysicalDeviceShaderModuleIdentifierFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceShaderModuleIdentifierFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3131:65: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT'?
|  3131 |         PhysicalDeviceShaderModuleIdentifierFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT;
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3310:5: error: 'VkSubpassResolvePerformanceQueryEXT' does not name a type
|  3310 |     VkSubpassResolvePerformanceQueryEXT SubpassResolvePerformanceQueryEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void format_properties2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3313:9: error: 'SubpassResolvePerformanceQueryEXT' was not declared in this scope; did you mean 'DumpVkSubpassResolvePerformanceQueryEXT'?
|  3313 |         SubpassResolvePerformanceQueryEXT.sType = VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkSubpassResolvePerformanceQueryEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3313:51: error: 'VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT' was not declared in this scope
|  3313 |         SubpassResolvePerformanceQueryEXT.sType = VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT;
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3534:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT'?
|  3534 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3535:54: error: 'VK_EXT_PIPELINE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME'?
|  3535 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PIPELINE_ROBUSTNESS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3536:13: error: 'VkPhysicalDevicePipelineRobustnessPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  3536 |             VkPhysicalDevicePipelineRobustnessPropertiesEXT* props = (VkPhysicalDevicePipelineRobustnessPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePipelineRobustnessPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3536:62: error: 'props' was not declared in this scope
|  3536 |             VkPhysicalDevicePipelineRobustnessPropertiesEXT* props = (VkPhysicalDevicePipelineRobustnessPropertiesEXT*)structure;
|       |                                                              ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3536:119: error: expected primary-expression before ')' token
|  3536 |             VkPhysicalDevicePipelineRobustnessPropertiesEXT* props = (VkPhysicalDevicePipelineRobustnessPropertiesEXT*)structure;
|       |                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3605:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV'?
|  3605 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3606:54: error: 'VK_EXT_SHADER_MODULE_IDENTIFIER_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SHADER_VIEWPORT_INDEX_LAYER_EXTENSION_NAME'?
|  3606 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_MODULE_IDENTIFIER_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SHADER_VIEWPORT_INDEX_LAYER_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3607:13: error: 'VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderModuleIdentifierPropertiesEXT'?
|  3607 |             VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT* props = (VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderModuleIdentifierPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3607:66: error: 'props' was not declared in this scope
|  3607 |             VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT* props = (VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT*)structure;
|       |                                                                  ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3607:127: error: expected primary-expression before ')' token
|  3607 |             VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT* props = (VkPhysicalDeviceShaderModuleIdentifierPropertiesEXT*)structure;
|       |                                                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3707:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT'?
|  3707 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3708:54: error: 'VK_EXT_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_EXTENSION_NAME' was not declared in this scope
|  3708 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3709:13: error: 'VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT'?
|  3709 |             VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT* props = (VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3709:70: error: 'props' was not declared in this scope
|  3709 |             VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT* props = (VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT*)structure;
|       |                                                                      ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3709:135: error: expected primary-expression before ')' token
|  3709 |             VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT* props = (VkPhysicalDeviceAttachmentFeedbackLoopLayoutFeaturesEXT*)structure;
|       |                                                                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3925:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT'?
|  3925 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3926:54: error: 'VK_EXT_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_EXTENSION_NAME' was not declared in this scope
|  3926 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3927:13: error: 'VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT'?
|  3927 |             VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT* props = (VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3927:75: error: 'props' was not declared in this scope
|  3927 |             VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT* props = (VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT*)structure;
|       |                                                                           ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3927:145: error: expected primary-expression before ')' token
|  3927 |             VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT* props = (VkPhysicalDeviceMultisampledRenderToSingleSampledFeaturesEXT*)structure;
|       |                                                                                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3938:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT'?
|  3938 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3939:54: error: 'VK_EXT_NON_SEAMLESS_CUBE_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_HEADLESS_SURFACE_EXTENSION_NAME'?
|  3939 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_NON_SEAMLESS_CUBE_MAP_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_HEADLESS_SURFACE_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3940:13: error: 'VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT'?
|  3940 |             VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT* props = (VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3940:60: error: 'props' was not declared in this scope
|  3940 |             VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT* props = (VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT*)structure;
|       |                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3940:115: error: expected primary-expression before ')' token
|  3940 |             VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT* props = (VkPhysicalDeviceNonSeamlessCubeMapFeaturesEXT*)structure;
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3975:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT'?
|  3975 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3976:54: error: 'VK_EXT_PIPELINE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME'?
|  3976 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PIPELINE_ROBUSTNESS_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_IMAGE_ROBUSTNESS_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3977:13: error: 'VkPhysicalDevicePipelineRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  3977 |             VkPhysicalDevicePipelineRobustnessFeaturesEXT* props = (VkPhysicalDevicePipelineRobustnessFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePipelineRobustnessFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3977:60: error: 'props' was not declared in this scope
|  3977 |             VkPhysicalDevicePipelineRobustnessFeaturesEXT* props = (VkPhysicalDevicePipelineRobustnessFeaturesEXT*)structure;
|       |                                                            ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3977:115: error: expected primary-expression before ')' token
|  3977 |             VkPhysicalDevicePipelineRobustnessFeaturesEXT* props = (VkPhysicalDevicePipelineRobustnessFeaturesEXT*)structure;
|       |                                                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4141:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT'?
|  4141 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4142:54: error: 'VK_EXT_SHADER_MODULE_IDENTIFIER_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_SHADER_VIEWPORT_INDEX_LAYER_EXTENSION_NAME'?
|  4142 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_SHADER_MODULE_IDENTIFIER_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_SHADER_VIEWPORT_INDEX_LAYER_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4143:13: error: 'VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceShaderModuleIdentifierFeaturesEXT'?
|  4143 |             VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT* props = (VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceShaderModuleIdentifierFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4143:64: error: 'props' was not declared in this scope
|  4143 |             VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT* props = (VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT*)structure;
|       |                                                                ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4143:123: error: expected primary-expression before ')' token
|  4143 |             VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT* props = (VkPhysicalDeviceShaderModuleIdentifierFeaturesEXT*)structure;
|       |                                                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_format_properties2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4330:33: error: 'VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT' was not declared in this scope
|  4330 |         if (structure->sType == VK_STRUCTURE_TYPE_SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4331:54: error: 'VK_EXT_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_EXTENSION_NAME' was not declared in this scope
|  4331 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4332:13: error: 'VkSubpassResolvePerformanceQueryEXT' was not declared in this scope; did you mean 'DumpVkSubpassResolvePerformanceQueryEXT'?
|  4332 |             VkSubpassResolvePerformanceQueryEXT* props = (VkSubpassResolvePerformanceQueryEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkSubpassResolvePerformanceQueryEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4332:50: error: 'props' was not declared in this scope
|  4332 |             VkSubpassResolvePerformanceQueryEXT* props = (VkSubpassResolvePerformanceQueryEXT*)structure;
|       |                                                  ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/git/vulkaninfo/generated/vulkaninfo.hpp:4332:95: error: expected primary-expression before ')' token
|  4332 |             VkSubpassResolvePerformanceQueryEXT* props = (VkSubpassResolvePerformanceQueryEXT*)structure;
|       |                                                                                               ^
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/temp/run.do_compile.951448:154 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/temp/run.do_compile.951448, line 154
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/temp/run.do_compile.951448, line 148
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/temp/run.do_compile.951448, line 143
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/temp/run.do_compile.951448, line 167
NOTE: recipe vulkan-tools-1.3.224.1-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1198 tasks of which 1189 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-tools-1.3.224.1-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/temp/run.do_compile.951448', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.224.1-r0/temp/log.do_compile.951448
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.224.1.bb:do_compile) failed with exit code '1'

--===============4538987502829620133==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.216.0-1.3.224.1.patch"

RnJvbSBlNzJmM2U2ODBjNmM0NWYzZmU2NDIwMWJhNDhjMDMzNjA2YjAyYzYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTY6NTM6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjIxNi4wIC0+IDEuMy4yMjQuMQoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjMuMjE2LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yMjQuMS5iYn0gICAg
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdG9vbHNfMS4zLjIxNi4w
LmJiID0+IHZ1bGthbi10b29sc18xLjMuMjI0LjEuYmJ9ICg5NiUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS4zLjIxNi4wLmJiIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdG9vbHNfMS4zLjIyNC4xLmJiCnNpbWls
YXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4v
dnVsa2FuLXRvb2xzXzEuMy4yMTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3Z1bGthbi92dWxrYW4tdG9vbHNfMS4zLjIyNC4xLmJiCmluZGV4IGUyNmY0NTA0ZjEuLmJlZDEw
YWZlZjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRv
b2xzXzEuMy4yMTYuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi10b29sc18xLjMuMjI0LjEuYmIKQEAgLTcsNyArNyw3IEBAIFNFQ1RJT04gPSAibGlicyIKIExJ
Q0VOU0UgPSAiQXBhY2hlLTIuMCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0Uu
dHh0O21kNT0zYjgzZWY5NjM4N2YxNDY1NWZjODU0ZGRjM2M2YmQ1NyIKIFNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvVnVsa2FuLVRvb2xzLmdpdDticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImVmOWRiN2E4ZWM1MmY2YzU2MTU4ZDgzZjVkNTdl
ZjM4OGMxYWJlYzEiCitTUkNSRVYgPSAiNDk3ZjIzMjY4MGIwNDZkYjM0YmE5ZTlkYTA2NWU2MzAz
YTEyNTg1MSIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi4zMS4xCgo=

--===============4538987502829620133==--

