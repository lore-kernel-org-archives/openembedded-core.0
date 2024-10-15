Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA6DD1F9C2
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.11883.1728994571022720667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DRIr30xC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=wSBiWKci;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010192901b7026-e6690cff-0f8d-40f3-afec-a26c2e7e2816-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=d8R+xT2LEXs3yavAo65101/bfU04iu96F5rdKxrrgWQ=;
	b=DRIr30xCqhdF7iKrHnxwpKefy8fmxTR4QpBo/qkhWmAwhg1+PO/6aepdpt0ZANTY
	BswRB2z9RWGa9KtDfHhZ0AF1YubhdQfymFqVemqKqHoDxbILrAg2BkE/QkQXoXRcwYS
	RVyEl1JFngQW/jQ5By5Hxbigut6yaDXQMXh91yqU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994570;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=d8R+xT2LEXs3yavAo65101/bfU04iu96F5rdKxrrgWQ=;
	b=wSBiWKciJ//jaGgEGO/OJvyRUKGw8J9bgsLc89UXAfiL48qhJhh/YQCf7rdNiBkr
	pS7bR7qd/EyP4hNWXuzrYdKg+Ff5onrTkVg5Z5SjEgCD8f2Nx0AdOvk6g7NjU5Juusl
	DBwKUyyrujMQPO5Hr/rtMGAi1HH1i3YbMx3nrTGg=
Content-Type: multipart/mixed; boundary="===============4350670356326709162=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.296.0 FAILED
Message-ID: <01010192901b7026-e6690cff-0f8d-40f3-afec-a26c2e7e2816-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205887

--===============4350670356326709162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.3.296.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.290.0-1.3.296.0.patch
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
From 8aa0871ab71180ef5557bbe16ba621b468e8f57b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 11:21:23 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.290.0 -> 1.3.296.0

---
 .../{vulkan-tools_1.3.290.0.bb => vulkan-tools_1.3.296.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.290.0.bb => vulkan-tools_1.3.296.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
index 9ef7d4daea..5f83f4f246 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "53a6ba7c235cbe0b0f3e85e3de6d9070bcfec710"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.296;protocol=https"
+SRCREV = "74dd90abd69f813220b572e1d89c17bc7784972d"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============4350670356326709162==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.290.0-1.3.296.0.patch"

RnJvbSA4YWEwODcxYWI3MTE4MGVmNTU1N2JiZTE2YmE2MjFiNDY4ZThmNTdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTE6MjE6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjI5MC4wIC0+IDEuMy4yOTYuMAoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjMuMjkwLjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yOTYuMC5iYn0gIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29sc18xLjMuMjkw
LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuMy4yOTYuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjkwLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjk2LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS4zLjI5MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjk2LjAuYmIKaW5kZXggOWVmN2Q0ZGFlYS4uNWY4
M2Y0ZjI0NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
dG9vbHNfMS4zLjI5MC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXRvb2xzXzEuMy4yOTYuMC5iYgpAQCAtNiw4ICs2LDggQEAgU0VDVElPTiA9ICJsaWJzIgog
CiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMiCi1TUkNSRVYgPSAiNTNhNmJhN2MyMzVjYmUwYjBmM2U4NWUzZGU2
ZDkwNzBiY2ZlYzcxMCIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAv
VnVsa2FuLVRvb2xzLmdpdDticmFuY2g9dnVsa2FuLXNkay0xLjMuMjk2O3Byb3RvY29sPWh0dHBz
IgorU1JDUkVWID0gIjc0ZGQ5MGFiZDY5ZjgxMzIyMGI1NzJlMWQ4OWMxN2JjNzc4NDk3MmQiCiAK
IFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMQoK

--===============4350670356326709162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (918 cached, 1 parsed). 1875 targets, 41 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:3fe9aa8dc7eeacff6b7a6e760f61fec78ccb23ec"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 214 Local 205 Mirrors 0 Missed 9 Current 355 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 432 of 569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 434 of 569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 569 of 569 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1584 of 1604 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 1604 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_unpack)
NOTE: Running task 1586 of 1604 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 1604 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_patch)
NOTE: Running task 1588 of 1604 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_patch: Succeeded
NOTE: Running task 1590 of 1604 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1592 of 1604 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_configure: Succeeded
NOTE: Running task 1593 of 1604 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/4] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot -DGIT_BRANCH_NAME=\"vulkan-sdk-1.3.296\" -DGIT_TAG_INFO=\"vulkan-sdk-1.3.296.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokyb
 uild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git=/usr/src/debug/vulkan-tools/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-t
 ools/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot -DGIT_BRANCH_NAME=\"vulkan-sdk-1.3.296\" -DGIT_TAG_INFO=\"vulkan-sdk-1.3.296.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/y
 octo-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git=/usr/src/debug/vulkan-tools/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1
 .3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/mock_icd.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/mock_icd.h:40,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/mock_icd.cpp:17:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3573:31: error: 'VkPhysicalDevicePipelineBinaryFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  3573 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineBinaryFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3573:72: error: template argument 1 is invalid
