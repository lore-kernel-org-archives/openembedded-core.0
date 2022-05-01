Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F304C3527D
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 19:49:11 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.2288.1651434544668616208
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 12:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=VdEVco2V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010180812b5b34-be5c1654-9ea4-4f7f-befc-7b5cbd9cf604-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wt0hNbAMLa9PNgcMcXIT9SBk3pyHr4azhUfLSnGmcuA=;
	b=VdEVco2VwnqC8XMCYw0iyJnkafwD9Baq00HYXxkO5WjdfanyoKykB3tt+tlpgRFX
	f5ZYHSW8Gnwopul84KInUcDsb6TVBE3ZXg+oLejrpK8AEi4TCAWzeZaY15qDRaB8S95
	e2ImO8qBb050PwfyBrTkXIph6h4EEFrVpmqD3Uc8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1651434544;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wt0hNbAMLa9PNgcMcXIT9SBk3pyHr4azhUfLSnGmcuA=;
	b=fTvucXbqpKTfuXDD2MM6gS21G+Y7j8ntiI0PYwiQqfMTBF/htHtQXm/ooXSfO1zD
	/I8KyQx00tU8b6UC7kH5GQv57rfHKNCVmeey6w7DHuH6pXDPfHLA6jd1JSEuQBMWUgg
	jgBr9itxrxL5TbExSrxEehHQdPl0nXZ1JX3zz+zE=
Content-Type: multipart/mixed; boundary="===============5253975112788353209=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.211.0 FAILED
Message-ID: 
 <01010180812b5b34-be5c1654-9ea4-4f7f-befc-7b5cbd9cf604-000000@us-west-2.amazonses.com>
Date: Sun, 1 May 2022 19:49:04 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 19:49:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165149

