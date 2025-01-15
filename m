Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BADC0218A
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:30 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.17795.1736936765289401376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=OMq5vE15;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rrciM711;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010194697ff042-eb7b6a9c-6012-41ff-993d-ec8012b6146d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Fo6zQDYYzNqunDuHsIY4E7vPblDtewz6MvkzA9uc9kc=;
	b=OMq5vE15v6gKnh6uzDdHPH5+LYdIv5IUxOrfaPVM5a9f1dvdhOEp1lgujvZB1ZHM
	vhPdsSLF5sm4DuD3qHfJ8dUD4Voxp6Vlt53x5djBBFy0qiX5OUq9C1pNcRQDXn/9saT
	9vZLQybAPawhmYQy+ht84mfjKZybfc3AQvfgtu2w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936780;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Fo6zQDYYzNqunDuHsIY4E7vPblDtewz6MvkzA9uc9kc=;
	b=rrciM711H1S3EARQ84a0j5e3FqwehJ/5sBA2nJ+ezNWfXxXusfn1aqAagUF/5FP/
	nWKtI1sweK2gflqZi0VUYhk0QZLKN+MxTQyOgbEVhmF5qpiykYI2LM4HWSAFgTWUkvY
	Xn9m2pqFrntkm0I7C00xSRUSrPs58o4S1nHAZH+E=
Content-Type: multipart/mixed; boundary="===============6332638254408511953=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.4.304.0 FAILED
Message-ID: <01010194697ff042-eb7b6a9c-6012-41ff-993d-ec8012b6146d-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209877

--===============6332638254408511953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.4.304.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.296.0-1.4.304.0.patch
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
From f9adbd9e9476a091ca41ee2762c43dd874d948f5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 09:38:04 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.296.0 -> 1.4.304.0

---
 .../{vulkan-tools_1.3.296.0.bb => vulkan-tools_1.4.304.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.296.0.bb => vulkan-tools_1.4.304.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb
index 5f83f4f246..16ec263067 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.296;protocol=https"
-SRCREV = "74dd90abd69f813220b572e1d89c17bc7784972d"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
+SRCREV = "4c25e78dd87720275ab069de1fe2e005cd528ed9"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============6332638254408511953==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.296.0-1.4.304.0.patch"

RnJvbSBmOWFkYmQ5ZTk0NzZhMDkxY2E0MWVlMjc2MmM0M2RkODc0ZDk0OGY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDk6Mzg6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjI5Ni4wIC0+IDEuNC4zMDQuMAoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjMuMjk2LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zMDQuMC5iYn0gIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29sc18xLjMuMjk2
LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zMDQuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjk2LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzA0LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS4zLjI5Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzA0LjAuYmIKaW5kZXggNWY4M2Y0ZjI0Ni4uMTZl
YzI2MzA2NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
dG9vbHNfMS4zLjI5Ni4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXRvb2xzXzEuNC4zMDQuMC5iYgpAQCAtNiw4ICs2LDggQEAgU0VDVElPTiA9ICJsaWJzIgog
CiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPXZ1
bGthbi1zZGstMS4zLjI5Njtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICI3NGRkOTBhYmQ2OWY4
MTMyMjBiNTcyZTFkODljMTdiYzc3ODQ5NzJkIgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L0tocm9ub3NHcm91cC9WdWxrYW4tVG9vbHMuZ2l0O2JyYW5jaD1tYWluO3Byb3RvY29sPWh0dHBz
IgorU1JDUkVWID0gIjRjMjVlNzhkZDg3NzIwMjc1YWIwNjlkZTFmZTJlMDA1Y2Q1MjhlZDkiCiAK
IFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMQoK

--===============6332638254408511953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1874 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1874 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:59986e60ecfb5aa0a49b45b253d20beb13f50e2f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 192 Local 180 Mirrors 0 Missed 12 Current 380 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1444 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_recipe_qa)
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1595 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_fetch: Succeeded
NOTE: Running task 1596 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_unpack)
NOTE: Running task 1597 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_unpack: Succeeded
NOTE: Running task 1598 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_patch)
NOTE: Running task 1599 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_patch: Succeeded
NOTE: Running task 1600 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1601 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_generate_toolchain_file)
NOTE: Running task 1602 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_populate_lic: Succeeded
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1603 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_configure: Succeeded
NOTE: Running task 1604 of 1615 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/4] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot -DGIT_BRANCH_NAME=\"main\" -DGIT_TAG_INFO=\"vulkan-sdk-1.4.304.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-wor
 ker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git=/usr/src/debug/vulkan-tools/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0
 /recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot -DGIT_BRANCH_NAME=\"main\" -DGIT_TAG_INFO=\"vulkan-sdk-1.4.304.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/au
 h/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git=/usr/src/debug/vulkan-tools/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recip
 e-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/mock_icd.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/mock_icd.h:40,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/mock_icd.cpp:17:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1969:31: error: 'VkPhysicalDeviceVulkan14Features' was not declared in this scope; did you mean 'VkPhysicalDeviceVulkan13Features'?