|  3573 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineBinaryFeaturesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3577:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  3577 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3577:94: error: template argument 1 is invalid
|  3577 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3582:31: error: 'VkPhysicalDevicePipelineBinaryPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphorePropertiesKHR'?
|  3582 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineBinaryPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceTimelineSemaphorePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3582:74: error: template argument 1 is invalid
|  3582 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineBinaryPropertiesKHR> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3586:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  3586 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3586:96: error: template argument 1 is invalid
|  3586 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3591:31: error: 'VkDevicePipelineBinaryInternalCacheControlKHR' was not declared in this scope
|  3591 | template <> struct LvlTypeMap<VkDevicePipelineBinaryInternalCacheControlKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3591:76: error: template argument 1 is invalid
|  3591 | template <> struct LvlTypeMap<VkDevicePipelineBinaryInternalCacheControlKHR> {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3595:32: error: 'VK_STRUCTURE_TYPE_DEVICE_PIPELINE_BINARY_INTERNAL_CACHE_CONTROL_KHR' was not declared in this scope
|  3595 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PIPELINE_BINARY_INTERNAL_CACHE_CONTROL_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3595:99: error: template argument 1 is invalid
|  3595 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_PIPELINE_BINARY_INTERNAL_CACHE_CONTROL_KHR> {
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3600:31: error: 'VkPipelineBinaryKeyKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|  3600 | template <> struct LvlTypeMap<VkPipelineBinaryKeyKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3600:53: error: template argument 1 is invalid
|  3600 | template <> struct LvlTypeMap<VkPipelineBinaryKeyKHR> {
|       |                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3604:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_BINARY_KEY_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR'?
|  3604 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_KEY_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3604:73: error: template argument 1 is invalid
|  3604 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_KEY_KHR> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3609:31: error: 'VkPipelineCreateInfoKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|  3609 | template <> struct LvlTypeMap<VkPipelineCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3609:54: error: template argument 1 is invalid
|  3609 | template <> struct LvlTypeMap<VkPipelineCreateInfoKHR> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3613:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR'?
|  3613 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3613:74: error: template argument 1 is invalid
|  3613 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_CREATE_INFO_KHR> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3618:31: error: 'VkPipelineBinaryCreateInfoKHR' was not declared in this scope; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|  3618 | template <> struct LvlTypeMap<VkPipelineBinaryCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3618:60: error: template argument 1 is invalid
|  3618 | template <> struct LvlTypeMap<VkPipelineBinaryCreateInfoKHR> {
|       |                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3622:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_BINARY_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR'?
|  3622 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3622:81: error: template argument 1 is invalid
|  3622 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_CREATE_INFO_KHR> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3627:31: error: 'VkPipelineBinaryInfoKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|  3627 | template <> struct LvlTypeMap<VkPipelineBinaryInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3627:54: error: template argument 1 is invalid
|  3627 | template <> struct LvlTypeMap<VkPipelineBinaryInfoKHR> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3631:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_BINARY_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR'?
|  3631 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3631:74: error: template argument 1 is invalid
|  3631 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_INFO_KHR> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3636:31: error: 'VkReleaseCapturedPipelineDataInfoKHR' was not declared in this scope
|  3636 | template <> struct LvlTypeMap<VkReleaseCapturedPipelineDataInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3636:67: error: template argument 1 is invalid
|  3636 | template <> struct LvlTypeMap<VkReleaseCapturedPipelineDataInfoKHR> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3640:32: error: 'VK_STRUCTURE_TYPE_RELEASE_CAPTURED_PIPELINE_DATA_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_KHR'?
|  3640 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RELEASE_CAPTURED_PIPELINE_DATA_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3640:89: error: template argument 1 is invalid
|  3640 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RELEASE_CAPTURED_PIPELINE_DATA_INFO_KHR> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3645:31: error: 'VkPipelineBinaryDataInfoKHR' was not declared in this scope; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|  3645 | template <> struct LvlTypeMap<VkPipelineBinaryDataInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3645:58: error: template argument 1 is invalid
|  3645 | template <> struct LvlTypeMap<VkPipelineBinaryDataInfoKHR> {
|       |                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3649:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_BINARY_DATA_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR'?
|  3649 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_DATA_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3649:79: error: template argument 1 is invalid
|  3649 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_DATA_INFO_KHR> {
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3654:31: error: 'VkPipelineBinaryHandlesInfoKHR' was not declared in this scope; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|  3654 | template <> struct LvlTypeMap<VkPipelineBinaryHandlesInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3654:61: error: template argument 1 is invalid
|  3654 | template <> struct LvlTypeMap<VkPipelineBinaryHandlesInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3658:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_BINARY_HANDLES_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR'?
|  3658 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_HANDLES_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_LIBRARY_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3658:82: error: template argument 1 is invalid
|  3658 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_BINARY_HANDLES_INFO_KHR> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3690:31: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  3690 | template <> struct LvlTypeMap<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3690:82: error: template argument 1 is invalid
|  3690 | template <> struct LvlTypeMap<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3694:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  3694 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3694:105: error: template argument 1 is invalid
|  3694 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR> {
|       |                                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3699:31: error: 'VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  3699 | template <> struct LvlTypeMap<VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3699:84: error: template argument 1 is invalid
|  3699 | template <> struct LvlTypeMap<VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3703:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  3703 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:3703:107: error: template argument 1 is invalid
|  3703 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR> {
|       |                                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7734:31: error: 'VkPhysicalDeviceAntiLagFeaturesAMD' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|  7734 | template <> struct LvlTypeMap<VkPhysicalDeviceAntiLagFeaturesAMD> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMultiDrawFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7734:65: error: template argument 1 is invalid
|  7734 | template <> struct LvlTypeMap<VkPhysicalDeviceAntiLagFeaturesAMD> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7738:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT'?
|  7738 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7738:87: error: template argument 1 is invalid
|  7738 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7743:31: error: 'VkAntiLagPresentationInfoAMD' was not declared in this scope
|  7743 | template <> struct LvlTypeMap<VkAntiLagPresentationInfoAMD> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7743:59: error: template argument 1 is invalid
|  7743 | template <> struct LvlTypeMap<VkAntiLagPresentationInfoAMD> {
|       |                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7747:32: error: 'VK_STRUCTURE_TYPE_ANTI_LAG_PRESENTATION_INFO_AMD' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEPTH_BIAS_REPRESENTATION_INFO_EXT'?
|  7747 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ANTI_LAG_PRESENTATION_INFO_AMD> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEPTH_BIAS_REPRESENTATION_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7747:80: error: template argument 1 is invalid
|  7747 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ANTI_LAG_PRESENTATION_INFO_AMD> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7752:31: error: 'VkAntiLagDataAMD' was not declared in this scope
|  7752 | template <> struct LvlTypeMap<VkAntiLagDataAMD> {
|       |                               ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7752:47: error: template argument 1 is invalid
|  7752 | template <> struct LvlTypeMap<VkAntiLagDataAMD> {
|       |                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7756:32: error: 'VK_STRUCTURE_TYPE_ANTI_LAG_DATA_AMD' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_HDR_METADATA_EXT'?
|  7756 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ANTI_LAG_DATA_AMD> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_HDR_METADATA_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:7756:67: error: template argument 1 is invalid
|  7756 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ANTI_LAG_DATA_AMD> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8212:31: error: 'VkPhysicalDeviceCommandBufferInheritanceFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCudaKernelLaunchFeaturesNV'?
|  8212 | template <> struct LvlTypeMap<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCudaKernelLaunchFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8212:81: error: template argument 1 is invalid
|  8212 | template <> struct LvlTypeMap<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8216:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMMAND_BUFFER_INHERITANCE_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  8216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMMAND_BUFFER_INHERITANCE_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8216:104: error: template argument 1 is invalid
|  8216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMMAND_BUFFER_INHERITANCE_FEATURES_NV> {
|       |                                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8248:31: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  8248 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8248:81: error: template argument 1 is invalid
|  8248 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8252:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV'?
|  8252 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8252:104: error: template argument 1 is invalid
|  8252 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT> {
|       |                                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8257:31: error: 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV'?
|  8257 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8257:83: error: template argument 1 is invalid
|  8257 | template <> struct LvlTypeMap<VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8261:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV'?
|  8261 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8261:106: error: template argument 1 is invalid
|  8261 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT> {
|       |                                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8266:31: error: 'VkGeneratedCommandsMemoryRequirementsInfoEXT' was not declared in this scope; did you mean 'VkGeneratedCommandsMemoryRequirementsInfoNV'?
|  8266 | template <> struct LvlTypeMap<VkGeneratedCommandsMemoryRequirementsInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkGeneratedCommandsMemoryRequirementsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8266:75: error: template argument 1 is invalid
|  8266 | template <> struct LvlTypeMap<VkGeneratedCommandsMemoryRequirementsInfoEXT> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8270:32: error: 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV'?
|  8270 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8270:97: error: template argument 1 is invalid
|  8270 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_EXT> {
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8275:31: error: 'VkIndirectExecutionSetPipelineInfoEXT' was not declared in this scope
|  8275 | template <> struct LvlTypeMap<VkIndirectExecutionSetPipelineInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8275:68: error: template argument 1 is invalid
|  8275 | template <> struct LvlTypeMap<VkIndirectExecutionSetPipelineInfoEXT> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8279:32: error: 'VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_PIPELINE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT'?
|  8279 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_PIPELINE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8279:90: error: template argument 1 is invalid
|  8279 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_PIPELINE_INFO_EXT> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8284:31: error: 'VkIndirectExecutionSetShaderLayoutInfoEXT' was not declared in this scope
|  8284 | template <> struct LvlTypeMap<VkIndirectExecutionSetShaderLayoutInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8284:72: error: template argument 1 is invalid
|  8284 | template <> struct LvlTypeMap<VkIndirectExecutionSetShaderLayoutInfoEXT> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8288:32: error: 'VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_SHADER_LAYOUT_INFO_EXT' was not declared in this scope
|  8288 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_SHADER_LAYOUT_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8288:95: error: template argument 1 is invalid
|  8288 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_SHADER_LAYOUT_INFO_EXT> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8293:31: error: 'VkIndirectExecutionSetShaderInfoEXT' was not declared in this scope
|  8293 | template <> struct LvlTypeMap<VkIndirectExecutionSetShaderInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8293:66: error: template argument 1 is invalid
|  8293 | template <> struct LvlTypeMap<VkIndirectExecutionSetShaderInfoEXT> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8297:32: error: 'VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_SHADER_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMPORT_METAL_IO_SURFACE_INFO_EXT'?
|  8297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_SHADER_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMPORT_METAL_IO_SURFACE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8297:88: error: template argument 1 is invalid
|  8297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_SHADER_INFO_EXT> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8302:31: error: 'VkIndirectExecutionSetCreateInfoEXT' was not declared in this scope
|  8302 | template <> struct LvlTypeMap<VkIndirectExecutionSetCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8302:66: error: template argument 1 is invalid
|  8302 | template <> struct LvlTypeMap<VkIndirectExecutionSetCreateInfoEXT> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8306:32: error: 'VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT'?
|  8306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DIRECTFB_SURFACE_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8306:88: error: template argument 1 is invalid
|  8306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_EXECUTION_SET_CREATE_INFO_EXT> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8311:31: error: 'VkGeneratedCommandsInfoEXT' was not declared in this scope; did you mean 'VkGeneratedCommandsInfoNV'?
|  8311 | template <> struct LvlTypeMap<VkGeneratedCommandsInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8311:57: error: template argument 1 is invalid
|  8311 | template <> struct LvlTypeMap<VkGeneratedCommandsInfoEXT> {
|       |                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8315:32: error: 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV'?
|  8315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8315:77: error: template argument 1 is invalid
|  8315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_EXT> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8320:31: error: 'VkWriteIndirectExecutionSetPipelineEXT' was not declared in this scope
|  8320 | template <> struct LvlTypeMap<VkWriteIndirectExecutionSetPipelineEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8320:69: error: template argument 1 is invalid
|  8320 | template <> struct LvlTypeMap<VkWriteIndirectExecutionSetPipelineEXT> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8324:32: error: 'VK_STRUCTURE_TYPE_WRITE_INDIRECT_EXECUTION_SET_PIPELINE_EXT' was not declared in this scope
|  8324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_INDIRECT_EXECUTION_SET_PIPELINE_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8324:91: error: template argument 1 is invalid
|  8324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_INDIRECT_EXECUTION_SET_PIPELINE_EXT> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8329:31: error: 'VkIndirectCommandsLayoutTokenEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutTokenNV'?
|  8329 | template <> struct LvlTypeMap<VkIndirectCommandsLayoutTokenEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkIndirectCommandsLayoutTokenNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8329:63: error: template argument 1 is invalid
|  8329 | template <> struct LvlTypeMap<VkIndirectCommandsLayoutTokenEXT> {
|       |                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8333:32: error: 'VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_NV'?
|  8333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8333:84: error: template argument 1 is invalid
|  8333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_TOKEN_EXT> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8338:31: error: 'VkIndirectCommandsLayoutCreateInfoEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutCreateInfoNV'?
|  8338 | template <> struct LvlTypeMap<VkIndirectCommandsLayoutCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkIndirectCommandsLayoutCreateInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8338:68: error: template argument 1 is invalid
|  8338 | template <> struct LvlTypeMap<VkIndirectCommandsLayoutCreateInfoEXT> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8342:32: error: 'VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV'?
|  8342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8342:90: error: template argument 1 is invalid
|  8342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_EXT> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8347:31: error: 'VkGeneratedCommandsPipelineInfoEXT' was not declared in this scope; did you mean 'VkGeneratedCommandsInfoNV'?
|  8347 | template <> struct LvlTypeMap<VkGeneratedCommandsPipelineInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8347:65: error: template argument 1 is invalid
|  8347 | template <> struct LvlTypeMap<VkGeneratedCommandsPipelineInfoEXT> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8351:32: error: 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_PIPELINE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV'?
|  8351 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GENERATED_COMMANDS_PIPELINE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8351:86: error: template argument 1 is invalid
|  8351 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GENERATED_COMMANDS_PIPELINE_INFO_EXT> {
|       |                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8356:31: error: 'VkGeneratedCommandsShaderInfoEXT' was not declared in this scope; did you mean 'VkGeneratedCommandsInfoNV'?
|  8356 | template <> struct LvlTypeMap<VkGeneratedCommandsShaderInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8356:63: error: template argument 1 is invalid
|  8356 | template <> struct LvlTypeMap<VkGeneratedCommandsShaderInfoEXT> {
|       |                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8360:32: error: 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_SHADER_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV'?
|  8360 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GENERATED_COMMANDS_SHADER_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8360:84: error: template argument 1 is invalid
|  8360 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_GENERATED_COMMANDS_SHADER_INFO_EXT> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8365:31: error: 'VkWriteIndirectExecutionSetShaderEXT' was not declared in this scope
|  8365 | template <> struct LvlTypeMap<VkWriteIndirectExecutionSetShaderEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8365:67: error: template argument 1 is invalid
|  8365 | template <> struct LvlTypeMap<VkWriteIndirectExecutionSetShaderEXT> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8369:32: error: 'VK_STRUCTURE_TYPE_WRITE_INDIRECT_EXECUTION_SET_SHADER_EXT' was not declared in this scope
|  8369 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_INDIRECT_EXECUTION_SET_SHADER_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8369:89: error: template argument 1 is invalid
|  8369 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_INDIRECT_EXECUTION_SET_SHADER_EXT> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8401:31: error: 'VkPhysicalDeviceDepthClampControlFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  8401 | template <> struct LvlTypeMap<VkPhysicalDeviceDepthClampControlFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8401:75: error: template argument 1 is invalid
|  8401 | template <> struct LvlTypeMap<VkPhysicalDeviceDepthClampControlFeaturesEXT> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8405:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT'?
|  8405 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8405:98: error: template argument 1 is invalid
|  8405 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8410:31: error: 'VkPipelineViewportDepthClampControlCreateInfoEXT' was not declared in this scope; did you mean 'VkPipelineViewportDepthClipControlCreateInfoEXT'?
|  8410 | template <> struct LvlTypeMap<VkPipelineViewportDepthClampControlCreateInfoEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineViewportDepthClipControlCreateInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8410:79: error: template argument 1 is invalid
|  8410 | template <> struct LvlTypeMap<VkPipelineViewportDepthClampControlCreateInfoEXT> {
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8414:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLAMP_CONTROL_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT'?
|  8414 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLAMP_CONTROL_CREATE_INFO_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/vk_typemap_helper.h:8414:103: error: template argument 1 is invalid
|  8414 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLAMP_CONTROL_CREATE_INFO_EXT> {
|       |                                                                                                       ^
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:25,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/mock_icd.cpp:18:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:2518:11: error: 'VkPipelineBinaryCreateInfoKHR' does not name a type; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|  2518 |     const VkPipelineBinaryCreateInfoKHR*        pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:2520:5: error: 'VkPipelineBinaryHandlesInfoKHR' has not been declared
|  2520 |     VkPipelineBinaryHandlesInfoKHR*             pBinaries);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:2524:5: error: 'VkPipelineBinaryKHR' has not been declared
|  2524 |     VkPipelineBinaryKHR                         pipelineBinary,
|       |     ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:2529:11: error: 'VkPipelineCreateInfoKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|  2529 |     const VkPipelineCreateInfoKHR*              pPipelineCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:2530:5: error: 'VkPipelineBinaryKeyKHR' has not been declared
|  2530 |     VkPipelineBinaryKeyKHR*                     pPipelineKey);
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:2534:11: error: 'VkPipelineBinaryDataInfoKHR' does not name a type; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|  2534 |     const VkPipelineBinaryDataInfoKHR*          pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:2535:5: error: 'VkPipelineBinaryKeyKHR' has not been declared
|  2535 |     VkPipelineBinaryKeyKHR*                     pPipelineBinaryKey,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:2541:11: error: 'VkReleaseCapturedPipelineDataInfoKHR' does not name a type
|  2541 |     const VkReleaseCapturedPipelineDataInfoKHR* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4307:11: error: 'VkAntiLagDataAMD' does not name a type
|  4307 |     const VkAntiLagDataAMD*                     pData);
|       |           ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4336:5: error: 'VkDepthClampModeEXT' has not been declared
|  4336 |     VkDepthClampModeEXT                         depthClampMode,
|       |     ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4337:11: error: 'VkDepthClampRangeEXT' does not name a type
|  4337 |     const VkDepthClampRangeEXT*                 pDepthClampRange);
|       |           ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4415:11: error: 'VkGeneratedCommandsMemoryRequirementsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsMemoryRequirementsInfoNV'?
|  4415 |     const VkGeneratedCommandsMemoryRequirementsInfoEXT* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGeneratedCommandsMemoryRequirementsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4420:11: error: 'VkGeneratedCommandsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsInfoNV'?
|  4420 |     const VkGeneratedCommandsInfoEXT*           pGeneratedCommandsInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4426:11: error: 'VkGeneratedCommandsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsInfoNV'?
|  4426 |     const VkGeneratedCommandsInfoEXT*           pGeneratedCommandsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4430:11: error: 'VkIndirectCommandsLayoutCreateInfoEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutCreateInfoNV'?
|  4430 |     const VkIndirectCommandsLayoutCreateInfoEXT* pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkIndirectCommandsLayoutCreateInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4432:5: error: 'VkIndirectCommandsLayoutEXT' has not been declared
|  4432 |     VkIndirectCommandsLayoutEXT*                pIndirectCommandsLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4436:5: error: 'VkIndirectCommandsLayoutEXT' has not been declared
|  4436 |     VkIndirectCommandsLayoutEXT                 indirectCommandsLayout,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4441:11: error: 'VkIndirectExecutionSetCreateInfoEXT' does not name a type
|  4441 |     const VkIndirectExecutionSetCreateInfoEXT*  pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4443:5: error: 'VkIndirectExecutionSetEXT' has not been declared
|  4443 |     VkIndirectExecutionSetEXT*                  pIndirectExecutionSet);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4447:5: error: 'VkIndirectExecutionSetEXT' has not been declared
|  4447 |     VkIndirectExecutionSetEXT                   indirectExecutionSet,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4452:5: error: 'VkIndirectExecutionSetEXT' has not been declared
|  4452 |     VkIndirectExecutionSetEXT                   indirectExecutionSet,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4454:11: error: 'VkWriteIndirectExecutionSetPipelineEXT' does not name a type
|  4454 |     const VkWriteIndirectExecutionSetPipelineEXT* pExecutionSetWrites);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4458:5: error: 'VkIndirectExecutionSetEXT' has not been declared
|  4458 |     VkIndirectExecutionSetEXT                   indirectExecutionSet,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_declarations.h:4460:11: error: 'VkWriteIndirectExecutionSetShaderEXT' does not name a type
|  4460 |     const VkWriteIndirectExecutionSetShaderEXT* pExecutionSetWrites);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4677:11: error: 'VkPipelineBinaryCreateInfoKHR' does not name a type; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|  4677 |     const VkPipelineBinaryCreateInfoKHR*        pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4679:5: error: 'VkPipelineBinaryHandlesInfoKHR' has not been declared
|  4679 |     VkPipelineBinaryHandlesInfoKHR*             pBinaries)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::CreatePipelineBinariesKHR(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4682:41: error: request for member 'pipelineBinaryCount' in '* pBinaries', which is of non-class type 'int'
|  4682 |     for (uint32_t i = 0; i < pBinaries->pipelineBinaryCount; ++i) {
|       |                                         ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4683:20: error: request for member 'pPipelineBinaries' in '* pBinaries', which is of non-class type 'int'
|  4683 |         pBinaries->pPipelineBinaries[i] = (VkPipelineBinaryKHR)global_unique_handle++;
|       |                    ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4683:44: error: 'VkPipelineBinaryKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|  4683 |         pBinaries->pPipelineBinaries[i] = (VkPipelineBinaryKHR)global_unique_handle++;
|       |                                            ^~~~~~~~~~~~~~~~~~~
|       |                                            VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4690:5: error: 'VkPipelineBinaryKHR' has not been declared
|  4690 |     VkPipelineBinaryKHR                         pipelineBinary,
|       |     ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4698:11: error: 'VkPipelineCreateInfoKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|  4698 |     const VkPipelineCreateInfoKHR*              pPipelineCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4699:5: error: 'VkPipelineBinaryKeyKHR' has not been declared
|  4699 |     VkPipelineBinaryKeyKHR*                     pPipelineKey)
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4707:11: error: 'VkPipelineBinaryDataInfoKHR' does not name a type; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|  4707 |     const VkPipelineBinaryDataInfoKHR*          pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4708:5: error: 'VkPipelineBinaryKeyKHR' has not been declared
|  4708 |     VkPipelineBinaryKeyKHR*                     pPipelineBinaryKey,
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:4718:11: error: 'VkReleaseCapturedPipelineDataInfoKHR' does not name a type
|  4718 |     const VkReleaseCapturedPipelineDataInfoKHR* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7514:11: error: 'VkAntiLagDataAMD' does not name a type
|  7514 |     const VkAntiLagDataAMD*                     pData)
|       |           ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7563:5: error: 'VkDepthClampModeEXT' has not been declared
|  7563 |     VkDepthClampModeEXT                         depthClampMode,
|       |     ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7564:11: error: 'VkDepthClampRangeEXT' does not name a type
|  7564 |     const VkDepthClampRangeEXT*                 pDepthClampRange)
|       |           ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7677:11: error: 'VkGeneratedCommandsMemoryRequirementsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsMemoryRequirementsInfoNV'?
|  7677 |     const VkGeneratedCommandsMemoryRequirementsInfoEXT* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGeneratedCommandsMemoryRequirementsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7685:11: error: 'VkGeneratedCommandsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsInfoNV'?
|  7685 |     const VkGeneratedCommandsInfoEXT*           pGeneratedCommandsInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7694:11: error: 'VkGeneratedCommandsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsInfoNV'?
|  7694 |     const VkGeneratedCommandsInfoEXT*           pGeneratedCommandsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7701:11: error: 'VkIndirectCommandsLayoutCreateInfoEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutCreateInfoNV'?
|  7701 |     const VkIndirectCommandsLayoutCreateInfoEXT* pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkIndirectCommandsLayoutCreateInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7703:5: error: 'VkIndirectCommandsLayoutEXT' has not been declared
|  7703 |     VkIndirectCommandsLayoutEXT*                pIndirectCommandsLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::CreateIndirectCommandsLayoutEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7706:33: error: 'VkIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  7706 |     *pIndirectCommandsLayout = (VkIndirectCommandsLayoutEXT)global_unique_handle++;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkIndirectCommandsLayoutNV_T
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7712:5: error: 'VkIndirectCommandsLayoutEXT' has not been declared
|  7712 |     VkIndirectCommandsLayoutEXT                 indirectCommandsLayout,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7720:11: error: 'VkIndirectExecutionSetCreateInfoEXT' does not name a type
|  7720 |     const VkIndirectExecutionSetCreateInfoEXT*  pCreateInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7722:5: error: 'VkIndirectExecutionSetEXT' has not been declared
|  7722 |     VkIndirectExecutionSetEXT*                  pIndirectExecutionSet)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::CreateIndirectExecutionSetEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7725:31: error: 'VkIndirectExecutionSetEXT' was not declared in this scope; did you mean 'pIndirectExecutionSet'?
|  7725 |     *pIndirectExecutionSet = (VkIndirectExecutionSetEXT)global_unique_handle++;
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               pIndirectExecutionSet
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7731:5: error: 'VkIndirectExecutionSetEXT' has not been declared
|  7731 |     VkIndirectExecutionSetEXT                   indirectExecutionSet,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7739:5: error: 'VkIndirectExecutionSetEXT' has not been declared
|  7739 |     VkIndirectExecutionSetEXT                   indirectExecutionSet,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7741:11: error: 'VkWriteIndirectExecutionSetPipelineEXT' does not name a type
|  7741 |     const VkWriteIndirectExecutionSetPipelineEXT* pExecutionSetWrites)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7748:5: error: 'VkIndirectExecutionSetEXT' has not been declared
|  7748 |     VkIndirectExecutionSetEXT                   indirectExecutionSet,
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/icd/generated/function_definitions.h:7750:11: error: 'VkWriteIndirectExecutionSetShaderEXT' does not name a type
|  7750 |     const VkWriteIndirectExecutionSetShaderEXT* pExecutionSetWrites)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [2/4] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git=/usr/src/debug/vulkan-tools/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-
 native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto
 -worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git=/usr/src/debug/vulkan-tools/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build=/usr/src/debug/vulkan-tools/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native
 =  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/vulkaninfo.cpp:34:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkResultString(VkResult)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:584:15: error: 'VK_PIPELINE_BINARY_MISSING_KHR' was not declared in this scope
|   584 |         case (VK_PIPELINE_BINARY_MISSING_KHR): return "PIPELINE_BINARY_MISSING_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:585:15: error: 'VK_ERROR_NOT_ENOUGH_SPACE_KHR' was not declared in this scope; did you mean 'VK_ERROR_OUT_OF_DATE_KHR'?
|   585 |         case (VK_ERROR_NOT_ENOUGH_SPACE_KHR): return "ERROR_NOT_ENOUGH_SPACE_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_ERROR_OUT_OF_DATE_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:867:76: error: 'VkIndirectCommandsInputModeFlagBitsEXT' was not declared in this scope; did you mean 'VkIndirectCommandsInputModeFlagBitsEXTGetStrings'?
|   867 | std::vector<const char *> VkIndirectCommandsInputModeFlagBitsEXTGetStrings(VkIndirectCommandsInputModeFlagBitsEXT value) {
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                            VkIndirectCommandsInputModeFlagBitsEXTGetStrings
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:867:122: error: expected ',' or ';' before '{' token
|   867 | std::vector<const char *> VkIndirectCommandsInputModeFlagBitsEXTGetStrings(VkIndirectCommandsInputModeFlagBitsEXT value) {
|       |                                                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:874:76: error: 'VkIndirectCommandsInputModeFlagsEXT' has not been declared
|   874 | void DumpVkIndirectCommandsInputModeFlagsEXT(Printer &p, std::string name, VkIndirectCommandsInputModeFlagsEXT value) {
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkIndirectCommandsInputModeFlagsEXT(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:875:21: error: 'VkIndirectCommandsInputModeFlagBitsEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutUsageFlagBitsNV'?
|   875 |     if (static_cast<VkIndirectCommandsInputModeFlagBitsEXT>(value) == 0) {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkIndirectCommandsLayoutUsageFlagBitsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:881:81: error: 'VkIndirectCommandsInputModeFlagBitsEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutUsageFlagBitsNV'?
|   881 |     auto strings = VkIndirectCommandsInputModeFlagBitsEXTGetStrings(static_cast<VkIndirectCommandsInputModeFlagBitsEXT>(value));
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                 VkIndirectCommandsLayoutUsageFlagBitsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:890:79: error: 'VkIndirectCommandsInputModeFlagBitsEXT' has not been declared
|   890 | void DumpVkIndirectCommandsInputModeFlagBitsEXT(Printer &p, std::string name, VkIndirectCommandsInputModeFlagBitsEXT value) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkIndirectCommandsInputModeFlagBitsEXT(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:891:68: error: no match for call to '(std::vector<const char*>) (int&)'
|   891 |     auto strings = VkIndirectCommandsInputModeFlagBitsEXTGetStrings(value);
|       |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1583:98: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  1583 | void DumpVkPhysicalDeviceComputeShaderDerivativesFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR &obj) {
|       |                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                  VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceComputeShaderDerivativesFeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1586:73: error: request for member 'computeDerivativeGroupQuads' in 'obj', which is of non-class type 'const int'
|  1586 |     p.PrintKeyBool("computeDerivativeGroupQuads", static_cast<bool>(obj.computeDerivativeGroupQuads));
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1587:74: error: request for member 'computeDerivativeGroupLinear' in 'obj', which is of non-class type 'const int'
|  1587 |     p.PrintKeyBool("computeDerivativeGroupLinear", static_cast<bool>(obj.computeDerivativeGroupLinear));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1589:100: error: 'VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  1589 | void DumpVkPhysicalDeviceComputeShaderDerivativesPropertiesKHR(Printer &p, std::string name, const VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceComputeShaderDerivativesPropertiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1592:74: error: request for member 'meshAndTaskShaderDerivatives' in 'obj', which is of non-class type 'const int'
|  1592 |     p.PrintKeyBool("meshAndTaskShaderDerivatives", static_cast<bool>(obj.meshAndTaskShaderDerivatives));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1642:91: error: 'VkPhysicalDeviceDepthClampControlFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  1642 | void DumpVkPhysicalDeviceDepthClampControlFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceDepthClampControlFeaturesEXT &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDepthClampControlFeaturesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1645:63: error: request for member 'depthClampControl' in 'obj', which is of non-class type 'const int'
|  1645 |     p.PrintKeyBool("depthClampControl", static_cast<bool>(obj.depthClampControl));
|       |                                                               ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1771:97: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  1771 | void DumpVkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT &obj) {
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                 VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1774:69: error: request for member 'deviceGeneratedCommands' in 'obj', which is of non-class type 'const int'
|  1774 |     p.PrintKeyBool("deviceGeneratedCommands", static_cast<bool>(obj.deviceGeneratedCommands));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1775:76: error: request for member 'dynamicGeneratedPipelineLayout' in 'obj', which is of non-class type 'const int'
|  1775 |     p.PrintKeyBool("dynamicGeneratedPipelineLayout", static_cast<bool>(obj.dynamicGeneratedPipelineLayout));
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1777:99: error: 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV'?
|  1777 | void DumpVkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT(Printer &p, std::string name, const VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT &obj) {
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                   VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1780:53: error: request for member 'maxIndirectPipelineCount' in 'obj', which is of non-class type 'const int'
|  1780 |     p.PrintKeyValue("maxIndirectPipelineCount", obj.maxIndirectPipelineCount);
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1781:57: error: request for member 'maxIndirectShaderObjectCount' in 'obj', which is of non-class type 'const int'
|  1781 |     p.PrintKeyValue("maxIndirectShaderObjectCount", obj.maxIndirectShaderObjectCount);
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1782:53: error: request for member 'maxIndirectSequenceCount' in 'obj', which is of non-class type 'const int'
|  1782 |     p.PrintKeyValue("maxIndirectSequenceCount", obj.maxIndirectSequenceCount);
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1783:58: error: request for member 'maxIndirectCommandsTokenCount' in 'obj', which is of non-class type 'const int'
|  1783 |     p.PrintKeyValue("maxIndirectCommandsTokenCount", obj.maxIndirectCommandsTokenCount);
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1784:59: error: request for member 'maxIndirectCommandsTokenOffset' in 'obj', which is of non-class type 'const int'
|  1784 |     p.PrintKeyValue("maxIndirectCommandsTokenOffset", obj.maxIndirectCommandsTokenOffset);
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1785:62: error: request for member 'maxIndirectCommandsIndirectStride' in 'obj', which is of non-class type 'const int'
|  1785 |     p.PrintKeyValue("maxIndirectCommandsIndirectStride", obj.maxIndirectCommandsIndirectStride);
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1786:91: error: request for member 'supportedIndirectCommandsInputModes' in 'obj', which is of non-class type 'const int'
|  1786 |     DumpVkIndirectCommandsInputModeFlagsEXT(p, "supportedIndirectCommandsInputModes", obj.supportedIndirectCommandsInputModes);
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1787:76: error: request for member 'supportedIndirectCommandsShaderStages' in 'obj', which is of non-class type 'const int'
|  1787 |     DumpVkShaderStageFlags(p, "supportedIndirectCommandsShaderStages", obj.supportedIndirectCommandsShaderStages);
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1788:91: error: request for member 'supportedIndirectCommandsShaderStagesPipelineBinding' in 'obj', which is of non-class type 'const int'
|  1788 |     DumpVkShaderStageFlags(p, "supportedIndirectCommandsShaderStagesPipelineBinding", obj.supportedIndirectCommandsShaderStagesPipelineBinding);
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1789:89: error: request for member 'supportedIndirectCommandsShaderStagesShaderBinding' in 'obj', which is of non-class type 'const int'
|  1789 |     DumpVkShaderStageFlags(p, "supportedIndirectCommandsShaderStagesShaderBinding", obj.supportedIndirectCommandsShaderStagesShaderBinding);
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1790:86: error: request for member 'deviceGeneratedCommandsTransformFeedback' in 'obj', which is of non-class type 'const int'
|  1790 |     p.PrintKeyBool("deviceGeneratedCommandsTransformFeedback", static_cast<bool>(obj.deviceGeneratedCommandsTransformFeedback));
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:1791:91: error: request for member 'deviceGeneratedCommandsMultiDrawIndirectCount' in 'obj', which is of non-class type 'const int'
|  1791 |     p.PrintKeyBool("deviceGeneratedCommandsMultiDrawIndirectCount", static_cast<bool>(obj.deviceGeneratedCommandsMultiDrawIndirectCount));
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:2585:88: error: 'VkPhysicalDevicePipelineBinaryFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  2585 | void DumpVkPhysicalDevicePipelineBinaryFeaturesKHR(Printer &p, std::string name, const VkPhysicalDevicePipelineBinaryFeaturesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineBinaryFeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:2588:62: error: request for member 'pipelineBinaries' in 'obj', which is of non-class type 'const int'
|  2588 |     p.PrintKeyBool("pipelineBinaries", static_cast<bool>(obj.pipelineBinaries));
|       |                                                              ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:2590:90: error: 'VkPhysicalDevicePipelineBinaryPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphorePropertiesKHR'?
|  2590 | void DumpVkPhysicalDevicePipelineBinaryPropertiesKHR(Printer &p, std::string name, const VkPhysicalDevicePipelineBinaryPropertiesKHR &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceTimelineSemaphorePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineBinaryPropertiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:2593:73: error: request for member 'pipelineBinaryInternalCache' in 'obj', which is of non-class type 'const int'
|  2593 |     p.PrintKeyBool("pipelineBinaryInternalCache", static_cast<bool>(obj.pipelineBinaryInternalCache));
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:2594:80: error: request for member 'pipelineBinaryInternalCacheControl' in 'obj', which is of non-class type 'const int'
|  2594 |     p.PrintKeyBool("pipelineBinaryInternalCacheControl", static_cast<bool>(obj.pipelineBinaryInternalCacheControl));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:2595:80: error: request for member 'pipelineBinaryPrefersInternalCache' in 'obj', which is of non-class type 'const int'
|  2595 |     p.PrintKeyBool("pipelineBinaryPrefersInternalCache", static_cast<bool>(obj.pipelineBinaryPrefersInternalCache));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:2596:84: error: request for member 'pipelineBinaryPrecompiledInternalCache' in 'obj', which is of non-class type 'const int'
|  2596 |     p.PrintKeyBool("pipelineBinaryPrecompiledInternalCache", static_cast<bool>(obj.pipelineBinaryPrecompiledInternalCache));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:2597:74: error: request for member 'pipelineBinaryCompressedData' in 'obj', which is of non-class type 'const int'
|  2597 |     p.PrintKeyBool("pipelineBinaryCompressedData", static_cast<bool>(obj.pipelineBinaryCompressedData));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3487:5: error: 'VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  3487 |     VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR PhysicalDeviceComputeShaderDerivativesPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3495:5: error: 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV'?
|  3495 |     VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT PhysicalDeviceDeviceGeneratedCommandsPropertiesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3529:5: error: 'VkPhysicalDevicePipelineBinaryPropertiesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphorePropertiesKHR'?
|  3529 |     VkPhysicalDevicePipelineBinaryPropertiesKHR PhysicalDevicePipelineBinaryPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceTimelineSemaphorePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain(AppInstance&, AppGpu&, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3559:9: error: 'PhysicalDeviceComputeShaderDerivativesPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceComputeShaderDerivativesPropertiesKHR'?
|  3559 |         PhysicalDeviceComputeShaderDerivativesPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceComputeShaderDerivativesPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3559:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  3559 |         PhysicalDeviceComputeShaderDerivativesPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3567:9: error: 'PhysicalDeviceDeviceGeneratedCommandsPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV'?
|  3567 |         PhysicalDeviceDeviceGeneratedCommandsPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3567:68: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV'?
|  3567 |         PhysicalDeviceDeviceGeneratedCommandsPropertiesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT;
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3598:9: error: 'PhysicalDevicePipelineBinaryPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineBinaryPropertiesKHR'?
|  3598 |         PhysicalDevicePipelineBinaryPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePipelineBinaryPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3598:59: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  3598 |         PhysicalDevicePipelineBinaryPropertiesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3630:54: error: 'VK_KHR_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME'?
|  3630 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3648:54: error: 'VK_EXT_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME'?
|  3648 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3720:54: error: 'VK_KHR_PIPELINE_BINARY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|  3720 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PIPELINE_BINARY_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, bool, void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3807:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  3807 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3808:13: error: 'VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceComputeShaderDerivativesPropertiesKHR'?
|  3808 |             VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR* props = (VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDeviceComputeShaderDerivativesPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3808:68: error: 'props' was not declared in this scope
|  3808 |             VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR* props = (VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR*)structure;
|       |                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3808:131: error: expected primary-expression before ')' token
|  3808 |             VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR* props = (VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR*)structure;
|       |                                                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3847:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV'?
|  3847 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3848:13: error: 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV'?
|  3848 |             VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT* props = (VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3848:67: error: 'props' was not declared in this scope
|  3848 |             VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT* props = (VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT*)structure;
|       |                                                                   ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:3848:129: error: expected primary-expression before ')' token
|  3848 |             VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT* props = (VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT*)structure;
|       |                                                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4002:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  4002 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4003:13: error: 'VkPhysicalDevicePipelineBinaryPropertiesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineBinaryPropertiesKHR'?
|  4003 |             VkPhysicalDevicePipelineBinaryPropertiesKHR* props = (VkPhysicalDevicePipelineBinaryPropertiesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePipelineBinaryPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4003:58: error: 'props' was not declared in this scope
|  4003 |             VkPhysicalDevicePipelineBinaryPropertiesKHR* props = (VkPhysicalDevicePipelineBinaryPropertiesKHR*)structure;
|       |                                                          ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4003:111: error: expected primary-expression before ')' token
|  4003 |             VkPhysicalDevicePipelineBinaryPropertiesKHR* props = (VkPhysicalDevicePipelineBinaryPropertiesKHR*)structure;
|       |                                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4195:5: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  4195 |     VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR PhysicalDeviceComputeShaderDerivativesFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4200:5: error: 'VkPhysicalDeviceDepthClampControlFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  4200 |     VkPhysicalDeviceDepthClampControlFeaturesEXT PhysicalDeviceDepthClampControlFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4206:5: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  4206 |     VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT PhysicalDeviceDeviceGeneratedCommandsFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4254:5: error: 'VkPhysicalDevicePipelineBinaryFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  4254 |     VkPhysicalDevicePipelineBinaryFeaturesKHR PhysicalDevicePipelineBinaryFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain(AppGpu&, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4339:9: error: 'PhysicalDeviceComputeShaderDerivativesFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  4339 |         PhysicalDeviceComputeShaderDerivativesFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4339:67: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  4339 |         PhysicalDeviceComputeShaderDerivativesFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR;
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4344:9: error: 'PhysicalDeviceDepthClampControlFeaturesEXT' was not declared in this scope; did you mean 'PhysicalDeviceDepthClipControlFeaturesEXT'?
|  4344 |         PhysicalDeviceDepthClampControlFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4344:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT'?
|  4344 |         PhysicalDeviceDepthClampControlFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4350:9: error: 'PhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  4350 |         PhysicalDeviceDeviceGeneratedCommandsFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4350:66: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV'?
|  4350 |         PhysicalDeviceDeviceGeneratedCommandsFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4397:9: error: 'PhysicalDevicePipelineBinaryFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineBinaryFeaturesKHR'?
|  4397 |         PhysicalDevicePipelineBinaryFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePipelineBinaryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4397:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  4397 |         PhysicalDevicePipelineBinaryFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4498:54: error: 'VK_KHR_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME'?
|  4498 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_COMPUTE_SHADER_DERIVATIVES_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4508:54: error: 'VK_EXT_DEPTH_CLAMP_CONTROL_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEPTH_CLIP_CONTROL_EXTENSION_NAME'?
|  4508 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEPTH_CLAMP_CONTROL_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEPTH_CLIP_CONTROL_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4521:54: error: 'VK_EXT_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_NV_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME'?
|  4521 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_NV_DEVICE_GENERATED_COMMANDS_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4627:54: error: 'VK_KHR_PIPELINE_BINARY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME'?
|  4627 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_PIPELINE_BINARY_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_PIPELINE_LIBRARY_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, bool, void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4870:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  4870 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4871:13: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  4871 |             VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR* props = (VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4871:66: error: 'props' was not declared in this scope
|  4871 |             VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR* props = (VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR*)structure;
|       |                                                                  ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4871:127: error: expected primary-expression before ')' token
|  4871 |             VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR* props = (VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR*)structure;
|       |                                                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4895:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT'?
|  4895 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4896:13: error: 'VkPhysicalDeviceDepthClampControlFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  4896 |             VkPhysicalDeviceDepthClampControlFeaturesEXT* props = (VkPhysicalDeviceDepthClampControlFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4896:59: error: 'props' was not declared in this scope
|  4896 |             VkPhysicalDeviceDepthClampControlFeaturesEXT* props = (VkPhysicalDeviceDepthClampControlFeaturesEXT*)structure;
|       |                                                           ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4896:113: error: expected primary-expression before ')' token
|  4896 |             VkPhysicalDeviceDepthClampControlFeaturesEXT* props = (VkPhysicalDeviceDepthClampControlFeaturesEXT*)structure;
|       |                                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4925:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV'?
|  4925 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4926:13: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  4926 |             VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT* props = (VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4926:65: error: 'props' was not declared in this scope
|  4926 |             VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT* props = (VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT*)structure;
|       |                                                                 ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:4926:125: error: expected primary-expression before ')' token
|  4926 |             VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT* props = (VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT*)structure;
|       |                                                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:5160:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  5160 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:5161:13: error: 'VkPhysicalDevicePipelineBinaryFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePipelineBinaryFeaturesKHR'?
|  5161 |             VkPhysicalDevicePipelineBinaryFeaturesKHR* props = (VkPhysicalDevicePipelineBinaryFeaturesKHR*)structure;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             DumpVkPhysicalDevicePipelineBinaryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:5161:56: error: 'props' was not declared in this scope
|  5161 |             VkPhysicalDevicePipelineBinaryFeaturesKHR* props = (VkPhysicalDevicePipelineBinaryFeaturesKHR*)structure;
|       |                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/git/vulkaninfo/generated/vulkaninfo.hpp:5161:107: error: expected primary-expression before ')' token
|  5161 |             VkPhysicalDevicePipelineBinaryFeaturesKHR* props = (VkPhysicalDevicePipelineBinaryFeaturesKHR*)structure;
|       |                                                                                                           ^
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/temp/run.do_compile.3381445:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/temp/run.do_compile.3381445, line 153
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/temp/run.do_compile.3381445, line 147
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/temp/run.do_compile.3381445, line 142
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/temp/run.do_compile.3381445, line 166
NOTE: recipe vulkan-tools-1.3.296.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1593 tasks of which 1585 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015112106.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241015112106.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/temp/log.do_compile.3381445
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.3.296.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/temp/run.do_compile.3381445' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.3.296.0/temp/log.do_compile.3381445
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb:do_compile) failed with exit code '1'

--===============4350670356326709162==--