--===============5253975112788353209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.211.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.204.1-1.3.211.0.patch
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
--===============5253975112788353209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1642 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-74909d4250e3ada1628fbd90c739541edf311970"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:74909d4250e3ada1628fbd90c739541edf311970"
workspace            = "master:9e556960421c8bbe8851d9810352a5b4bd3b50df"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 84 Mirrors 0 Missed 7 Current 232 (92% match, 97% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1136 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_fetch: Succeeded
NOTE: Running task 1191 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_unpack)
NOTE: Running task 1192 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_unpack: Succeeded
NOTE: Running task 1193 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_patch: Succeeded
NOTE: Running task 1194 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1195 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_generate_toolchain_file)
NOTE: Running task 1196 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1197 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_configure: Succeeded
NOTE: Running task 1198 of 1205 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/build --target all --
| [1/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp
 /work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0=/usr/src/debug/vulkan-tools/1.3.211.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0=/usr/src/debug/vulkan-tools/1.3.211.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidd
 en -Wpointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/build/icd -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/build -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/
 core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0=/usr/src/debug/vulkan-tools/1.3.211.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0=/usr/src/debug/vulkan-tools/1.3.211.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -Wp
 ointer-arith -Wno-unused-function -Wno-sign-compare -fPIC -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/generated/mock_icd.cpp.o -c /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/mock_icd.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/mock_icd.cpp:22:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/mock_icd.h:3518:11: error: 'VkDescriptorSetBindingReferenceVALVE' does not name a type
|  3518 |     const VkDescriptorSetBindingReferenceVALVE* pBindingReference,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/mock_icd.h:3519:5: error: 'VkDescriptorSetLayoutHostMappingInfoVALVE' has not been declared
|  3519 |     VkDescriptorSetLayoutHostMappingInfoVALVE*  pHostMapping);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/mock_icd.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:2311:31: error: 'VkVideoDecodeCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoCapabilitiesKHR'?
|  2311 | template <> struct LvlTypeMap<VkVideoDecodeCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:2311:59: error: template argument 1 is invalid
|  2311 | template <> struct LvlTypeMap<VkVideoDecodeCapabilitiesKHR> {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:2315:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR'?
|  2315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:2315:79: error: template argument 1 is invalid
|  2315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_CAPABILITIES_KHR> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:2939:31: error: 'VkVideoEncodeCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoCapabilitiesKHR'?
|  2939 | template <> struct LvlTypeMap<VkVideoEncodeCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoCapabilitiesKHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:2939:59: error: template argument 1 is invalid
|  2939 | template <> struct LvlTypeMap<VkVideoEncodeCapabilitiesKHR> {
|       |                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:2943:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR'?
|  2943 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_CAPABILITIES_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:2943:79: error: template argument 1 is invalid
|  2943 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_CAPABILITIES_KHR> {
|       |                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:3196:31: error: 'VkVideoEncodeH264ReferenceListsEXT' was not declared in this scope; did you mean 'VkVideoEncodeH265ReferenceListsEXT'?
|  3196 | template <> struct LvlTypeMap<VkVideoEncodeH264ReferenceListsEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265ReferenceListsEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:3196:65: error: template argument 1 is invalid
|  3196 | template <> struct LvlTypeMap<VkVideoEncodeH264ReferenceListsEXT> {
|       |                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:3200:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_REFERENCE_LISTS_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_REFERENCE_LISTS_EXT'?
|  3200 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_REFERENCE_LISTS_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_REFERENCE_LISTS_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:3200:87: error: template argument 1 is invalid
|  3200 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_REFERENCE_LISTS_EXT> {
|       |                                                                                       ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:3328:31: error: 'VkVideoEncodeH265NaluSliceSegmentEXT' was not declared in this scope; did you mean 'VkVideoEncodeH265NaluSliceEXT'?
|  3328 | template <> struct LvlTypeMap<VkVideoEncodeH265NaluSliceSegmentEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265NaluSliceEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:3328:67: error: template argument 1 is invalid
|  3328 | template <> struct LvlTypeMap<VkVideoEncodeH265NaluSliceSegmentEXT> {
|       |                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:3332:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_EXT'?
|  3332 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:3332:90: error: template argument 1 is invalid
|  3332 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_EXT> {
|       |                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5142:31: error: 'VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  5142 | template <> struct LvlTypeMap<VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5142:81: error: template argument 1 is invalid
|  5142 | template <> struct LvlTypeMap<VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT> {
|       |                                                                                 ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5146:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  5146 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5146:104: error: template argument 1 is invalid
|  5146 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT> {
|       |                                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5151:31: error: 'VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceTransformFeedbackPropertiesEXT'?
|  5151 | template <> struct LvlTypeMap<VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTransformFeedbackPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5151:83: error: template argument 1 is invalid
|  5151 | template <> struct LvlTypeMap<VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT> {
|       |                                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5155:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT'?
|  5155 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5155:106: error: template argument 1 is invalid
|  5155 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT> {
|       |                                                                                                          ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5160:31: error: 'VkGraphicsPipelineLibraryCreateInfoEXT' was not declared in this scope; did you mean 'VkGraphicsPipelineCreateInfo'?
|  5160 | template <> struct LvlTypeMap<VkGraphicsPipelineLibraryCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkGraphicsPipelineCreateInfo
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5160:69: error: template argument 1 is invalid
|  5160 | template <> struct LvlTypeMap<VkGraphicsPipelineLibraryCreateInfoEXT> {
|       |                                                                     ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5164:32: error: 'VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR'?
|  5164 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5164:91: error: template argument 1 is invalid
|  5164 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT> {
|       |                                                                                           ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5635:31: error: 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceProvokingVertexFeaturesEXT'?
|  5635 | template <> struct LvlTypeMap<VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceProvokingVertexFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5635:82: error: template argument 1 is invalid
|  5635 | template <> struct LvlTypeMap<VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT> {
|       |                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5639:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT'?
|  5639 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5639:105: error: template argument 1 is invalid
|  5639 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT> {
|       |                                                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5680:31: error: 'VkPhysicalDeviceImage2DViewOf3DFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceImageViewMinLodFeaturesEXT'?
|  5680 | template <> struct LvlTypeMap<VkPhysicalDeviceImage2DViewOf3DFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceImageViewMinLodFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5680:73: error: template argument 1 is invalid
|  5680 | template <> struct LvlTypeMap<VkPhysicalDeviceImage2DViewOf3DFeaturesEXT> {
|       |                                                                         ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5684:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT'?
|  5684 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5684:98: error: template argument 1 is invalid
|  5684 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT> {
|       |                                                                                                  ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5716:31: error: 'VkPhysicalDeviceDescriptorSetHostMappingFeaturesVALVE' was not declared in this scope; did you mean 'VkPhysicalDeviceDescriptorIndexingFeaturesEXT'?
|  5716 | template <> struct LvlTypeMap<VkPhysicalDeviceDescriptorSetHostMappingFeaturesVALVE> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDescriptorIndexingFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5716:84: error: template argument 1 is invalid
|  5716 | template <> struct LvlTypeMap<VkPhysicalDeviceDescriptorSetHostMappingFeaturesVALVE> {
|       |                                                                                    ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5720:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES_EXT'?
|  5720 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5720:108: error: template argument 1 is invalid
|  5720 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE> {
|       |                                                                                                            ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5725:31: error: 'VkDescriptorSetBindingReferenceVALVE' was not declared in this scope
|  5725 | template <> struct LvlTypeMap<VkDescriptorSetBindingReferenceVALVE> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5725:67: error: template argument 1 is invalid
|  5725 | template <> struct LvlTypeMap<VkDescriptorSetBindingReferenceVALVE> {
|       |                                                                   ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5729:32: error: 'VK_STRUCTURE_TYPE_DESCRIPTOR_SET_BINDING_REFERENCE_VALVE' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO'?
|  5729 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DESCRIPTOR_SET_BINDING_REFERENCE_VALVE> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5729:88: error: template argument 1 is invalid
|  5729 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DESCRIPTOR_SET_BINDING_REFERENCE_VALVE> {
|       |                                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5734:31: error: 'VkDescriptorSetLayoutHostMappingInfoVALVE' was not declared in this scope
|  5734 | template <> struct LvlTypeMap<VkDescriptorSetLayoutHostMappingInfoVALVE> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5734:72: error: template argument 1 is invalid
|  5734 | template <> struct LvlTypeMap<VkDescriptorSetLayoutHostMappingInfoVALVE> {
|       |                                                                        ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5738:32: error: 'VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO'?
|  5738 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/vk_typemap_helper.h:5738:95: error: template argument 1 is invalid
|  5738 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE> {
|       |                                                                                               ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/mock_icd.cpp:5684:11: error: 'VkDescriptorSetBindingReferenceVALVE' does not name a type
|  5684 |     const VkDescriptorSetBindingReferenceVALVE* pBindingReference,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/icd/generated/mock_icd.cpp:5685:5: error: 'VkDescriptorSetLayoutHostMappingInfoVALVE' has not been declared
|  5685 |     VkDescriptorSetLayoutHostMappingInfoVALVE*  pHostMapping)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [2/5] /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulk
 an-tools/1.3.211.0-r0=/usr/src/debug/vulkan-tools/1.3.211.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0=/usr/src/debug/vulkan-tools/1.3.211.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/a
 uh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-too
 ls/1.3.211.0-r0=/usr/src/debug/vulkan-tools/1.3.211.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0=/usr/src/debug/vulkan-tools/1.3.211.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -fno-strict-aliasing -fno-builtin-memcmp -Wimplicit-fallthrough=0 -std=c++11 -fno-rtti -fvisibility=hidden -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /home/pokybuild/yocto-worker/auh/bui
 ld/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:27,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/vulkaninfo.cpp:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/vulkaninfo.h: In constructor 'AppInstance::AppInstance()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/vulkaninfo.h:651:36: error: 'VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME'?
|   651 |             (CheckExtensionEnabled(VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME)
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                    VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/vulkaninfo.h:652:55: error: 'VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR' was not declared in this scope
|   652 |                  ? static_cast<VkInstanceCreateFlags>(VK_INSTANCE_CREATE_ENUMERATE_PORTABILITY_BIT_KHR)
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/vulkaninfo.cpp:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1658:97: error: 'VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  1658 | void DumpVkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT &obj) {
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                 VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1661:69: error: request for member 'graphicsPipelineLibrary' in 'obj', which is of non-class type 'const int'
|  1661 |     p.PrintKeyBool("graphicsPipelineLibrary", static_cast<bool>(obj.graphicsPipelineLibrary));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1663:99: error: 'VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceTransformFeedbackPropertiesEXT'?
|  1663 | void DumpVkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT &obj) {
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                   VkPhysicalDeviceTransformFeedbackPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1666:80: error: request for member 'graphicsPipelineLibraryFastLinking' in 'obj', which is of non-class type 'const int'
|  1666 |     p.PrintKeyBool("graphicsPipelineLibraryFastLinking", static_cast<bool>(obj.graphicsPipelineLibraryFastLinking));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1667:103: error: request for member 'graphicsPipelineLibraryIndependentInterpolationDecoration' in 'obj', which is of non-class type 'const int'
|  1667 |     p.PrintKeyBool("graphicsPipelineLibraryIndependentInterpolationDecoration", static_cast<bool>(obj.graphicsPipelineLibraryIndependentInterpolationDecoration));
|       |                                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1697:89: error: 'VkPhysicalDeviceImage2DViewOf3DFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceImageViewMinLodFeaturesEXT'?
|  1697 | void DumpVkPhysicalDeviceImage2DViewOf3DFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceImage2DViewOf3DFeaturesEXT &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDeviceImageViewMinLodFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceImage2DViewOf3DFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1700:61: error: request for member 'image2DViewOf3D' in 'obj', which is of non-class type 'const int'
|  1700 |     p.PrintKeyBool("image2DViewOf3D", static_cast<bool>(obj.image2DViewOf3D));
|       |                                                             ^~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:1701:63: error: request for member 'sampler2DViewOf3D' in 'obj', which is of non-class type 'const int'
|  1701 |     p.PrintKeyBool("sampler2DViewOf3D", static_cast<bool>(obj.sampler2DViewOf3D));
|       |                                                               ^~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2053:98: error: 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceProvokingVertexFeaturesEXT'?
|  2053 | void DumpVkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT(Printer &p, std::string name, const VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT &obj) {
|       |                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                  VkPhysicalDeviceProvokingVertexFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT(Printer&, std::string, const int&)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2056:70: error: request for member 'primitivesGeneratedQuery' in 'obj', which is of non-class type 'const int'
|  2056 |     p.PrintKeyBool("primitivesGeneratedQuery", static_cast<bool>(obj.primitivesGeneratedQuery));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2057:91: error: request for member 'primitivesGeneratedQueryWithRasterizerDiscard' in 'obj', which is of non-class type 'const int'
|  2057 |     p.PrintKeyBool("primitivesGeneratedQueryWithRasterizerDiscard", static_cast<bool>(obj.primitivesGeneratedQueryWithRasterizerDiscard));
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2058:88: error: request for member 'primitivesGeneratedQueryWithNonZeroStreams' in 'obj', which is of non-class type 'const int'
|  2058 |     p.PrintKeyBool("primitivesGeneratedQueryWithNonZeroStreams", static_cast<bool>(obj.primitivesGeneratedQueryWithNonZeroStreams));
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2769:5: error: 'VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceTransformFeedbackPropertiesEXT'?
|  2769 |     VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT PhysicalDeviceGraphicsPipelineLibraryPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceTransformFeedbackPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2815:9: error: 'PhysicalDeviceGraphicsPipelineLibraryPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT'?
|  2815 |         PhysicalDeviceGraphicsPipelineLibraryPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2815:68: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT'?
|  2815 |         PhysicalDeviceGraphicsPipelineLibraryPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT;
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2959:5: error: 'VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceTransformFeedbackFeaturesEXT'?
|  2959 |     VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT PhysicalDeviceGraphicsPipelineLibraryFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceTransformFeedbackFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2961:5: error: 'VkPhysicalDeviceImage2DViewOf3DFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceImageViewMinLodFeaturesEXT'?
|  2961 |     VkPhysicalDeviceImage2DViewOf3DFeaturesEXT PhysicalDeviceImage2DViewOf3DFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceImageViewMinLodFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:2982:5: error: 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceProvokingVertexFeaturesEXT'?
|  2982 |     VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT PhysicalDevicePrimitivesGeneratedQueryFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceProvokingVertexFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain()':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3049:9: error: 'PhysicalDeviceGraphicsPipelineLibraryFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT'?
|  3049 |         PhysicalDeviceGraphicsPipelineLibraryFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3049:66: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  3049 |         PhysicalDeviceGraphicsPipelineLibraryFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3051:9: error: 'PhysicalDeviceImage2DViewOf3DFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImage2DViewOf3DFeaturesEXT'?
|  3051 |         PhysicalDeviceImage2DViewOf3DFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceImage2DViewOf3DFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3051:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT'?
|  3051 |         PhysicalDeviceImage2DViewOf3DFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3072:9: error: 'PhysicalDevicePrimitivesGeneratedQueryFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  3072 |         PhysicalDevicePrimitivesGeneratedQueryFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3072:67: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT'?
|  3072 |         PhysicalDevicePrimitivesGeneratedQueryFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT;
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3444:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT'?
|  3444 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3445:54: error: 'VK_EXT_GRAPHICS_PIPELINE_LIBRARY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|  3445 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_GRAPHICS_PIPELINE_LIBRARY_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3446:13: error: 'VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT'?
|  3446 |             VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT* props = (VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3446:67: error: 'props' was not declared in this scope
|  3446 |             VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT* props = (VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT*)structure;
|       |                                                                   ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3446:129: error: expected primary-expression before ')' token
|  3446 |             VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT* props = (VkPhysicalDeviceGraphicsPipelineLibraryPropertiesEXT*)structure;
|       |                                                                                                                                 ^
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/vulkaninfo.cpp:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, void*)':
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3787:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT'?
|  3787 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3788:54: error: 'VK_EXT_GRAPHICS_PIPELINE_LIBRARY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|  3788 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_GRAPHICS_PIPELINE_LIBRARY_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3789:13: error: 'VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT'?
|  3789 |             VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT* props = (VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3789:65: error: 'props' was not declared in this scope
|  3789 |             VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT* props = (VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT*)structure;
|       |                                                                 ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3789:125: error: expected primary-expression before ')' token
|  3789 |             VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT* props = (VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT*)structure;
|       |                                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3800:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT'?
|  3800 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3801:54: error: 'VK_EXT_IMAGE_2D_VIEW_OF_3D_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_IMAGE_VIEW_MIN_LOD_EXTENSION_NAME'?
|  3801 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_IMAGE_2D_VIEW_OF_3D_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_IMAGE_VIEW_MIN_LOD_EXTENSION_NAME
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3802:13: error: 'VkPhysicalDeviceImage2DViewOf3DFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceImage2DViewOf3DFeaturesEXT'?
|  3802 |             VkPhysicalDeviceImage2DViewOf3DFeaturesEXT* props = (VkPhysicalDeviceImage2DViewOf3DFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceImage2DViewOf3DFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3802:57: error: 'props' was not declared in this scope
|  3802 |             VkPhysicalDeviceImage2DViewOf3DFeaturesEXT* props = (VkPhysicalDeviceImage2DViewOf3DFeaturesEXT*)structure;
|       |                                                         ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3802:109: error: expected primary-expression before ')' token
|  3802 |             VkPhysicalDeviceImage2DViewOf3DFeaturesEXT* props = (VkPhysicalDeviceImage2DViewOf3DFeaturesEXT*)structure;
|       |                                                                                                             ^
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3922:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT'?
|  3922 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT &&
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_EXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3923:54: error: 'VK_EXT_PRIMITIVES_GENERATED_QUERY_EXTENSION_NAME' was not declared in this scope
|  3923 |            (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRIMITIVES_GENERATED_QUERY_EXTENSION_NAME))) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3924:13: error: 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  3924 |             VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT* props = (VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3924:66: error: 'props' was not declared in this scope
|  3924 |             VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT* props = (VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT*)structure;
|       |                                                                  ^~~~~
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/git/vulkaninfo/generated/vulkaninfo.hpp:3924:127: error: expected primary-expression before ')' token
|  3924 |             VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT* props = (VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT*)structure;
|       |                                                                                                                               ^
| ninja: build stopped: subcommand failed.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/temp/run.do_compile.4104420:155 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/temp/run.do_compile.4104420, line 155
| 	#2: cmake_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/temp/run.do_compile.4104420, line 149
| 	#3: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/temp/run.do_compile.4104420, line 144
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/temp/run.do_compile.4104420, line 168
NOTE: recipe vulkan-tools-1.3.211.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1198 tasks of which 1189 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_compile
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: vulkan-tools-1.3.211.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/temp/run.do_compile.4104420', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-tools/1.3.211.0-r0/temp/log.do_compile.4104420
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb:do_compile) failed with exit code '1'

--===============5253975112788353209==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.204.1-1.3.211.0.patch"

From 9a29aa01de03df20c0025f5655c9757737c4b2dd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 May 2022 15:20:45 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.204.1 -> 1.3.211.0

---
 .../{vulkan-tools_1.3.204.1.bb => vulkan-tools_1.3.211.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.204.1.bb => vulkan-tools_1.3.211.0.bb} (93%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
similarity index 93%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
index ae062f3ee2..3cb4ccc23f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.204.1.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.211.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.204;protocol=https"
-SRCREV = "b9a87a24a814e443b1adfc5a6bc2e57243446f6c"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.211;protocol=https"
+SRCREV = "4fdfd2b1187ab44f062d091ba3113c5e3eab5a1b"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============5253975112788353209==--