|  1969 | template <> struct LvlTypeMap<VkPhysicalDeviceVulkan14Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVulkan13Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1969:63: error: template argument 1 is invalid
|  1969 | template <> struct LvlTypeMap<VkPhysicalDeviceVulkan14Features> {
|       |                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1973:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES'?
|  1973 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1973:85: error: template argument 1 is invalid
|  1973 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1978:31: error: 'VkPhysicalDeviceVulkan14Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceVulkan13Properties'?
|  1978 | template <> struct LvlTypeMap<VkPhysicalDeviceVulkan14Properties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVulkan13Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1978:65: error: template argument 1 is invalid
|  1978 | template <> struct LvlTypeMap<VkPhysicalDeviceVulkan14Properties> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1982:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES'?
|  1982 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1982:87: error: template argument 1 is invalid
|  1982 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1987:31: error: 'VkDeviceQueueGlobalPriorityCreateInfo' was not declared in this scope; did you mean 'VkDeviceQueueGlobalPriorityCreateInfoKHR'?
|  1987 | template <> struct LvlTypeMap<VkDeviceQueueGlobalPriorityCreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDeviceQueueGlobalPriorityCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1987:68: error: template argument 1 is invalid
|  1987 | template <> struct LvlTypeMap<VkDeviceQueueGlobalPriorityCreateInfo> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1991:32: error: 'VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR'?
|  1991 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1991:90: error: template argument 1 is invalid
|  1991 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1996:31: error: 'VkPhysicalDeviceGlobalPriorityQueryFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  1996 | template <> struct LvlTypeMap<VkPhysicalDeviceGlobalPriorityQueryFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:1996:74: error: template argument 1 is invalid
|  1996 | template <> struct LvlTypeMap<VkPhysicalDeviceGlobalPriorityQueryFeatures> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2000:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR'?
|  2000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2000:96: error: template argument 1 is invalid
|  2000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2005:31: error: 'VkQueueFamilyGlobalPriorityProperties' was not declared in this scope; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  2005 | template <> struct LvlTypeMap<VkQueueFamilyGlobalPriorityProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2005:68: error: template argument 1 is invalid
|  2005 | template <> struct LvlTypeMap<VkQueueFamilyGlobalPriorityProperties> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2009:32: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR'?
|  2009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2009:89: error: template argument 1 is invalid
|  2009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2014:31: error: 'VkPhysicalDeviceShaderSubgroupRotateFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  2014 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderSubgroupRotateFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2014:75: error: template argument 1 is invalid
|  2014 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderSubgroupRotateFeatures> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2018:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR'?
|  2018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2018:97: error: template argument 1 is invalid
|  2018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES> {
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2023:31: error: 'VkPhysicalDeviceShaderFloatControls2Features' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  2023 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderFloatControls2Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2023:75: error: template argument 1 is invalid
|  2023 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderFloatControls2Features> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2027:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR'?
|  2027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2027:98: error: template argument 1 is invalid
|  2027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2032:31: error: 'VkPhysicalDeviceShaderExpectAssumeFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  2032 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderExpectAssumeFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2032:73: error: template argument 1 is invalid
|  2032 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderExpectAssumeFeatures> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2036:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR'?
|  2036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2036:95: error: template argument 1 is invalid
|  2036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2041:31: error: 'VkPhysicalDeviceLineRasterizationFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  2041 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2041:72: error: template argument 1 is invalid
|  2041 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationFeatures> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2045:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR'?
|  2045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2045:93: error: template argument 1 is invalid
|  2045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES> {
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2050:31: error: 'VkPhysicalDeviceLineRasterizationProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  2050 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2050:74: error: template argument 1 is invalid
|  2050 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationProperties> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2054:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR'?
|  2054 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2054:95: error: template argument 1 is invalid
|  2054 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2059:31: error: 'VkPipelineRasterizationLineStateCreateInfo' was not declared in this scope; did you mean 'VkPipelineRasterizationLineStateCreateInfoKHR'?
|  2059 | template <> struct LvlTypeMap<VkPipelineRasterizationLineStateCreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineRasterizationLineStateCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2059:73: error: template argument 1 is invalid
|  2059 | template <> struct LvlTypeMap<VkPipelineRasterizationLineStateCreateInfo> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2063:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR'?
|  2063 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2063:95: error: template argument 1 is invalid
|  2063 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2068:31: error: 'VkPhysicalDeviceVertexAttributeDivisorProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR'?
|  2068 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeDivisorProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2068:79: error: template argument 1 is invalid
|  2068 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeDivisorProperties> {
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2072:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR'?
|  2072 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2072:101: error: template argument 1 is invalid
|  2072 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2077:31: error: 'VkPipelineVertexInputDivisorStateCreateInfo' was not declared in this scope; did you mean 'VkPipelineVertexInputDivisorStateCreateInfoKHR'?
|  2077 | template <> struct LvlTypeMap<VkPipelineVertexInputDivisorStateCreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineVertexInputDivisorStateCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2077:74: error: template argument 1 is invalid
|  2077 | template <> struct LvlTypeMap<VkPipelineVertexInputDivisorStateCreateInfo> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2081:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_KHR'?
|  2081 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2081:97: error: template argument 1 is invalid
|  2081 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO> {
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2086:31: error: 'VkPhysicalDeviceVertexAttributeDivisorFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  2086 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeDivisorFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2086:77: error: template argument 1 is invalid
|  2086 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeDivisorFeatures> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2090:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR'?
|  2090 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2090:99: error: template argument 1 is invalid
|  2090 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES> {
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2095:31: error: 'VkPhysicalDeviceIndexTypeUint8Features' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  2095 | template <> struct LvlTypeMap<VkPhysicalDeviceIndexTypeUint8Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2095:69: error: template argument 1 is invalid
|  2095 | template <> struct LvlTypeMap<VkPhysicalDeviceIndexTypeUint8Features> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2099:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR'?
|  2099 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2099:91: error: template argument 1 is invalid
|  2099 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2104:31: error: 'VkMemoryMapInfo' was not declared in this scope; did you mean 'VkMemoryMapInfoKHR'?
|  2104 | template <> struct LvlTypeMap<VkMemoryMapInfo> {
|       |                               ^~~~~~~~~~~~~~~
|       |                               VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2104:46: error: template argument 1 is invalid
|  2104 | template <> struct LvlTypeMap<VkMemoryMapInfo> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2108:32: error: 'VK_STRUCTURE_TYPE_MEMORY_MAP_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_MAP_INFO_KHR'?
|  2108 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_MAP_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_MAP_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2108:65: error: template argument 1 is invalid
|  2108 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_MAP_INFO> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2113:31: error: 'VkMemoryUnmapInfo' was not declared in this scope; did you mean 'VkMemoryUnmapInfoKHR'?
|  2113 | template <> struct LvlTypeMap<VkMemoryUnmapInfo> {
|       |                               ^~~~~~~~~~~~~~~~~
|       |                               VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2113:48: error: template argument 1 is invalid
|  2113 | template <> struct LvlTypeMap<VkMemoryUnmapInfo> {
|       |                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2117:32: error: 'VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO_KHR'?
|  2117 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2117:67: error: template argument 1 is invalid
|  2117 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2122:31: error: 'VkPhysicalDeviceMaintenance5Features' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  2122 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2122:67: error: template argument 1 is invalid
|  2122 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5Features> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2126:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  2126 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2126:88: error: template argument 1 is invalid
|  2126 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2131:31: error: 'VkPhysicalDeviceMaintenance5Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  2131 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5Properties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2131:69: error: template argument 1 is invalid
|  2131 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5Properties> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2135:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  2135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2135:90: error: template argument 1 is invalid
|  2135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2140:31: error: 'VkRenderingAreaInfo' was not declared in this scope; did you mean 'VkRenderingAreaInfoKHR'?
|  2140 | template <> struct LvlTypeMap<VkRenderingAreaInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2140:50: error: template argument 1 is invalid
|  2140 | template <> struct LvlTypeMap<VkRenderingAreaInfo> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2144:32: error: 'VK_STRUCTURE_TYPE_RENDERING_AREA_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_AREA_INFO_KHR'?
|  2144 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_AREA_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_AREA_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2144:69: error: template argument 1 is invalid
|  2144 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_AREA_INFO> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2149:31: error: 'VkImageSubresource2' was not declared in this scope; did you mean 'VkImageSubresource'?
|  2149 | template <> struct LvlTypeMap<VkImageSubresource2> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2149:50: error: template argument 1 is invalid
|  2149 | template <> struct LvlTypeMap<VkImageSubresource2> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2153:32: error: 'VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR'?
|  2153 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2153:69: error: template argument 1 is invalid
|  2153 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2158:31: error: 'VkDeviceImageSubresourceInfo' was not declared in this scope; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  2158 | template <> struct LvlTypeMap<VkDeviceImageSubresourceInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2158:59: error: template argument 1 is invalid
|  2158 | template <> struct LvlTypeMap<VkDeviceImageSubresourceInfo> {
|       |                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2162:32: error: 'VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO_KHR'?
|  2162 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2162:79: error: template argument 1 is invalid
|  2162 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO> {
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2167:31: error: 'VkSubresourceLayout2' was not declared in this scope; did you mean 'VkSubresourceLayout'?
|  2167 | template <> struct LvlTypeMap<VkSubresourceLayout2> {
|       |                               ^~~~~~~~~~~~~~~~~~~~
|       |                               VkSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2167:51: error: template argument 1 is invalid
|  2167 | template <> struct LvlTypeMap<VkSubresourceLayout2> {
|       |                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2171:32: error: 'VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR'?
|  2171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2171:70: error: template argument 1 is invalid
|  2171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2176:31: error: 'VkPipelineCreateFlags2CreateInfo' was not declared in this scope; did you mean 'VkPipelineCreateFlags2CreateInfoKHR'?
|  2176 | template <> struct LvlTypeMap<VkPipelineCreateFlags2CreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineCreateFlags2CreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2176:63: error: template argument 1 is invalid
|  2176 | template <> struct LvlTypeMap<VkPipelineCreateFlags2CreateInfo> {
|       |                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2180:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO_KHR'?
|  2180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2180:85: error: template argument 1 is invalid
|  2180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2185:31: error: 'VkBufferUsageFlags2CreateInfo' was not declared in this scope; did you mean 'VkBufferUsageFlags2CreateInfoKHR'?
|  2185 | template <> struct LvlTypeMap<VkBufferUsageFlags2CreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBufferUsageFlags2CreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2185:60: error: template argument 1 is invalid
|  2185 | template <> struct LvlTypeMap<VkBufferUsageFlags2CreateInfo> {
|       |                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2189:32: error: 'VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO_KHR'?
|  2189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2189:82: error: template argument 1 is invalid
|  2189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2194:31: error: 'VkPhysicalDevicePushDescriptorProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  2194 | template <> struct LvlTypeMap<VkPhysicalDevicePushDescriptorProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2194:71: error: template argument 1 is invalid
|  2194 | template <> struct LvlTypeMap<VkPhysicalDevicePushDescriptorProperties> {
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2198:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR'?
|  2198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2198:92: error: template argument 1 is invalid
|  2198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES> {
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2203:31: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  2203 | template <> struct LvlTypeMap<VkPhysicalDeviceDynamicRenderingLocalReadFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2203:80: error: template argument 1 is invalid
|  2203 | template <> struct LvlTypeMap<VkPhysicalDeviceDynamicRenderingLocalReadFeatures> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2207:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR'?
|  2207 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2207:103: error: template argument 1 is invalid
|  2207 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES> {
|       |                                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2212:31: error: 'VkRenderingAttachmentLocationInfo' was not declared in this scope; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  2212 | template <> struct LvlTypeMap<VkRenderingAttachmentLocationInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2212:64: error: template argument 1 is invalid
|  2212 | template <> struct LvlTypeMap<VkRenderingAttachmentLocationInfo> {
|       |                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2216:32: error: 'VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO_KHR'?
|  2216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2216:84: error: template argument 1 is invalid
|  2216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2221:31: error: 'VkRenderingInputAttachmentIndexInfo' was not declared in this scope; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  2221 | template <> struct LvlTypeMap<VkRenderingInputAttachmentIndexInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2221:66: error: template argument 1 is invalid
|  2221 | template <> struct LvlTypeMap<VkRenderingInputAttachmentIndexInfo> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2225:32: error: 'VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO_KHR'?
|  2225 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2225:87: error: template argument 1 is invalid
|  2225 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2230:31: error: 'VkPhysicalDeviceMaintenance6Features' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  2230 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance6Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2230:67: error: template argument 1 is invalid
|  2230 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance6Features> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2234:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  2234 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2234:88: error: template argument 1 is invalid
|  2234 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2239:31: error: 'VkPhysicalDeviceMaintenance6Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  2239 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance6Properties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2239:69: error: template argument 1 is invalid
|  2239 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance6Properties> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2243:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  2243 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2243:90: error: template argument 1 is invalid
|  2243 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2248:31: error: 'VkBindMemoryStatus' was not declared in this scope; did you mean 'VkBindMemoryStatusKHR'?
|  2248 | template <> struct LvlTypeMap<VkBindMemoryStatus> {
|       |                               ^~~~~~~~~~~~~~~~~~
|       |                               VkBindMemoryStatusKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2248:49: error: template argument 1 is invalid
|  2248 | template <> struct LvlTypeMap<VkBindMemoryStatus> {
|       |                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2252:32: error: 'VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS_KHR'?
|  2252 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2252:68: error: template argument 1 is invalid
|  2252 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2257:31: error: 'VkBindDescriptorSetsInfo' was not declared in this scope; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  2257 | template <> struct LvlTypeMap<VkBindDescriptorSetsInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2257:55: error: template argument 1 is invalid
|  2257 | template <> struct LvlTypeMap<VkBindDescriptorSetsInfo> {
|       |                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2261:32: error: 'VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO_KHR'?
|  2261 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2261:75: error: template argument 1 is invalid
|  2261 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2266:31: error: 'VkPushConstantsInfo' was not declared in this scope; did you mean 'VkPushConstantsInfoKHR'?
|  2266 | template <> struct LvlTypeMap<VkPushConstantsInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2266:50: error: template argument 1 is invalid
|  2266 | template <> struct LvlTypeMap<VkPushConstantsInfo> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2270:32: error: 'VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO_KHR'?
|  2270 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2270:69: error: template argument 1 is invalid
|  2270 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2275:31: error: 'VkPushDescriptorSetInfo' was not declared in this scope; did you mean 'VkPushDescriptorSetInfoKHR'?
|  2275 | template <> struct LvlTypeMap<VkPushDescriptorSetInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2275:54: error: template argument 1 is invalid
|  2275 | template <> struct LvlTypeMap<VkPushDescriptorSetInfo> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2279:32: error: 'VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO_KHR'?
|  2279 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2279:74: error: template argument 1 is invalid
|  2279 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2284:31: error: 'VkPushDescriptorSetWithTemplateInfo' was not declared in this scope; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  2284 | template <> struct LvlTypeMap<VkPushDescriptorSetWithTemplateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2284:66: error: template argument 1 is invalid
|  2284 | template <> struct LvlTypeMap<VkPushDescriptorSetWithTemplateInfo> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2288:32: error: 'VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO_KHR'?
|  2288 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2288:88: error: template argument 1 is invalid
|  2288 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2293:31: error: 'VkPhysicalDevicePipelineProtectedAccessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  2293 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineProtectedAccessFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2293:78: error: template argument 1 is invalid
|  2293 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineProtectedAccessFeatures> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2297:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT'?
|  2297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2297:100: error: template argument 1 is invalid
|  2297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES> {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2302:31: error: 'VkPhysicalDevicePipelineRobustnessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  2302 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2302:73: error: template argument 1 is invalid
|  2302 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessFeatures> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2306:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT'?
|  2306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2306:94: error: template argument 1 is invalid
|  2306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2311:31: error: 'VkPhysicalDevicePipelineRobustnessProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  2311 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2311:75: error: template argument 1 is invalid
|  2311 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessProperties> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2315:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT'?
|  2315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2315:96: error: template argument 1 is invalid
|  2315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2320:31: error: 'VkPipelineRobustnessCreateInfo' was not declared in this scope; did you mean 'VkPipelineRobustnessCreateInfoEXT'?
|  2320 | template <> struct LvlTypeMap<VkPipelineRobustnessCreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineRobustnessCreateInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2320:61: error: template argument 1 is invalid
|  2320 | template <> struct LvlTypeMap<VkPipelineRobustnessCreateInfo> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2324:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO_EXT'?
|  2324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2324:81: error: template argument 1 is invalid
|  2324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2329:31: error: 'VkPhysicalDeviceHostImageCopyFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  2329 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2329:68: error: template argument 1 is invalid
|  2329 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyFeatures> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2333:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT'?
|  2333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2333:90: error: template argument 1 is invalid
|  2333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2338:31: error: 'VkPhysicalDeviceHostImageCopyProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  2338 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2338:70: error: template argument 1 is invalid
|  2338 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyProperties> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2342:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT'?
|  2342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2342:92: error: template argument 1 is invalid
|  2342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES> {
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2347:31: error: 'VkMemoryToImageCopy' was not declared in this scope; did you mean 'VkMemoryToImageCopyEXT'?
|  2347 | template <> struct LvlTypeMap<VkMemoryToImageCopy> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkMemoryToImageCopyEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2347:50: error: template argument 1 is invalid
|  2347 | template <> struct LvlTypeMap<VkMemoryToImageCopy> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2351:32: error: 'VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY_EXT'?
|  2351 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2351:70: error: template argument 1 is invalid
|  2351 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2356:31: error: 'VkImageToMemoryCopy' was not declared in this scope; did you mean 'VkImageToMemoryCopyEXT'?
|  2356 | template <> struct LvlTypeMap<VkImageToMemoryCopy> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkImageToMemoryCopyEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2356:50: error: template argument 1 is invalid
|  2356 | template <> struct LvlTypeMap<VkImageToMemoryCopy> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2360:32: error: 'VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY_EXT'?
|  2360 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2360:70: error: template argument 1 is invalid
|  2360 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2365:31: error: 'VkCopyMemoryToImageInfo' was not declared in this scope; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  2365 | template <> struct LvlTypeMap<VkCopyMemoryToImageInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2365:54: error: template argument 1 is invalid
|  2365 | template <> struct LvlTypeMap<VkCopyMemoryToImageInfo> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2369:32: error: 'VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO_EXT'?
|  2369 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2369:75: error: template argument 1 is invalid
|  2369 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2374:31: error: 'VkCopyImageToMemoryInfo' was not declared in this scope; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  2374 | template <> struct LvlTypeMap<VkCopyImageToMemoryInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2374:54: error: template argument 1 is invalid
|  2374 | template <> struct LvlTypeMap<VkCopyImageToMemoryInfo> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2378:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO_EXT'?
|  2378 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2378:75: error: template argument 1 is invalid
|  2378 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2383:31: error: 'VkCopyImageToImageInfo' was not declared in this scope; did you mean 'VkCopyImageToImageInfoEXT'?
|  2383 | template <> struct LvlTypeMap<VkCopyImageToImageInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2383:53: error: template argument 1 is invalid
|  2383 | template <> struct LvlTypeMap<VkCopyImageToImageInfo> {
|       |                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2387:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO_EXT'?
|  2387 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2387:74: error: template argument 1 is invalid
|  2387 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2392:31: error: 'VkHostImageLayoutTransitionInfo' was not declared in this scope; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  2392 | template <> struct LvlTypeMap<VkHostImageLayoutTransitionInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2392:62: error: template argument 1 is invalid
|  2392 | template <> struct LvlTypeMap<VkHostImageLayoutTransitionInfo> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2396:32: error: 'VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO_EXT'?
|  2396 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2396:83: error: template argument 1 is invalid
|  2396 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2401:31: error: 'VkSubresourceHostMemcpySize' was not declared in this scope; did you mean 'VkSubresourceHostMemcpySizeEXT'?
|  2401 | template <> struct LvlTypeMap<VkSubresourceHostMemcpySize> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSubresourceHostMemcpySizeEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2401:58: error: template argument 1 is invalid
|  2401 | template <> struct LvlTypeMap<VkSubresourceHostMemcpySize> {
|       |                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2405:32: error: 'VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE_EXT'?
|  2405 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2405:78: error: template argument 1 is invalid
|  2405 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2410:31: error: 'VkHostImageCopyDevicePerformanceQuery' was not declared in this scope; did you mean 'VkHostImageCopyDevicePerformanceQueryEXT'?
|  2410 | template <> struct LvlTypeMap<VkHostImageCopyDevicePerformanceQuery> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkHostImageCopyDevicePerformanceQueryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2410:68: error: template argument 1 is invalid
|  2410 | template <> struct LvlTypeMap<VkHostImageCopyDevicePerformanceQuery> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2414:32: error: 'VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY_EXT'?
|  2414 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:2414:90: error: template argument 1 is invalid
|  2414 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:3996:31: error: 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  3996 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeAV1FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:3996:72: error: template argument 1 is invalid
|  3996 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeAV1FeaturesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4000:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  4000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4000:95: error: template argument 1 is invalid
|  4000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4005:31: error: 'VkVideoEncodeAV1CapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1CapabilitiesKHR'?
|  4005 | template <> struct LvlTypeMap<VkVideoEncodeAV1CapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4005:62: error: template argument 1 is invalid
|  4005 | template <> struct LvlTypeMap<VkVideoEncodeAV1CapabilitiesKHR> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4009:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  4009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4009:83: error: template argument 1 is invalid
|  4009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4014:31: error: 'VkVideoEncodeAV1QualityLevelPropertiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeQualityLevelPropertiesKHR'?
|  4014 | template <> struct LvlTypeMap<VkVideoEncodeAV1QualityLevelPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeQualityLevelPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4014:72: error: template argument 1 is invalid
|  4014 | template <> struct LvlTypeMap<VkVideoEncodeAV1QualityLevelPropertiesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4018:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUALITY_LEVEL_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR'?
|  4018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUALITY_LEVEL_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4018:95: error: template argument 1 is invalid
|  4018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUALITY_LEVEL_PROPERTIES_KHR> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4023:31: error: 'VkVideoEncodeAV1SessionCreateInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265SessionCreateInfoKHR'?
|  4023 | template <> struct LvlTypeMap<VkVideoEncodeAV1SessionCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265SessionCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4023:67: error: template argument 1 is invalid
|  4023 | template <> struct LvlTypeMap<VkVideoEncodeAV1SessionCreateInfoKHR> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4027:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_CREATE_INFO_KHR'?
|  4027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4027:90: error: template argument 1 is invalid
|  4027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_CREATE_INFO_KHR> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4032:31: error: 'VkVideoEncodeAV1SessionParametersCreateInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1SessionParametersCreateInfoKHR'?
|  4032 | template <> struct LvlTypeMap<VkVideoEncodeAV1SessionParametersCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1SessionParametersCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4032:77: error: template argument 1 is invalid
|  4032 | template <> struct LvlTypeMap<VkVideoEncodeAV1SessionParametersCreateInfoKHR> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4036:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR'?
|  4036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4036:101: error: template argument 1 is invalid
|  4036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4041:31: error: 'VkVideoEncodeAV1PictureInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1PictureInfoKHR'?
|  4041 | template <> struct LvlTypeMap<VkVideoEncodeAV1PictureInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1PictureInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4041:61: error: template argument 1 is invalid
|  4041 | template <> struct LvlTypeMap<VkVideoEncodeAV1PictureInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4045:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PICTURE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR'?
|  4045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PICTURE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4045:83: error: template argument 1 is invalid
|  4045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PICTURE_INFO_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4050:31: error: 'VkVideoEncodeAV1DpbSlotInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1DpbSlotInfoKHR'?
|  4050 | template <> struct LvlTypeMap<VkVideoEncodeAV1DpbSlotInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1DpbSlotInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4050:61: error: template argument 1 is invalid
|  4050 | template <> struct LvlTypeMap<VkVideoEncodeAV1DpbSlotInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4054:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_DPB_SLOT_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR'?
|  4054 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_DPB_SLOT_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4054:84: error: template argument 1 is invalid
|  4054 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_DPB_SLOT_INFO_KHR> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4059:31: error: 'VkVideoEncodeAV1ProfileInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  4059 | template <> struct LvlTypeMap<VkVideoEncodeAV1ProfileInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4059:61: error: template argument 1 is invalid
|  4059 | template <> struct LvlTypeMap<VkVideoEncodeAV1ProfileInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4063:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  4063 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4063:83: error: template argument 1 is invalid
|  4063 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4068:31: error: 'VkVideoEncodeAV1GopRemainingFrameInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265GopRemainingFrameInfoKHR'?
|  4068 | template <> struct LvlTypeMap<VkVideoEncodeAV1GopRemainingFrameInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265GopRemainingFrameInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4068:71: error: template argument 1 is invalid
|  4068 | template <> struct LvlTypeMap<VkVideoEncodeAV1GopRemainingFrameInfoKHR> {
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4072:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_GOP_REMAINING_FRAME_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_GOP_REMAINING_FRAME_INFO_KHR'?
|  4072 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_GOP_REMAINING_FRAME_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_GOP_REMAINING_FRAME_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4072:95: error: template argument 1 is invalid
|  4072 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_GOP_REMAINING_FRAME_INFO_KHR> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4077:31: error: 'VkVideoEncodeAV1RateControlInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeRateControlInfoKHR'?
|  4077 | template <> struct LvlTypeMap<VkVideoEncodeAV1RateControlInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeRateControlInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4077:65: error: template argument 1 is invalid
|  4077 | template <> struct LvlTypeMap<VkVideoEncodeAV1RateControlInfoKHR> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4081:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_INFO_KHR'?
|  4081 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4081:88: error: template argument 1 is invalid
|  4081 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_INFO_KHR> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4086:31: error: 'VkVideoEncodeAV1RateControlLayerInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeRateControlLayerInfoKHR'?
|  4086 | template <> struct LvlTypeMap<VkVideoEncodeAV1RateControlLayerInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeRateControlLayerInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4086:70: error: template argument 1 is invalid
|  4086 | template <> struct LvlTypeMap<VkVideoEncodeAV1RateControlLayerInfoKHR> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4090:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_LAYER_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_LAYER_INFO_KHR'?
|  4090 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_LAYER_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_LAYER_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4090:94: error: template argument 1 is invalid
|  4090 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_LAYER_INFO_KHR> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4140:31: error: 'VkVideoEncodeQuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  4140 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4140:74: error: template argument 1 is invalid
|  4140 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapCapabilitiesKHR> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4144:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  4144 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4144:96: error: template argument 1 is invalid
|  4144 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4149:31: error: 'VkVideoFormatQuantizationMapPropertiesKHR' was not declared in this scope
|  4149 | template <> struct LvlTypeMap<VkVideoFormatQuantizationMapPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4149:72: error: template argument 1 is invalid
|  4149 | template <> struct LvlTypeMap<VkVideoFormatQuantizationMapPropertiesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4153:32: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  4153 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4153:94: error: template argument 1 is invalid
|  4153 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4158:31: error: 'VkVideoEncodeQuantizationMapInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeQualityLevelInfoKHR'?
|  4158 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeQualityLevelInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4158:66: error: template argument 1 is invalid
|  4158 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapInfoKHR> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4162:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR'?
|  4162 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4162:88: error: template argument 1 is invalid
|  4162 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_INFO_KHR> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4167:31: error: 'VkVideoEncodeQuantizationMapSessionParametersCreateInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265SessionParametersCreateInfoKHR'?
|  4167 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapSessionParametersCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265SessionParametersCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4167:89: error: template argument 1 is invalid
|  4167 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapSessionParametersCreateInfoKHR> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4171:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_SESSION_PARAMETERS_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR'?
|  4171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4171:114: error: template argument 1 is invalid
|  4171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4176:31: error: 'VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceSynchronization2FeaturesKHR'?
|  4176 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceSynchronization2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4176:84: error: template argument 1 is invalid
|  4176 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4180:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR'?
|  4180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4180:108: error: template argument 1 is invalid
|  4180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR> {
|       |                                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4185:31: error: 'VkVideoEncodeH264QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH264CapabilitiesKHR'?
|  4185 | template <> struct LvlTypeMap<VkVideoEncodeH264QuantizationMapCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4185:78: error: template argument 1 is invalid
|  4185 | template <> struct LvlTypeMap<VkVideoEncodeH264QuantizationMapCapabilitiesKHR> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4189:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR'?
|  4189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4189:101: error: template argument 1 is invalid
|  4189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4194:31: error: 'VkVideoEncodeH265QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  4194 | template <> struct LvlTypeMap<VkVideoEncodeH265QuantizationMapCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4194:78: error: template argument 1 is invalid
|  4194 | template <> struct LvlTypeMap<VkVideoEncodeH265QuantizationMapCapabilitiesKHR> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4198:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  4198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4198:101: error: template argument 1 is invalid
|  4198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4203:31: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' was not declared in this scope
|  4203 | template <> struct LvlTypeMap<VkVideoFormatH265QuantizationMapPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4203:76: error: template argument 1 is invalid
|  4203 | template <> struct LvlTypeMap<VkVideoFormatH265QuantizationMapPropertiesKHR> {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4207:32: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  4207 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4207:99: error: template argument 1 is invalid
|  4207 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4212:31: error: 'VkVideoEncodeAV1QuantizationMapCapabilitiesKHR' was not declared in this scope
|  4212 | template <> struct LvlTypeMap<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4212:77: error: template argument 1 is invalid
|  4212 | template <> struct LvlTypeMap<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4216:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  4216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4216:100: error: template argument 1 is invalid
|  4216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4221:31: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' was not declared in this scope
|  4221 | template <> struct LvlTypeMap<VkVideoFormatAV1QuantizationMapPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4221:75: error: template argument 1 is invalid
|  4221 | template <> struct LvlTypeMap<VkVideoFormatAV1QuantizationMapPropertiesKHR> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4225:32: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  4225 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4225:98: error: template argument 1 is invalid
|  4225 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4392:31: error: 'VkCuModuleTexturingModeCreateInfoNVX' was not declared in this scope
|  4392 | template <> struct LvlTypeMap<VkCuModuleTexturingModeCreateInfoNVX> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4392:67: error: template argument 1 is invalid
|  4392 | template <> struct LvlTypeMap<VkCuModuleTexturingModeCreateInfoNVX> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4396:32: error: 'VK_STRUCTURE_TYPE_CU_MODULE_TEXTURING_MODE_CREATE_INFO_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX'?
|  4396 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CU_MODULE_TEXTURING_MODE_CREATE_INFO_NVX> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:4396:90: error: template argument 1 is invalid
|  4396 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CU_MODULE_TEXTURING_MODE_CREATE_INFO_NVX> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:6862:31: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  6862 | template <> struct LvlTypeMap<VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:6862:84: error: template argument 1 is invalid
|  6862 | template <> struct LvlTypeMap<VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:6866:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  6866 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:6866:109: error: template argument 1 is invalid
|  6866 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT> {
|       |                                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8428:31: error: 'VkDisplaySurfaceStereoCreateInfoNV' was not declared in this scope; did you mean 'VkDisplaySurfaceCreateInfoKHR'?
|  8428 | template <> struct LvlTypeMap<VkDisplaySurfaceStereoCreateInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDisplaySurfaceCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8428:65: error: template argument 1 is invalid
|  8428 | template <> struct LvlTypeMap<VkDisplaySurfaceStereoCreateInfoNV> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8432:32: error: 'VK_STRUCTURE_TYPE_DISPLAY_SURFACE_STEREO_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR'?
|  8432 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DISPLAY_SURFACE_STEREO_CREATE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8432:87: error: template argument 1 is invalid
|  8432 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DISPLAY_SURFACE_STEREO_CREATE_INFO_NV> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8437:31: error: 'VkDisplayModeStereoPropertiesNV' was not declared in this scope; did you mean 'VkDisplayModePropertiesKHR'?
|  8437 | template <> struct LvlTypeMap<VkDisplayModeStereoPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDisplayModePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8437:62: error: template argument 1 is invalid
|  8437 | template <> struct LvlTypeMap<VkDisplayModeStereoPropertiesNV> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8441:32: error: 'VK_STRUCTURE_TYPE_DISPLAY_MODE_STEREO_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR'?
|  8441 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DISPLAY_MODE_STEREO_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8441:83: error: template argument 1 is invalid
|  8441 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DISPLAY_MODE_STEREO_PROPERTIES_NV> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8662:31: error: 'VkPhysicalDeviceHdrVividFeaturesHUAWEI' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiviewFeaturesKHR'?
|  8662 | template <> struct LvlTypeMap<VkPhysicalDeviceHdrVividFeaturesHUAWEI> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMultiviewFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8662:69: error: template argument 1 is invalid
|  8662 | template <> struct LvlTypeMap<VkPhysicalDeviceHdrVividFeaturesHUAWEI> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8666:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HDR_VIVID_FEATURES_HUAWEI' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI'?
|  8666 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HDR_VIVID_FEATURES_HUAWEI> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8666:91: error: template argument 1 is invalid
|  8666 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HDR_VIVID_FEATURES_HUAWEI> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8671:31: error: 'VkHdrVividDynamicMetadataHUAWEI' was not declared in this scope
|  8671 | template <> struct LvlTypeMap<VkHdrVividDynamicMetadataHUAWEI> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8671:62: error: template argument 1 is invalid
|  8671 | template <> struct LvlTypeMap<VkHdrVividDynamicMetadataHUAWEI> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8675:32: error: 'VK_STRUCTURE_TYPE_HDR_VIVID_DYNAMIC_METADATA_HUAWEI' was not declared in this scope
|  8675 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HDR_VIVID_DYNAMIC_METADATA_HUAWEI> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8675:83: error: template argument 1 is invalid
|  8675 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HDR_VIVID_DYNAMIC_METADATA_HUAWEI> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8680:31: error: 'VkCooperativeMatrixFlexibleDimensionsPropertiesNV' was not declared in this scope
|  8680 | template <> struct LvlTypeMap<VkCooperativeMatrixFlexibleDimensionsPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8680:80: error: template argument 1 is invalid
|  8680 | template <> struct LvlTypeMap<VkCooperativeMatrixFlexibleDimensionsPropertiesNV> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8684:32: error: 'VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_FLEXIBLE_DIMENSIONS_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  8684 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_FLEXIBLE_DIMENSIONS_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8684:102: error: template argument 1 is invalid
|  8684 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_FLEXIBLE_DIMENSIONS_PROPERTIES_NV> {
|       |                                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8689:31: error: 'VkPhysicalDeviceCooperativeMatrix2FeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixFeaturesNV'?
|  8689 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrix2FeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCooperativeMatrixFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8689:75: error: template argument 1 is invalid
|  8689 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrix2FeaturesNV> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8693:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV'?
|  8693 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8693:98: error: template argument 1 is invalid
|  8693 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_FEATURES_NV> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8698:31: error: 'VkPhysicalDeviceCooperativeMatrix2PropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  8698 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrix2PropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8698:77: error: template argument 1 is invalid
|  8698 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrix2PropertiesNV> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8702:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  8702 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8702:100: error: template argument 1 is invalid
|  8702 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_PROPERTIES_NV> {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8707:31: error: 'VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  8707 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8707:83: error: template argument 1 is invalid
|  8707 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8711:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  8711 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8711:106: error: template argument 1 is invalid
|  8711 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT> {
|       |                                                                                                          ^
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:25,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/mock_icd.cpp:18:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1630:11: error: 'VkMemoryMapInfo' does not name a type; did you mean 'VkMemoryMapInfoKHR'?
|  1630 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1635:11: error: 'VkMemoryUnmapInfo' does not name a type; did you mean 'VkMemoryUnmapInfoKHR'?
|  1635 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1646:11: error: 'VkRenderingAreaInfo' does not name a type; did you mean 'VkRenderingAreaInfoKHR'?
|  1646 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1651:11: error: 'VkDeviceImageSubresourceInfo' does not name a type; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  1651 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1652:5: error: 'VkSubresourceLayout2' has not been declared
|  1652 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1657:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  1657 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1658:5: error: 'VkSubresourceLayout2' has not been declared
|  1658 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1677:11: error: 'VkRenderingAttachmentLocationInfo' does not name a type; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  1677 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1681:11: error: 'VkRenderingInputAttachmentIndexInfo' does not name a type; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  1681 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1685:11: error: 'VkBindDescriptorSetsInfo' does not name a type; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  1685 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1689:11: error: 'VkPushConstantsInfo' does not name a type; did you mean 'VkPushConstantsInfoKHR'?
|  1689 |     const VkPushConstantsInfo*                  pPushConstantsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1693:11: error: 'VkPushDescriptorSetInfo' does not name a type; did you mean 'VkPushDescriptorSetInfoKHR'?
|  1693 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1697:11: error: 'VkPushDescriptorSetWithTemplateInfo' does not name a type; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  1697 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1701:11: error: 'VkCopyMemoryToImageInfo' does not name a type; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  1701 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1705:11: error: 'VkCopyImageToMemoryInfo' does not name a type; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  1705 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1709:11: error: 'VkCopyImageToImageInfo' does not name a type; did you mean 'VkCopyImageToImageInfoEXT'?
|  1709 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:1714:11: error: 'VkHostImageLayoutTransitionInfo' does not name a type; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  1714 |     const VkHostImageLayoutTransitionInfo*      pTransitions);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2387:11: error: 'VkRenderingAttachmentLocationInfo' does not name a type; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  2387 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2391:11: error: 'VkRenderingInputAttachmentIndexInfo' does not name a type; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  2391 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2463:11: error: 'VkMemoryMapInfo' does not name a type; did you mean 'VkMemoryMapInfoKHR'?
|  2463 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2468:11: error: 'VkMemoryUnmapInfo' does not name a type; did you mean 'VkMemoryUnmapInfoKHR'?
|  2468 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2589:11: error: 'VkRenderingAreaInfo' does not name a type; did you mean 'VkRenderingAreaInfoKHR'?
|  2589 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2594:11: error: 'VkDeviceImageSubresourceInfo' does not name a type; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  2594 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2595:5: error: 'VkSubresourceLayout2' has not been declared
|  2595 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2600:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  2600 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2601:5: error: 'VkSubresourceLayout2' has not been declared
|  2601 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2670:11: error: 'VkBindDescriptorSetsInfo' does not name a type; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  2670 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2674:11: error: 'VkPushConstantsInfo' does not name a type; did you mean 'VkPushConstantsInfoKHR'?
|  2674 |     const VkPushConstantsInfo*                  pPushConstantsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2678:11: error: 'VkPushDescriptorSetInfo' does not name a type; did you mean 'VkPushDescriptorSetInfoKHR'?
|  2678 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:2682:11: error: 'VkPushDescriptorSetWithTemplateInfo' does not name a type; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  2682 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:3631:11: error: 'VkCopyMemoryToImageInfo' does not name a type; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  3631 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:3635:11: error: 'VkCopyImageToMemoryInfo' does not name a type; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  3635 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:3639:11: error: 'VkCopyImageToImageInfo' does not name a type; did you mean 'VkCopyImageToImageInfoEXT'?
|  3639 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:3644:11: error: 'VkHostImageLayoutTransitionInfo' does not name a type; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  3644 |     const VkHostImageLayoutTransitionInfo*      pTransitions);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:3649:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  3649 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:3650:5: error: 'VkSubresourceLayout2' has not been declared
|  3650 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_declarations.h:4583:5: error: 'VkCooperativeMatrixFlexibleDimensionsPropertiesNV' has not been declared
|  4583 |     VkCooperativeMatrixFlexibleDimensionsPropertiesNV* pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2351:11: error: 'VkMemoryMapInfo' does not name a type; did you mean 'VkMemoryMapInfoKHR'?
|  2351 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2359:11: error: 'VkMemoryUnmapInfo' does not name a type; did you mean 'VkMemoryUnmapInfoKHR'?
|  2359 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo)
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2376:11: error: 'VkRenderingAreaInfo' does not name a type; did you mean 'VkRenderingAreaInfoKHR'?
|  2376 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2384:11: error: 'VkDeviceImageSubresourceInfo' does not name a type; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  2384 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2385:5: error: 'VkSubresourceLayout2' has not been declared
|  2385 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2393:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  2393 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2394:5: error: 'VkSubresourceLayout2' has not been declared
|  2394 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2422:11: error: 'VkRenderingAttachmentLocationInfo' does not name a type; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  2422 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2429:11: error: 'VkRenderingInputAttachmentIndexInfo' does not name a type; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  2429 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2436:11: error: 'VkBindDescriptorSetsInfo' does not name a type; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  2436 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2443:11: error: 'VkPushConstantsInfo' does not name a type; did you mean 'VkPushConstantsInfoKHR'?
|  2443 |     const VkPushConstantsInfo*                  pPushConstantsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2450:11: error: 'VkPushDescriptorSetInfo' does not name a type; did you mean 'VkPushDescriptorSetInfoKHR'?
|  2450 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2457:11: error: 'VkPushDescriptorSetWithTemplateInfo' does not name a type; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  2457 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2464:11: error: 'VkCopyMemoryToImageInfo' does not name a type; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  2464 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2472:11: error: 'VkCopyImageToMemoryInfo' does not name a type; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  2472 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2480:11: error: 'VkCopyImageToImageInfo' does not name a type; did you mean 'VkCopyImageToImageInfoEXT'?
|  2480 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2489:11: error: 'VkHostImageLayoutTransitionInfo' does not name a type; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  2489 |     const VkHostImageLayoutTransitionInfo*      pTransitions)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::GetPhysicalDeviceVideoCapabilitiesKHR(VkPhysicalDevice, const VkVideoProfileInfoKHR*, VkVideoCapabilitiesKHR*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2912:31: error: 'VkVideoEncodeQuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  2912 |         lvl_find_mod_in_chain<VkVideoEncodeQuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2912:75: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2912 |         lvl_find_mod_in_chain<VkVideoEncodeQuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8947 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2912:75: error: template argument 1 is invalid
|  2912 |         lvl_find_mod_in_chain<VkVideoEncodeQuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2914:31: error: 'VkVideoEncodeH264QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH264CapabilitiesKHR'?
|  2914 |         lvl_find_mod_in_chain<VkVideoEncodeH264QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2914:79: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2914 |         lvl_find_mod_in_chain<VkVideoEncodeH264QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8947 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2914:79: error: template argument 1 is invalid
|  2914 |         lvl_find_mod_in_chain<VkVideoEncodeH264QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2916:31: error: 'VkVideoEncodeH265QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  2916 |         lvl_find_mod_in_chain<VkVideoEncodeH265QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2916:79: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2916 |         lvl_find_mod_in_chain<VkVideoEncodeH265QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8947 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2916:79: error: template argument 1 is invalid
|  2916 |         lvl_find_mod_in_chain<VkVideoEncodeH265QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2918:31: error: 'VkVideoEncodeAV1QuantizationMapCapabilitiesKHR' was not declared in this scope
|  2918 |         lvl_find_mod_in_chain<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2918:78: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2918 |         lvl_find_mod_in_chain<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8947 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2918:78: error: template argument 1 is invalid
|  2918 |         lvl_find_mod_in_chain<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2921:50: error: 'VkVideoEncodeAV1CapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1CapabilitiesKHR'?
|  2921 |     auto caps_encode_av1 = lvl_find_mod_in_chain<VkVideoEncodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VkVideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2921:82: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2921 |     auto caps_encode_av1 = lvl_find_mod_in_chain<VkVideoEncodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8947 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:2921:82: error: template argument 1 is invalid
|  2921 |     auto caps_encode_av1 = lvl_find_mod_in_chain<VkVideoEncodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3074:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  3074 |                                        | VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3075:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  3075 |                                        | VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR;
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3207:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  3207 |                     caps_encode->flags = VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR;
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3250:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  3250 |                     caps_encode->flags = VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR;
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3331:14: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  3331 |         case VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR: {
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3332:46: error: 'VkVideoEncodeAV1ProfileInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  3332 |             auto profile = lvl_find_in_chain<VkVideoEncodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3332:77: error: no matching function for call to 'lvl_find_in_chain<<expression error> >(const void* const&)'
|  3332 |             auto profile = lvl_find_in_chain<VkVideoEncodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8933:32: note: candidate: 'template<class T> const T* lvl_find_in_chain(const void*)'
|  8933 | template <typename T> const T *lvl_find_in_chain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8933:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3332:77: error: template argument 1 is invalid
|  3332 |             auto profile = lvl_find_in_chain<VkVideoEncodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3345:64: error: 'VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_EXTENSION_NAME'?
|  3345 |             std::strncpy(caps->stdHeaderVersion.extensionName, VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_EXTENSION_NAME, sizeof(caps->stdHeaderVersion.extensionName));
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3346:55: error: 'VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_SPEC_VERSION' was not declared in this scope; did you mean 'VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_SPEC_VERSION'?
|  3346 |             caps->stdHeaderVersion.specVersion      = VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_SPEC_VERSION;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_SPEC_VERSION
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3350:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  3350 |                     caps_encode->flags = VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3351:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  3351 |                                        | VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR;
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3359:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_PRIMARY_REFERENCE_CDF_ONLY_BIT_KHR' was not declared in this scope
|  3359 |                     caps_encode_av1->flags = VK_VIDEO_ENCODE_AV1_CAPABILITY_PRIMARY_REFERENCE_CDF_ONLY_BIT_KHR;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3364:56: error: 'VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR'?
|  3364 |                     caps_encode_av1->superblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3402:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_GENERATE_OBU_EXTENSION_HEADER_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H264_CAPABILITY_GENERATE_PREFIX_NALU_BIT_KHR'?
|  3402 |                                            | VK_VIDEO_ENCODE_AV1_CAPABILITY_GENERATE_OBU_EXTENSION_HEADER_BIT_KHR
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_VIDEO_ENCODE_H264_CAPABILITY_GENERATE_PREFIX_NALU_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3403:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_FRAME_SIZE_OVERRIDE_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CAPABILITY_B_FRAME_IN_L1_LIST_BIT_KHR'?
|  3403 |                                            | VK_VIDEO_ENCODE_AV1_CAPABILITY_FRAME_SIZE_OVERRIDE_BIT_KHR;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_VIDEO_ENCODE_H265_CAPABILITY_B_FRAME_IN_L1_LIST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3409:56: error: 'VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_TRANSFORM_BLOCK_SIZE_8_BIT_KHR'?
|  3409 |                                                      | VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_VIDEO_ENCODE_H265_TRANSFORM_BLOCK_SIZE_8_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3450:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CAPABILITY_PER_PICTURE_TYPE_MIN_MAX_QP_BIT_KHR'?
|  3450 |                     caps_encode_av1->flags = VK_VIDEO_ENCODE_AV1_CAPABILITY_PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX_BIT_KHR
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_VIDEO_ENCODE_H265_CAPABILITY_PER_PICTURE_TYPE_MIN_MAX_QP_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3452:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_MOTION_VECTOR_SCALING_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H264_CAPABILITY_ROW_UNALIGNED_SLICE_BIT_KHR'?
|  3452 |                                            | VK_VIDEO_ENCODE_AV1_CAPABILITY_MOTION_VECTOR_SCALING_BIT_KHR;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_VIDEO_ENCODE_H264_CAPABILITY_ROW_UNALIGNED_SLICE_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3510:9: error: 'VkVideoFormatQuantizationMapPropertiesKHR' does not name a type
|  3510 |         VkVideoFormatQuantizationMapPropertiesKHR props_quantization_map;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3511:9: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' does not name a type
|  3511 |         VkVideoFormatH265QuantizationMapPropertiesKHR props_h265_quantization_map;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3512:9: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' does not name a type
|  3512 |         VkVideoFormatAV1QuantizationMapPropertiesKHR props_av1_quantization_map;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3523:9: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3523 |     fmt.props_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3523:40: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  3523 |     fmt.props_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3524:9: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3524 |     fmt.props_h265_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3524:45: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  3524 |     fmt.props_h265_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3525:9: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3525 |     fmt.props_av1_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3525:44: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  3525 |     fmt.props_av1_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                            VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3574:14: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  3574 |         case VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3627:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  3627 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3628:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3628 |                     fmt.props_quantization_map.quantizationMapTexelSize = {16, 16};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3632:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  3632 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3639:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3639 |                     fmt.props_quantization_map.quantizationMapTexelSize = {16, 16};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3653:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  3653 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3654:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3654 |                     fmt.props_quantization_map.quantizationMapTexelSize = {4, 4};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3655:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3655 |                     fmt.props_h265_quantization_map.compatibleCtbSizes =
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3658:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3658 |                     fmt.props_quantization_map.quantizationMapTexelSize = {8, 8};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3660:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3660 |                     fmt.props_quantization_map.quantizationMapTexelSize = {32, 32};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3662:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3662 |                     fmt.props_quantization_map.quantizationMapTexelSize = {64, 64};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3663:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3663 |                     fmt.props_h265_quantization_map.compatibleCtbSizes = VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3669:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  3669 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3670:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3670 |                     fmt.props_quantization_map.quantizationMapTexelSize = {32, 32};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3671:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3671 |                     fmt.props_h265_quantization_map.compatibleCtbSizes =
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3674:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3674 |                     fmt.props_quantization_map.quantizationMapTexelSize = {64, 64};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3675:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3675 |                     fmt.props_h265_quantization_map.compatibleCtbSizes = VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3684:14: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  3684 |         case VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3689:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  3689 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3690:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3690 |                     fmt.props_quantization_map.quantizationMapTexelSize = {8, 8};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3691:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3691 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3691:80: error: 'VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR'?
|  3691 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3695:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  3695 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3696:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3696 |                     fmt.props_quantization_map.quantizationMapTexelSize = {64, 64};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3697:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3697 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3704:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3704 |                     fmt.props_quantization_map.quantizationMapTexelSize = {64, 64};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3705:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3705 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3707:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3707 |                     fmt.props_quantization_map.quantizationMapTexelSize = {128, 128};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3708:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3708 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3708:80: error: 'VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_TRANSFORM_BLOCK_SIZE_8_BIT_KHR'?
|  3708 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR;
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                VK_VIDEO_ENCODE_H265_TRANSFORM_BLOCK_SIZE_8_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3715:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3715 |                     fmt.props_quantization_map.quantizationMapTexelSize = {128, 128};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3716:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3716 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3741:66: error: 'VkVideoFormatQuantizationMapPropertiesKHR' was not declared in this scope
|  3741 |             auto* props_quantization_map = lvl_find_mod_in_chain<VkVideoFormatQuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3741:108: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  3741 |             auto* props_quantization_map = lvl_find_mod_in_chain<VkVideoFormatQuantizationMapPropertiesKHR>(saved_pNext);
|       |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8947 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3741:108: error: template argument 1 is invalid
|  3741 |             auto* props_quantization_map = lvl_find_mod_in_chain<VkVideoFormatQuantizationMapPropertiesKHR>(saved_pNext);
|       |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3742:71: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' was not declared in this scope
|  3742 |             auto* props_h265_quantization_map = lvl_find_mod_in_chain<VkVideoFormatH265QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3742:117: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  3742 |             auto* props_h265_quantization_map = lvl_find_mod_in_chain<VkVideoFormatH265QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8947 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3742:117: error: template argument 1 is invalid
|  3742 |             auto* props_h265_quantization_map = lvl_find_mod_in_chain<VkVideoFormatH265QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3743:70: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' was not declared in this scope
|  3743 |             auto* props_av1_quantization_map = lvl_find_mod_in_chain<VkVideoFormatAV1QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3743:115: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  3743 |             auto* props_av1_quantization_map = lvl_find_mod_in_chain<VkVideoFormatAV1QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  8947 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8947:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3743:115: error: template argument 1 is invalid
|  3743 |             auto* props_av1_quantization_map = lvl_find_mod_in_chain<VkVideoFormatAV1QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3747:55: error: '__gnu_cxx::__alloc_traits<std::allocator<vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>, vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>::value_type' {aka 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties'} has no member named 'props_quantization_map'
|  3747 |                 *props_quantization_map = filtered[i].props_quantization_map;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3753:60: error: '__gnu_cxx::__alloc_traits<std::allocator<vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>, vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>::value_type' {aka 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties'} has no member named 'props_h265_quantization_map'
|  3753 |                 *props_h265_quantization_map = filtered[i].props_h265_quantization_map;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3759:59: error: '__gnu_cxx::__alloc_traits<std::allocator<vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>, vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>::value_type' {aka 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties'} has no member named 'props_av1_quantization_map'
|  3759 |                 *props_av1_quantization_map = filtered[i].props_av1_quantization_map;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h: In function 'void vkmock::GetPhysicalDeviceQueueFamilyProperties2KHR(VkPhysicalDevice, uint32_t*, VkQueueFamilyProperties2*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4149:53: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  4149 |                                                   | VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4812:11: error: 'VkRenderingAttachmentLocationInfo' does not name a type; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  4812 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4819:11: error: 'VkRenderingInputAttachmentIndexInfo' does not name a type; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  4819 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4941:11: error: 'VkMemoryMapInfo' does not name a type; did you mean 'VkMemoryMapInfoKHR'?
|  4941 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::MapMemory2KHR(VkDevice, const int*, void**)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4944:46: error: request for member 'memory' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  4944 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                              ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4944:70: error: request for member 'offset' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  4944 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                      ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4944:94: error: request for member 'size' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  4944 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                                              ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4944:116: error: request for member 'flags' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  4944 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4949:11: error: 'VkMemoryUnmapInfo' does not name a type; did you mean 'VkMemoryUnmapInfoKHR'?
|  4949 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo)
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::UnmapMemory2KHR(VkDevice, const int*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4951:43: error: request for member 'memory' in '* pMemoryUnmapInfo', which is of non-class type 'const int'
|  4951 |     UnmapMemory(device, pMemoryUnmapInfo->memory);
|       |                                           ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5137:11: error: 'VkRenderingAreaInfo' does not name a type; did you mean 'VkRenderingAreaInfoKHR'?
|  5137 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5145:11: error: 'VkDeviceImageSubresourceInfo' does not name a type; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  5145 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5146:5: error: 'VkSubresourceLayout2' has not been declared
|  5146 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5154:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  5154 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5155:5: error: 'VkSubresourceLayout2' has not been declared
|  5155 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5285:11: error: 'VkBindDescriptorSetsInfo' does not name a type; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  5285 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5292:11: error: 'VkPushConstantsInfo' does not name a type; did you mean 'VkPushConstantsInfoKHR'?
|  5292 |     const VkPushConstantsInfo*                  pPushConstantsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5299:11: error: 'VkPushDescriptorSetInfo' does not name a type; did you mean 'VkPushDescriptorSetInfoKHR'?
|  5299 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:5306:11: error: 'VkPushDescriptorSetWithTemplateInfo' does not name a type; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  5306 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:6790:11: error: 'VkCopyMemoryToImageInfo' does not name a type; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  6790 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:6798:11: error: 'VkCopyImageToMemoryInfo' does not name a type; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  6798 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:6806:11: error: 'VkCopyImageToImageInfo' does not name a type; did you mean 'VkCopyImageToImageInfoEXT'?
|  6806 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:6815:11: error: 'VkHostImageLayoutTransitionInfo' does not name a type; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  6815 |     const VkHostImageLayoutTransitionInfo*      pTransitions)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:6824:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  6824 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:6825:5: error: 'VkSubresourceLayout2' has not been declared
|  6825 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:8284:5: error: 'VkCooperativeMatrixFlexibleDimensionsPropertiesNV' has not been declared
|  8284 |     VkCooperativeMatrixFlexibleDimensionsPropertiesNV* pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h: In instantiation of 'const T* lvl_find_in_chain(const void*) [with T = VkPhysicalDeviceHostImageCopyFeaturesEXT]':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:3932:103:   required from here
|  3932 |     const auto *host_image_copy_features = lvl_find_in_chain<VkPhysicalDeviceHostImageCopyFeaturesEXT>(pFeatures->pNext);
|       |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8937:28: error: 'kSType' is not a member of 'LvlTypeMap<VkPhysicalDeviceHostImageCopyFeaturesEXT>'
|  8937 |         if (LvlTypeMap<T>::kSType == current->sType) {
|       |                            ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h: In instantiation of 'T* lvl_find_mod_in_chain(void*) [with T = VkPhysicalDeviceHostImageCopyPropertiesEXT]':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/function_definitions.h:4042:100:   required from here
|  4042 |     auto *host_image_copy_props = lvl_find_mod_in_chain<VkPhysicalDeviceHostImageCopyPropertiesEXT>(pProperties->pNext);
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/icd/generated/vk_typemap_helper.h:8951:28: error: 'kSType' is not a member of 'LvlTypeMap<VkPhysicalDeviceHostImageCopyPropertiesEXT>'
|  8951 |         if (LvlTypeMap<T>::kSType == current->sType) {
|       |                            ^~~~~~
| [2/4] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git=/usr/src/debug/vulkan-tools/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-
 native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto
 -worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git=/usr/src/debug/vulkan-tools/1.4.304.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build=/usr/src/debug/vulkan-tools/1.4.304.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native
 =  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/vulkaninfo.cpp:34:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkDriverIdString(VkDriverId)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:103:15: error: 'VK_DRIVER_ID_VULKAN_SC_EMULATION_ON_VULKAN' was not declared in this scope
|   103 |         case (VK_DRIVER_ID_VULKAN_SC_EMULATION_ON_VULKAN): return "DRIVER_ID_VULKAN_SC_EMULATION_ON_VULKAN";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkFormatString(VkFormat)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:354:15: error: 'VK_FORMAT_A1B5G5R5_UNORM_PACK16' was not declared in this scope; did you mean 'VK_FORMAT_A1R5G5B5_UNORM_PACK16'?
|   354 |         case (VK_FORMAT_A1B5G5R5_UNORM_PACK16): return "FORMAT_A1B5G5R5_UNORM_PACK16";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_A1R5G5B5_UNORM_PACK16
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:355:15: error: 'VK_FORMAT_A8_UNORM' was not declared in this scope; did you mean 'VK_FORMAT_R8_UNORM'?
|   355 |         case (VK_FORMAT_A8_UNORM): return "FORMAT_A8_UNORM";
|       |               ^~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R8_UNORM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkImageLayoutString(VkImageLayout)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:393:15: error: 'VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ' was not declared in this scope; did you mean 'VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ_KHR'?
|   393 |         case (VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ): return "IMAGE_LAYOUT_RENDERING_LOCAL_READ";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:405:15: error: 'VK_IMAGE_LAYOUT_VIDEO_ENCODE_QUANTIZATION_MAP_KHR' was not declared in this scope; did you mean 'VK_IMAGE_LAYOUT_VIDEO_ENCODE_DST_KHR'?
|   405 |         case (VK_IMAGE_LAYOUT_VIDEO_ENCODE_QUANTIZATION_MAP_KHR): return "IMAGE_LAYOUT_VIDEO_ENCODE_QUANTIZATION_MAP_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_IMAGE_LAYOUT_VIDEO_ENCODE_DST_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:461:54: error: 'VkPipelineRobustnessBufferBehavior' was not declared in this scope; did you mean 'VkPipelineRobustnessBufferBehaviorEXT'?
|   461 | std::string VkPipelineRobustnessBufferBehaviorString(VkPipelineRobustnessBufferBehavior value) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VkPipelineRobustnessBufferBehaviorEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:461:96: error: expected ',' or ';' before '{' token
|   461 | std::string VkPipelineRobustnessBufferBehaviorString(VkPipelineRobustnessBufferBehavior value) {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:470:75: error: 'VkPipelineRobustnessBufferBehavior' has not been declared
|   470 | void DumpVkPipelineRobustnessBufferBehavior(Printer &p, std::string name, VkPipelineRobustnessBufferBehavior value) {
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPipelineRobustnessBufferBehavior(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:472:93: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   472 |         p.PrintKeyString(name, std::string("VK_") + VkPipelineRobustnessBufferBehaviorString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:474:72: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   474 |         p.PrintKeyString(name, VkPipelineRobustnessBufferBehaviorString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:476:53: error: 'VkPipelineRobustnessImageBehavior' was not declared in this scope; did you mean 'VkPipelineRobustnessImageBehaviorEXT'?
|   476 | std::string VkPipelineRobustnessImageBehaviorString(VkPipelineRobustnessImageBehavior value) {
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VkPipelineRobustnessImageBehaviorEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:476:94: error: expected ',' or ';' before '{' token
|   476 | std::string VkPipelineRobustnessImageBehaviorString(VkPipelineRobustnessImageBehavior value) {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:485:74: error: 'VkPipelineRobustnessImageBehavior' has not been declared
|   485 | void DumpVkPipelineRobustnessImageBehavior(Printer &p, std::string name, VkPipelineRobustnessImageBehavior value) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPipelineRobustnessImageBehavior(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:487:92: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   487 |         p.PrintKeyString(name, std::string("VK_") + VkPipelineRobustnessImageBehaviorString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:489:71: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   489 |         p.PrintKeyString(name, VkPipelineRobustnessImageBehaviorString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkPresentModeKHRString(VkPresentModeKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:512:15: error: 'VK_PRESENT_MODE_FIFO_LATEST_READY_EXT' was not declared in this scope; did you mean 'VK_PRESENT_MODE_FIFO_RELAXED_KHR'?
|   512 |         case (VK_PRESENT_MODE_FIFO_LATEST_READY_EXT): return "PRESENT_MODE_FIFO_LATEST_READY_EXT";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_PRESENT_MODE_FIFO_RELAXED_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:522:41: error: 'VkQueueGlobalPriority' was not declared in this scope; did you mean 'VkQueueGlobalPriorityKHR'?
|   522 | std::string VkQueueGlobalPriorityString(VkQueueGlobalPriority value) {
|       |                                         ^~~~~~~~~~~~~~~~~~~~~
|       |                                         VkQueueGlobalPriorityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:522:70: error: expected ',' or ';' before '{' token
|   522 | std::string VkQueueGlobalPriorityString(VkQueueGlobalPriority value) {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:531:62: error: 'VkQueueGlobalPriority' has not been declared
|   531 | void DumpVkQueueGlobalPriority(Printer &p, std::string name, VkQueueGlobalPriority value) {
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkQueueGlobalPriority(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:533:80: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   533 |         p.PrintKeyString(name, std::string("VK_") + VkQueueGlobalPriorityString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:535:59: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|   535 |         p.PrintKeyString(name, VkQueueGlobalPriorityString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkResultString(VkResult)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:563:15: error: 'VK_ERROR_NOT_PERMITTED' was not declared in this scope; did you mean 'VK_ERROR_NOT_PERMITTED_KHR'?
|   563 |         case (VK_ERROR_NOT_PERMITTED): return "ERROR_NOT_PERMITTED";
|       |               ^~~~~~~~~~~~~~~~~~~~~~
|       |               VK_ERROR_NOT_PERMITTED_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkFormatFeatureFlagBits2GetStrings(VkFormatFeatureFlagBits2)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:773:9: error: 'VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT'?
|   773 |     if (VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT & value) strings.push_back("FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:789:9: error: 'VK_FORMAT_FEATURE_2_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR'?
|   789 |     if (VK_FORMAT_FEATURE_2_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR & value) strings.push_back("FORMAT_FEATURE_2_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:790:9: error: 'VK_FORMAT_FEATURE_2_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR'?
|   790 |     if (VK_FORMAT_FEATURE_2_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR & value) strings.push_back("FORMAT_FEATURE_2_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkImageUsageFlagBitsGetStrings(VkImageUsageFlagBits)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:830:9: error: 'VK_IMAGE_USAGE_HOST_TRANSFER_BIT' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_HOST_TRANSFER_BIT_EXT'?
|   830 |     if (VK_IMAGE_USAGE_HOST_TRANSFER_BIT & value) strings.push_back("IMAGE_USAGE_HOST_TRANSFER_BIT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_HOST_TRANSFER_BIT_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:843:9: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|   843 |     if (VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR & value) strings.push_back("IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:844:9: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|   844 |     if (VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR & value) strings.push_back("IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkSubgroupFeatureFlagBitsGetStrings(VkSubgroupFeatureFlagBits)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:1255:9: error: 'VK_SUBGROUP_FEATURE_ROTATE_BIT' was not declared in this scope; did you mean 'VK_SUBGROUP_FEATURE_VOTE_BIT'?
|  1255 |     if (VK_SUBGROUP_FEATURE_ROTATE_BIT & value) strings.push_back("SUBGROUP_FEATURE_ROTATE_BIT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_SUBGROUP_FEATURE_VOTE_BIT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:1256:9: error: 'VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT' was not declared in this scope; did you mean 'VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT_KHR'?
|  1256 |     if (VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT & value) strings.push_back("SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoCodecOperationFlagBitsKHRGetStrings(VkVideoCodecOperationFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:1404:9: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  1404 |     if (VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR & value) strings.push_back("VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:1833:96: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeatures' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  1833 | void DumpVkPhysicalDeviceDynamicRenderingLocalReadFeatures(Printer &p, std::string name, const VkPhysicalDeviceDynamicRenderingLocalReadFeatures &obj) {
|       |                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDynamicRenderingLocalReadFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:1836:71: error: request for member 'dynamicRenderingLocalRead' in 'obj', which is of non-class type 'const int'
|  1836 |     p.PrintKeyBool("dynamicRenderingLocalRead", static_cast<bool>(obj.dynamicRenderingLocalRead));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2063:90: error: 'VkPhysicalDeviceGlobalPriorityQueryFeatures' does not name a type; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  2063 | void DumpVkPhysicalDeviceGlobalPriorityQueryFeatures(Printer &p, std::string name, const VkPhysicalDeviceGlobalPriorityQueryFeatures &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceGlobalPriorityQueryFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2066:65: error: request for member 'globalPriorityQuery' in 'obj', which is of non-class type 'const int'
|  2066 |     p.PrintKeyBool("globalPriorityQuery", static_cast<bool>(obj.globalPriorityQuery));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2079:84: error: 'VkPhysicalDeviceHostImageCopyFeatures' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  2079 | void DumpVkPhysicalDeviceHostImageCopyFeatures(Printer &p, std::string name, const VkPhysicalDeviceHostImageCopyFeatures &obj) {
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceHostImageCopyFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2082:59: error: request for member 'hostImageCopy' in 'obj', which is of non-class type 'const int'
|  2082 |     p.PrintKeyBool("hostImageCopy", static_cast<bool>(obj.hostImageCopy));
|       |                                                           ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2084:86: error: 'VkPhysicalDeviceHostImageCopyProperties' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  2084 | void DumpVkPhysicalDeviceHostImageCopyProperties(Printer &p, std::string name, const VkPhysicalDeviceHostImageCopyProperties &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceHostImageCopyProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2087:47: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  2087 |     p.PrintKeyValue("copySrcLayoutCount", obj.copySrcLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2088:13: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  2088 |     if (obj.copySrcLayoutCount == 0 || obj.pCopySrcLayouts == nullptr) {
|       |             ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2088:44: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  2088 |     if (obj.copySrcLayoutCount == 0 || obj.pCopySrcLayouts == nullptr) {
|       |                                            ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2091:51: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  2091 |         ArrayWrapper arr(p,"pCopySrcLayouts", obj.copySrcLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2092:38: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  2092 |         for (uint32_t i = 0; i < obj.copySrcLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2093:57: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  2093 |             DumpVkImageLayout(p, std::to_string(i), obj.pCopySrcLayouts[i]);
|       |                                                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2096:47: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  2096 |     p.PrintKeyValue("copyDstLayoutCount", obj.copyDstLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2097:13: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  2097 |     if (obj.copyDstLayoutCount == 0 || obj.pCopyDstLayouts == nullptr) {
|       |             ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2097:44: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  2097 |     if (obj.copyDstLayoutCount == 0 || obj.pCopyDstLayouts == nullptr) {
|       |                                            ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2100:51: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  2100 |         ArrayWrapper arr(p,"pCopyDstLayouts", obj.copyDstLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2101:38: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  2101 |         for (uint32_t i = 0; i < obj.copyDstLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2102:57: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  2102 |             DumpVkImageLayout(p, std::to_string(i), obj.pCopyDstLayouts[i]);
|       |                                                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2105:52: error: request for member 'optimalTilingLayoutUUID' in 'obj', which is of non-class type 'const int'
|  2105 |     p.PrintKeyValue("optimalTilingLayoutUUID", obj.optimalTilingLayoutUUID);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2106:77: error: request for member 'identicalMemoryTypeRequirements' in 'obj', which is of non-class type 'const int'
|  2106 |     p.PrintKeyBool("identicalMemoryTypeRequirements", static_cast<bool>(obj.identicalMemoryTypeRequirements));
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2160:85: error: 'VkPhysicalDeviceIndexTypeUint8Features' does not name a type; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  2160 | void DumpVkPhysicalDeviceIndexTypeUint8Features(Printer &p, std::string name, const VkPhysicalDeviceIndexTypeUint8Features &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceIndexTypeUint8Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2163:60: error: request for member 'indexTypeUint8' in 'obj', which is of non-class type 'const int'
|  2163 |     p.PrintKeyBool("indexTypeUint8", static_cast<bool>(obj.indexTypeUint8));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2348:88: error: 'VkPhysicalDeviceLineRasterizationFeatures' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  2348 | void DumpVkPhysicalDeviceLineRasterizationFeatures(Printer &p, std::string name, const VkPhysicalDeviceLineRasterizationFeatures &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLineRasterizationFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2351:62: error: request for member 'rectangularLines' in 'obj', which is of non-class type 'const int'
|  2351 |     p.PrintKeyBool("rectangularLines", static_cast<bool>(obj.rectangularLines));
|       |                                                              ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2352:60: error: request for member 'bresenhamLines' in 'obj', which is of non-class type 'const int'
|  2352 |     p.PrintKeyBool("bresenhamLines", static_cast<bool>(obj.bresenhamLines));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2353:57: error: request for member 'smoothLines' in 'obj', which is of non-class type 'const int'
|  2353 |     p.PrintKeyBool("smoothLines", static_cast<bool>(obj.smoothLines));
|       |                                                         ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2354:70: error: request for member 'stippledRectangularLines' in 'obj', which is of non-class type 'const int'
|  2354 |     p.PrintKeyBool("stippledRectangularLines", static_cast<bool>(obj.stippledRectangularLines));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2355:68: error: request for member 'stippledBresenhamLines' in 'obj', which is of non-class type 'const int'
|  2355 |     p.PrintKeyBool("stippledBresenhamLines", static_cast<bool>(obj.stippledBresenhamLines));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2356:65: error: request for member 'stippledSmoothLines' in 'obj', which is of non-class type 'const int'
|  2356 |     p.PrintKeyBool("stippledSmoothLines", static_cast<bool>(obj.stippledSmoothLines));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2358:90: error: 'VkPhysicalDeviceLineRasterizationProperties' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  2358 | void DumpVkPhysicalDeviceLineRasterizationProperties(Printer &p, std::string name, const VkPhysicalDeviceLineRasterizationProperties &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLineRasterizationProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2361:54: error: request for member 'lineSubPixelPrecisionBits' in 'obj', which is of non-class type 'const int'
|  2361 |     p.PrintKeyValue("lineSubPixelPrecisionBits", obj.lineSubPixelPrecisionBits);
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2379:83: error: 'VkPhysicalDeviceMaintenance5Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  2379 | void DumpVkPhysicalDeviceMaintenance5Features(Printer &p, std::string name, const VkPhysicalDeviceMaintenance5Features &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                   VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance5Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2382:58: error: request for member 'maintenance5' in 'obj', which is of non-class type 'const int'
|  2382 |     p.PrintKeyBool("maintenance5", static_cast<bool>(obj.maintenance5));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2384:85: error: 'VkPhysicalDeviceMaintenance5Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  2384 | void DumpVkPhysicalDeviceMaintenance5Properties(Printer &p, std::string name, const VkPhysicalDeviceMaintenance5Properties &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance5Properties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2387:97: error: request for member 'earlyFragmentMultisampleCoverageAfterSampleCounting' in 'obj', which is of non-class type 'const int'
|  2387 |     p.PrintKeyBool("earlyFragmentMultisampleCoverageAfterSampleCounting", static_cast<bool>(obj.earlyFragmentMultisampleCoverageAfterSampleCounting));
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2388:93: error: request for member 'earlyFragmentSampleMaskTestBeforeSampleCounting' in 'obj', which is of non-class type 'const int'
|  2388 |     p.PrintKeyBool("earlyFragmentSampleMaskTestBeforeSampleCounting", static_cast<bool>(obj.earlyFragmentSampleMaskTestBeforeSampleCounting));
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2389:75: error: request for member 'depthStencilSwizzleOneSupport' in 'obj', which is of non-class type 'const int'
|  2389 |     p.PrintKeyBool("depthStencilSwizzleOneSupport", static_cast<bool>(obj.depthStencilSwizzleOneSupport));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2390:66: error: request for member 'polygonModePointSize' in 'obj', which is of non-class type 'const int'
|  2390 |     p.PrintKeyBool("polygonModePointSize", static_cast<bool>(obj.polygonModePointSize));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2391:91: error: request for member 'nonStrictSinglePixelWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  2391 |     p.PrintKeyBool("nonStrictSinglePixelWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictSinglePixelWideLinesUseParallelogram));
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2392:80: error: request for member 'nonStrictWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  2392 |     p.PrintKeyBool("nonStrictWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictWideLinesUseParallelogram));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2394:83: error: 'VkPhysicalDeviceMaintenance6Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  2394 | void DumpVkPhysicalDeviceMaintenance6Features(Printer &p, std::string name, const VkPhysicalDeviceMaintenance6Features &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                   VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance6Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2397:58: error: request for member 'maintenance6' in 'obj', which is of non-class type 'const int'
|  2397 |     p.PrintKeyBool("maintenance6", static_cast<bool>(obj.maintenance6));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2399:85: error: 'VkPhysicalDeviceMaintenance6Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  2399 | void DumpVkPhysicalDeviceMaintenance6Properties(Printer &p, std::string name, const VkPhysicalDeviceMaintenance6Properties &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance6Properties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2402:84: error: request for member 'blockTexelViewCompatibleMultipleLayers' in 'obj', which is of non-class type 'const int'
|  2402 |     p.PrintKeyBool("blockTexelViewCompatibleMultipleLayers", static_cast<bool>(obj.blockTexelViewCompatibleMultipleLayers));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2403:67: error: request for member 'maxCombinedImageSamplerDescriptorCount' in 'obj', which is of non-class type 'const int'
|  2403 |     p.PrintKeyValue("maxCombinedImageSamplerDescriptorCount", obj.maxCombinedImageSamplerDescriptorCount);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2404:84: error: request for member 'fragmentShadingRateClampCombinerInputs' in 'obj', which is of non-class type 'const int'
|  2404 |     p.PrintKeyBool("fragmentShadingRateClampCombinerInputs", static_cast<bool>(obj.fragmentShadingRateClampCombinerInputs));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2626:94: error: 'VkPhysicalDevicePipelineProtectedAccessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  2626 | void DumpVkPhysicalDevicePipelineProtectedAccessFeatures(Printer &p, std::string name, const VkPhysicalDevicePipelineProtectedAccessFeatures &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineProtectedAccessFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2629:69: error: request for member 'pipelineProtectedAccess' in 'obj', which is of non-class type 'const int'
|  2629 |     p.PrintKeyBool("pipelineProtectedAccess", static_cast<bool>(obj.pipelineProtectedAccess));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2631:89: error: 'VkPhysicalDevicePipelineRobustnessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  2631 | void DumpVkPhysicalDevicePipelineRobustnessFeatures(Printer &p, std::string name, const VkPhysicalDevicePipelineRobustnessFeatures &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineRobustnessFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2634:64: error: request for member 'pipelineRobustness' in 'obj', which is of non-class type 'const int'
|  2634 |     p.PrintKeyBool("pipelineRobustness", static_cast<bool>(obj.pipelineRobustness));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2636:91: error: 'VkPhysicalDevicePipelineRobustnessProperties' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  2636 | void DumpVkPhysicalDevicePipelineRobustnessProperties(Printer &p, std::string name, const VkPhysicalDevicePipelineRobustnessProperties &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineRobustnessProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2638:86: error: request for member 'defaultRobustnessStorageBuffers' in 'obj', which is of non-class type 'const int'
|  2638 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessStorageBuffers", obj.defaultRobustnessStorageBuffers);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2639:86: error: request for member 'defaultRobustnessUniformBuffers' in 'obj', which is of non-class type 'const int'
|  2639 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessUniformBuffers", obj.defaultRobustnessUniformBuffers);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2640:84: error: request for member 'defaultRobustnessVertexInputs' in 'obj', which is of non-class type 'const int'
|  2640 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessVertexInputs", obj.defaultRobustnessVertexInputs);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2641:77: error: request for member 'defaultRobustnessImages' in 'obj', which is of non-class type 'const int'
|  2641 |     DumpVkPipelineRobustnessImageBehavior(p, "defaultRobustnessImages", obj.defaultRobustnessImages);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2680:100: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  2680 | void DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT(Printer &p, std::string name, const VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2683:72: error: request for member 'presentModeFifoLatestReady' in 'obj', which is of non-class type 'const int'
|  2683 |     p.PrintKeyBool("presentModeFifoLatestReady", static_cast<bool>(obj.presentModeFifoLatestReady));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2730:87: error: 'VkPhysicalDevicePushDescriptorProperties' does not name a type; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  2730 | void DumpVkPhysicalDevicePushDescriptorProperties(Printer &p, std::string name, const VkPhysicalDevicePushDescriptorProperties &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePushDescriptorProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2733:47: error: request for member 'maxPushDescriptors' in 'obj', which is of non-class type 'const int'
|  2733 |     p.PrintKeyValue("maxPushDescriptors", obj.maxPushDescriptors);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2884:89: error: 'VkPhysicalDeviceShaderExpectAssumeFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  2884 | void DumpVkPhysicalDeviceShaderExpectAssumeFeatures(Printer &p, std::string name, const VkPhysicalDeviceShaderExpectAssumeFeatures &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderExpectAssumeFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2887:64: error: request for member 'shaderExpectAssume' in 'obj', which is of non-class type 'const int'
|  2887 |     p.PrintKeyBool("shaderExpectAssume", static_cast<bool>(obj.shaderExpectAssume));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2895:91: error: 'VkPhysicalDeviceShaderFloatControls2Features' does not name a type; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  2895 | void DumpVkPhysicalDeviceShaderFloatControls2Features(Printer &p, std::string name, const VkPhysicalDeviceShaderFloatControls2Features &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderFloatControls2Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2898:66: error: request for member 'shaderFloatControls2' in 'obj', which is of non-class type 'const int'
|  2898 |     p.PrintKeyBool("shaderFloatControls2", static_cast<bool>(obj.shaderFloatControls2));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2991:91: error: 'VkPhysicalDeviceShaderSubgroupRotateFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  2991 | void DumpVkPhysicalDeviceShaderSubgroupRotateFeatures(Printer &p, std::string name, const VkPhysicalDeviceShaderSubgroupRotateFeatures &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderSubgroupRotateFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2994:66: error: request for member 'shaderSubgroupRotate' in 'obj', which is of non-class type 'const int'
|  2994 |     p.PrintKeyBool("shaderSubgroupRotate", static_cast<bool>(obj.shaderSubgroupRotate));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:2995:75: error: request for member 'shaderSubgroupRotateClustered' in 'obj', which is of non-class type 'const int'
|  2995 |     p.PrintKeyBool("shaderSubgroupRotateClustered", static_cast<bool>(obj.shaderSubgroupRotateClustered));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3139:93: error: 'VkPhysicalDeviceVertexAttributeDivisorFeatures' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  3139 | void DumpVkPhysicalDeviceVertexAttributeDivisorFeatures(Printer &p, std::string name, const VkPhysicalDeviceVertexAttributeDivisorFeatures &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVertexAttributeDivisorFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3142:80: error: request for member 'vertexAttributeInstanceRateDivisor' in 'obj', which is of non-class type 'const int'
|  3142 |     p.PrintKeyBool("vertexAttributeInstanceRateDivisor", static_cast<bool>(obj.vertexAttributeInstanceRateDivisor));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3143:84: error: request for member 'vertexAttributeInstanceRateZeroDivisor' in 'obj', which is of non-class type 'const int'
|  3143 |     p.PrintKeyBool("vertexAttributeInstanceRateZeroDivisor", static_cast<bool>(obj.vertexAttributeInstanceRateZeroDivisor));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3145:95: error: 'VkPhysicalDeviceVertexAttributeDivisorProperties' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR'?
|  3145 | void DumpVkPhysicalDeviceVertexAttributeDivisorProperties(Printer &p, std::string name, const VkPhysicalDeviceVertexAttributeDivisorProperties &obj) {
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVertexAttributeDivisorProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3148:51: error: request for member 'maxVertexAttribDivisor' in 'obj', which is of non-class type 'const int'
|  3148 |     p.PrintKeyValue("maxVertexAttribDivisor", obj.maxVertexAttribDivisor);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3149:74: error: request for member 'supportsNonZeroFirstInstance' in 'obj', which is of non-class type 'const int'
|  3149 |     p.PrintKeyBool("supportsNonZeroFirstInstance", static_cast<bool>(obj.supportsNonZeroFirstInstance));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3156:99: error: 'VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  3156 | void DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT &obj) {
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                   VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3159:71: error: request for member 'vertexAttributeRobustness' in 'obj', which is of non-class type 'const int'
|  3159 |     p.PrintKeyBool("vertexAttributeRobustness", static_cast<bool>(obj.vertexAttributeRobustness));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3166:88: error: 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  3166 | void DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceVideoEncodeAV1FeaturesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3169:60: error: request for member 'videoEncodeAV1' in 'obj', which is of non-class type 'const int'
|  3169 |     p.PrintKeyBool("videoEncodeAV1", static_cast<bool>(obj.videoEncodeAV1));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3171:100: error: 'VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceSynchronization2FeaturesKHR'?
|  3171 | void DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDeviceSynchronization2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3174:72: error: request for member 'videoEncodeQuantizationMap' in 'obj', which is of non-class type 'const int'
|  3174 |     p.PrintKeyBool("videoEncodeQuantizationMap", static_cast<bool>(obj.videoEncodeQuantizationMap));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3393:79: error: 'VkPhysicalDeviceVulkan14Features' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Features'?
|  3393 | void DumpVkPhysicalDeviceVulkan14Features(Printer &p, std::string name, const VkPhysicalDeviceVulkan14Features &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                               VkPhysicalDeviceVulkan13Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVulkan14Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3396:65: error: request for member 'globalPriorityQuery' in 'obj', which is of non-class type 'const int'
|  3396 |     p.PrintKeyBool("globalPriorityQuery", static_cast<bool>(obj.globalPriorityQuery));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3397:66: error: request for member 'shaderSubgroupRotate' in 'obj', which is of non-class type 'const int'
|  3397 |     p.PrintKeyBool("shaderSubgroupRotate", static_cast<bool>(obj.shaderSubgroupRotate));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3398:75: error: request for member 'shaderSubgroupRotateClustered' in 'obj', which is of non-class type 'const int'
|  3398 |     p.PrintKeyBool("shaderSubgroupRotateClustered", static_cast<bool>(obj.shaderSubgroupRotateClustered));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3399:66: error: request for member 'shaderFloatControls2' in 'obj', which is of non-class type 'const int'
|  3399 |     p.PrintKeyBool("shaderFloatControls2", static_cast<bool>(obj.shaderFloatControls2));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3400:64: error: request for member 'shaderExpectAssume' in 'obj', which is of non-class type 'const int'
|  3400 |     p.PrintKeyBool("shaderExpectAssume", static_cast<bool>(obj.shaderExpectAssume));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3401:62: error: request for member 'rectangularLines' in 'obj', which is of non-class type 'const int'
|  3401 |     p.PrintKeyBool("rectangularLines", static_cast<bool>(obj.rectangularLines));
|       |                                                              ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3402:60: error: request for member 'bresenhamLines' in 'obj', which is of non-class type 'const int'
|  3402 |     p.PrintKeyBool("bresenhamLines", static_cast<bool>(obj.bresenhamLines));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3403:57: error: request for member 'smoothLines' in 'obj', which is of non-class type 'const int'
|  3403 |     p.PrintKeyBool("smoothLines", static_cast<bool>(obj.smoothLines));
|       |                                                         ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3404:70: error: request for member 'stippledRectangularLines' in 'obj', which is of non-class type 'const int'
|  3404 |     p.PrintKeyBool("stippledRectangularLines", static_cast<bool>(obj.stippledRectangularLines));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3405:68: error: request for member 'stippledBresenhamLines' in 'obj', which is of non-class type 'const int'
|  3405 |     p.PrintKeyBool("stippledBresenhamLines", static_cast<bool>(obj.stippledBresenhamLines));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3406:65: error: request for member 'stippledSmoothLines' in 'obj', which is of non-class type 'const int'
|  3406 |     p.PrintKeyBool("stippledSmoothLines", static_cast<bool>(obj.stippledSmoothLines));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3407:80: error: request for member 'vertexAttributeInstanceRateDivisor' in 'obj', which is of non-class type 'const int'
|  3407 |     p.PrintKeyBool("vertexAttributeInstanceRateDivisor", static_cast<bool>(obj.vertexAttributeInstanceRateDivisor));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3408:84: error: request for member 'vertexAttributeInstanceRateZeroDivisor' in 'obj', which is of non-class type 'const int'
|  3408 |     p.PrintKeyBool("vertexAttributeInstanceRateZeroDivisor", static_cast<bool>(obj.vertexAttributeInstanceRateZeroDivisor));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3409:60: error: request for member 'indexTypeUint8' in 'obj', which is of non-class type 'const int'
|  3409 |     p.PrintKeyBool("indexTypeUint8", static_cast<bool>(obj.indexTypeUint8));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3410:71: error: request for member 'dynamicRenderingLocalRead' in 'obj', which is of non-class type 'const int'
|  3410 |     p.PrintKeyBool("dynamicRenderingLocalRead", static_cast<bool>(obj.dynamicRenderingLocalRead));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3411:58: error: request for member 'maintenance5' in 'obj', which is of non-class type 'const int'
|  3411 |     p.PrintKeyBool("maintenance5", static_cast<bool>(obj.maintenance5));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3412:58: error: request for member 'maintenance6' in 'obj', which is of non-class type 'const int'
|  3412 |     p.PrintKeyBool("maintenance6", static_cast<bool>(obj.maintenance6));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3413:69: error: request for member 'pipelineProtectedAccess' in 'obj', which is of non-class type 'const int'
|  3413 |     p.PrintKeyBool("pipelineProtectedAccess", static_cast<bool>(obj.pipelineProtectedAccess));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3414:64: error: request for member 'pipelineRobustness' in 'obj', which is of non-class type 'const int'
|  3414 |     p.PrintKeyBool("pipelineRobustness", static_cast<bool>(obj.pipelineRobustness));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3415:59: error: request for member 'hostImageCopy' in 'obj', which is of non-class type 'const int'
|  3415 |     p.PrintKeyBool("hostImageCopy", static_cast<bool>(obj.hostImageCopy));
|       |                                                           ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3416:60: error: request for member 'pushDescriptor' in 'obj', which is of non-class type 'const int'
|  3416 |     p.PrintKeyBool("pushDescriptor", static_cast<bool>(obj.pushDescriptor));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3418:81: error: 'VkPhysicalDeviceVulkan14Properties' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Properties'?
|  3418 | void DumpVkPhysicalDeviceVulkan14Properties(Printer &p, std::string name, const VkPhysicalDeviceVulkan14Properties &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                 VkPhysicalDeviceVulkan13Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVulkan14Properties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3421:54: error: request for member 'lineSubPixelPrecisionBits' in 'obj', which is of non-class type 'const int'
|  3421 |     p.PrintKeyValue("lineSubPixelPrecisionBits", obj.lineSubPixelPrecisionBits);
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3422:51: error: request for member 'maxVertexAttribDivisor' in 'obj', which is of non-class type 'const int'
|  3422 |     p.PrintKeyValue("maxVertexAttribDivisor", obj.maxVertexAttribDivisor);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3423:74: error: request for member 'supportsNonZeroFirstInstance' in 'obj', which is of non-class type 'const int'
|  3423 |     p.PrintKeyBool("supportsNonZeroFirstInstance", static_cast<bool>(obj.supportsNonZeroFirstInstance));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3424:47: error: request for member 'maxPushDescriptors' in 'obj', which is of non-class type 'const int'
|  3424 |     p.PrintKeyValue("maxPushDescriptors", obj.maxPushDescriptors);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3425:94: error: request for member 'dynamicRenderingLocalReadDepthStencilAttachments' in 'obj', which is of non-class type 'const int'
|  3425 |     p.PrintKeyBool("dynamicRenderingLocalReadDepthStencilAttachments", static_cast<bool>(obj.dynamicRenderingLocalReadDepthStencilAttachments));
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3426:94: error: request for member 'dynamicRenderingLocalReadMultisampledAttachments' in 'obj', which is of non-class type 'const int'
|  3426 |     p.PrintKeyBool("dynamicRenderingLocalReadMultisampledAttachments", static_cast<bool>(obj.dynamicRenderingLocalReadMultisampledAttachments));
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3427:97: error: request for member 'earlyFragmentMultisampleCoverageAfterSampleCounting' in 'obj', which is of non-class type 'const int'
|  3427 |     p.PrintKeyBool("earlyFragmentMultisampleCoverageAfterSampleCounting", static_cast<bool>(obj.earlyFragmentMultisampleCoverageAfterSampleCounting));
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3428:93: error: request for member 'earlyFragmentSampleMaskTestBeforeSampleCounting' in 'obj', which is of non-class type 'const int'
|  3428 |     p.PrintKeyBool("earlyFragmentSampleMaskTestBeforeSampleCounting", static_cast<bool>(obj.earlyFragmentSampleMaskTestBeforeSampleCounting));
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3429:75: error: request for member 'depthStencilSwizzleOneSupport' in 'obj', which is of non-class type 'const int'
|  3429 |     p.PrintKeyBool("depthStencilSwizzleOneSupport", static_cast<bool>(obj.depthStencilSwizzleOneSupport));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3430:66: error: request for member 'polygonModePointSize' in 'obj', which is of non-class type 'const int'
|  3430 |     p.PrintKeyBool("polygonModePointSize", static_cast<bool>(obj.polygonModePointSize));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3431:91: error: request for member 'nonStrictSinglePixelWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  3431 |     p.PrintKeyBool("nonStrictSinglePixelWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictSinglePixelWideLinesUseParallelogram));
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3432:80: error: request for member 'nonStrictWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  3432 |     p.PrintKeyBool("nonStrictWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictWideLinesUseParallelogram));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3433:84: error: request for member 'blockTexelViewCompatibleMultipleLayers' in 'obj', which is of non-class type 'const int'
|  3433 |     p.PrintKeyBool("blockTexelViewCompatibleMultipleLayers", static_cast<bool>(obj.blockTexelViewCompatibleMultipleLayers));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3434:67: error: request for member 'maxCombinedImageSamplerDescriptorCount' in 'obj', which is of non-class type 'const int'
|  3434 |     p.PrintKeyValue("maxCombinedImageSamplerDescriptorCount", obj.maxCombinedImageSamplerDescriptorCount);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3435:84: error: request for member 'fragmentShadingRateClampCombinerInputs' in 'obj', which is of non-class type 'const int'
|  3435 |     p.PrintKeyBool("fragmentShadingRateClampCombinerInputs", static_cast<bool>(obj.fragmentShadingRateClampCombinerInputs));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3436:86: error: request for member 'defaultRobustnessStorageBuffers' in 'obj', which is of non-class type 'const int'
|  3436 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessStorageBuffers", obj.defaultRobustnessStorageBuffers);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3437:86: error: request for member 'defaultRobustnessUniformBuffers' in 'obj', which is of non-class type 'const int'
|  3437 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessUniformBuffers", obj.defaultRobustnessUniformBuffers);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3438:84: error: request for member 'defaultRobustnessVertexInputs' in 'obj', which is of non-class type 'const int'
|  3438 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessVertexInputs", obj.defaultRobustnessVertexInputs);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3439:77: error: request for member 'defaultRobustnessImages' in 'obj', which is of non-class type 'const int'
|  3439 |     DumpVkPipelineRobustnessImageBehavior(p, "defaultRobustnessImages", obj.defaultRobustnessImages);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3440:47: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  3440 |     p.PrintKeyValue("copySrcLayoutCount", obj.copySrcLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3441:13: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  3441 |     if (obj.copySrcLayoutCount == 0 || obj.pCopySrcLayouts == nullptr) {
|       |             ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3441:44: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  3441 |     if (obj.copySrcLayoutCount == 0 || obj.pCopySrcLayouts == nullptr) {
|       |                                            ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3444:51: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  3444 |         ArrayWrapper arr(p,"pCopySrcLayouts", obj.copySrcLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3445:38: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  3445 |         for (uint32_t i = 0; i < obj.copySrcLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3446:57: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  3446 |             DumpVkImageLayout(p, std::to_string(i), obj.pCopySrcLayouts[i]);
|       |                                                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3449:47: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  3449 |     p.PrintKeyValue("copyDstLayoutCount", obj.copyDstLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3450:13: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  3450 |     if (obj.copyDstLayoutCount == 0 || obj.pCopyDstLayouts == nullptr) {
|       |             ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3450:44: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  3450 |     if (obj.copyDstLayoutCount == 0 || obj.pCopyDstLayouts == nullptr) {
|       |                                            ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3453:51: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  3453 |         ArrayWrapper arr(p,"pCopyDstLayouts", obj.copyDstLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3454:38: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  3454 |         for (uint32_t i = 0; i < obj.copyDstLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3455:57: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  3455 |             DumpVkImageLayout(p, std::to_string(i), obj.pCopyDstLayouts[i]);
|       |                                                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3458:52: error: request for member 'optimalTilingLayoutUUID' in 'obj', which is of non-class type 'const int'
|  3458 |     p.PrintKeyValue("optimalTilingLayoutUUID", obj.optimalTilingLayoutUUID);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3459:77: error: request for member 'identicalMemoryTypeRequirements' in 'obj', which is of non-class type 'const int'
|  3459 |     p.PrintKeyBool("identicalMemoryTypeRequirements", static_cast<bool>(obj.identicalMemoryTypeRequirements));
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3491:84: error: 'VkQueueFamilyGlobalPriorityProperties' does not name a type; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  3491 | void DumpVkQueueFamilyGlobalPriorityProperties(Printer &p, std::string name, const VkQueueFamilyGlobalPriorityProperties &obj) {
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkQueueFamilyGlobalPriorityProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3494:42: error: request for member 'priorityCount' in 'obj', which is of non-class type 'const int'
|  3494 |     p.PrintKeyValue("priorityCount", obj.priorityCount);
|       |                                          ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3495:42: error: request for member 'priorityCount' in 'obj', which is of non-class type 'const int'
|  3495 |     ArrayWrapper arr(p,"priorities", obj.priorityCount);
|       |                                          ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3496:34: error: request for member 'priorityCount' in 'obj', which is of non-class type 'const int'
|  3496 |     for (uint32_t i = 0; i < obj.priorityCount; i++) {
|       |                                  ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3498:79: error: request for member 'priorities' in 'obj', which is of non-class type 'const int'
|  3498 |            p.PrintString(std::string("VK_") + VkQueueGlobalPriorityString(obj.priorities[i]));
|       |                                                                               ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3500:58: error: request for member 'priorities' in 'obj', which is of non-class type 'const int'
|  3500 |            p.PrintString(VkQueueGlobalPriorityString(obj.priorities[i]));
|       |                                                          ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3602:5: error: 'VkPhysicalDeviceHostImageCopyProperties' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  3602 |     VkPhysicalDeviceHostImageCopyProperties PhysicalDeviceHostImageCopyProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3610:5: error: 'VkPhysicalDeviceLineRasterizationProperties' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  3610 |     VkPhysicalDeviceLineRasterizationProperties PhysicalDeviceLineRasterizationProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3613:5: error: 'VkPhysicalDeviceMaintenance5Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  3613 |     VkPhysicalDeviceMaintenance5Properties PhysicalDeviceMaintenance5Properties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3614:5: error: 'VkPhysicalDeviceMaintenance6Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  3614 |     VkPhysicalDeviceMaintenance6Properties PhysicalDeviceMaintenance6Properties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3625:5: error: 'VkPhysicalDevicePipelineRobustnessProperties' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  3625 |     VkPhysicalDevicePipelineRobustnessProperties PhysicalDevicePipelineRobustnessProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3632:5: error: 'VkPhysicalDevicePushDescriptorProperties' does not name a type; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  3632 |     VkPhysicalDevicePushDescriptorProperties PhysicalDevicePushDescriptorProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3646:5: error: 'VkPhysicalDeviceVertexAttributeDivisorProperties' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR'?
|  3646 |     VkPhysicalDeviceVertexAttributeDivisorProperties PhysicalDeviceVertexAttributeDivisorProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3651:5: error: 'VkPhysicalDeviceVulkan14Properties' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Properties'?
|  3651 |     VkPhysicalDeviceVulkan14Properties PhysicalDeviceVulkan14Properties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVulkan13Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain(AppInstance&, AppGpu&, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3677:9: error: 'PhysicalDeviceHostImageCopyProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  3677 |         PhysicalDeviceHostImageCopyProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3677:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT'?
|  3677 |         PhysicalDeviceHostImageCopyProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3682:9: error: 'PhysicalDeviceLineRasterizationProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  3682 |         PhysicalDeviceLineRasterizationProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3682:59: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR'?
|  3682 |         PhysicalDeviceLineRasterizationProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3685:9: error: 'PhysicalDeviceMaintenance5Properties' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance3Properties'?
|  3685 |         PhysicalDeviceMaintenance5Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance3Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3685:54: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  3685 |         PhysicalDeviceMaintenance5Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES;
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3686:9: error: 'PhysicalDeviceMaintenance6Properties' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance3Properties'?
|  3686 |         PhysicalDeviceMaintenance6Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance3Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3686:54: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  3686 |         PhysicalDeviceMaintenance6Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES;
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3697:9: error: 'PhysicalDevicePipelineRobustnessProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  3697 |         PhysicalDevicePipelineRobustnessProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3697:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT'?
|  3697 |         PhysicalDevicePipelineRobustnessProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3704:9: error: 'PhysicalDevicePushDescriptorProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  3704 |         PhysicalDevicePushDescriptorProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3704:56: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR'?
|  3704 |         PhysicalDevicePushDescriptorProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3718:9: error: 'PhysicalDeviceVertexAttributeDivisorProperties' was not declared in this scope; did you mean 'PhysicalDeviceVertexAttributeDivisorPropertiesEXT'?
|  3718 |         PhysicalDeviceVertexAttributeDivisorProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceVertexAttributeDivisorPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3718:64: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR'?
|  3718 |         PhysicalDeviceVertexAttributeDivisorProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3723:9: error: 'PhysicalDeviceVulkan14Properties' was not declared in this scope; did you mean 'PhysicalDeviceVulkan11Properties'?
|  3723 |         PhysicalDeviceVulkan14Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3723:50: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES'?
|  3723 |         PhysicalDeviceVulkan14Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES;
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3774:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  3774 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3790:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  3790 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3799:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  3799 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3802:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  3802 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3826:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  3826 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3840:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  3840 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3874:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  3874 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:3884:33: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  3884 |         if ((gpu.api_version >= VK_API_VERSION_1_4))
|       |                                 ^~~~~~~~~~~~~~~~~~
|       |                                 VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, bool, void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4015:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT'?
|  4015 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4016:13: error: 'VkPhysicalDeviceHostImageCopyProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  4016 |             VkPhysicalDeviceHostImageCopyProperties* props = (VkPhysicalDeviceHostImageCopyProperties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4016:54: error: 'props' was not declared in this scope
|  4016 |             VkPhysicalDeviceHostImageCopyProperties* props = (VkPhysicalDeviceHostImageCopyProperties*)structure;
|       |                                                      ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4016:103: error: expected primary-expression before ')' token
|  4016 |             VkPhysicalDeviceHostImageCopyProperties* props = (VkPhysicalDeviceHostImageCopyProperties*)structure;
|       |                                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4017:79: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4017 |             DumpVkPhysicalDeviceHostImageCopyProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceHostImageCopyProperties":"VkPhysicalDeviceHostImageCopyPropertiesEXT", *props);
|       |                                                                               ^~~~~~~~~~~~~~~~~~
|       |                                                                               VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4040:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR'?
|  4040 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4041:13: error: 'VkPhysicalDeviceLineRasterizationProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  4041 |             VkPhysicalDeviceLineRasterizationProperties* props = (VkPhysicalDeviceLineRasterizationProperties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4041:58: error: 'props' was not declared in this scope
|  4041 |             VkPhysicalDeviceLineRasterizationProperties* props = (VkPhysicalDeviceLineRasterizationProperties*)structure;
|       |                                                          ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4041:111: error: expected primary-expression before ')' token
|  4041 |             VkPhysicalDeviceLineRasterizationProperties* props = (VkPhysicalDeviceLineRasterizationProperties*)structure;
|       |                                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4042:83: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4042 |             DumpVkPhysicalDeviceLineRasterizationProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceLineRasterizationProperties":"VkPhysicalDeviceLineRasterizationPropertiesKHR", *props);
|       |                                                                                   ^~~~~~~~~~~~~~~~~~
|       |                                                                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4055:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  4055 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4056:13: error: 'VkPhysicalDeviceMaintenance5Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  4056 |             VkPhysicalDeviceMaintenance5Properties* props = (VkPhysicalDeviceMaintenance5Properties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4056:53: error: 'props' was not declared in this scope
|  4056 |             VkPhysicalDeviceMaintenance5Properties* props = (VkPhysicalDeviceMaintenance5Properties*)structure;
|       |                                                     ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4056:101: error: expected primary-expression before ')' token
|  4056 |             VkPhysicalDeviceMaintenance5Properties* props = (VkPhysicalDeviceMaintenance5Properties*)structure;
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4057:78: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4057 |             DumpVkPhysicalDeviceMaintenance5Properties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance5Properties":"VkPhysicalDeviceMaintenance5PropertiesKHR", *props);
|       |                                                                              ^~~~~~~~~~~~~~~~~~
|       |                                                                              VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4060:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  4060 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4061:13: error: 'VkPhysicalDeviceMaintenance6Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  4061 |             VkPhysicalDeviceMaintenance6Properties* props = (VkPhysicalDeviceMaintenance6Properties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4061:53: error: 'props' was not declared in this scope
|  4061 |             VkPhysicalDeviceMaintenance6Properties* props = (VkPhysicalDeviceMaintenance6Properties*)structure;
|       |                                                     ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4061:101: error: expected primary-expression before ')' token
|  4061 |             VkPhysicalDeviceMaintenance6Properties* props = (VkPhysicalDeviceMaintenance6Properties*)structure;
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4062:78: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4062 |             DumpVkPhysicalDeviceMaintenance6Properties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance6Properties":"VkPhysicalDeviceMaintenance6PropertiesKHR", *props);
|       |                                                                              ^~~~~~~~~~~~~~~~~~
|       |                                                                              VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4115:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT'?
|  4115 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4116:13: error: 'VkPhysicalDevicePipelineRobustnessProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  4116 |             VkPhysicalDevicePipelineRobustnessProperties* props = (VkPhysicalDevicePipelineRobustnessProperties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4116:59: error: 'props' was not declared in this scope
|  4116 |             VkPhysicalDevicePipelineRobustnessProperties* props = (VkPhysicalDevicePipelineRobustnessProperties*)structure;
|       |                                                           ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4116:113: error: expected primary-expression before ')' token
|  4116 |             VkPhysicalDevicePipelineRobustnessProperties* props = (VkPhysicalDevicePipelineRobustnessProperties*)structure;
|       |                                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4117:84: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4117 |             DumpVkPhysicalDevicePipelineRobustnessProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineRobustnessProperties":"VkPhysicalDevicePipelineRobustnessPropertiesEXT", *props);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~
|       |                                                                                    VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4142:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR'?
|  4142 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4143:13: error: 'VkPhysicalDevicePushDescriptorProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  4143 |             VkPhysicalDevicePushDescriptorProperties* props = (VkPhysicalDevicePushDescriptorProperties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4143:55: error: 'props' was not declared in this scope
|  4143 |             VkPhysicalDevicePushDescriptorProperties* props = (VkPhysicalDevicePushDescriptorProperties*)structure;
|       |                                                       ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4143:105: error: expected primary-expression before ')' token
|  4143 |             VkPhysicalDevicePushDescriptorProperties* props = (VkPhysicalDevicePushDescriptorProperties*)structure;
|       |                                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4144:80: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4144 |             DumpVkPhysicalDevicePushDescriptorProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePushDescriptorProperties":"VkPhysicalDevicePushDescriptorPropertiesKHR", *props);
|       |                                                                                ^~~~~~~~~~~~~~~~~~
|       |                                                                                VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4212:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR'?
|  4212 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4213:13: error: 'VkPhysicalDeviceVertexAttributeDivisorProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR'?
|  4213 |             VkPhysicalDeviceVertexAttributeDivisorProperties* props = (VkPhysicalDeviceVertexAttributeDivisorProperties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4213:63: error: 'props' was not declared in this scope
|  4213 |             VkPhysicalDeviceVertexAttributeDivisorProperties* props = (VkPhysicalDeviceVertexAttributeDivisorProperties*)structure;
|       |                                                               ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4213:121: error: expected primary-expression before ')' token
|  4213 |             VkPhysicalDeviceVertexAttributeDivisorProperties* props = (VkPhysicalDeviceVertexAttributeDivisorProperties*)structure;
|       |                                                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4214:88: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4214 |             DumpVkPhysicalDeviceVertexAttributeDivisorProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceVertexAttributeDivisorProperties":"VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR", *props);
|       |                                                                                        ^~~~~~~~~~~~~~~~~~
|       |                                                                                        VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4237:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES'?
|  4237 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4238:13: error: 'VkPhysicalDeviceVulkan14Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceVulkan13Properties'?
|  4238 |             VkPhysicalDeviceVulkan14Properties* props = (VkPhysicalDeviceVulkan14Properties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceVulkan13Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4238:49: error: 'props' was not declared in this scope
|  4238 |             VkPhysicalDeviceVulkan14Properties* props = (VkPhysicalDeviceVulkan14Properties*)structure;
|       |                                                 ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4238:93: error: expected primary-expression before ')' token
|  4238 |             VkPhysicalDeviceVulkan14Properties* props = (VkPhysicalDeviceVulkan14Properties*)structure;
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'bool prepare_phys_device_props2_twocall_chain_vectors(std::unique_ptr<phys_device_props2_chain>&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4248:82: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceHostImageCopyProperties'; did you mean 'PhysicalDeviceMultiviewProperties'?
|  4248 |     chain->VkPhysicalDeviceHostImageCopyProperties_pCopySrcLayouts.resize(chain->PhysicalDeviceHostImageCopyProperties.copySrcLayoutCount);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  PhysicalDeviceMultiviewProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4249:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceHostImageCopyProperties'; did you mean 'PhysicalDeviceMultiviewProperties'?
|  4249 |     chain->PhysicalDeviceHostImageCopyProperties.pCopySrcLayouts = chain->VkPhysicalDeviceHostImageCopyProperties_pCopySrcLayouts.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceMultiviewProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4250:82: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceHostImageCopyProperties'; did you mean 'PhysicalDeviceMultiviewProperties'?
|  4250 |     chain->VkPhysicalDeviceHostImageCopyProperties_pCopyDstLayouts.resize(chain->PhysicalDeviceHostImageCopyProperties.copyDstLayoutCount);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  PhysicalDeviceMultiviewProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4251:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceHostImageCopyProperties'; did you mean 'PhysicalDeviceMultiviewProperties'?
|  4251 |     chain->PhysicalDeviceHostImageCopyProperties.pCopyDstLayouts = chain->VkPhysicalDeviceHostImageCopyProperties_pCopyDstLayouts.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceMultiviewProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4254:77: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceVulkan14Properties'; did you mean 'PhysicalDeviceVulkan11Properties'?
|  4254 |     chain->VkPhysicalDeviceVulkan14Properties_pCopySrcLayouts.resize(chain->PhysicalDeviceVulkan14Properties.copySrcLayoutCount);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                             PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4255:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceVulkan14Properties'; did you mean 'PhysicalDeviceVulkan11Properties'?
|  4255 |     chain->PhysicalDeviceVulkan14Properties.pCopySrcLayouts = chain->VkPhysicalDeviceVulkan14Properties_pCopySrcLayouts.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4256:77: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceVulkan14Properties'; did you mean 'PhysicalDeviceVulkan11Properties'?
|  4256 |     chain->VkPhysicalDeviceVulkan14Properties_pCopyDstLayouts.resize(chain->PhysicalDeviceVulkan14Properties.copyDstLayoutCount);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                             PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4257:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceVulkan14Properties'; did you mean 'PhysicalDeviceVulkan11Properties'?
|  4257 |     chain->PhysicalDeviceVulkan14Properties.pCopyDstLayouts = chain->VkPhysicalDeviceVulkan14Properties_pCopyDstLayouts.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4326:5: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeatures' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  4326 |     VkPhysicalDeviceDynamicRenderingLocalReadFeatures PhysicalDeviceDynamicRenderingLocalReadFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4338:5: error: 'VkPhysicalDeviceGlobalPriorityQueryFeatures' does not name a type; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  4338 |     VkPhysicalDeviceGlobalPriorityQueryFeatures PhysicalDeviceGlobalPriorityQueryFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4340:5: error: 'VkPhysicalDeviceHostImageCopyFeatures' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  4340 |     VkPhysicalDeviceHostImageCopyFeatures PhysicalDeviceHostImageCopyFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4349:5: error: 'VkPhysicalDeviceIndexTypeUint8Features' does not name a type; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  4349 |     VkPhysicalDeviceIndexTypeUint8Features PhysicalDeviceIndexTypeUint8Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4353:5: error: 'VkPhysicalDeviceLineRasterizationFeatures' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  4353 |     VkPhysicalDeviceLineRasterizationFeatures PhysicalDeviceLineRasterizationFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4355:5: error: 'VkPhysicalDeviceMaintenance5Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  4355 |     VkPhysicalDeviceMaintenance5Features PhysicalDeviceMaintenance5Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4356:5: error: 'VkPhysicalDeviceMaintenance6Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  4356 |     VkPhysicalDeviceMaintenance6Features PhysicalDeviceMaintenance6Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4375:5: error: 'VkPhysicalDevicePipelineProtectedAccessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  4375 |     VkPhysicalDevicePipelineProtectedAccessFeatures PhysicalDevicePipelineProtectedAccessFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4376:5: error: 'VkPhysicalDevicePipelineRobustnessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  4376 |     VkPhysicalDevicePipelineRobustnessFeatures PhysicalDevicePipelineRobustnessFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4381:5: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  4381 |     VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4404:5: error: 'VkPhysicalDeviceShaderExpectAssumeFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  4404 |     VkPhysicalDeviceShaderExpectAssumeFeatures PhysicalDeviceShaderExpectAssumeFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4406:5: error: 'VkPhysicalDeviceShaderFloatControls2Features' does not name a type; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  4406 |     VkPhysicalDeviceShaderFloatControls2Features PhysicalDeviceShaderFloatControls2Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4417:5: error: 'VkPhysicalDeviceShaderSubgroupRotateFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  4417 |     VkPhysicalDeviceShaderSubgroupRotateFeatures PhysicalDeviceShaderSubgroupRotateFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4431:5: error: 'VkPhysicalDeviceVertexAttributeDivisorFeatures' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  4431 |     VkPhysicalDeviceVertexAttributeDivisorFeatures PhysicalDeviceVertexAttributeDivisorFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4432:5: error: 'VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  4432 |     VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT PhysicalDeviceVertexAttributeRobustnessFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4434:5: error: 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  4434 |     VkPhysicalDeviceVideoEncodeAV1FeaturesKHR PhysicalDeviceVideoEncodeAV1FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4435:5: error: 'VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceSynchronization2FeaturesKHR'?
|  4435 |     VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceSynchronization2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4440:5: error: 'VkPhysicalDeviceVulkan14Features' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Features'?
|  4440 |     VkPhysicalDeviceVulkan14Features PhysicalDeviceVulkan14Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVulkan13Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain(AppGpu&, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4474:9: error: 'PhysicalDeviceDynamicRenderingLocalReadFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  4474 |         PhysicalDeviceDynamicRenderingLocalReadFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4474:65: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR'?
|  4474 |         PhysicalDeviceDynamicRenderingLocalReadFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES;
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4486:9: error: 'PhysicalDeviceGlobalPriorityQueryFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  4486 |         PhysicalDeviceGlobalPriorityQueryFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4486:59: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR'?
|  4486 |         PhysicalDeviceGlobalPriorityQueryFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4488:9: error: 'PhysicalDeviceHostImageCopyFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  4488 |         PhysicalDeviceHostImageCopyFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4488:53: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT'?
|  4488 |         PhysicalDeviceHostImageCopyFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4497:9: error: 'PhysicalDeviceIndexTypeUint8Features' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  4497 |         PhysicalDeviceIndexTypeUint8Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4497:54: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR'?
|  4497 |         PhysicalDeviceIndexTypeUint8Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES;
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4501:9: error: 'PhysicalDeviceLineRasterizationFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  4501 |         PhysicalDeviceLineRasterizationFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4501:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR'?
|  4501 |         PhysicalDeviceLineRasterizationFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4503:9: error: 'PhysicalDeviceMaintenance5Features' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance4Features'?
|  4503 |         PhysicalDeviceMaintenance5Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4503:52: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  4503 |         PhysicalDeviceMaintenance5Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES;
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4504:9: error: 'PhysicalDeviceMaintenance6Features' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance4Features'?
|  4504 |         PhysicalDeviceMaintenance6Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4504:52: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  4504 |         PhysicalDeviceMaintenance6Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES;
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4523:9: error: 'PhysicalDevicePipelineProtectedAccessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  4523 |         PhysicalDevicePipelineProtectedAccessFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4523:63: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT'?
|  4523 |         PhysicalDevicePipelineProtectedAccessFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4524:9: error: 'PhysicalDevicePipelineRobustnessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  4524 |         PhysicalDevicePipelineRobustnessFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4524:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT'?
|  4524 |         PhysicalDevicePipelineRobustnessFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4529:9: error: 'PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT'?
|  4529 |         PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4529:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  4529 |         PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4552:9: error: 'PhysicalDeviceShaderExpectAssumeFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  4552 |         PhysicalDeviceShaderExpectAssumeFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4552:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR'?
|  4552 |         PhysicalDeviceShaderExpectAssumeFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4554:9: error: 'PhysicalDeviceShaderFloatControls2Features' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  4554 |         PhysicalDeviceShaderFloatControls2Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4554:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR'?
|  4554 |         PhysicalDeviceShaderFloatControls2Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4564:9: error: 'PhysicalDeviceShaderSubgroupRotateFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  4564 |         PhysicalDeviceShaderSubgroupRotateFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4564:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR'?
|  4564 |         PhysicalDeviceShaderSubgroupRotateFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4578:9: error: 'PhysicalDeviceVertexAttributeDivisorFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  4578 |         PhysicalDeviceVertexAttributeDivisorFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4578:62: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR'?
|  4578 |         PhysicalDeviceVertexAttributeDivisorFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4579:9: error: 'PhysicalDeviceVertexAttributeRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT'?
|  4579 |         PhysicalDeviceVertexAttributeRobustnessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4579:68: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  4579 |         PhysicalDeviceVertexAttributeRobustnessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT;
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4581:9: error: 'PhysicalDeviceVideoEncodeAV1FeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  4581 |         PhysicalDeviceVideoEncodeAV1FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4581:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  4581 |         PhysicalDeviceVideoEncodeAV1FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4582:9: error: 'PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR'?
|  4582 |         PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4582:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR'?
|  4582 |         PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4587:9: error: 'PhysicalDeviceVulkan14Features' was not declared in this scope; did you mean 'PhysicalDeviceVulkan11Features'?
|  4587 |         PhysicalDeviceVulkan14Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceVulkan11Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4587:48: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES'?
|  4587 |         PhysicalDeviceVulkan14Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES;
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4655:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4655 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4682:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4682 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4687:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4687 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4710:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4710 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4721:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4721 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4727:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4727 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4730:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4730 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4772:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4772 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4775:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4775 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4783:54: error: 'VK_EXT_PRESENT_MODE_FIFO_LATEST_READY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME'?
|  4783 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRESENT_MODE_FIFO_LATEST_READY_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4837:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4837 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4843:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4843 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4866:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4866 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4903:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4903 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4905:54: error: 'VK_EXT_VERTEX_ATTRIBUTE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_VERTEX_ATTRIBUTE_DIVISOR_EXTENSION_NAME'?
|  4905 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_VERTEX_ATTRIBUTE_ROBUSTNESS_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_VERTEX_ATTRIBUTE_DIVISOR_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4909:54: error: 'VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  4909 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4911:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  4911 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:4921:33: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  4921 |         if ((gpu.api_version >= VK_API_VERSION_1_4))
|       |                                 ^~~~~~~~~~~~~~~~~~
|       |                                 VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, bool, void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5089:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR'?
|  5089 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5090:13: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  5090 |             VkPhysicalDeviceDynamicRenderingLocalReadFeatures* props = (VkPhysicalDeviceDynamicRenderingLocalReadFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5090:64: error: 'props' was not declared in this scope
|  5090 |             VkPhysicalDeviceDynamicRenderingLocalReadFeatures* props = (VkPhysicalDeviceDynamicRenderingLocalReadFeatures*)structure;
|       |                                                                ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5090:123: error: expected primary-expression before ')' token
|  5090 |             VkPhysicalDeviceDynamicRenderingLocalReadFeatures* props = (VkPhysicalDeviceDynamicRenderingLocalReadFeatures*)structure;
|       |                                                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5091:89: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5091 |             DumpVkPhysicalDeviceDynamicRenderingLocalReadFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceDynamicRenderingLocalReadFeatures":"VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR", *props);
|       |                                                                                         ^~~~~~~~~~~~~~~~~~
|       |                                                                                         VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5149:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR'?
|  5149 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5150:13: error: 'VkPhysicalDeviceGlobalPriorityQueryFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  5150 |             VkPhysicalDeviceGlobalPriorityQueryFeatures* props = (VkPhysicalDeviceGlobalPriorityQueryFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5150:58: error: 'props' was not declared in this scope
|  5150 |             VkPhysicalDeviceGlobalPriorityQueryFeatures* props = (VkPhysicalDeviceGlobalPriorityQueryFeatures*)structure;
|       |                                                          ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5150:111: error: expected primary-expression before ')' token
|  5150 |             VkPhysicalDeviceGlobalPriorityQueryFeatures* props = (VkPhysicalDeviceGlobalPriorityQueryFeatures*)structure;
|       |                                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5151:83: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5151 |             DumpVkPhysicalDeviceGlobalPriorityQueryFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceGlobalPriorityQueryFeatures":"VkPhysicalDeviceGlobalPriorityQueryFeaturesEXT", *props);
|       |                                                                                   ^~~~~~~~~~~~~~~~~~
|       |                                                                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5159:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT'?
|  5159 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5160:13: error: 'VkPhysicalDeviceHostImageCopyFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  5160 |             VkPhysicalDeviceHostImageCopyFeatures* props = (VkPhysicalDeviceHostImageCopyFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5160:52: error: 'props' was not declared in this scope
|  5160 |             VkPhysicalDeviceHostImageCopyFeatures* props = (VkPhysicalDeviceHostImageCopyFeatures*)structure;
|       |                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5160:99: error: expected primary-expression before ')' token
|  5160 |             VkPhysicalDeviceHostImageCopyFeatures* props = (VkPhysicalDeviceHostImageCopyFeatures*)structure;
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5161:77: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5161 |             DumpVkPhysicalDeviceHostImageCopyFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceHostImageCopyFeatures":"VkPhysicalDeviceHostImageCopyFeaturesEXT", *props);
|       |                                                                             ^~~~~~~~~~~~~~~~~~
|       |                                                                             VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5204:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR'?
|  5204 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5205:13: error: 'VkPhysicalDeviceIndexTypeUint8Features' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  5205 |             VkPhysicalDeviceIndexTypeUint8Features* props = (VkPhysicalDeviceIndexTypeUint8Features*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5205:53: error: 'props' was not declared in this scope
|  5205 |             VkPhysicalDeviceIndexTypeUint8Features* props = (VkPhysicalDeviceIndexTypeUint8Features*)structure;
|       |                                                     ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5205:101: error: expected primary-expression before ')' token
|  5205 |             VkPhysicalDeviceIndexTypeUint8Features* props = (VkPhysicalDeviceIndexTypeUint8Features*)structure;
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5206:78: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5206 |             DumpVkPhysicalDeviceIndexTypeUint8Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceIndexTypeUint8Features":"VkPhysicalDeviceIndexTypeUint8FeaturesKHR", *props);
|       |                                                                              ^~~~~~~~~~~~~~~~~~
|       |                                                                              VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5224:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR'?
|  5224 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5225:13: error: 'VkPhysicalDeviceLineRasterizationFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  5225 |             VkPhysicalDeviceLineRasterizationFeatures* props = (VkPhysicalDeviceLineRasterizationFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5225:56: error: 'props' was not declared in this scope
|  5225 |             VkPhysicalDeviceLineRasterizationFeatures* props = (VkPhysicalDeviceLineRasterizationFeatures*)structure;
|       |                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5225:107: error: expected primary-expression before ')' token
|  5225 |             VkPhysicalDeviceLineRasterizationFeatures* props = (VkPhysicalDeviceLineRasterizationFeatures*)structure;
|       |                                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5226:81: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5226 |             DumpVkPhysicalDeviceLineRasterizationFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceLineRasterizationFeatures":"VkPhysicalDeviceLineRasterizationFeaturesKHR", *props);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~
|       |                                                                                 VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5234:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  5234 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5235:13: error: 'VkPhysicalDeviceMaintenance5Features' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  5235 |             VkPhysicalDeviceMaintenance5Features* props = (VkPhysicalDeviceMaintenance5Features*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5235:51: error: 'props' was not declared in this scope
|  5235 |             VkPhysicalDeviceMaintenance5Features* props = (VkPhysicalDeviceMaintenance5Features*)structure;
|       |                                                   ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5235:97: error: expected primary-expression before ')' token
|  5235 |             VkPhysicalDeviceMaintenance5Features* props = (VkPhysicalDeviceMaintenance5Features*)structure;
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5236:76: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5236 |             DumpVkPhysicalDeviceMaintenance5Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance5Features":"VkPhysicalDeviceMaintenance5FeaturesKHR", *props);
|       |                                                                            ^~~~~~~~~~~~~~~~~~
|       |                                                                            VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5239:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  5239 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5240:13: error: 'VkPhysicalDeviceMaintenance6Features' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  5240 |             VkPhysicalDeviceMaintenance6Features* props = (VkPhysicalDeviceMaintenance6Features*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5240:51: error: 'props' was not declared in this scope
|  5240 |             VkPhysicalDeviceMaintenance6Features* props = (VkPhysicalDeviceMaintenance6Features*)structure;
|       |                                                   ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5240:97: error: expected primary-expression before ')' token
|  5240 |             VkPhysicalDeviceMaintenance6Features* props = (VkPhysicalDeviceMaintenance6Features*)structure;
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5241:76: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5241 |             DumpVkPhysicalDeviceMaintenance6Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance6Features":"VkPhysicalDeviceMaintenance6FeaturesKHR", *props);
|       |                                                                            ^~~~~~~~~~~~~~~~~~
|       |                                                                            VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5334:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT'?
|  5334 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5335:13: error: 'VkPhysicalDevicePipelineProtectedAccessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  5335 |             VkPhysicalDevicePipelineProtectedAccessFeatures* props = (VkPhysicalDevicePipelineProtectedAccessFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5335:62: error: 'props' was not declared in this scope
|  5335 |             VkPhysicalDevicePipelineProtectedAccessFeatures* props = (VkPhysicalDevicePipelineProtectedAccessFeatures*)structure;
|       |                                                              ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5335:119: error: expected primary-expression before ')' token
|  5335 |             VkPhysicalDevicePipelineProtectedAccessFeatures* props = (VkPhysicalDevicePipelineProtectedAccessFeatures*)structure;
|       |                                                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5336:87: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5336 |             DumpVkPhysicalDevicePipelineProtectedAccessFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineProtectedAccessFeatures":"VkPhysicalDevicePipelineProtectedAccessFeaturesEXT", *props);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~
|       |                                                                                       VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5339:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT'?
|  5339 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5340:13: error: 'VkPhysicalDevicePipelineRobustnessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  5340 |             VkPhysicalDevicePipelineRobustnessFeatures* props = (VkPhysicalDevicePipelineRobustnessFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5340:57: error: 'props' was not declared in this scope
|  5340 |             VkPhysicalDevicePipelineRobustnessFeatures* props = (VkPhysicalDevicePipelineRobustnessFeatures*)structure;
|       |                                                         ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5340:109: error: expected primary-expression before ')' token
|  5340 |             VkPhysicalDevicePipelineRobustnessFeatures* props = (VkPhysicalDevicePipelineRobustnessFeatures*)structure;
|       |                                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5341:82: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5341 |             DumpVkPhysicalDevicePipelineRobustnessFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineRobustnessFeatures":"VkPhysicalDevicePipelineRobustnessFeaturesEXT", *props);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5356:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  5356 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5357:13: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT'?
|  5357 |             VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT* props = (VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5357:68: error: 'props' was not declared in this scope
|  5357 |             VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT* props = (VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT*)structure;
|       |                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5357:131: error: expected primary-expression before ')' token
|  5357 |             VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT* props = (VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT*)structure;
|       |                                                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5471:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR'?
|  5471 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5472:13: error: 'VkPhysicalDeviceShaderExpectAssumeFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  5472 |             VkPhysicalDeviceShaderExpectAssumeFeatures* props = (VkPhysicalDeviceShaderExpectAssumeFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5472:57: error: 'props' was not declared in this scope
|  5472 |             VkPhysicalDeviceShaderExpectAssumeFeatures* props = (VkPhysicalDeviceShaderExpectAssumeFeatures*)structure;
|       |                                                         ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5472:109: error: expected primary-expression before ')' token
|  5472 |             VkPhysicalDeviceShaderExpectAssumeFeatures* props = (VkPhysicalDeviceShaderExpectAssumeFeatures*)structure;
|       |                                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5473:82: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5473 |             DumpVkPhysicalDeviceShaderExpectAssumeFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderExpectAssumeFeatures":"VkPhysicalDeviceShaderExpectAssumeFeaturesKHR", *props);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5481:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR'?
|  5481 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5482:13: error: 'VkPhysicalDeviceShaderFloatControls2Features' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  5482 |             VkPhysicalDeviceShaderFloatControls2Features* props = (VkPhysicalDeviceShaderFloatControls2Features*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5482:59: error: 'props' was not declared in this scope
|  5482 |             VkPhysicalDeviceShaderFloatControls2Features* props = (VkPhysicalDeviceShaderFloatControls2Features*)structure;
|       |                                                           ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5482:113: error: expected primary-expression before ')' token
|  5482 |             VkPhysicalDeviceShaderFloatControls2Features* props = (VkPhysicalDeviceShaderFloatControls2Features*)structure;
|       |                                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5483:84: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5483 |             DumpVkPhysicalDeviceShaderFloatControls2Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderFloatControls2Features":"VkPhysicalDeviceShaderFloatControls2FeaturesKHR", *props);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~
|       |                                                                                    VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5531:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR'?
|  5531 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5532:13: error: 'VkPhysicalDeviceShaderSubgroupRotateFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  5532 |             VkPhysicalDeviceShaderSubgroupRotateFeatures* props = (VkPhysicalDeviceShaderSubgroupRotateFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5532:59: error: 'props' was not declared in this scope
|  5532 |             VkPhysicalDeviceShaderSubgroupRotateFeatures* props = (VkPhysicalDeviceShaderSubgroupRotateFeatures*)structure;
|       |                                                           ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5532:113: error: expected primary-expression before ')' token
|  5532 |             VkPhysicalDeviceShaderSubgroupRotateFeatures* props = (VkPhysicalDeviceShaderSubgroupRotateFeatures*)structure;
|       |                                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5533:84: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5533 |             DumpVkPhysicalDeviceShaderSubgroupRotateFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderSubgroupRotateFeatures":"VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR", *props);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~
|       |                                                                                    VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5601:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR'?
|  5601 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5602:13: error: 'VkPhysicalDeviceVertexAttributeDivisorFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  5602 |             VkPhysicalDeviceVertexAttributeDivisorFeatures* props = (VkPhysicalDeviceVertexAttributeDivisorFeatures*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5602:61: error: 'props' was not declared in this scope
|  5602 |             VkPhysicalDeviceVertexAttributeDivisorFeatures* props = (VkPhysicalDeviceVertexAttributeDivisorFeatures*)structure;
|       |                                                             ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5602:117: error: expected primary-expression before ')' token
|  5602 |             VkPhysicalDeviceVertexAttributeDivisorFeatures* props = (VkPhysicalDeviceVertexAttributeDivisorFeatures*)structure;
|       |                                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5603:86: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5603 |             DumpVkPhysicalDeviceVertexAttributeDivisorFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceVertexAttributeDivisorFeatures":"VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR", *props);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~
|       |                                                                                      VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5606:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  5606 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5607:13: error: 'VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT'?
|  5607 |             VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT* props = (VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5607:67: error: 'props' was not declared in this scope
|  5607 |             VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT* props = (VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT*)structure;
|       |                                                                   ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5607:129: error: expected primary-expression before ')' token
|  5607 |             VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT* props = (VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT*)structure;
|       |                                                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5616:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  5616 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5617:13: error: 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  5617 |             VkPhysicalDeviceVideoEncodeAV1FeaturesKHR* props = (VkPhysicalDeviceVideoEncodeAV1FeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5617:56: error: 'props' was not declared in this scope
|  5617 |             VkPhysicalDeviceVideoEncodeAV1FeaturesKHR* props = (VkPhysicalDeviceVideoEncodeAV1FeaturesKHR*)structure;
|       |                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5617:107: error: expected primary-expression before ')' token
|  5617 |             VkPhysicalDeviceVideoEncodeAV1FeaturesKHR* props = (VkPhysicalDeviceVideoEncodeAV1FeaturesKHR*)structure;
|       |                                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5621:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR'?
|  5621 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5622:13: error: 'VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR'?
|  5622 |             VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR* props = (VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5622:68: error: 'props' was not declared in this scope
|  5622 |             VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR* props = (VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR*)structure;
|       |                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5622:131: error: expected primary-expression before ')' token
|  5622 |             VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR* props = (VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR*)structure;
|       |                                                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5646:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES'?
|  5646 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5647:13: error: 'VkPhysicalDeviceVulkan14Features' was not declared in this scope; did you mean 'VkPhysicalDeviceVulkan13Features'?
|  5647 |             VkPhysicalDeviceVulkan14Features* props = (VkPhysicalDeviceVulkan14Features*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceVulkan13Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5647:47: error: 'props' was not declared in this scope
|  5647 |             VkPhysicalDeviceVulkan14Features* props = (VkPhysicalDeviceVulkan14Features*)structure;
|       |                                               ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5647:89: error: expected primary-expression before ')' token
|  5647 |             VkPhysicalDeviceVulkan14Features* props = (VkPhysicalDeviceVulkan14Features*)structure;
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5817:5: error: 'VkQueueFamilyGlobalPriorityProperties' does not name a type; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  5817 |     VkQueueFamilyGlobalPriorityProperties QueueFamilyGlobalPriorityProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void queue_properties2_chain::initialize_chain(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5821:9: error: 'QueueFamilyGlobalPriorityProperties' was not declared in this scope; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  5821 |         QueueFamilyGlobalPriorityProperties.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5821:53: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR'?
|  5821 |         QueueFamilyGlobalPriorityProperties.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5827:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5827 |             && (gpu.api_version < VK_API_VERSION_1_4 ))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_queue_properties2(Printer&, AppGpu&, void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5852:33: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR'?
|  5852 |         if (structure->sType == VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5853:13: error: 'VkQueueFamilyGlobalPriorityProperties' was not declared in this scope; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  5853 |             VkQueueFamilyGlobalPriorityProperties* props = (VkQueueFamilyGlobalPriorityProperties*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5853:52: error: 'props' was not declared in this scope
|  5853 |             VkQueueFamilyGlobalPriorityProperties* props = (VkQueueFamilyGlobalPriorityProperties*)structure;
|       |                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5853:99: error: expected primary-expression before ')' token
|  5853 |             VkQueueFamilyGlobalPriorityProperties* props = (VkQueueFamilyGlobalPriorityProperties*)structure;
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5854:77: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5854 |             DumpVkQueueFamilyGlobalPriorityProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkQueueFamilyGlobalPriorityProperties":"VkQueueFamilyGlobalPriorityPropertiesEXT", *props);
|       |                                                                             ^~~~~~~~~~~~~~~~~~
|       |                                                                             VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/git/vulkaninfo/generated/vulkaninfo.hpp:5933:17: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5933 |     FormatRange{VK_API_VERSION_1_4, nullptr, static_cast<VkFormat>(1000470000), static_cast<VkFormat>(1000470001)},
|       |                 ^~~~~~~~~~~~~~~~~~
|       |                 VK_API_VERSION_1_0
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/temp/run.do_compile.2297985:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/temp/run.do_compile.2297985, line 153
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/temp/run.do_compile.2297985, line 147
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/temp/run.do_compile.2297985, line 142
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/temp/run.do_compile.2297985, line 166
NOTE: recipe vulkan-tools-1.4.304.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1604 tasks of which 1593 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115093743.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250115093743.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/temp/log.do_compile.2297985
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.4.304.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/temp/run.do_compile.2297985' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.304.0/temp/log.do_compile.2297985
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.304.0.bb:do_compile) failed with exit code '1'

--===============6332638254408511953==--

