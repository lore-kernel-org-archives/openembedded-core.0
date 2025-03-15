Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C852FC36011
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:44 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10358.1742048293296256688
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NPwGjw0K;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=QVMpTTME;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101959a2bbee0-536f890d-2ed8-4892-b683-4df516d261eb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048313;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9u0gU6Y5xea6hQBLKPjLP21tdNvuPfIOgQDYHNU7HFY=;
	b=NPwGjw0KubVLOYfKI146DvNpUs0renVm7h0b+EaxhuYK61PKcHXZS0G52VYG7tmJ
	cKCYcn6aJmcFvii7pV40iJHmw3saOd+ts105Q8UX2HYk8jEkaUbSqDbuGenmMCnCfHW
	lU2K0cftCzFXhjegy1iO7j1wA+YIcIA060jff01g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048313;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9u0gU6Y5xea6hQBLKPjLP21tdNvuPfIOgQDYHNU7HFY=;
	b=QVMpTTMENNrbOaso4OcVjfmZ5SqPzuIuWcFXd6rfStQ9AT5Mv+aqVUQ8vgSGb+K9
	L/8MsrWMgWMTL/N0kLAIZbHGmoD3NKrxfBCGNYPnSijxM9/6gN9YKn0/qWKFwt4iNa0
	xVjLe8tPMVwxnCKdYfoWTK3XQIbuDz7jt3sjU+y0=
Content-Type: multipart/mixed; boundary="===============8025916100084108519=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.4.309.0 FAILED
Message-ID: <010101959a2bbee0-536f890d-2ed8-4892-b683-4df516d261eb-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212956

--===============8025916100084108519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-tools* to *1.4.309.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.296.0-1.4.309.0.patch
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
From 1119ae9843e3654f350295c98c2aea4efdc91cf6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 12:49:44 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.296.0 -> 1.4.309.0

---
 .../{vulkan-tools_1.3.296.0.bb => vulkan-tools_1.4.309.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.296.0.bb => vulkan-tools_1.4.309.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb
index 5f83f4f246..4215fa25d9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.296.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.3.296;protocol=https"
-SRCREV = "74dd90abd69f813220b572e1d89c17bc7784972d"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.309;protocol=https"
+SRCREV = "bf9fcd2d62ea9eac52e5351c02e35cb61ec5e873"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============8025916100084108519==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.296.0-1.4.309.0.patch"

RnJvbSAxMTE5YWU5ODQzZTM2NTRmMzUwMjk1Yzk4YzJhZWE0ZWZkYzkxY2Y2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTI6NDk6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdG9vbHM6IHVwZ3JhZGUgMS4zLjI5Ni4wIC0+IDEuNC4zMDkuMAoKLS0tCiAuLi4ve3Z1
bGthbi10b29sc18xLjMuMjk2LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zMDkuMC5iYn0gIHwg
NCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi10b29sc18xLjMuMjk2
LjAuYmIgPT4gdnVsa2FuLXRvb2xzXzEuNC4zMDkuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjk2LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzA5LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS4zLjI5Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjQuMzA5LjAuYmIKaW5kZXggNWY4M2Y0ZjI0Ni4uNDIx
NWZhMjVkOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4t
dG9vbHNfMS4zLjI5Ni4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXRvb2xzXzEuNC4zMDkuMC5iYgpAQCAtNiw4ICs2LDggQEAgU0VDVElPTiA9ICJsaWJzIgog
CiBMSUNFTlNFID0gIkFwYWNoZS0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNF
TlNFLnR4dDttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1Ub29scy5naXQ7YnJhbmNoPXZ1
bGthbi1zZGstMS4zLjI5Njtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICI3NGRkOTBhYmQ2OWY4
MTMyMjBiNTcyZTFkODljMTdiYzc3ODQ5NzJkIgorU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L0tocm9ub3NHcm91cC9WdWxrYW4tVG9vbHMuZ2l0O2JyYW5jaD12dWxrYW4tc2RrLTEuNC4zMDk7
cHJvdG9jb2w9aHR0cHMiCitTUkNSRVYgPSAiYmY5ZmNkMmQ2MmVhOWVhYzUyZTUzNTFjMDJlMzVj
YjYxZWM1ZTg3MyIKIAogUyA9ICIke1dPUktESVJ9L2dpdCIKIAotLSAKMi40NC4xCgo=

--===============8025916100084108519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:9164dbdcd47f9c4ea7183b9c4b89072e5718a3ea"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 192 Local 180 Mirrors 0 Missed 12 Current 391 (93% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1475 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_recipe_qa)
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1626 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_fetch)
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_fetch: Succeeded
NOTE: Running task 1627 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_unpack)
NOTE: Running task 1628 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_unpack: Succeeded
NOTE: Running task 1629 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_patch)
NOTE: Running task 1630 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_patch: Succeeded
NOTE: Running task 1631 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1632 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_generate_toolchain_file)
NOTE: Running task 1633 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_populate_lic)
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1634 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_configure)
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_configure: Succeeded
NOTE: Running task 1635 of 1646 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_compile)
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/4] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot -DGIT_BRANCH_NAME=\"vulkan-sdk-1.4.309\" -DGIT_TAG_INFO=\"vulkan-sdk-1.4.309.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokyb
 uild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git=/usr/src/debug/vulkan-tools/1.4.309.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-t
 ools/1.4.309.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/mock_icd.cpp
| FAILED: icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot -DGIT_BRANCH_NAME=\"vulkan-sdk-1.4.309\" -DGIT_TAG_INFO=\"vulkan-sdk-1.4.309.0\" -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_WAYLAND_KHX -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XCB_KHX -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_KHX -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -DVkICD_mock_icd_EXPORTS -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/y
 octo-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git=/usr/src/debug/vulkan-tools/1.4.309.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1
 .4.309.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -Wpointer-arith -Wno-unused-function -Wno-sign-compare -MD -MT icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -MF icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o.d -o icd/CMakeFiles/VkICD_mock_icd.dir/mock_icd.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/mock_icd.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/mock_icd.h:40,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/mock_icd.cpp:17:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1969:31: error: 'VkPhysicalDeviceVulkan14Features' was not declared in this scope; did you mean 'VkPhysicalDeviceVulkan13Features'?
|  1969 | template <> struct LvlTypeMap<VkPhysicalDeviceVulkan14Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVulkan13Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1969:63: error: template argument 1 is invalid
|  1969 | template <> struct LvlTypeMap<VkPhysicalDeviceVulkan14Features> {
|       |                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1973:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES'?
|  1973 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1973:85: error: template argument 1 is invalid
|  1973 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1978:31: error: 'VkPhysicalDeviceVulkan14Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceVulkan13Properties'?
|  1978 | template <> struct LvlTypeMap<VkPhysicalDeviceVulkan14Properties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVulkan13Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1978:65: error: template argument 1 is invalid
|  1978 | template <> struct LvlTypeMap<VkPhysicalDeviceVulkan14Properties> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1982:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES'?
|  1982 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1982:87: error: template argument 1 is invalid
|  1982 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1987:31: error: 'VkDeviceQueueGlobalPriorityCreateInfo' was not declared in this scope; did you mean 'VkDeviceQueueGlobalPriorityCreateInfoKHR'?
|  1987 | template <> struct LvlTypeMap<VkDeviceQueueGlobalPriorityCreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDeviceQueueGlobalPriorityCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1987:68: error: template argument 1 is invalid
|  1987 | template <> struct LvlTypeMap<VkDeviceQueueGlobalPriorityCreateInfo> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1991:32: error: 'VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR'?
|  1991 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1991:90: error: template argument 1 is invalid
|  1991 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1996:31: error: 'VkPhysicalDeviceGlobalPriorityQueryFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  1996 | template <> struct LvlTypeMap<VkPhysicalDeviceGlobalPriorityQueryFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:1996:74: error: template argument 1 is invalid
|  1996 | template <> struct LvlTypeMap<VkPhysicalDeviceGlobalPriorityQueryFeatures> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2000:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR'?
|  2000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2000:96: error: template argument 1 is invalid
|  2000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2005:31: error: 'VkQueueFamilyGlobalPriorityProperties' was not declared in this scope; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  2005 | template <> struct LvlTypeMap<VkQueueFamilyGlobalPriorityProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2005:68: error: template argument 1 is invalid
|  2005 | template <> struct LvlTypeMap<VkQueueFamilyGlobalPriorityProperties> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2009:32: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR'?
|  2009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2009:89: error: template argument 1 is invalid
|  2009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2014:31: error: 'VkPhysicalDeviceShaderSubgroupRotateFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  2014 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderSubgroupRotateFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2014:75: error: template argument 1 is invalid
|  2014 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderSubgroupRotateFeatures> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2018:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR'?
|  2018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2018:97: error: template argument 1 is invalid
|  2018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES> {
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2023:31: error: 'VkPhysicalDeviceShaderFloatControls2Features' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  2023 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderFloatControls2Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2023:75: error: template argument 1 is invalid
|  2023 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderFloatControls2Features> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2027:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR'?
|  2027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2027:98: error: template argument 1 is invalid
|  2027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2032:31: error: 'VkPhysicalDeviceShaderExpectAssumeFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  2032 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderExpectAssumeFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2032:73: error: template argument 1 is invalid
|  2032 | template <> struct LvlTypeMap<VkPhysicalDeviceShaderExpectAssumeFeatures> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2036:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR'?
|  2036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2036:95: error: template argument 1 is invalid
|  2036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2041:31: error: 'VkPhysicalDeviceLineRasterizationFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  2041 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2041:72: error: template argument 1 is invalid
|  2041 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationFeatures> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2045:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR'?
|  2045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2045:93: error: template argument 1 is invalid
|  2045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES> {
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2050:31: error: 'VkPhysicalDeviceLineRasterizationProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  2050 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2050:74: error: template argument 1 is invalid
|  2050 | template <> struct LvlTypeMap<VkPhysicalDeviceLineRasterizationProperties> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2054:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR'?
|  2054 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2054:95: error: template argument 1 is invalid
|  2054 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2059:31: error: 'VkPipelineRasterizationLineStateCreateInfo' was not declared in this scope; did you mean 'VkPipelineRasterizationLineStateCreateInfoKHR'?
|  2059 | template <> struct LvlTypeMap<VkPipelineRasterizationLineStateCreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineRasterizationLineStateCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2059:73: error: template argument 1 is invalid
|  2059 | template <> struct LvlTypeMap<VkPipelineRasterizationLineStateCreateInfo> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2063:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR'?
|  2063 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2063:95: error: template argument 1 is invalid
|  2063 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2068:31: error: 'VkPhysicalDeviceVertexAttributeDivisorProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR'?
|  2068 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeDivisorProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2068:79: error: template argument 1 is invalid
|  2068 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeDivisorProperties> {
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2072:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR'?
|  2072 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2072:101: error: template argument 1 is invalid
|  2072 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2077:31: error: 'VkPipelineVertexInputDivisorStateCreateInfo' was not declared in this scope; did you mean 'VkPipelineVertexInputDivisorStateCreateInfoKHR'?
|  2077 | template <> struct LvlTypeMap<VkPipelineVertexInputDivisorStateCreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineVertexInputDivisorStateCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2077:74: error: template argument 1 is invalid
|  2077 | template <> struct LvlTypeMap<VkPipelineVertexInputDivisorStateCreateInfo> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2081:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_KHR'?
|  2081 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2081:97: error: template argument 1 is invalid
|  2081 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO> {
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2086:31: error: 'VkPhysicalDeviceVertexAttributeDivisorFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  2086 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeDivisorFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2086:77: error: template argument 1 is invalid
|  2086 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeDivisorFeatures> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2090:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR'?
|  2090 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2090:99: error: template argument 1 is invalid
|  2090 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES> {
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2095:31: error: 'VkPhysicalDeviceIndexTypeUint8Features' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  2095 | template <> struct LvlTypeMap<VkPhysicalDeviceIndexTypeUint8Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2095:69: error: template argument 1 is invalid
|  2095 | template <> struct LvlTypeMap<VkPhysicalDeviceIndexTypeUint8Features> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2099:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR'?
|  2099 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2099:91: error: template argument 1 is invalid
|  2099 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2104:31: error: 'VkMemoryMapInfo' was not declared in this scope; did you mean 'VkMemoryMapInfoKHR'?
|  2104 | template <> struct LvlTypeMap<VkMemoryMapInfo> {
|       |                               ^~~~~~~~~~~~~~~
|       |                               VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2104:46: error: template argument 1 is invalid
|  2104 | template <> struct LvlTypeMap<VkMemoryMapInfo> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2108:32: error: 'VK_STRUCTURE_TYPE_MEMORY_MAP_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_MAP_INFO_KHR'?
|  2108 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_MAP_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_MAP_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2108:65: error: template argument 1 is invalid
|  2108 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_MAP_INFO> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2113:31: error: 'VkMemoryUnmapInfo' was not declared in this scope; did you mean 'VkMemoryUnmapInfoKHR'?
|  2113 | template <> struct LvlTypeMap<VkMemoryUnmapInfo> {
|       |                               ^~~~~~~~~~~~~~~~~
|       |                               VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2113:48: error: template argument 1 is invalid
|  2113 | template <> struct LvlTypeMap<VkMemoryUnmapInfo> {
|       |                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2117:32: error: 'VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO_KHR'?
|  2117 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2117:67: error: template argument 1 is invalid
|  2117 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_UNMAP_INFO> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2122:31: error: 'VkPhysicalDeviceMaintenance5Features' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  2122 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2122:67: error: template argument 1 is invalid
|  2122 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5Features> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2126:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  2126 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2126:88: error: template argument 1 is invalid
|  2126 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2131:31: error: 'VkPhysicalDeviceMaintenance5Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  2131 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5Properties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2131:69: error: template argument 1 is invalid
|  2131 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance5Properties> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2135:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  2135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2135:90: error: template argument 1 is invalid
|  2135 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2140:31: error: 'VkRenderingAreaInfo' was not declared in this scope; did you mean 'VkRenderingAreaInfoKHR'?
|  2140 | template <> struct LvlTypeMap<VkRenderingAreaInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2140:50: error: template argument 1 is invalid
|  2140 | template <> struct LvlTypeMap<VkRenderingAreaInfo> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2144:32: error: 'VK_STRUCTURE_TYPE_RENDERING_AREA_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_AREA_INFO_KHR'?
|  2144 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_AREA_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_AREA_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2144:69: error: template argument 1 is invalid
|  2144 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_AREA_INFO> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2149:31: error: 'VkImageSubresource2' was not declared in this scope; did you mean 'VkImageSubresource'?
|  2149 | template <> struct LvlTypeMap<VkImageSubresource2> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2149:50: error: template argument 1 is invalid
|  2149 | template <> struct LvlTypeMap<VkImageSubresource2> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2153:32: error: 'VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR'?
|  2153 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2153:69: error: template argument 1 is invalid
|  2153 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_SUBRESOURCE_2> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2158:31: error: 'VkDeviceImageSubresourceInfo' was not declared in this scope; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  2158 | template <> struct LvlTypeMap<VkDeviceImageSubresourceInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2158:59: error: template argument 1 is invalid
|  2158 | template <> struct LvlTypeMap<VkDeviceImageSubresourceInfo> {
|       |                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2162:32: error: 'VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO_KHR'?
|  2162 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2162:79: error: template argument 1 is invalid
|  2162 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DEVICE_IMAGE_SUBRESOURCE_INFO> {
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2167:31: error: 'VkSubresourceLayout2' was not declared in this scope; did you mean 'VkSubresourceLayout'?
|  2167 | template <> struct LvlTypeMap<VkSubresourceLayout2> {
|       |                               ^~~~~~~~~~~~~~~~~~~~
|       |                               VkSubresourceLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2167:51: error: template argument 1 is invalid
|  2167 | template <> struct LvlTypeMap<VkSubresourceLayout2> {
|       |                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2171:32: error: 'VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR'?
|  2171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2171:70: error: template argument 1 is invalid
|  2171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_LAYOUT_2> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2176:31: error: 'VkPipelineCreateFlags2CreateInfo' was not declared in this scope; did you mean 'VkPipelineCreateFlags2CreateInfoKHR'?
|  2176 | template <> struct LvlTypeMap<VkPipelineCreateFlags2CreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineCreateFlags2CreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2176:63: error: template argument 1 is invalid
|  2176 | template <> struct LvlTypeMap<VkPipelineCreateFlags2CreateInfo> {
|       |                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2180:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO_KHR'?
|  2180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2180:85: error: template argument 1 is invalid
|  2180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_CREATE_FLAGS_2_CREATE_INFO> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2185:31: error: 'VkBufferUsageFlags2CreateInfo' was not declared in this scope; did you mean 'VkBufferUsageFlags2CreateInfoKHR'?
|  2185 | template <> struct LvlTypeMap<VkBufferUsageFlags2CreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBufferUsageFlags2CreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2185:60: error: template argument 1 is invalid
|  2185 | template <> struct LvlTypeMap<VkBufferUsageFlags2CreateInfo> {
|       |                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2189:32: error: 'VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO_KHR'?
|  2189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2189:82: error: template argument 1 is invalid
|  2189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUFFER_USAGE_FLAGS_2_CREATE_INFO> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2194:31: error: 'VkPhysicalDevicePushDescriptorProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  2194 | template <> struct LvlTypeMap<VkPhysicalDevicePushDescriptorProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2194:71: error: template argument 1 is invalid
|  2194 | template <> struct LvlTypeMap<VkPhysicalDevicePushDescriptorProperties> {
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2198:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR'?
|  2198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2198:92: error: template argument 1 is invalid
|  2198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES> {
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2203:31: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  2203 | template <> struct LvlTypeMap<VkPhysicalDeviceDynamicRenderingLocalReadFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2203:80: error: template argument 1 is invalid
|  2203 | template <> struct LvlTypeMap<VkPhysicalDeviceDynamicRenderingLocalReadFeatures> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2207:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR'?
|  2207 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2207:103: error: template argument 1 is invalid
|  2207 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES> {
|       |                                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2212:31: error: 'VkRenderingAttachmentLocationInfo' was not declared in this scope; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  2212 | template <> struct LvlTypeMap<VkRenderingAttachmentLocationInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2212:64: error: template argument 1 is invalid
|  2212 | template <> struct LvlTypeMap<VkRenderingAttachmentLocationInfo> {
|       |                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2216:32: error: 'VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO_KHR'?
|  2216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2216:84: error: template argument 1 is invalid
|  2216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_ATTACHMENT_LOCATION_INFO> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2221:31: error: 'VkRenderingInputAttachmentIndexInfo' was not declared in this scope; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  2221 | template <> struct LvlTypeMap<VkRenderingInputAttachmentIndexInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2221:66: error: template argument 1 is invalid
|  2221 | template <> struct LvlTypeMap<VkRenderingInputAttachmentIndexInfo> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2225:32: error: 'VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO_KHR'?
|  2225 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2225:87: error: template argument 1 is invalid
|  2225 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RENDERING_INPUT_ATTACHMENT_INDEX_INFO> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2230:31: error: 'VkPhysicalDeviceMaintenance6Features' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  2230 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance6Features> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2230:67: error: template argument 1 is invalid
|  2230 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance6Features> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2234:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  2234 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2234:88: error: template argument 1 is invalid
|  2234 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2239:31: error: 'VkPhysicalDeviceMaintenance6Properties' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  2239 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance6Properties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2239:69: error: template argument 1 is invalid
|  2239 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance6Properties> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2243:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  2243 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2243:90: error: template argument 1 is invalid
|  2243 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2248:31: error: 'VkBindMemoryStatus' was not declared in this scope; did you mean 'VkBindMemoryStatusKHR'?
|  2248 | template <> struct LvlTypeMap<VkBindMemoryStatus> {
|       |                               ^~~~~~~~~~~~~~~~~~
|       |                               VkBindMemoryStatusKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2248:49: error: template argument 1 is invalid
|  2248 | template <> struct LvlTypeMap<VkBindMemoryStatus> {
|       |                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2252:32: error: 'VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS_KHR'?
|  2252 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2252:68: error: template argument 1 is invalid
|  2252 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_MEMORY_STATUS> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2257:31: error: 'VkBindDescriptorSetsInfo' was not declared in this scope; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  2257 | template <> struct LvlTypeMap<VkBindDescriptorSetsInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2257:55: error: template argument 1 is invalid
|  2257 | template <> struct LvlTypeMap<VkBindDescriptorSetsInfo> {
|       |                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2261:32: error: 'VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO_KHR'?
|  2261 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2261:75: error: template argument 1 is invalid
|  2261 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BIND_DESCRIPTOR_SETS_INFO> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2266:31: error: 'VkPushConstantsInfo' was not declared in this scope; did you mean 'VkPushConstantsInfoKHR'?
|  2266 | template <> struct LvlTypeMap<VkPushConstantsInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2266:50: error: template argument 1 is invalid
|  2266 | template <> struct LvlTypeMap<VkPushConstantsInfo> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2270:32: error: 'VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO_KHR'?
|  2270 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2270:69: error: template argument 1 is invalid
|  2270 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_CONSTANTS_INFO> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2275:31: error: 'VkPushDescriptorSetInfo' was not declared in this scope; did you mean 'VkPushDescriptorSetInfoKHR'?
|  2275 | template <> struct LvlTypeMap<VkPushDescriptorSetInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2275:54: error: template argument 1 is invalid
|  2275 | template <> struct LvlTypeMap<VkPushDescriptorSetInfo> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2279:32: error: 'VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO_KHR'?
|  2279 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2279:74: error: template argument 1 is invalid
|  2279 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_INFO> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2284:31: error: 'VkPushDescriptorSetWithTemplateInfo' was not declared in this scope; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  2284 | template <> struct LvlTypeMap<VkPushDescriptorSetWithTemplateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2284:66: error: template argument 1 is invalid
|  2284 | template <> struct LvlTypeMap<VkPushDescriptorSetWithTemplateInfo> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2288:32: error: 'VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO_KHR'?
|  2288 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2288:88: error: template argument 1 is invalid
|  2288 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2293:31: error: 'VkPhysicalDevicePipelineProtectedAccessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  2293 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineProtectedAccessFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2293:78: error: template argument 1 is invalid
|  2293 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineProtectedAccessFeatures> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2297:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT'?
|  2297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2297:100: error: template argument 1 is invalid
|  2297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES> {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2302:31: error: 'VkPhysicalDevicePipelineRobustnessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  2302 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2302:73: error: template argument 1 is invalid
|  2302 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessFeatures> {
|       |                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2306:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT'?
|  2306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2306:94: error: template argument 1 is invalid
|  2306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2311:31: error: 'VkPhysicalDevicePipelineRobustnessProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  2311 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2311:75: error: template argument 1 is invalid
|  2311 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineRobustnessProperties> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2315:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT'?
|  2315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2315:96: error: template argument 1 is invalid
|  2315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2320:31: error: 'VkPipelineRobustnessCreateInfo' was not declared in this scope; did you mean 'VkPipelineRobustnessCreateInfoEXT'?
|  2320 | template <> struct LvlTypeMap<VkPipelineRobustnessCreateInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPipelineRobustnessCreateInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2320:61: error: template argument 1 is invalid
|  2320 | template <> struct LvlTypeMap<VkPipelineRobustnessCreateInfo> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2324:32: error: 'VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO_EXT'?
|  2324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2324:81: error: template argument 1 is invalid
|  2324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PIPELINE_ROBUSTNESS_CREATE_INFO> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2329:31: error: 'VkPhysicalDeviceHostImageCopyFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  2329 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyFeatures> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2329:68: error: template argument 1 is invalid
|  2329 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyFeatures> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2333:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT'?
|  2333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2333:90: error: template argument 1 is invalid
|  2333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2338:31: error: 'VkPhysicalDeviceHostImageCopyProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  2338 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyProperties> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2338:70: error: template argument 1 is invalid
|  2338 | template <> struct LvlTypeMap<VkPhysicalDeviceHostImageCopyProperties> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2342:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT'?
|  2342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2342:92: error: template argument 1 is invalid
|  2342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES> {
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2347:31: error: 'VkMemoryToImageCopy' was not declared in this scope; did you mean 'VkMemoryToImageCopyEXT'?
|  2347 | template <> struct LvlTypeMap<VkMemoryToImageCopy> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkMemoryToImageCopyEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2347:50: error: template argument 1 is invalid
|  2347 | template <> struct LvlTypeMap<VkMemoryToImageCopy> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2351:32: error: 'VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY_EXT'?
|  2351 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2351:70: error: template argument 1 is invalid
|  2351 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_TO_IMAGE_COPY> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2356:31: error: 'VkImageToMemoryCopy' was not declared in this scope; did you mean 'VkImageToMemoryCopyEXT'?
|  2356 | template <> struct LvlTypeMap<VkImageToMemoryCopy> {
|       |                               ^~~~~~~~~~~~~~~~~~~
|       |                               VkImageToMemoryCopyEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2356:50: error: template argument 1 is invalid
|  2356 | template <> struct LvlTypeMap<VkImageToMemoryCopy> {
|       |                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2360:32: error: 'VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY_EXT'?
|  2360 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2360:70: error: template argument 1 is invalid
|  2360 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_IMAGE_TO_MEMORY_COPY> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2365:31: error: 'VkCopyMemoryToImageInfo' was not declared in this scope; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  2365 | template <> struct LvlTypeMap<VkCopyMemoryToImageInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2365:54: error: template argument 1 is invalid
|  2365 | template <> struct LvlTypeMap<VkCopyMemoryToImageInfo> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2369:32: error: 'VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO_EXT'?
|  2369 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2369:75: error: template argument 1 is invalid
|  2369 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_MEMORY_TO_IMAGE_INFO> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2374:31: error: 'VkCopyImageToMemoryInfo' was not declared in this scope; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  2374 | template <> struct LvlTypeMap<VkCopyImageToMemoryInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2374:54: error: template argument 1 is invalid
|  2374 | template <> struct LvlTypeMap<VkCopyImageToMemoryInfo> {
|       |                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2378:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO_EXT'?
|  2378 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2378:75: error: template argument 1 is invalid
|  2378 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_MEMORY_INFO> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2383:31: error: 'VkCopyImageToImageInfo' was not declared in this scope; did you mean 'VkCopyImageToImageInfoEXT'?
|  2383 | template <> struct LvlTypeMap<VkCopyImageToImageInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2383:53: error: template argument 1 is invalid
|  2383 | template <> struct LvlTypeMap<VkCopyImageToImageInfo> {
|       |                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2387:32: error: 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO_EXT'?
|  2387 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2387:74: error: template argument 1 is invalid
|  2387 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COPY_IMAGE_TO_IMAGE_INFO> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2392:31: error: 'VkHostImageLayoutTransitionInfo' was not declared in this scope; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  2392 | template <> struct LvlTypeMap<VkHostImageLayoutTransitionInfo> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2392:62: error: template argument 1 is invalid
|  2392 | template <> struct LvlTypeMap<VkHostImageLayoutTransitionInfo> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2396:32: error: 'VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO_EXT'?
|  2396 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2396:83: error: template argument 1 is invalid
|  2396 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_LAYOUT_TRANSITION_INFO> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2401:31: error: 'VkSubresourceHostMemcpySize' was not declared in this scope; did you mean 'VkSubresourceHostMemcpySizeEXT'?
|  2401 | template <> struct LvlTypeMap<VkSubresourceHostMemcpySize> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkSubresourceHostMemcpySizeEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2401:58: error: template argument 1 is invalid
|  2401 | template <> struct LvlTypeMap<VkSubresourceHostMemcpySize> {
|       |                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2405:32: error: 'VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE_EXT'?
|  2405 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2405:78: error: template argument 1 is invalid
|  2405 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_SUBRESOURCE_HOST_MEMCPY_SIZE> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2410:31: error: 'VkHostImageCopyDevicePerformanceQuery' was not declared in this scope; did you mean 'VkHostImageCopyDevicePerformanceQueryEXT'?
|  2410 | template <> struct LvlTypeMap<VkHostImageCopyDevicePerformanceQuery> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkHostImageCopyDevicePerformanceQueryEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2410:68: error: template argument 1 is invalid
|  2410 | template <> struct LvlTypeMap<VkHostImageCopyDevicePerformanceQuery> {
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2414:32: error: 'VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY_EXT'?
|  2414 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:2414:90: error: template argument 1 is invalid
|  2414 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:3996:31: error: 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  3996 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeAV1FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:3996:72: error: template argument 1 is invalid
|  3996 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeAV1FeaturesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4000:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  4000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4000:95: error: template argument 1 is invalid
|  4000 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4005:31: error: 'VkVideoEncodeAV1CapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1CapabilitiesKHR'?
|  4005 | template <> struct LvlTypeMap<VkVideoEncodeAV1CapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4005:62: error: template argument 1 is invalid
|  4005 | template <> struct LvlTypeMap<VkVideoEncodeAV1CapabilitiesKHR> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4009:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  4009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4009:83: error: template argument 1 is invalid
|  4009 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4014:31: error: 'VkVideoEncodeAV1QualityLevelPropertiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeQualityLevelPropertiesKHR'?
|  4014 | template <> struct LvlTypeMap<VkVideoEncodeAV1QualityLevelPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeQualityLevelPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4014:72: error: template argument 1 is invalid
|  4014 | template <> struct LvlTypeMap<VkVideoEncodeAV1QualityLevelPropertiesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4018:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUALITY_LEVEL_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR'?
|  4018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUALITY_LEVEL_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4018:95: error: template argument 1 is invalid
|  4018 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUALITY_LEVEL_PROPERTIES_KHR> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4023:31: error: 'VkVideoEncodeAV1SessionCreateInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265SessionCreateInfoKHR'?
|  4023 | template <> struct LvlTypeMap<VkVideoEncodeAV1SessionCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265SessionCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4023:67: error: template argument 1 is invalid
|  4023 | template <> struct LvlTypeMap<VkVideoEncodeAV1SessionCreateInfoKHR> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4027:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_CREATE_INFO_KHR'?
|  4027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4027:90: error: template argument 1 is invalid
|  4027 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_CREATE_INFO_KHR> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4032:31: error: 'VkVideoEncodeAV1SessionParametersCreateInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1SessionParametersCreateInfoKHR'?
|  4032 | template <> struct LvlTypeMap<VkVideoEncodeAV1SessionParametersCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1SessionParametersCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4032:77: error: template argument 1 is invalid
|  4032 | template <> struct LvlTypeMap<VkVideoEncodeAV1SessionParametersCreateInfoKHR> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4036:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR'?
|  4036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4036:101: error: template argument 1 is invalid
|  4036 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4041:31: error: 'VkVideoEncodeAV1PictureInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1PictureInfoKHR'?
|  4041 | template <> struct LvlTypeMap<VkVideoEncodeAV1PictureInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1PictureInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4041:61: error: template argument 1 is invalid
|  4041 | template <> struct LvlTypeMap<VkVideoEncodeAV1PictureInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4045:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PICTURE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR'?
|  4045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PICTURE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PICTURE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4045:83: error: template argument 1 is invalid
|  4045 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PICTURE_INFO_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4050:31: error: 'VkVideoEncodeAV1DpbSlotInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1DpbSlotInfoKHR'?
|  4050 | template <> struct LvlTypeMap<VkVideoEncodeAV1DpbSlotInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1DpbSlotInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4050:61: error: template argument 1 is invalid
|  4050 | template <> struct LvlTypeMap<VkVideoEncodeAV1DpbSlotInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4054:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_DPB_SLOT_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR'?
|  4054 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_DPB_SLOT_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4054:84: error: template argument 1 is invalid
|  4054 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_DPB_SLOT_INFO_KHR> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4059:31: error: 'VkVideoEncodeAV1ProfileInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  4059 | template <> struct LvlTypeMap<VkVideoEncodeAV1ProfileInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4059:61: error: template argument 1 is invalid
|  4059 | template <> struct LvlTypeMap<VkVideoEncodeAV1ProfileInfoKHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4063:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  4063 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4063:83: error: template argument 1 is invalid
|  4063 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4068:31: error: 'VkVideoEncodeAV1GopRemainingFrameInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265GopRemainingFrameInfoKHR'?
|  4068 | template <> struct LvlTypeMap<VkVideoEncodeAV1GopRemainingFrameInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265GopRemainingFrameInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4068:71: error: template argument 1 is invalid
|  4068 | template <> struct LvlTypeMap<VkVideoEncodeAV1GopRemainingFrameInfoKHR> {
|       |                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4072:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_GOP_REMAINING_FRAME_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_GOP_REMAINING_FRAME_INFO_KHR'?
|  4072 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_GOP_REMAINING_FRAME_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_GOP_REMAINING_FRAME_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4072:95: error: template argument 1 is invalid
|  4072 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_GOP_REMAINING_FRAME_INFO_KHR> {
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4077:31: error: 'VkVideoEncodeAV1RateControlInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeRateControlInfoKHR'?
|  4077 | template <> struct LvlTypeMap<VkVideoEncodeAV1RateControlInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeRateControlInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4077:65: error: template argument 1 is invalid
|  4077 | template <> struct LvlTypeMap<VkVideoEncodeAV1RateControlInfoKHR> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4081:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_INFO_KHR'?
|  4081 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4081:88: error: template argument 1 is invalid
|  4081 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_INFO_KHR> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4086:31: error: 'VkVideoEncodeAV1RateControlLayerInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeRateControlLayerInfoKHR'?
|  4086 | template <> struct LvlTypeMap<VkVideoEncodeAV1RateControlLayerInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeRateControlLayerInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4086:70: error: template argument 1 is invalid
|  4086 | template <> struct LvlTypeMap<VkVideoEncodeAV1RateControlLayerInfoKHR> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4090:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_LAYER_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_LAYER_INFO_KHR'?
|  4090 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_LAYER_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_RATE_CONTROL_LAYER_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4090:94: error: template argument 1 is invalid
|  4090 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_RATE_CONTROL_LAYER_INFO_KHR> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4140:31: error: 'VkVideoEncodeQuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  4140 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4140:74: error: template argument 1 is invalid
|  4140 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapCapabilitiesKHR> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4144:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  4144 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4144:96: error: template argument 1 is invalid
|  4144 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4149:31: error: 'VkVideoFormatQuantizationMapPropertiesKHR' was not declared in this scope
|  4149 | template <> struct LvlTypeMap<VkVideoFormatQuantizationMapPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4149:72: error: template argument 1 is invalid
|  4149 | template <> struct LvlTypeMap<VkVideoFormatQuantizationMapPropertiesKHR> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4153:32: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  4153 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4153:94: error: template argument 1 is invalid
|  4153 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4158:31: error: 'VkVideoEncodeQuantizationMapInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeQualityLevelInfoKHR'?
|  4158 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeQualityLevelInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4158:66: error: template argument 1 is invalid
|  4158 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapInfoKHR> {
|       |                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4162:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR'?
|  4162 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4162:88: error: template argument 1 is invalid
|  4162 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_INFO_KHR> {
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4167:31: error: 'VkVideoEncodeQuantizationMapSessionParametersCreateInfoKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265SessionParametersCreateInfoKHR'?
|  4167 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapSessionParametersCreateInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265SessionParametersCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4167:89: error: template argument 1 is invalid
|  4167 | template <> struct LvlTypeMap<VkVideoEncodeQuantizationMapSessionParametersCreateInfoKHR> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4171:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_SESSION_PARAMETERS_CREATE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR'?
|  4171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4171:114: error: template argument 1 is invalid
|  4171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_SESSION_PARAMETERS_CREATE_INFO_KHR> {
|       |                                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4176:31: error: 'VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceSynchronization2FeaturesKHR'?
|  4176 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceSynchronization2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4176:84: error: template argument 1 is invalid
|  4176 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4180:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR'?
|  4180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4180:108: error: template argument 1 is invalid
|  4180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR> {
|       |                                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4185:31: error: 'VkVideoEncodeH264QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH264CapabilitiesKHR'?
|  4185 | template <> struct LvlTypeMap<VkVideoEncodeH264QuantizationMapCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4185:78: error: template argument 1 is invalid
|  4185 | template <> struct LvlTypeMap<VkVideoEncodeH264QuantizationMapCapabilitiesKHR> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4189:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR'?
|  4189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4189:101: error: template argument 1 is invalid
|  4189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4194:31: error: 'VkVideoEncodeH265QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  4194 | template <> struct LvlTypeMap<VkVideoEncodeH265QuantizationMapCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4194:78: error: template argument 1 is invalid
|  4194 | template <> struct LvlTypeMap<VkVideoEncodeH265QuantizationMapCapabilitiesKHR> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4198:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  4198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4198:101: error: template argument 1 is invalid
|  4198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4203:31: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' was not declared in this scope
|  4203 | template <> struct LvlTypeMap<VkVideoFormatH265QuantizationMapPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4203:76: error: template argument 1 is invalid
|  4203 | template <> struct LvlTypeMap<VkVideoFormatH265QuantizationMapPropertiesKHR> {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4207:32: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  4207 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4207:99: error: template argument 1 is invalid
|  4207 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4212:31: error: 'VkVideoEncodeAV1QuantizationMapCapabilitiesKHR' was not declared in this scope
|  4212 | template <> struct LvlTypeMap<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4212:77: error: template argument 1 is invalid
|  4212 | template <> struct LvlTypeMap<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4216:32: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  4216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4216:100: error: template argument 1 is invalid
|  4216 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR> {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4221:31: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' was not declared in this scope
|  4221 | template <> struct LvlTypeMap<VkVideoFormatAV1QuantizationMapPropertiesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4221:75: error: template argument 1 is invalid
|  4221 | template <> struct LvlTypeMap<VkVideoFormatAV1QuantizationMapPropertiesKHR> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4225:32: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  4225 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4225:98: error: template argument 1 is invalid
|  4225 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4284:31: error: 'VkPhysicalDeviceMaintenance8FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceMaintenance7FeaturesKHR'?
|  4284 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance8FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMaintenance7FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4284:70: error: template argument 1 is invalid
|  4284 | template <> struct LvlTypeMap<VkPhysicalDeviceMaintenance8FeaturesKHR> {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4288:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR'?
|  4288 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4288:92: error: template argument 1 is invalid
|  4288 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR> {
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4293:31: error: 'VkMemoryBarrierAccessFlags3KHR' was not declared in this scope
|  4293 | template <> struct LvlTypeMap<VkMemoryBarrierAccessFlags3KHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4293:61: error: template argument 1 is invalid
|  4293 | template <> struct LvlTypeMap<VkMemoryBarrierAccessFlags3KHR> {
|       |                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4297:32: error: 'VK_STRUCTURE_TYPE_MEMORY_BARRIER_ACCESS_FLAGS_3_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_MEMORY_BARRIER_2_KHR'?
|  4297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_BARRIER_ACCESS_FLAGS_3_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_MEMORY_BARRIER_2_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4297:83: error: template argument 1 is invalid
|  4297 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_MEMORY_BARRIER_ACCESS_FLAGS_3_KHR> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4302:31: error: 'VkPhysicalDeviceVideoMaintenance2FeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  4302 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoMaintenance2FeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4302:75: error: template argument 1 is invalid
|  4302 | template <> struct LvlTypeMap<VkPhysicalDeviceVideoMaintenance2FeaturesKHR> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4306:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  4306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4306:98: error: template argument 1 is invalid
|  4306 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4311:31: error: 'VkVideoDecodeH264InlineSessionParametersInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeH264SessionParametersAddInfoKHR'?
|  4311 | template <> struct LvlTypeMap<VkVideoDecodeH264InlineSessionParametersInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH264SessionParametersAddInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4311:78: error: template argument 1 is invalid
|  4311 | template <> struct LvlTypeMap<VkVideoDecodeH264InlineSessionParametersInfoKHR> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4315:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_INLINE_SESSION_PARAMETERS_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_SESSION_PARAMETERS_ADD_INFO_KHR'?
|  4315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_INLINE_SESSION_PARAMETERS_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_SESSION_PARAMETERS_ADD_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4315:102: error: template argument 1 is invalid
|  4315 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_H264_INLINE_SESSION_PARAMETERS_INFO_KHR> {
|       |                                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4320:31: error: 'VkVideoDecodeH265InlineSessionParametersInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeH265SessionParametersAddInfoKHR'?
|  4320 | template <> struct LvlTypeMap<VkVideoDecodeH265InlineSessionParametersInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH265SessionParametersAddInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4320:78: error: template argument 1 is invalid
|  4320 | template <> struct LvlTypeMap<VkVideoDecodeH265InlineSessionParametersInfoKHR> {
|       |                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4324:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_INLINE_SESSION_PARAMETERS_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR'?
|  4324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_INLINE_SESSION_PARAMETERS_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4324:102: error: template argument 1 is invalid
|  4324 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_INLINE_SESSION_PARAMETERS_INFO_KHR> {
|       |                                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4329:31: error: 'VkVideoDecodeAV1InlineSessionParametersInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeH265SessionParametersAddInfoKHR'?
|  4329 | template <> struct LvlTypeMap<VkVideoDecodeAV1InlineSessionParametersInfoKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoDecodeH265SessionParametersAddInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4329:77: error: template argument 1 is invalid
|  4329 | template <> struct LvlTypeMap<VkVideoDecodeAV1InlineSessionParametersInfoKHR> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4333:32: error: 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_INLINE_SESSION_PARAMETERS_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR'?
|  4333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_INLINE_SESSION_PARAMETERS_INFO_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_VIDEO_DECODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4333:101: error: template argument 1 is invalid
|  4333 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_INLINE_SESSION_PARAMETERS_INFO_KHR> {
|       |                                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4338:31: error: 'VkPhysicalDeviceDepthClampZeroOneFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT'?
|  4338 | template <> struct LvlTypeMap<VkPhysicalDeviceDepthClampZeroOneFeaturesKHR> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceDepthClampZeroOneFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4338:75: error: template argument 1 is invalid
|  4338 | template <> struct LvlTypeMap<VkPhysicalDeviceDepthClampZeroOneFeaturesKHR> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4342:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT'?
|  4342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4342:99: error: template argument 1 is invalid
|  4342 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR> {
|       |                                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4455:31: error: 'VkCuModuleTexturingModeCreateInfoNVX' was not declared in this scope
|  4455 | template <> struct LvlTypeMap<VkCuModuleTexturingModeCreateInfoNVX> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4455:67: error: template argument 1 is invalid
|  4455 | template <> struct LvlTypeMap<VkCuModuleTexturingModeCreateInfoNVX> {
|       |                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4459:32: error: 'VK_STRUCTURE_TYPE_CU_MODULE_TEXTURING_MODE_CREATE_INFO_NVX' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX'?
|  4459 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CU_MODULE_TEXTURING_MODE_CREATE_INFO_NVX> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_CU_MODULE_CREATE_INFO_NVX
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:4459:90: error: template argument 1 is invalid
|  4459 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CU_MODULE_TEXTURING_MODE_CREATE_INFO_NVX> {
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:6935:31: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  6935 | template <> struct LvlTypeMap<VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:6935:84: error: template argument 1 is invalid
|  6935 | template <> struct LvlTypeMap<VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT> {
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:6939:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  6939 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:6939:109: error: template argument 1 is invalid
|  6939 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT> {
|       |                                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7738:31: error: 'VkPhysicalDeviceRayTracingLinearSweptSpheresFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceRayTracingInvocationReorderFeaturesNV'?
|  7738 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingLinearSweptSpheresFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceRayTracingInvocationReorderFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7738:85: error: template argument 1 is invalid
|  7738 | template <> struct LvlTypeMap<VkPhysicalDeviceRayTracingLinearSweptSpheresFeaturesNV> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7742:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_LINEAR_SWEPT_SPHERES_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_INVOCATION_REORDER_FEATURES_NV'?
|  7742 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_LINEAR_SWEPT_SPHERES_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_INVOCATION_REORDER_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7742:110: error: template argument 1 is invalid
|  7742 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_RAY_TRACING_LINEAR_SWEPT_SPHERES_FEATURES_NV> {
|       |                                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7747:31: error: 'VkAccelerationStructureGeometryLinearSweptSpheresDataNV' was not declared in this scope; did you mean 'VkAccelerationStructureGeometryMotionTrianglesDataNV'?
|  7747 | template <> struct LvlTypeMap<VkAccelerationStructureGeometryLinearSweptSpheresDataNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureGeometryMotionTrianglesDataNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7747:86: error: template argument 1 is invalid
|  7747 | template <> struct LvlTypeMap<VkAccelerationStructureGeometryLinearSweptSpheresDataNV> {
|       |                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7751:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_LINEAR_SWEPT_SPHERES_DATA_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_MOTION_TRIANGLES_DATA_NV'?
|  7751 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_LINEAR_SWEPT_SPHERES_DATA_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_MOTION_TRIANGLES_DATA_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7751:110: error: template argument 1 is invalid
|  7751 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_LINEAR_SWEPT_SPHERES_DATA_NV> {
|       |                                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7756:31: error: 'VkAccelerationStructureGeometrySpheresDataNV' was not declared in this scope; did you mean 'VkAccelerationStructureGeometryAabbsDataKHR'?
|  7756 | template <> struct LvlTypeMap<VkAccelerationStructureGeometrySpheresDataNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureGeometryAabbsDataKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7756:75: error: template argument 1 is invalid
|  7756 | template <> struct LvlTypeMap<VkAccelerationStructureGeometrySpheresDataNV> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7760:32: error: 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_SPHERES_DATA_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR'?
|  7760 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_SPHERES_DATA_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:7760:97: error: template argument 1 is invalid
|  7760 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_GEOMETRY_SPHERES_DATA_NV> {
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8167:31: error: 'VkPhysicalDeviceCooperativeVectorPropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  8167 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeVectorPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8167:76: error: template argument 1 is invalid
|  8167 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeVectorPropertiesNV> {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8171:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_VECTOR_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  8171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_VECTOR_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8171:98: error: template argument 1 is invalid
|  8171 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_VECTOR_PROPERTIES_NV> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8176:31: error: 'VkPhysicalDeviceCooperativeVectorFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixFeaturesNV'?
|  8176 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeVectorFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCooperativeMatrixFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8176:74: error: template argument 1 is invalid
|  8176 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeVectorFeaturesNV> {
|       |                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8180:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_VECTOR_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV'?
|  8180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_VECTOR_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8180:96: error: template argument 1 is invalid
|  8180 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_VECTOR_FEATURES_NV> {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8185:31: error: 'VkCooperativeVectorPropertiesNV' was not declared in this scope; did you mean 'VkCooperativeMatrixPropertiesNV'?
|  8185 | template <> struct LvlTypeMap<VkCooperativeVectorPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8185:62: error: template argument 1 is invalid
|  8185 | template <> struct LvlTypeMap<VkCooperativeVectorPropertiesNV> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8189:32: error: 'VK_STRUCTURE_TYPE_COOPERATIVE_VECTOR_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  8189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COOPERATIVE_VECTOR_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8189:82: error: template argument 1 is invalid
|  8189 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COOPERATIVE_VECTOR_PROPERTIES_NV> {
|       |                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8194:31: error: 'VkConvertCooperativeVectorMatrixInfoNV' was not declared in this scope
|  8194 | template <> struct LvlTypeMap<VkConvertCooperativeVectorMatrixInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8194:69: error: template argument 1 is invalid
|  8194 | template <> struct LvlTypeMap<VkConvertCooperativeVectorMatrixInfoNV> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8198:32: error: 'VK_STRUCTURE_TYPE_CONVERT_COOPERATIVE_VECTOR_MATRIX_INFO_NV' was not declared in this scope
|  8198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CONVERT_COOPERATIVE_VECTOR_MATRIX_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8198:91: error: template argument 1 is invalid
|  8198 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CONVERT_COOPERATIVE_VECTOR_MATRIX_INFO_NV> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8555:31: error: 'VkDisplaySurfaceStereoCreateInfoNV' was not declared in this scope; did you mean 'VkDisplaySurfaceCreateInfoKHR'?
|  8555 | template <> struct LvlTypeMap<VkDisplaySurfaceStereoCreateInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDisplaySurfaceCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8555:65: error: template argument 1 is invalid
|  8555 | template <> struct LvlTypeMap<VkDisplaySurfaceStereoCreateInfoNV> {
|       |                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8559:32: error: 'VK_STRUCTURE_TYPE_DISPLAY_SURFACE_STEREO_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR'?
|  8559 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DISPLAY_SURFACE_STEREO_CREATE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_SURFACE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8559:87: error: template argument 1 is invalid
|  8559 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DISPLAY_SURFACE_STEREO_CREATE_INFO_NV> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8564:31: error: 'VkDisplayModeStereoPropertiesNV' was not declared in this scope; did you mean 'VkDisplayModePropertiesKHR'?
|  8564 | template <> struct LvlTypeMap<VkDisplayModeStereoPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkDisplayModePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8564:62: error: template argument 1 is invalid
|  8564 | template <> struct LvlTypeMap<VkDisplayModeStereoPropertiesNV> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8568:32: error: 'VK_STRUCTURE_TYPE_DISPLAY_MODE_STEREO_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR'?
|  8568 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DISPLAY_MODE_STEREO_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_DISPLAY_MODE_PROPERTIES_2_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8568:83: error: template argument 1 is invalid
|  8568 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_DISPLAY_MODE_STEREO_PROPERTIES_NV> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8618:31: error: 'VkPhysicalDeviceClusterAccelerationStructureFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceAccelerationStructureFeaturesKHR'?
|  8618 | template <> struct LvlTypeMap<VkPhysicalDeviceClusterAccelerationStructureFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceAccelerationStructureFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8618:85: error: template argument 1 is invalid
|  8618 | template <> struct LvlTypeMap<VkPhysicalDeviceClusterAccelerationStructureFeaturesNV> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8622:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR'?
|  8622 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8622:108: error: template argument 1 is invalid
|  8622 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_FEATURES_NV> {
|       |                                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8627:31: error: 'VkPhysicalDeviceClusterAccelerationStructurePropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceAccelerationStructurePropertiesKHR'?
|  8627 | template <> struct LvlTypeMap<VkPhysicalDeviceClusterAccelerationStructurePropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceAccelerationStructurePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8627:87: error: template argument 1 is invalid
|  8627 | template <> struct LvlTypeMap<VkPhysicalDeviceClusterAccelerationStructurePropertiesNV> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8631:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR'?
|  8631 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8631:110: error: template argument 1 is invalid
|  8631 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_PROPERTIES_NV> {
|       |                                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8636:31: error: 'VkClusterAccelerationStructureClustersBottomLevelInputNV' was not declared in this scope
|  8636 | template <> struct LvlTypeMap<VkClusterAccelerationStructureClustersBottomLevelInputNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8636:87: error: template argument 1 is invalid
|  8636 | template <> struct LvlTypeMap<VkClusterAccelerationStructureClustersBottomLevelInputNV> {
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8640:32: error: 'VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_CLUSTERS_BOTTOM_LEVEL_INPUT_NV' was not declared in this scope
|  8640 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_CLUSTERS_BOTTOM_LEVEL_INPUT_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8640:111: error: template argument 1 is invalid
|  8640 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_CLUSTERS_BOTTOM_LEVEL_INPUT_NV> {
|       |                                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8645:31: error: 'VkClusterAccelerationStructureTriangleClusterInputNV' was not declared in this scope
|  8645 | template <> struct LvlTypeMap<VkClusterAccelerationStructureTriangleClusterInputNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8645:83: error: template argument 1 is invalid
|  8645 | template <> struct LvlTypeMap<VkClusterAccelerationStructureTriangleClusterInputNV> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8649:32: error: 'VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_TRIANGLE_CLUSTER_INPUT_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV'?
|  8649 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_TRIANGLE_CLUSTER_INPUT_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_CREATE_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8649:106: error: template argument 1 is invalid
|  8649 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_TRIANGLE_CLUSTER_INPUT_NV> {
|       |                                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8654:31: error: 'VkClusterAccelerationStructureMoveObjectsInputNV' was not declared in this scope
|  8654 | template <> struct LvlTypeMap<VkClusterAccelerationStructureMoveObjectsInputNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8654:79: error: template argument 1 is invalid
|  8654 | template <> struct LvlTypeMap<VkClusterAccelerationStructureMoveObjectsInputNV> {
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8658:32: error: 'VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_MOVE_OBJECTS_INPUT_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV'?
|  8658 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_MOVE_OBJECTS_INPUT_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8658:102: error: template argument 1 is invalid
|  8658 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_MOVE_OBJECTS_INPUT_NV> {
|       |                                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8663:31: error: 'VkClusterAccelerationStructureInputInfoNV' was not declared in this scope; did you mean 'VkAccelerationStructureInstanceNV'?
|  8663 | template <> struct LvlTypeMap<VkClusterAccelerationStructureInputInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureInstanceNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8663:72: error: template argument 1 is invalid
|  8663 | template <> struct LvlTypeMap<VkClusterAccelerationStructureInputInfoNV> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8667:32: error: 'VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_INPUT_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV'?
|  8667 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_INPUT_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8667:94: error: template argument 1 is invalid
|  8667 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_INPUT_INFO_NV> {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8672:31: error: 'VkClusterAccelerationStructureCommandsInfoNV' was not declared in this scope; did you mean 'VkAccelerationStructureMotionInfoNV'?
|  8672 | template <> struct LvlTypeMap<VkClusterAccelerationStructureCommandsInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureMotionInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8672:75: error: template argument 1 is invalid
|  8672 | template <> struct LvlTypeMap<VkClusterAccelerationStructureCommandsInfoNV> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8676:32: error: 'VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_COMMANDS_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV'?
|  8676 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_COMMANDS_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8676:97: error: template argument 1 is invalid
|  8676 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_CLUSTER_ACCELERATION_STRUCTURE_COMMANDS_INFO_NV> {
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8690:31: error: 'VkRayTracingPipelineClusterAccelerationStructureCreateInfoNV' was not declared in this scope
|  8690 | template <> struct LvlTypeMap<VkRayTracingPipelineClusterAccelerationStructureCreateInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8690:91: error: template argument 1 is invalid
|  8690 | template <> struct LvlTypeMap<VkRayTracingPipelineClusterAccelerationStructureCreateInfoNV> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8694:32: error: 'VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CLUSTER_ACCELERATION_STRUCTURE_CREATE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR'?
|  8694 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CLUSTER_ACCELERATION_STRUCTURE_CREATE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8694:116: error: template argument 1 is invalid
|  8694 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_RAY_TRACING_PIPELINE_CLUSTER_ACCELERATION_STRUCTURE_CREATE_INFO_NV> {
|       |                                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8699:31: error: 'VkPhysicalDevicePartitionedAccelerationStructureFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceAccelerationStructureFeaturesKHR'?
|  8699 | template <> struct LvlTypeMap<VkPhysicalDevicePartitionedAccelerationStructureFeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceAccelerationStructureFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8699:89: error: template argument 1 is invalid
|  8699 | template <> struct LvlTypeMap<VkPhysicalDevicePartitionedAccelerationStructureFeaturesNV> {
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8703:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR'?
|  8703 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8703:112: error: template argument 1 is invalid
|  8703 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_FEATURES_NV> {
|       |                                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8708:31: error: 'VkPhysicalDevicePartitionedAccelerationStructurePropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceAccelerationStructurePropertiesKHR'?
|  8708 | template <> struct LvlTypeMap<VkPhysicalDevicePartitionedAccelerationStructurePropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceAccelerationStructurePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8708:91: error: template argument 1 is invalid
|  8708 | template <> struct LvlTypeMap<VkPhysicalDevicePartitionedAccelerationStructurePropertiesNV> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8712:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR'?
|  8712 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8712:114: error: template argument 1 is invalid
|  8712 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_PROPERTIES_NV> {
|       |                                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8717:31: error: 'VkPartitionedAccelerationStructureFlagsNV' was not declared in this scope; did you mean 'VkBuildAccelerationStructureFlagsNV'?
|  8717 | template <> struct LvlTypeMap<VkPartitionedAccelerationStructureFlagsNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkBuildAccelerationStructureFlagsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8717:72: error: template argument 1 is invalid
|  8717 | template <> struct LvlTypeMap<VkPartitionedAccelerationStructureFlagsNV> {
|       |                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8721:32: error: 'VK_STRUCTURE_TYPE_PARTITIONED_ACCELERATION_STRUCTURE_FLAGS_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_INFO_NV'?
|  8721 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PARTITIONED_ACCELERATION_STRUCTURE_FLAGS_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_ACCELERATION_STRUCTURE_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8721:93: error: template argument 1 is invalid
|  8721 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PARTITIONED_ACCELERATION_STRUCTURE_FLAGS_NV> {
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8726:31: error: 'VkWriteDescriptorSetPartitionedAccelerationStructureNV' was not declared in this scope; did you mean 'VkWriteDescriptorSetAccelerationStructureNV'?
|  8726 | template <> struct LvlTypeMap<VkWriteDescriptorSetPartitionedAccelerationStructureNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkWriteDescriptorSetAccelerationStructureNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8726:85: error: template argument 1 is invalid
|  8726 | template <> struct LvlTypeMap<VkWriteDescriptorSetPartitionedAccelerationStructureNV> {
|       |                                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8730:32: error: 'VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_PARTITIONED_ACCELERATION_STRUCTURE_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV'?
|  8730 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_PARTITIONED_ACCELERATION_STRUCTURE_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8730:108: error: template argument 1 is invalid
|  8730 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET_PARTITIONED_ACCELERATION_STRUCTURE_NV> {
|       |                                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8735:31: error: 'VkPartitionedAccelerationStructureInstancesInputNV' was not declared in this scope; did you mean 'VkAccelerationStructureInstanceNV'?
|  8735 | template <> struct LvlTypeMap<VkPartitionedAccelerationStructureInstancesInputNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkAccelerationStructureInstanceNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8735:81: error: template argument 1 is invalid
|  8735 | template <> struct LvlTypeMap<VkPartitionedAccelerationStructureInstancesInputNV> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8739:32: error: 'VK_STRUCTURE_TYPE_PARTITIONED_ACCELERATION_STRUCTURE_INSTANCES_INPUT_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV'?
|  8739 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PARTITIONED_ACCELERATION_STRUCTURE_INSTANCES_INPUT_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8739:103: error: template argument 1 is invalid
|  8739 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PARTITIONED_ACCELERATION_STRUCTURE_INSTANCES_INPUT_NV> {
|       |                                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8744:31: error: 'VkBuildPartitionedAccelerationStructureInfoNV' was not declared in this scope
|  8744 | template <> struct LvlTypeMap<VkBuildPartitionedAccelerationStructureInfoNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8744:76: error: template argument 1 is invalid
|  8744 | template <> struct LvlTypeMap<VkBuildPartitionedAccelerationStructureInfoNV> {
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8748:32: error: 'VK_STRUCTURE_TYPE_BUILD_PARTITIONED_ACCELERATION_STRUCTURE_INFO_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR'?
|  8748 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUILD_PARTITIONED_ACCELERATION_STRUCTURE_INFO_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8748:98: error: template argument 1 is invalid
|  8748 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_BUILD_PARTITIONED_ACCELERATION_STRUCTURE_INFO_NV> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8924:31: error: 'VkPhysicalDeviceHdrVividFeaturesHUAWEI' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiviewFeaturesKHR'?
|  8924 | template <> struct LvlTypeMap<VkPhysicalDeviceHdrVividFeaturesHUAWEI> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceMultiviewFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8924:69: error: template argument 1 is invalid
|  8924 | template <> struct LvlTypeMap<VkPhysicalDeviceHdrVividFeaturesHUAWEI> {
|       |                                                                     ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8928:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HDR_VIVID_FEATURES_HUAWEI' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI'?
|  8928 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HDR_VIVID_FEATURES_HUAWEI> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8928:91: error: template argument 1 is invalid
|  8928 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HDR_VIVID_FEATURES_HUAWEI> {
|       |                                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8933:31: error: 'VkHdrVividDynamicMetadataHUAWEI' was not declared in this scope
|  8933 | template <> struct LvlTypeMap<VkHdrVividDynamicMetadataHUAWEI> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8933:62: error: template argument 1 is invalid
|  8933 | template <> struct LvlTypeMap<VkHdrVividDynamicMetadataHUAWEI> {
|       |                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8937:32: error: 'VK_STRUCTURE_TYPE_HDR_VIVID_DYNAMIC_METADATA_HUAWEI' was not declared in this scope
|  8937 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HDR_VIVID_DYNAMIC_METADATA_HUAWEI> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8937:83: error: template argument 1 is invalid
|  8937 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_HDR_VIVID_DYNAMIC_METADATA_HUAWEI> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8942:31: error: 'VkCooperativeMatrixFlexibleDimensionsPropertiesNV' was not declared in this scope
|  8942 | template <> struct LvlTypeMap<VkCooperativeMatrixFlexibleDimensionsPropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8942:80: error: template argument 1 is invalid
|  8942 | template <> struct LvlTypeMap<VkCooperativeMatrixFlexibleDimensionsPropertiesNV> {
|       |                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8946:32: error: 'VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_FLEXIBLE_DIMENSIONS_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  8946 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_FLEXIBLE_DIMENSIONS_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8946:102: error: template argument 1 is invalid
|  8946 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_COOPERATIVE_MATRIX_FLEXIBLE_DIMENSIONS_PROPERTIES_NV> {
|       |                                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8951:31: error: 'VkPhysicalDeviceCooperativeMatrix2FeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixFeaturesNV'?
|  8951 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrix2FeaturesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCooperativeMatrixFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8951:75: error: template argument 1 is invalid
|  8951 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrix2FeaturesNV> {
|       |                                                                           ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8955:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV'?
|  8955 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_FEATURES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8955:98: error: template argument 1 is invalid
|  8955 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_FEATURES_NV> {
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8960:31: error: 'VkPhysicalDeviceCooperativeMatrix2PropertiesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCooperativeMatrixPropertiesNV'?
|  8960 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrix2PropertiesNV> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceCooperativeMatrixPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8960:77: error: template argument 1 is invalid
|  8960 | template <> struct LvlTypeMap<VkPhysicalDeviceCooperativeMatrix2PropertiesNV> {
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8964:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_PROPERTIES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV'?
|  8964 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_PROPERTIES_NV> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8964:100: error: template argument 1 is invalid
|  8964 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_PROPERTIES_NV> {
|       |                                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8969:31: error: 'VkPhysicalDevicePipelineOpacityMicromapFeaturesARM' was not declared in this scope; did you mean 'VkPhysicalDeviceOpacityMicromapFeaturesEXT'?
|  8969 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineOpacityMicromapFeaturesARM> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceOpacityMicromapFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8969:81: error: template argument 1 is invalid
|  8969 | template <> struct LvlTypeMap<VkPhysicalDevicePipelineOpacityMicromapFeaturesARM> {
|       |                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8973:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_OPACITY_MICROMAP_FEATURES_ARM' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT'?
|  8973 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_OPACITY_MICROMAP_FEATURES_ARM> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:8973:104: error: template argument 1 is invalid
|  8973 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_OPACITY_MICROMAP_FEATURES_ARM> {
|       |                                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9011:31: error: 'VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  9011 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT> {
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9011:83: error: template argument 1 is invalid
|  9011 | template <> struct LvlTypeMap<VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT> {
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9015:32: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  9015 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT> {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9015:106: error: template argument 1 is invalid
|  9015 | template <> struct LvlSTypeMap<VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT> {
|       |                                                                                                          ^
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:25,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/mock_icd.cpp:18:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1640:11: error: 'VkMemoryMapInfo' does not name a type; did you mean 'VkMemoryMapInfoKHR'?
|  1640 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1645:11: error: 'VkMemoryUnmapInfo' does not name a type; did you mean 'VkMemoryUnmapInfoKHR'?
|  1645 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1656:11: error: 'VkRenderingAreaInfo' does not name a type; did you mean 'VkRenderingAreaInfoKHR'?
|  1656 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1661:11: error: 'VkDeviceImageSubresourceInfo' does not name a type; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  1661 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1662:5: error: 'VkSubresourceLayout2' has not been declared
|  1662 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1667:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  1667 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1668:5: error: 'VkSubresourceLayout2' has not been declared
|  1668 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1687:11: error: 'VkRenderingAttachmentLocationInfo' does not name a type; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  1687 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1691:11: error: 'VkRenderingInputAttachmentIndexInfo' does not name a type; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  1691 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1695:11: error: 'VkBindDescriptorSetsInfo' does not name a type; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  1695 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1699:11: error: 'VkPushConstantsInfo' does not name a type; did you mean 'VkPushConstantsInfoKHR'?
|  1699 |     const VkPushConstantsInfo*                  pPushConstantsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1703:11: error: 'VkPushDescriptorSetInfo' does not name a type; did you mean 'VkPushDescriptorSetInfoKHR'?
|  1703 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1707:11: error: 'VkPushDescriptorSetWithTemplateInfo' does not name a type; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  1707 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1711:11: error: 'VkCopyMemoryToImageInfo' does not name a type; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  1711 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1715:11: error: 'VkCopyImageToMemoryInfo' does not name a type; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  1715 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1719:11: error: 'VkCopyImageToImageInfo' does not name a type; did you mean 'VkCopyImageToImageInfoEXT'?
|  1719 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:1724:11: error: 'VkHostImageLayoutTransitionInfo' does not name a type; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  1724 |     const VkHostImageLayoutTransitionInfo*      pTransitions);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2397:11: error: 'VkRenderingAttachmentLocationInfo' does not name a type; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  2397 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2401:11: error: 'VkRenderingInputAttachmentIndexInfo' does not name a type; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  2401 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2473:11: error: 'VkMemoryMapInfo' does not name a type; did you mean 'VkMemoryMapInfoKHR'?
|  2473 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2478:11: error: 'VkMemoryUnmapInfo' does not name a type; did you mean 'VkMemoryUnmapInfoKHR'?
|  2478 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo);
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2599:11: error: 'VkRenderingAreaInfo' does not name a type; did you mean 'VkRenderingAreaInfoKHR'?
|  2599 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2604:11: error: 'VkDeviceImageSubresourceInfo' does not name a type; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  2604 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2605:5: error: 'VkSubresourceLayout2' has not been declared
|  2605 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2610:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  2610 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2611:5: error: 'VkSubresourceLayout2' has not been declared
|  2611 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2680:11: error: 'VkBindDescriptorSetsInfo' does not name a type; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  2680 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2684:11: error: 'VkPushConstantsInfo' does not name a type; did you mean 'VkPushConstantsInfoKHR'?
|  2684 |     const VkPushConstantsInfo*                  pPushConstantsInfo);
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2688:11: error: 'VkPushDescriptorSetInfo' does not name a type; did you mean 'VkPushDescriptorSetInfoKHR'?
|  2688 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:2692:11: error: 'VkPushDescriptorSetWithTemplateInfo' does not name a type; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  2692 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:3644:11: error: 'VkCopyMemoryToImageInfo' does not name a type; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  3644 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:3648:11: error: 'VkCopyImageToMemoryInfo' does not name a type; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  3648 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:3652:11: error: 'VkCopyImageToImageInfo' does not name a type; did you mean 'VkCopyImageToImageInfoEXT'?
|  3652 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:3657:11: error: 'VkHostImageLayoutTransitionInfo' does not name a type; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  3657 |     const VkHostImageLayoutTransitionInfo*      pTransitions);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:3662:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  3662 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:3663:5: error: 'VkSubresourceLayout2' has not been declared
|  3663 |     VkSubresourceLayout2*                       pLayout);
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:4487:5: error: 'VkCooperativeVectorPropertiesNV' has not been declared
|  4487 |     VkCooperativeVectorPropertiesNV*            pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:4491:11: error: 'VkConvertCooperativeVectorMatrixInfoNV' does not name a type
|  4491 |     const VkConvertCooperativeVectorMatrixInfoNV* pInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:4496:11: error: 'VkConvertCooperativeVectorMatrixInfoNV' does not name a type
|  4496 |     const VkConvertCooperativeVectorMatrixInfoNV* pInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:4560:11: error: 'VkClusterAccelerationStructureInputInfoNV' does not name a type; did you mean 'VkAccelerationStructureInstanceNV'?
|  4560 |     const VkClusterAccelerationStructureInputInfoNV* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureInstanceNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:4565:11: error: 'VkClusterAccelerationStructureCommandsInfoNV' does not name a type; did you mean 'VkAccelerationStructureMotionInfoNV'?
|  4565 |     const VkClusterAccelerationStructureCommandsInfoNV* pCommandInfos);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureMotionInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:4570:11: error: 'VkPartitionedAccelerationStructureInstancesInputNV' does not name a type; did you mean 'VkAccelerationStructureInstanceNV'?
|  4570 |     const VkPartitionedAccelerationStructureInstancesInputNV* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureInstanceNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:4575:11: error: 'VkBuildPartitionedAccelerationStructureInfoNV' does not name a type
|  4575 |     const VkBuildPartitionedAccelerationStructureInfoNV* pBuildInfo);
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_declarations.h:4634:5: error: 'VkCooperativeMatrixFlexibleDimensionsPropertiesNV' has not been declared
|  4634 |     VkCooperativeMatrixFlexibleDimensionsPropertiesNV* pProperties);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2351:11: error: 'VkMemoryMapInfo' does not name a type; did you mean 'VkMemoryMapInfoKHR'?
|  2351 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2359:11: error: 'VkMemoryUnmapInfo' does not name a type; did you mean 'VkMemoryUnmapInfoKHR'?
|  2359 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo)
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2376:11: error: 'VkRenderingAreaInfo' does not name a type; did you mean 'VkRenderingAreaInfoKHR'?
|  2376 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2384:11: error: 'VkDeviceImageSubresourceInfo' does not name a type; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  2384 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2385:5: error: 'VkSubresourceLayout2' has not been declared
|  2385 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2393:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  2393 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2394:5: error: 'VkSubresourceLayout2' has not been declared
|  2394 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2422:11: error: 'VkRenderingAttachmentLocationInfo' does not name a type; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  2422 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2429:11: error: 'VkRenderingInputAttachmentIndexInfo' does not name a type; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  2429 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2436:11: error: 'VkBindDescriptorSetsInfo' does not name a type; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  2436 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2443:11: error: 'VkPushConstantsInfo' does not name a type; did you mean 'VkPushConstantsInfoKHR'?
|  2443 |     const VkPushConstantsInfo*                  pPushConstantsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2450:11: error: 'VkPushDescriptorSetInfo' does not name a type; did you mean 'VkPushDescriptorSetInfoKHR'?
|  2450 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2457:11: error: 'VkPushDescriptorSetWithTemplateInfo' does not name a type; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  2457 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2464:11: error: 'VkCopyMemoryToImageInfo' does not name a type; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  2464 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2472:11: error: 'VkCopyImageToMemoryInfo' does not name a type; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  2472 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2480:11: error: 'VkCopyImageToImageInfo' does not name a type; did you mean 'VkCopyImageToImageInfoEXT'?
|  2480 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2489:11: error: 'VkHostImageLayoutTransitionInfo' does not name a type; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  2489 |     const VkHostImageLayoutTransitionInfo*      pTransitions)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::GetPhysicalDeviceVideoCapabilitiesKHR(VkPhysicalDevice, const VkVideoProfileInfoKHR*, VkVideoCapabilitiesKHR*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2912:31: error: 'VkVideoEncodeQuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  2912 |         lvl_find_mod_in_chain<VkVideoEncodeQuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2912:75: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2912 |         lvl_find_mod_in_chain<VkVideoEncodeQuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  9264 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2912:75: error: template argument 1 is invalid
|  2912 |         lvl_find_mod_in_chain<VkVideoEncodeQuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2914:31: error: 'VkVideoEncodeH264QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH264CapabilitiesKHR'?
|  2914 |         lvl_find_mod_in_chain<VkVideoEncodeH264QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2914:79: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2914 |         lvl_find_mod_in_chain<VkVideoEncodeH264QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  9264 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2914:79: error: template argument 1 is invalid
|  2914 |         lvl_find_mod_in_chain<VkVideoEncodeH264QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2916:31: error: 'VkVideoEncodeH265QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  2916 |         lvl_find_mod_in_chain<VkVideoEncodeH265QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                               VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2916:79: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2916 |         lvl_find_mod_in_chain<VkVideoEncodeH265QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  9264 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2916:79: error: template argument 1 is invalid
|  2916 |         lvl_find_mod_in_chain<VkVideoEncodeH265QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2918:31: error: 'VkVideoEncodeAV1QuantizationMapCapabilitiesKHR' was not declared in this scope
|  2918 |         lvl_find_mod_in_chain<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2918:78: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2918 |         lvl_find_mod_in_chain<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  9264 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2918:78: error: template argument 1 is invalid
|  2918 |         lvl_find_mod_in_chain<VkVideoEncodeAV1QuantizationMapCapabilitiesKHR>(pCapabilities->pNext);
|       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2921:50: error: 'VkVideoEncodeAV1CapabilitiesKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1CapabilitiesKHR'?
|  2921 |     auto caps_encode_av1 = lvl_find_mod_in_chain<VkVideoEncodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VkVideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2921:82: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  2921 |     auto caps_encode_av1 = lvl_find_mod_in_chain<VkVideoEncodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  9264 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:2921:82: error: template argument 1 is invalid
|  2921 |     auto caps_encode_av1 = lvl_find_mod_in_chain<VkVideoEncodeAV1CapabilitiesKHR>(pCapabilities->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3074:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  3074 |                                        | VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3075:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  3075 |                                        | VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR;
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3207:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  3207 |                     caps_encode->flags = VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR;
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3250:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  3250 |                     caps_encode->flags = VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR;
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3331:14: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  3331 |         case VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR: {
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3332:46: error: 'VkVideoEncodeAV1ProfileInfoKHR' was not declared in this scope; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  3332 |             auto profile = lvl_find_in_chain<VkVideoEncodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3332:77: error: no matching function for call to 'lvl_find_in_chain<<expression error> >(const void* const&)'
|  3332 |             auto profile = lvl_find_in_chain<VkVideoEncodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9250:32: note: candidate: 'template<class T> const T* lvl_find_in_chain(const void*)'
|  9250 | template <typename T> const T *lvl_find_in_chain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9250:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3332:77: error: template argument 1 is invalid
|  3332 |             auto profile = lvl_find_in_chain<VkVideoEncodeAV1ProfileInfoKHR>(pVideoProfile->pNext);
|       |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3345:64: error: 'VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_EXTENSION_NAME'?
|  3345 |             std::strncpy(caps->stdHeaderVersion.extensionName, VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_EXTENSION_NAME, sizeof(caps->stdHeaderVersion.extensionName));
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3346:55: error: 'VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_SPEC_VERSION' was not declared in this scope; did you mean 'VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_SPEC_VERSION'?
|  3346 |             caps->stdHeaderVersion.specVersion      = VK_STD_VULKAN_VIDEO_CODEC_AV1_ENCODE_SPEC_VERSION;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STD_VULKAN_VIDEO_CODEC_AV1_DECODE_SPEC_VERSION
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3350:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  3350 |                     caps_encode->flags = VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3351:42: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  3351 |                                        | VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR;
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                          VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3359:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_PRIMARY_REFERENCE_CDF_ONLY_BIT_KHR' was not declared in this scope
|  3359 |                     caps_encode_av1->flags = VK_VIDEO_ENCODE_AV1_CAPABILITY_PRIMARY_REFERENCE_CDF_ONLY_BIT_KHR;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3364:56: error: 'VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR'?
|  3364 |                     caps_encode_av1->superblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3402:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_GENERATE_OBU_EXTENSION_HEADER_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H264_CAPABILITY_GENERATE_PREFIX_NALU_BIT_KHR'?
|  3402 |                                            | VK_VIDEO_ENCODE_AV1_CAPABILITY_GENERATE_OBU_EXTENSION_HEADER_BIT_KHR
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_VIDEO_ENCODE_H264_CAPABILITY_GENERATE_PREFIX_NALU_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3403:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_FRAME_SIZE_OVERRIDE_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CAPABILITY_B_FRAME_IN_L1_LIST_BIT_KHR'?
|  3403 |                                            | VK_VIDEO_ENCODE_AV1_CAPABILITY_FRAME_SIZE_OVERRIDE_BIT_KHR;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_VIDEO_ENCODE_H265_CAPABILITY_B_FRAME_IN_L1_LIST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3409:56: error: 'VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_TRANSFORM_BLOCK_SIZE_8_BIT_KHR'?
|  3409 |                                                      | VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_VIDEO_ENCODE_H265_TRANSFORM_BLOCK_SIZE_8_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3450:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CAPABILITY_PER_PICTURE_TYPE_MIN_MAX_QP_BIT_KHR'?
|  3450 |                     caps_encode_av1->flags = VK_VIDEO_ENCODE_AV1_CAPABILITY_PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX_BIT_KHR
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_VIDEO_ENCODE_H265_CAPABILITY_PER_PICTURE_TYPE_MIN_MAX_QP_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3452:46: error: 'VK_VIDEO_ENCODE_AV1_CAPABILITY_MOTION_VECTOR_SCALING_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H264_CAPABILITY_ROW_UNALIGNED_SLICE_BIT_KHR'?
|  3452 |                                            | VK_VIDEO_ENCODE_AV1_CAPABILITY_MOTION_VECTOR_SCALING_BIT_KHR;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_VIDEO_ENCODE_H264_CAPABILITY_ROW_UNALIGNED_SLICE_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3510:9: error: 'VkVideoFormatQuantizationMapPropertiesKHR' does not name a type
|  3510 |         VkVideoFormatQuantizationMapPropertiesKHR props_quantization_map;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3511:9: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' does not name a type
|  3511 |         VkVideoFormatH265QuantizationMapPropertiesKHR props_h265_quantization_map;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3512:9: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' does not name a type
|  3512 |         VkVideoFormatAV1QuantizationMapPropertiesKHR props_av1_quantization_map;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3523:9: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3523 |     fmt.props_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3523:40: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  3523 |     fmt.props_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3524:9: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3524 |     fmt.props_h265_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3524:45: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  3524 |     fmt.props_h265_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3525:9: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3525 |     fmt.props_av1_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3525:44: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  3525 |     fmt.props_av1_quantization_map.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                            VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3574:14: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  3574 |         case VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3627:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  3627 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3628:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3628 |                     fmt.props_quantization_map.quantizationMapTexelSize = {16, 16};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3632:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  3632 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3639:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3639 |                     fmt.props_quantization_map.quantizationMapTexelSize = {16, 16};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3653:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  3653 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3654:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3654 |                     fmt.props_quantization_map.quantizationMapTexelSize = {4, 4};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3655:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3655 |                     fmt.props_h265_quantization_map.compatibleCtbSizes =
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3658:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3658 |                     fmt.props_quantization_map.quantizationMapTexelSize = {8, 8};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3660:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3660 |                     fmt.props_quantization_map.quantizationMapTexelSize = {32, 32};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3662:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3662 |                     fmt.props_quantization_map.quantizationMapTexelSize = {64, 64};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3663:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3663 |                     fmt.props_h265_quantization_map.compatibleCtbSizes = VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3669:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  3669 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3670:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3670 |                     fmt.props_quantization_map.quantizationMapTexelSize = {32, 32};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3671:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3671 |                     fmt.props_h265_quantization_map.compatibleCtbSizes =
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3674:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3674 |                     fmt.props_quantization_map.quantizationMapTexelSize = {64, 64};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3675:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_h265_quantization_map'
|  3675 |                     fmt.props_h265_quantization_map.compatibleCtbSizes = VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3684:14: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  3684 |         case VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3689:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  3689 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3690:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3690 |                     fmt.props_quantization_map.quantizationMapTexelSize = {8, 8};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3691:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3691 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3691:80: error: 'VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR'?
|  3691 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                VK_VIDEO_ENCODE_H265_CTB_SIZE_64_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3695:49: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  3695 |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3696:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3696 |                     fmt.props_quantization_map.quantizationMapTexelSize = {64, 64};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3697:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3697 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3704:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3704 |                     fmt.props_quantization_map.quantizationMapTexelSize = {64, 64};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3705:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3705 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_64_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3707:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3707 |                     fmt.props_quantization_map.quantizationMapTexelSize = {128, 128};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3708:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3708 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3708:80: error: 'VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_TRANSFORM_BLOCK_SIZE_8_BIT_KHR'?
|  3708 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR;
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                VK_VIDEO_ENCODE_H265_TRANSFORM_BLOCK_SIZE_8_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3715:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_quantization_map'
|  3715 |                     fmt.props_quantization_map.quantizationMapTexelSize = {128, 128};
|       |                         ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3716:25: error: 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties' has no member named 'props_av1_quantization_map'
|  3716 |                     fmt.props_av1_quantization_map.compatibleSuperblockSizes = VK_VIDEO_ENCODE_AV1_SUPERBLOCK_SIZE_128_BIT_KHR;
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3741:66: error: 'VkVideoFormatQuantizationMapPropertiesKHR' was not declared in this scope
|  3741 |             auto* props_quantization_map = lvl_find_mod_in_chain<VkVideoFormatQuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3741:108: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  3741 |             auto* props_quantization_map = lvl_find_mod_in_chain<VkVideoFormatQuantizationMapPropertiesKHR>(saved_pNext);
|       |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  9264 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3741:108: error: template argument 1 is invalid
|  3741 |             auto* props_quantization_map = lvl_find_mod_in_chain<VkVideoFormatQuantizationMapPropertiesKHR>(saved_pNext);
|       |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3742:71: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' was not declared in this scope
|  3742 |             auto* props_h265_quantization_map = lvl_find_mod_in_chain<VkVideoFormatH265QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3742:117: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  3742 |             auto* props_h265_quantization_map = lvl_find_mod_in_chain<VkVideoFormatH265QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  9264 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3742:117: error: template argument 1 is invalid
|  3742 |             auto* props_h265_quantization_map = lvl_find_mod_in_chain<VkVideoFormatH265QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3743:70: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' was not declared in this scope
|  3743 |             auto* props_av1_quantization_map = lvl_find_mod_in_chain<VkVideoFormatAV1QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3743:115: error: no matching function for call to 'lvl_find_mod_in_chain<<expression error> >(void*&)'
|  3743 |             auto* props_av1_quantization_map = lvl_find_mod_in_chain<VkVideoFormatAV1QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note: candidate: 'template<class T> T* lvl_find_mod_in_chain(void*)'
|  9264 | template <typename T> T *lvl_find_mod_in_chain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9264:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3743:115: error: template argument 1 is invalid
|  3743 |             auto* props_av1_quantization_map = lvl_find_mod_in_chain<VkVideoFormatAV1QuantizationMapPropertiesKHR>(saved_pNext);
|       |                                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3747:55: error: '__gnu_cxx::__alloc_traits<std::allocator<vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>, vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>::value_type' {aka 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties'} has no member named 'props_quantization_map'
|  3747 |                 *props_quantization_map = filtered[i].props_quantization_map;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3753:60: error: '__gnu_cxx::__alloc_traits<std::allocator<vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>, vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>::value_type' {aka 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties'} has no member named 'props_h265_quantization_map'
|  3753 |                 *props_h265_quantization_map = filtered[i].props_h265_quantization_map;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3759:59: error: '__gnu_cxx::__alloc_traits<std::allocator<vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>, vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties>::value_type' {aka 'struct vkmock::GetPhysicalDeviceVideoFormatPropertiesKHR(VkPhysicalDevice, const VkPhysicalDeviceVideoFormatInfoKHR*, uint32_t*, VkVideoFormatPropertiesKHR*)::VideoFormatProperties'} has no member named 'props_av1_quantization_map'
|  3759 |                 *props_av1_quantization_map = filtered[i].props_av1_quantization_map;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h: In function 'void vkmock::GetPhysicalDeviceQueueFamilyProperties2KHR(VkPhysicalDevice, uint32_t*, VkQueueFamilyProperties2*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4155:53: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  4155 |                                                   | VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4818:11: error: 'VkRenderingAttachmentLocationInfo' does not name a type; did you mean 'VkRenderingAttachmentLocationInfoKHR'?
|  4818 |     const VkRenderingAttachmentLocationInfo*    pLocationInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAttachmentLocationInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4825:11: error: 'VkRenderingInputAttachmentIndexInfo' does not name a type; did you mean 'VkRenderingInputAttachmentIndexInfoKHR'?
|  4825 |     const VkRenderingInputAttachmentIndexInfo*  pInputAttachmentIndexInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkRenderingInputAttachmentIndexInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4947:11: error: 'VkMemoryMapInfo' does not name a type; did you mean 'VkMemoryMapInfoKHR'?
|  4947 |     const VkMemoryMapInfo*                      pMemoryMapInfo,
|       |           ^~~~~~~~~~~~~~~
|       |           VkMemoryMapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::MapMemory2KHR(VkDevice, const int*, void**)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4950:46: error: request for member 'memory' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  4950 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                              ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4950:70: error: request for member 'offset' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  4950 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                      ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4950:94: error: request for member 'size' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  4950 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                                              ^~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4950:116: error: request for member 'flags' in '* pMemoryMapInfo', which is of non-class type 'const int'
|  4950 |     return MapMemory(device, pMemoryMapInfo->memory, pMemoryMapInfo->offset, pMemoryMapInfo->size, pMemoryMapInfo->flags, ppData);
|       |                                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4955:11: error: 'VkMemoryUnmapInfo' does not name a type; did you mean 'VkMemoryUnmapInfoKHR'?
|  4955 |     const VkMemoryUnmapInfo*                    pMemoryUnmapInfo)
|       |           ^~~~~~~~~~~~~~~~~
|       |           VkMemoryUnmapInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h: In function 'VkResult vkmock::UnmapMemory2KHR(VkDevice, const int*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4957:43: error: request for member 'memory' in '* pMemoryUnmapInfo', which is of non-class type 'const int'
|  4957 |     UnmapMemory(device, pMemoryUnmapInfo->memory);
|       |                                           ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5143:11: error: 'VkRenderingAreaInfo' does not name a type; did you mean 'VkRenderingAreaInfoKHR'?
|  5143 |     const VkRenderingAreaInfo*                  pRenderingAreaInfo,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkRenderingAreaInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5151:11: error: 'VkDeviceImageSubresourceInfo' does not name a type; did you mean 'VkDeviceImageSubresourceInfoKHR'?
|  5151 |     const VkDeviceImageSubresourceInfo*         pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkDeviceImageSubresourceInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5152:5: error: 'VkSubresourceLayout2' has not been declared
|  5152 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5160:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  5160 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5161:5: error: 'VkSubresourceLayout2' has not been declared
|  5161 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5291:11: error: 'VkBindDescriptorSetsInfo' does not name a type; did you mean 'VkBindDescriptorSetsInfoKHR'?
|  5291 |     const VkBindDescriptorSetsInfo*             pBindDescriptorSetsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkBindDescriptorSetsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5298:11: error: 'VkPushConstantsInfo' does not name a type; did you mean 'VkPushConstantsInfoKHR'?
|  5298 |     const VkPushConstantsInfo*                  pPushConstantsInfo)
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkPushConstantsInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5305:11: error: 'VkPushDescriptorSetInfo' does not name a type; did you mean 'VkPushDescriptorSetInfoKHR'?
|  5305 |     const VkPushDescriptorSetInfo*              pPushDescriptorSetInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:5312:11: error: 'VkPushDescriptorSetWithTemplateInfo' does not name a type; did you mean 'VkPushDescriptorSetWithTemplateInfoKHR'?
|  5312 |     const VkPushDescriptorSetWithTemplateInfo*  pPushDescriptorSetWithTemplateInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkPushDescriptorSetWithTemplateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:6799:11: error: 'VkCopyMemoryToImageInfo' does not name a type; did you mean 'VkCopyMemoryToImageInfoEXT'?
|  6799 |     const VkCopyMemoryToImageInfo*              pCopyMemoryToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyMemoryToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:6807:11: error: 'VkCopyImageToMemoryInfo' does not name a type; did you mean 'VkCopyImageToMemoryInfoEXT'?
|  6807 |     const VkCopyImageToMemoryInfo*              pCopyImageToMemoryInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToMemoryInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:6815:11: error: 'VkCopyImageToImageInfo' does not name a type; did you mean 'VkCopyImageToImageInfoEXT'?
|  6815 |     const VkCopyImageToImageInfo*               pCopyImageToImageInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~
|       |           VkCopyImageToImageInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:6824:11: error: 'VkHostImageLayoutTransitionInfo' does not name a type; did you mean 'VkHostImageLayoutTransitionInfoEXT'?
|  6824 |     const VkHostImageLayoutTransitionInfo*      pTransitions)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkHostImageLayoutTransitionInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:6833:11: error: 'VkImageSubresource2' does not name a type; did you mean 'VkImageSubresource'?
|  6833 |     const VkImageSubresource2*                  pSubresource,
|       |           ^~~~~~~~~~~~~~~~~~~
|       |           VkImageSubresource
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:6834:5: error: 'VkSubresourceLayout2' has not been declared
|  6834 |     VkSubresourceLayout2*                       pLayout)
|       |     ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:8129:5: error: 'VkCooperativeVectorPropertiesNV' has not been declared
|  8129 |     VkCooperativeVectorPropertiesNV*            pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:8137:11: error: 'VkConvertCooperativeVectorMatrixInfoNV' does not name a type
|  8137 |     const VkConvertCooperativeVectorMatrixInfoNV* pInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:8146:11: error: 'VkConvertCooperativeVectorMatrixInfoNV' does not name a type
|  8146 |     const VkConvertCooperativeVectorMatrixInfoNV* pInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:8237:11: error: 'VkClusterAccelerationStructureInputInfoNV' does not name a type; did you mean 'VkAccelerationStructureInstanceNV'?
|  8237 |     const VkClusterAccelerationStructureInputInfoNV* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureInstanceNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:8245:11: error: 'VkClusterAccelerationStructureCommandsInfoNV' does not name a type; did you mean 'VkAccelerationStructureMotionInfoNV'?
|  8245 |     const VkClusterAccelerationStructureCommandsInfoNV* pCommandInfos)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureMotionInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:8253:11: error: 'VkPartitionedAccelerationStructureInstancesInputNV' does not name a type; did you mean 'VkAccelerationStructureInstanceNV'?
|  8253 |     const VkPartitionedAccelerationStructureInstancesInputNV* pInfo,
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |           VkAccelerationStructureInstanceNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:8261:11: error: 'VkBuildPartitionedAccelerationStructureInfoNV' does not name a type
|  8261 |     const VkBuildPartitionedAccelerationStructureInfoNV* pBuildInfo)
|       |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:8354:5: error: 'VkCooperativeMatrixFlexibleDimensionsPropertiesNV' has not been declared
|  8354 |     VkCooperativeMatrixFlexibleDimensionsPropertiesNV* pProperties)
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h: In instantiation of 'const T* lvl_find_in_chain(const void*) [with T = VkPhysicalDeviceHostImageCopyFeaturesEXT]':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:3932:103:   required from here
|  3932 |     const auto *host_image_copy_features = lvl_find_in_chain<VkPhysicalDeviceHostImageCopyFeaturesEXT>(pFeatures->pNext);
|       |                                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9254:28: error: 'kSType' is not a member of 'LvlTypeMap<VkPhysicalDeviceHostImageCopyFeaturesEXT>'
|  9254 |         if (LvlTypeMap<T>::kSType == current->sType) {
|       |                            ^~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h: In instantiation of 'T* lvl_find_mod_in_chain(void*) [with T = VkPhysicalDeviceHostImageCopyPropertiesEXT]':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/function_definitions.h:4048:100:   required from here
|  4048 |     auto *host_image_copy_props = lvl_find_mod_in_chain<VkPhysicalDeviceHostImageCopyPropertiesEXT>(pProperties->pNext);
|       |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/icd/generated/vk_typemap_helper.h:9268:28: error: 'kSType' is not a member of 'LvlTypeMap<VkPhysicalDeviceHostImageCopyPropertiesEXT>'
|  9268 |         if (LvlTypeMap<T>::kSType == current->sType) {
|       |                            ^~~~~~
| [2/4] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild
 /yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git=/usr/src/debug/vulkan-tools/1.4.309.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-
 native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/vulkaninfo.cpp
| FAILED: vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_NO_PROTOTYPES -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/. -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto
 -worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git=/usr/src/debug/vulkan-tools/1.4.309.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build=/usr/src/debug/vulkan-tools/1.4.309.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native
 =  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIE -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -Wno-stringop-truncation -MD -MT vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -MF vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o.d -o vulkaninfo/CMakeFiles/vulkaninfo.dir/vulkaninfo.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/vulkaninfo.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/vulkaninfo.cpp:34:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string StdVideoAV1ColorPrimariesString(StdVideoAV1ColorPrimaries)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:476:14: error: 'STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED' was not declared in this scope; did you mean 'STD_VIDEO_AV1_COLOR_PRIMARIES_BT_UNSPECIFIED'?
|   476 |         case STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED: return "STD_VIDEO_AV1_COLOR_PRIMARIES_UNSPECIFIED";
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              STD_VIDEO_AV1_COLOR_PRIMARIES_BT_UNSPECIFIED
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkDriverIdString(VkDriverId)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:632:15: error: 'VK_DRIVER_ID_VULKAN_SC_EMULATION_ON_VULKAN' was not declared in this scope
|   632 |         case (VK_DRIVER_ID_VULKAN_SC_EMULATION_ON_VULKAN): return "DRIVER_ID_VULKAN_SC_EMULATION_ON_VULKAN";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkFormatString(VkFormat)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:883:15: error: 'VK_FORMAT_A1B5G5R5_UNORM_PACK16' was not declared in this scope; did you mean 'VK_FORMAT_A1R5G5B5_UNORM_PACK16'?
|   883 |         case (VK_FORMAT_A1B5G5R5_UNORM_PACK16): return "FORMAT_A1B5G5R5_UNORM_PACK16";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_A1R5G5B5_UNORM_PACK16
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:884:15: error: 'VK_FORMAT_A8_UNORM' was not declared in this scope; did you mean 'VK_FORMAT_R8_UNORM'?
|   884 |         case (VK_FORMAT_A8_UNORM): return "FORMAT_A8_UNORM";
|       |               ^~~~~~~~~~~~~~~~~~
|       |               VK_FORMAT_R8_UNORM
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkImageLayoutString(VkImageLayout)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:922:15: error: 'VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ' was not declared in this scope; did you mean 'VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ_KHR'?
|   922 |         case (VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ): return "IMAGE_LAYOUT_RENDERING_LOCAL_READ";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_IMAGE_LAYOUT_RENDERING_LOCAL_READ_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:934:15: error: 'VK_IMAGE_LAYOUT_VIDEO_ENCODE_QUANTIZATION_MAP_KHR' was not declared in this scope; did you mean 'VK_IMAGE_LAYOUT_VIDEO_ENCODE_DST_KHR'?
|   934 |         case (VK_IMAGE_LAYOUT_VIDEO_ENCODE_QUANTIZATION_MAP_KHR): return "IMAGE_LAYOUT_VIDEO_ENCODE_QUANTIZATION_MAP_KHR";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_IMAGE_LAYOUT_VIDEO_ENCODE_DST_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1004:54: error: 'VkPipelineRobustnessBufferBehavior' was not declared in this scope; did you mean 'VkPipelineRobustnessBufferBehaviorEXT'?
|  1004 | std::string VkPipelineRobustnessBufferBehaviorString(VkPipelineRobustnessBufferBehavior value) {
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VkPipelineRobustnessBufferBehaviorEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1004:96: error: expected ',' or ';' before '{' token
|  1004 | std::string VkPipelineRobustnessBufferBehaviorString(VkPipelineRobustnessBufferBehavior value) {
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1013:75: error: 'VkPipelineRobustnessBufferBehavior' has not been declared
|  1013 | void DumpVkPipelineRobustnessBufferBehavior(Printer &p, std::string name, VkPipelineRobustnessBufferBehavior value) {
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPipelineRobustnessBufferBehavior(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1015:93: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|  1015 |         p.PrintKeyString(name, std::string("VK_") + VkPipelineRobustnessBufferBehaviorString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1017:72: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|  1017 |         p.PrintKeyString(name, VkPipelineRobustnessBufferBehaviorString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1019:53: error: 'VkPipelineRobustnessImageBehavior' was not declared in this scope; did you mean 'VkPipelineRobustnessImageBehaviorEXT'?
|  1019 | std::string VkPipelineRobustnessImageBehaviorString(VkPipelineRobustnessImageBehavior value) {
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VkPipelineRobustnessImageBehaviorEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1019:94: error: expected ',' or ';' before '{' token
|  1019 | std::string VkPipelineRobustnessImageBehaviorString(VkPipelineRobustnessImageBehavior value) {
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1028:74: error: 'VkPipelineRobustnessImageBehavior' has not been declared
|  1028 | void DumpVkPipelineRobustnessImageBehavior(Printer &p, std::string name, VkPipelineRobustnessImageBehavior value) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPipelineRobustnessImageBehavior(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1030:92: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|  1030 |         p.PrintKeyString(name, std::string("VK_") + VkPipelineRobustnessImageBehaviorString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1032:71: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|  1032 |         p.PrintKeyString(name, VkPipelineRobustnessImageBehaviorString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkPresentModeKHRString(VkPresentModeKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1055:15: error: 'VK_PRESENT_MODE_FIFO_LATEST_READY_EXT' was not declared in this scope; did you mean 'VK_PRESENT_MODE_FIFO_RELAXED_KHR'?
|  1055 |         case (VK_PRESENT_MODE_FIFO_LATEST_READY_EXT): return "PRESENT_MODE_FIFO_LATEST_READY_EXT";
|       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |               VK_PRESENT_MODE_FIFO_RELAXED_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1065:41: error: 'VkQueueGlobalPriority' was not declared in this scope; did you mean 'VkQueueGlobalPriorityKHR'?
|  1065 | std::string VkQueueGlobalPriorityString(VkQueueGlobalPriority value) {
|       |                                         ^~~~~~~~~~~~~~~~~~~~~
|       |                                         VkQueueGlobalPriorityKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1065:70: error: expected ',' or ';' before '{' token
|  1065 | std::string VkQueueGlobalPriorityString(VkQueueGlobalPriority value) {
|       |                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1074:62: error: 'VkQueueGlobalPriority' has not been declared
|  1074 | void DumpVkQueueGlobalPriority(Printer &p, std::string name, VkQueueGlobalPriority value) {
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkQueueGlobalPriority(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1076:80: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|  1076 |         p.PrintKeyString(name, std::string("VK_") + VkQueueGlobalPriorityString(value));
|       |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1078:59: error: no match for call to '(std::string {aka std::__cxx11::basic_string<char>}) (int&)'
|  1078 |         p.PrintKeyString(name, VkQueueGlobalPriorityString(value));
|       |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::string VkResultString(VkResult)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1106:15: error: 'VK_ERROR_NOT_PERMITTED' was not declared in this scope; did you mean 'VK_ERROR_NOT_PERMITTED_KHR'?
|  1106 |         case (VK_ERROR_NOT_PERMITTED): return "ERROR_NOT_PERMITTED";
|       |               ^~~~~~~~~~~~~~~~~~~~~~
|       |               VK_ERROR_NOT_PERMITTED_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkFormatFeatureFlagBits2GetStrings(VkFormatFeatureFlagBits2)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1332:9: error: 'VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT'?
|  1332 |     if (VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT & value) strings.push_back("FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_HOST_IMAGE_TRANSFER_BIT_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1340:9: error: 'VK_FORMAT_FEATURE_2_ACCELERATION_STRUCTURE_RADIUS_BUFFER_BIT_NV' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_ACCELERATION_STRUCTURE_VERTEX_BUFFER_BIT_KHR'?
|  1340 |     if (VK_FORMAT_FEATURE_2_ACCELERATION_STRUCTURE_RADIUS_BUFFER_BIT_NV & value) strings.push_back("FORMAT_FEATURE_2_ACCELERATION_STRUCTURE_RADIUS_BUFFER_BIT_NV");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_ACCELERATION_STRUCTURE_VERTEX_BUFFER_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1349:9: error: 'VK_FORMAT_FEATURE_2_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR'?
|  1349 |     if (VK_FORMAT_FEATURE_2_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR & value) strings.push_back("FORMAT_FEATURE_2_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1350:9: error: 'VK_FORMAT_FEATURE_2_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR'?
|  1350 |     if (VK_FORMAT_FEATURE_2_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR & value) strings.push_back("FORMAT_FEATURE_2_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_FORMAT_FEATURE_2_VIDEO_ENCODE_INPUT_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkImageUsageFlagBitsGetStrings(VkImageUsageFlagBits)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1441:9: error: 'VK_IMAGE_USAGE_HOST_TRANSFER_BIT' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_HOST_TRANSFER_BIT_EXT'?
|  1441 |     if (VK_IMAGE_USAGE_HOST_TRANSFER_BIT & value) strings.push_back("IMAGE_USAGE_HOST_TRANSFER_BIT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_HOST_TRANSFER_BIT_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1454:9: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  1454 |     if (VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR & value) strings.push_back("IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1455:9: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  1455 |     if (VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR & value) strings.push_back("IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkSubgroupFeatureFlagBitsGetStrings(VkSubgroupFeatureFlagBits)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1866:9: error: 'VK_SUBGROUP_FEATURE_ROTATE_BIT' was not declared in this scope; did you mean 'VK_SUBGROUP_FEATURE_VOTE_BIT'?
|  1866 |     if (VK_SUBGROUP_FEATURE_ROTATE_BIT & value) strings.push_back("SUBGROUP_FEATURE_ROTATE_BIT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_SUBGROUP_FEATURE_VOTE_BIT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:1867:9: error: 'VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT' was not declared in this scope; did you mean 'VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT_KHR'?
|  1867 |     if (VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT & value) strings.push_back("SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_SUBGROUP_FEATURE_ROTATE_CLUSTERED_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoCodecOperationFlagBitsKHRGetStrings(VkVideoCodecOperationFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2083:9: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  2083 |     if (VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR & value) strings.push_back("VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2246:75: error: 'VkVideoEncodeAV1CapabilityFlagBitsKHR' was not declared in this scope; did you mean 'VkVideoEncodeCapabilityFlagBitsKHR'?
|  2246 | std::vector<const char *> VkVideoEncodeAV1CapabilityFlagBitsKHRGetStrings(VkVideoEncodeAV1CapabilityFlagBitsKHR value) {
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                           VkVideoEncodeCapabilityFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2246:120: error: expected ',' or ';' before '{' token
|  2246 | std::vector<const char *> VkVideoEncodeAV1CapabilityFlagBitsKHRGetStrings(VkVideoEncodeAV1CapabilityFlagBitsKHR value) {
|       |                                                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2256:75: error: 'VkVideoEncodeAV1CapabilityFlagsKHR' has not been declared
|  2256 | void DumpVkVideoEncodeAV1CapabilityFlagsKHR(Printer &p, std::string name, VkVideoEncodeAV1CapabilityFlagsKHR value) {
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1CapabilityFlagsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2257:21: error: 'VkVideoEncodeAV1CapabilityFlagBitsKHR' does not name a type; did you mean 'VkVideoEncodeCapabilityFlagBitsKHR'?
|  2257 |     if (static_cast<VkVideoEncodeAV1CapabilityFlagBitsKHR>(value) == 0) {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkVideoEncodeCapabilityFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2263:80: error: 'VkVideoEncodeAV1CapabilityFlagBitsKHR' does not name a type; did you mean 'VkVideoEncodeCapabilityFlagBitsKHR'?
|  2263 |     auto strings = VkVideoEncodeAV1CapabilityFlagBitsKHRGetStrings(static_cast<VkVideoEncodeAV1CapabilityFlagBitsKHR>(value));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                VkVideoEncodeCapabilityFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2272:78: error: 'VkVideoEncodeAV1CapabilityFlagBitsKHR' has not been declared
|  2272 | void DumpVkVideoEncodeAV1CapabilityFlagBitsKHR(Printer &p, std::string name, VkVideoEncodeAV1CapabilityFlagBitsKHR value) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1CapabilityFlagBitsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2273:67: error: no match for call to '(std::vector<const char*>) (int&)'
|  2273 |     auto strings = VkVideoEncodeAV1CapabilityFlagBitsKHRGetStrings(value);
|       |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2282:68: error: 'VkVideoEncodeAV1StdFlagBitsKHR' was not declared in this scope; did you mean 'VkVideoEncodeH265StdFlagBitsKHR'?
|  2282 | std::vector<const char *> VkVideoEncodeAV1StdFlagBitsKHRGetStrings(VkVideoEncodeAV1StdFlagBitsKHR value) {
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VkVideoEncodeH265StdFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2282:106: error: expected ',' or ';' before '{' token
|  2282 | std::vector<const char *> VkVideoEncodeAV1StdFlagBitsKHRGetStrings(VkVideoEncodeAV1StdFlagBitsKHR value) {
|       |                                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2291:68: error: 'VkVideoEncodeAV1StdFlagsKHR' has not been declared
|  2291 | void DumpVkVideoEncodeAV1StdFlagsKHR(Printer &p, std::string name, VkVideoEncodeAV1StdFlagsKHR value) {
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1StdFlagsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2292:21: error: 'VkVideoEncodeAV1StdFlagBitsKHR' does not name a type; did you mean 'VkVideoEncodeH265StdFlagBitsKHR'?
|  2292 |     if (static_cast<VkVideoEncodeAV1StdFlagBitsKHR>(value) == 0) {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkVideoEncodeH265StdFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2298:73: error: 'VkVideoEncodeAV1StdFlagBitsKHR' does not name a type; did you mean 'VkVideoEncodeH265StdFlagBitsKHR'?
|  2298 |     auto strings = VkVideoEncodeAV1StdFlagBitsKHRGetStrings(static_cast<VkVideoEncodeAV1StdFlagBitsKHR>(value));
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                         VkVideoEncodeH265StdFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2307:71: error: 'VkVideoEncodeAV1StdFlagBitsKHR' has not been declared
|  2307 | void DumpVkVideoEncodeAV1StdFlagBitsKHR(Printer &p, std::string name, VkVideoEncodeAV1StdFlagBitsKHR value) {
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1StdFlagBitsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2308:60: error: no match for call to '(std::vector<const char*>) (int&)'
|  2308 |     auto strings = VkVideoEncodeAV1StdFlagBitsKHRGetStrings(value);
|       |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2317:79: error: 'VkVideoEncodeAV1SuperblockSizeFlagBitsKHR' was not declared in this scope; did you mean 'VkVideoEncodeAV1SuperblockSizeFlagBitsKHRGetStrings'?
|  2317 | std::vector<const char *> VkVideoEncodeAV1SuperblockSizeFlagBitsKHRGetStrings(VkVideoEncodeAV1SuperblockSizeFlagBitsKHR value) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                               VkVideoEncodeAV1SuperblockSizeFlagBitsKHRGetStrings
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2317:128: error: expected ',' or ';' before '{' token
|  2317 | std::vector<const char *> VkVideoEncodeAV1SuperblockSizeFlagBitsKHRGetStrings(VkVideoEncodeAV1SuperblockSizeFlagBitsKHR value) {
|       |                                                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2324:79: error: 'VkVideoEncodeAV1SuperblockSizeFlagsKHR' has not been declared
|  2324 | void DumpVkVideoEncodeAV1SuperblockSizeFlagsKHR(Printer &p, std::string name, VkVideoEncodeAV1SuperblockSizeFlagsKHR value) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1SuperblockSizeFlagsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2325:21: error: 'VkVideoEncodeAV1SuperblockSizeFlagBitsKHR' does not name a type; did you mean 'VkVideoEncodeH265CtbSizeFlagBitsKHR'?
|  2325 |     if (static_cast<VkVideoEncodeAV1SuperblockSizeFlagBitsKHR>(value) == 0) {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkVideoEncodeH265CtbSizeFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2331:84: error: 'VkVideoEncodeAV1SuperblockSizeFlagBitsKHR' does not name a type; did you mean 'VkVideoEncodeH265CtbSizeFlagBitsKHR'?
|  2331 |     auto strings = VkVideoEncodeAV1SuperblockSizeFlagBitsKHRGetStrings(static_cast<VkVideoEncodeAV1SuperblockSizeFlagBitsKHR>(value));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    VkVideoEncodeH265CtbSizeFlagBitsKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2340:82: error: 'VkVideoEncodeAV1SuperblockSizeFlagBitsKHR' has not been declared
|  2340 | void DumpVkVideoEncodeAV1SuperblockSizeFlagBitsKHR(Printer &p, std::string name, VkVideoEncodeAV1SuperblockSizeFlagBitsKHR value) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1SuperblockSizeFlagBitsKHR(Printer&, std::string, int)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2341:71: error: no match for call to '(std::vector<const char*>) (int&)'
|  2341 |     auto strings = VkVideoEncodeAV1SuperblockSizeFlagBitsKHRGetStrings(value);
|       |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoEncodeCapabilityFlagBitsKHRGetStrings(VkVideoEncodeCapabilityFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2355:9: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  2355 |     if (VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR & value) strings.push_back("VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2356:9: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  2356 |     if (VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR & value) strings.push_back("VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoEncodeH264CapabilityFlagBitsKHRGetStrings(VkVideoEncodeH264CapabilityFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2465:9: error: 'VK_VIDEO_ENCODE_H264_CAPABILITY_MB_QP_DIFF_WRAPAROUND_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H264_CAPABILITY_HRD_COMPLIANCE_BIT_KHR'?
|  2465 |     if (VK_VIDEO_ENCODE_H264_CAPABILITY_MB_QP_DIFF_WRAPAROUND_BIT_KHR & value) strings.push_back("VIDEO_ENCODE_H264_CAPABILITY_MB_QP_DIFF_WRAPAROUND_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_ENCODE_H264_CAPABILITY_HRD_COMPLIANCE_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<const char*> VkVideoEncodeH265CapabilityFlagBitsKHRGetStrings(VkVideoEncodeH265CapabilityFlagBitsKHR)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:2558:9: error: 'VK_VIDEO_ENCODE_H265_CAPABILITY_CU_QP_DIFF_WRAPAROUND_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_H265_CAPABILITY_HRD_COMPLIANCE_BIT_KHR'?
|  2558 |     if (VK_VIDEO_ENCODE_H265_CAPABILITY_CU_QP_DIFF_WRAPAROUND_BIT_KHR & value) strings.push_back("VIDEO_ENCODE_H265_CAPABILITY_CU_QP_DIFF_WRAPAROUND_BIT_KHR");
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VK_VIDEO_ENCODE_H265_CAPABILITY_HRD_COMPLIANCE_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3017:91: error: 'VkPhysicalDeviceDepthClampZeroOneFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT'?
|  3017 | void DumpVkPhysicalDeviceDepthClampZeroOneFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceDepthClampZeroOneFeaturesKHR &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceDepthClampZeroOneFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDepthClampZeroOneFeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3020:63: error: request for member 'depthClampZeroOne' in 'obj', which is of non-class type 'const int'
|  3020 |     p.PrintKeyBool("depthClampZeroOne", static_cast<bool>(obj.depthClampZeroOne));
|       |                                                               ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3196:96: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeatures' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  3196 | void DumpVkPhysicalDeviceDynamicRenderingLocalReadFeatures(Printer &p, std::string name, const VkPhysicalDeviceDynamicRenderingLocalReadFeatures &obj) {
|       |                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceDynamicRenderingLocalReadFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3199:71: error: request for member 'dynamicRenderingLocalRead' in 'obj', which is of non-class type 'const int'
|  3199 |     p.PrintKeyBool("dynamicRenderingLocalRead", static_cast<bool>(obj.dynamicRenderingLocalRead));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3426:90: error: 'VkPhysicalDeviceGlobalPriorityQueryFeatures' does not name a type; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  3426 | void DumpVkPhysicalDeviceGlobalPriorityQueryFeatures(Printer &p, std::string name, const VkPhysicalDeviceGlobalPriorityQueryFeatures &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceGlobalPriorityQueryFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3429:65: error: request for member 'globalPriorityQuery' in 'obj', which is of non-class type 'const int'
|  3429 |     p.PrintKeyBool("globalPriorityQuery", static_cast<bool>(obj.globalPriorityQuery));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3442:84: error: 'VkPhysicalDeviceHostImageCopyFeatures' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  3442 | void DumpVkPhysicalDeviceHostImageCopyFeatures(Printer &p, std::string name, const VkPhysicalDeviceHostImageCopyFeatures &obj) {
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceHostImageCopyFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3445:59: error: request for member 'hostImageCopy' in 'obj', which is of non-class type 'const int'
|  3445 |     p.PrintKeyBool("hostImageCopy", static_cast<bool>(obj.hostImageCopy));
|       |                                                           ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3447:86: error: 'VkPhysicalDeviceHostImageCopyProperties' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  3447 | void DumpVkPhysicalDeviceHostImageCopyProperties(Printer &p, std::string name, const VkPhysicalDeviceHostImageCopyProperties &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceHostImageCopyProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3450:47: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  3450 |     p.PrintKeyValue("copySrcLayoutCount", obj.copySrcLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3451:13: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  3451 |     if (obj.copySrcLayoutCount == 0 || obj.pCopySrcLayouts == nullptr) {
|       |             ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3451:44: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  3451 |     if (obj.copySrcLayoutCount == 0 || obj.pCopySrcLayouts == nullptr) {
|       |                                            ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3454:51: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  3454 |         ArrayWrapper arr(p,"pCopySrcLayouts", obj.copySrcLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3455:38: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  3455 |         for (uint32_t i = 0; i < obj.copySrcLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3456:57: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  3456 |             DumpVkImageLayout(p, std::to_string(i), obj.pCopySrcLayouts[i]);
|       |                                                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3459:47: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  3459 |     p.PrintKeyValue("copyDstLayoutCount", obj.copyDstLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3460:13: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  3460 |     if (obj.copyDstLayoutCount == 0 || obj.pCopyDstLayouts == nullptr) {
|       |             ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3460:44: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  3460 |     if (obj.copyDstLayoutCount == 0 || obj.pCopyDstLayouts == nullptr) {
|       |                                            ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3463:51: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  3463 |         ArrayWrapper arr(p,"pCopyDstLayouts", obj.copyDstLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3464:38: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  3464 |         for (uint32_t i = 0; i < obj.copyDstLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3465:57: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  3465 |             DumpVkImageLayout(p, std::to_string(i), obj.pCopyDstLayouts[i]);
|       |                                                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3468:52: error: request for member 'optimalTilingLayoutUUID' in 'obj', which is of non-class type 'const int'
|  3468 |     p.PrintKeyValue("optimalTilingLayoutUUID", obj.optimalTilingLayoutUUID);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3469:77: error: request for member 'identicalMemoryTypeRequirements' in 'obj', which is of non-class type 'const int'
|  3469 |     p.PrintKeyBool("identicalMemoryTypeRequirements", static_cast<bool>(obj.identicalMemoryTypeRequirements));
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3523:85: error: 'VkPhysicalDeviceIndexTypeUint8Features' does not name a type; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  3523 | void DumpVkPhysicalDeviceIndexTypeUint8Features(Printer &p, std::string name, const VkPhysicalDeviceIndexTypeUint8Features &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceIndexTypeUint8Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3526:60: error: request for member 'indexTypeUint8' in 'obj', which is of non-class type 'const int'
|  3526 |     p.PrintKeyBool("indexTypeUint8", static_cast<bool>(obj.indexTypeUint8));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3711:88: error: 'VkPhysicalDeviceLineRasterizationFeatures' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  3711 | void DumpVkPhysicalDeviceLineRasterizationFeatures(Printer &p, std::string name, const VkPhysicalDeviceLineRasterizationFeatures &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLineRasterizationFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3714:62: error: request for member 'rectangularLines' in 'obj', which is of non-class type 'const int'
|  3714 |     p.PrintKeyBool("rectangularLines", static_cast<bool>(obj.rectangularLines));
|       |                                                              ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3715:60: error: request for member 'bresenhamLines' in 'obj', which is of non-class type 'const int'
|  3715 |     p.PrintKeyBool("bresenhamLines", static_cast<bool>(obj.bresenhamLines));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3716:57: error: request for member 'smoothLines' in 'obj', which is of non-class type 'const int'
|  3716 |     p.PrintKeyBool("smoothLines", static_cast<bool>(obj.smoothLines));
|       |                                                         ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3717:70: error: request for member 'stippledRectangularLines' in 'obj', which is of non-class type 'const int'
|  3717 |     p.PrintKeyBool("stippledRectangularLines", static_cast<bool>(obj.stippledRectangularLines));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3718:68: error: request for member 'stippledBresenhamLines' in 'obj', which is of non-class type 'const int'
|  3718 |     p.PrintKeyBool("stippledBresenhamLines", static_cast<bool>(obj.stippledBresenhamLines));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3719:65: error: request for member 'stippledSmoothLines' in 'obj', which is of non-class type 'const int'
|  3719 |     p.PrintKeyBool("stippledSmoothLines", static_cast<bool>(obj.stippledSmoothLines));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3721:90: error: 'VkPhysicalDeviceLineRasterizationProperties' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  3721 | void DumpVkPhysicalDeviceLineRasterizationProperties(Printer &p, std::string name, const VkPhysicalDeviceLineRasterizationProperties &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceLineRasterizationProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3724:54: error: request for member 'lineSubPixelPrecisionBits' in 'obj', which is of non-class type 'const int'
|  3724 |     p.PrintKeyValue("lineSubPixelPrecisionBits", obj.lineSubPixelPrecisionBits);
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3742:83: error: 'VkPhysicalDeviceMaintenance5Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  3742 | void DumpVkPhysicalDeviceMaintenance5Features(Printer &p, std::string name, const VkPhysicalDeviceMaintenance5Features &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                   VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance5Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3745:58: error: request for member 'maintenance5' in 'obj', which is of non-class type 'const int'
|  3745 |     p.PrintKeyBool("maintenance5", static_cast<bool>(obj.maintenance5));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3747:85: error: 'VkPhysicalDeviceMaintenance5Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  3747 | void DumpVkPhysicalDeviceMaintenance5Properties(Printer &p, std::string name, const VkPhysicalDeviceMaintenance5Properties &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance5Properties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3750:97: error: request for member 'earlyFragmentMultisampleCoverageAfterSampleCounting' in 'obj', which is of non-class type 'const int'
|  3750 |     p.PrintKeyBool("earlyFragmentMultisampleCoverageAfterSampleCounting", static_cast<bool>(obj.earlyFragmentMultisampleCoverageAfterSampleCounting));
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3751:93: error: request for member 'earlyFragmentSampleMaskTestBeforeSampleCounting' in 'obj', which is of non-class type 'const int'
|  3751 |     p.PrintKeyBool("earlyFragmentSampleMaskTestBeforeSampleCounting", static_cast<bool>(obj.earlyFragmentSampleMaskTestBeforeSampleCounting));
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3752:75: error: request for member 'depthStencilSwizzleOneSupport' in 'obj', which is of non-class type 'const int'
|  3752 |     p.PrintKeyBool("depthStencilSwizzleOneSupport", static_cast<bool>(obj.depthStencilSwizzleOneSupport));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3753:66: error: request for member 'polygonModePointSize' in 'obj', which is of non-class type 'const int'
|  3753 |     p.PrintKeyBool("polygonModePointSize", static_cast<bool>(obj.polygonModePointSize));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3754:91: error: request for member 'nonStrictSinglePixelWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  3754 |     p.PrintKeyBool("nonStrictSinglePixelWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictSinglePixelWideLinesUseParallelogram));
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3755:80: error: request for member 'nonStrictWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  3755 |     p.PrintKeyBool("nonStrictWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictWideLinesUseParallelogram));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3757:83: error: 'VkPhysicalDeviceMaintenance6Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  3757 | void DumpVkPhysicalDeviceMaintenance6Features(Printer &p, std::string name, const VkPhysicalDeviceMaintenance6Features &obj) {
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                   VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance6Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3760:58: error: request for member 'maintenance6' in 'obj', which is of non-class type 'const int'
|  3760 |     p.PrintKeyBool("maintenance6", static_cast<bool>(obj.maintenance6));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3762:85: error: 'VkPhysicalDeviceMaintenance6Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  3762 | void DumpVkPhysicalDeviceMaintenance6Properties(Printer &p, std::string name, const VkPhysicalDeviceMaintenance6Properties &obj) {
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance6Properties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3765:84: error: request for member 'blockTexelViewCompatibleMultipleLayers' in 'obj', which is of non-class type 'const int'
|  3765 |     p.PrintKeyBool("blockTexelViewCompatibleMultipleLayers", static_cast<bool>(obj.blockTexelViewCompatibleMultipleLayers));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3766:67: error: request for member 'maxCombinedImageSamplerDescriptorCount' in 'obj', which is of non-class type 'const int'
|  3766 |     p.PrintKeyValue("maxCombinedImageSamplerDescriptorCount", obj.maxCombinedImageSamplerDescriptorCount);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3767:84: error: request for member 'fragmentShadingRateClampCombinerInputs' in 'obj', which is of non-class type 'const int'
|  3767 |     p.PrintKeyBool("fragmentShadingRateClampCombinerInputs", static_cast<bool>(obj.fragmentShadingRateClampCombinerInputs));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3786:86: error: 'VkPhysicalDeviceMaintenance8FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance7FeaturesKHR'?
|  3786 | void DumpVkPhysicalDeviceMaintenance8FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceMaintenance8FeaturesKHR &obj) {
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VkPhysicalDeviceMaintenance7FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceMaintenance8FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3789:58: error: request for member 'maintenance8' in 'obj', which is of non-class type 'const int'
|  3789 |     p.PrintKeyBool("maintenance8", static_cast<bool>(obj.maintenance8));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3994:94: error: 'VkPhysicalDevicePipelineProtectedAccessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  3994 | void DumpVkPhysicalDevicePipelineProtectedAccessFeatures(Printer &p, std::string name, const VkPhysicalDevicePipelineProtectedAccessFeatures &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineProtectedAccessFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3997:69: error: request for member 'pipelineProtectedAccess' in 'obj', which is of non-class type 'const int'
|  3997 |     p.PrintKeyBool("pipelineProtectedAccess", static_cast<bool>(obj.pipelineProtectedAccess));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:3999:89: error: 'VkPhysicalDevicePipelineRobustnessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  3999 | void DumpVkPhysicalDevicePipelineRobustnessFeatures(Printer &p, std::string name, const VkPhysicalDevicePipelineRobustnessFeatures &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineRobustnessFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4002:64: error: request for member 'pipelineRobustness' in 'obj', which is of non-class type 'const int'
|  4002 |     p.PrintKeyBool("pipelineRobustness", static_cast<bool>(obj.pipelineRobustness));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4004:91: error: 'VkPhysicalDevicePipelineRobustnessProperties' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  4004 | void DumpVkPhysicalDevicePipelineRobustnessProperties(Printer &p, std::string name, const VkPhysicalDevicePipelineRobustnessProperties &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePipelineRobustnessProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4006:86: error: request for member 'defaultRobustnessStorageBuffers' in 'obj', which is of non-class type 'const int'
|  4006 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessStorageBuffers", obj.defaultRobustnessStorageBuffers);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4007:86: error: request for member 'defaultRobustnessUniformBuffers' in 'obj', which is of non-class type 'const int'
|  4007 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessUniformBuffers", obj.defaultRobustnessUniformBuffers);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4008:84: error: request for member 'defaultRobustnessVertexInputs' in 'obj', which is of non-class type 'const int'
|  4008 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessVertexInputs", obj.defaultRobustnessVertexInputs);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4009:77: error: request for member 'defaultRobustnessImages' in 'obj', which is of non-class type 'const int'
|  4009 |     DumpVkPipelineRobustnessImageBehavior(p, "defaultRobustnessImages", obj.defaultRobustnessImages);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4048:100: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  4048 | void DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT(Printer &p, std::string name, const VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4051:72: error: request for member 'presentModeFifoLatestReady' in 'obj', which is of non-class type 'const int'
|  4051 |     p.PrintKeyBool("presentModeFifoLatestReady", static_cast<bool>(obj.presentModeFifoLatestReady));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4098:87: error: 'VkPhysicalDevicePushDescriptorProperties' does not name a type; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  4098 | void DumpVkPhysicalDevicePushDescriptorProperties(Printer &p, std::string name, const VkPhysicalDevicePushDescriptorProperties &obj) {
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDevicePushDescriptorProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4101:47: error: request for member 'maxPushDescriptors' in 'obj', which is of non-class type 'const int'
|  4101 |     p.PrintKeyValue("maxPushDescriptors", obj.maxPushDescriptors);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4252:89: error: 'VkPhysicalDeviceShaderExpectAssumeFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  4252 | void DumpVkPhysicalDeviceShaderExpectAssumeFeatures(Printer &p, std::string name, const VkPhysicalDeviceShaderExpectAssumeFeatures &obj) {
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                         VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderExpectAssumeFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4255:64: error: request for member 'shaderExpectAssume' in 'obj', which is of non-class type 'const int'
|  4255 |     p.PrintKeyBool("shaderExpectAssume", static_cast<bool>(obj.shaderExpectAssume));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4263:91: error: 'VkPhysicalDeviceShaderFloatControls2Features' does not name a type; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  4263 | void DumpVkPhysicalDeviceShaderFloatControls2Features(Printer &p, std::string name, const VkPhysicalDeviceShaderFloatControls2Features &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderFloatControls2Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4266:66: error: request for member 'shaderFloatControls2' in 'obj', which is of non-class type 'const int'
|  4266 |     p.PrintKeyBool("shaderFloatControls2", static_cast<bool>(obj.shaderFloatControls2));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4359:91: error: 'VkPhysicalDeviceShaderSubgroupRotateFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  4359 | void DumpVkPhysicalDeviceShaderSubgroupRotateFeatures(Printer &p, std::string name, const VkPhysicalDeviceShaderSubgroupRotateFeatures &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceShaderSubgroupRotateFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4362:66: error: request for member 'shaderSubgroupRotate' in 'obj', which is of non-class type 'const int'
|  4362 |     p.PrintKeyBool("shaderSubgroupRotate", static_cast<bool>(obj.shaderSubgroupRotate));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4363:75: error: request for member 'shaderSubgroupRotateClustered' in 'obj', which is of non-class type 'const int'
|  4363 |     p.PrintKeyBool("shaderSubgroupRotateClustered", static_cast<bool>(obj.shaderSubgroupRotateClustered));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4507:93: error: 'VkPhysicalDeviceVertexAttributeDivisorFeatures' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  4507 | void DumpVkPhysicalDeviceVertexAttributeDivisorFeatures(Printer &p, std::string name, const VkPhysicalDeviceVertexAttributeDivisorFeatures &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                             VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVertexAttributeDivisorFeatures(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4510:80: error: request for member 'vertexAttributeInstanceRateDivisor' in 'obj', which is of non-class type 'const int'
|  4510 |     p.PrintKeyBool("vertexAttributeInstanceRateDivisor", static_cast<bool>(obj.vertexAttributeInstanceRateDivisor));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4511:84: error: request for member 'vertexAttributeInstanceRateZeroDivisor' in 'obj', which is of non-class type 'const int'
|  4511 |     p.PrintKeyBool("vertexAttributeInstanceRateZeroDivisor", static_cast<bool>(obj.vertexAttributeInstanceRateZeroDivisor));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4513:95: error: 'VkPhysicalDeviceVertexAttributeDivisorProperties' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR'?
|  4513 | void DumpVkPhysicalDeviceVertexAttributeDivisorProperties(Printer &p, std::string name, const VkPhysicalDeviceVertexAttributeDivisorProperties &obj) {
|       |                                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                               VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVertexAttributeDivisorProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4516:51: error: request for member 'maxVertexAttribDivisor' in 'obj', which is of non-class type 'const int'
|  4516 |     p.PrintKeyValue("maxVertexAttribDivisor", obj.maxVertexAttribDivisor);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4517:74: error: request for member 'supportsNonZeroFirstInstance' in 'obj', which is of non-class type 'const int'
|  4517 |     p.PrintKeyBool("supportsNonZeroFirstInstance", static_cast<bool>(obj.supportsNonZeroFirstInstance));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4524:99: error: 'VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  4524 | void DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT(Printer &p, std::string name, const VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT &obj) {
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                   VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4527:71: error: request for member 'vertexAttributeRobustness' in 'obj', which is of non-class type 'const int'
|  4527 |     p.PrintKeyBool("vertexAttributeRobustness", static_cast<bool>(obj.vertexAttributeRobustness));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4534:88: error: 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  4534 | void DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceVideoEncodeAV1FeaturesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                        VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4537:60: error: request for member 'videoEncodeAV1' in 'obj', which is of non-class type 'const int'
|  4537 |     p.PrintKeyBool("videoEncodeAV1", static_cast<bool>(obj.videoEncodeAV1));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4539:100: error: 'VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceSynchronization2FeaturesKHR'?
|  4539 | void DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR &obj) {
|       |                                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                    VkPhysicalDeviceSynchronization2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4542:72: error: request for member 'videoEncodeQuantizationMap' in 'obj', which is of non-class type 'const int'
|  4542 |     p.PrintKeyBool("videoEncodeQuantizationMap", static_cast<bool>(obj.videoEncodeQuantizationMap));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4549:91: error: 'VkPhysicalDeviceVideoMaintenance2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  4549 | void DumpVkPhysicalDeviceVideoMaintenance2FeaturesKHR(Printer &p, std::string name, const VkPhysicalDeviceVideoMaintenance2FeaturesKHR &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVideoMaintenance2FeaturesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4552:63: error: request for member 'videoMaintenance2' in 'obj', which is of non-class type 'const int'
|  4552 |     p.PrintKeyBool("videoMaintenance2", static_cast<bool>(obj.videoMaintenance2));
|       |                                                               ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4766:79: error: 'VkPhysicalDeviceVulkan14Features' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Features'?
|  4766 | void DumpVkPhysicalDeviceVulkan14Features(Printer &p, std::string name, const VkPhysicalDeviceVulkan14Features &obj) {
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                               VkPhysicalDeviceVulkan13Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVulkan14Features(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4769:65: error: request for member 'globalPriorityQuery' in 'obj', which is of non-class type 'const int'
|  4769 |     p.PrintKeyBool("globalPriorityQuery", static_cast<bool>(obj.globalPriorityQuery));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4770:66: error: request for member 'shaderSubgroupRotate' in 'obj', which is of non-class type 'const int'
|  4770 |     p.PrintKeyBool("shaderSubgroupRotate", static_cast<bool>(obj.shaderSubgroupRotate));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4771:75: error: request for member 'shaderSubgroupRotateClustered' in 'obj', which is of non-class type 'const int'
|  4771 |     p.PrintKeyBool("shaderSubgroupRotateClustered", static_cast<bool>(obj.shaderSubgroupRotateClustered));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4772:66: error: request for member 'shaderFloatControls2' in 'obj', which is of non-class type 'const int'
|  4772 |     p.PrintKeyBool("shaderFloatControls2", static_cast<bool>(obj.shaderFloatControls2));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4773:64: error: request for member 'shaderExpectAssume' in 'obj', which is of non-class type 'const int'
|  4773 |     p.PrintKeyBool("shaderExpectAssume", static_cast<bool>(obj.shaderExpectAssume));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4774:62: error: request for member 'rectangularLines' in 'obj', which is of non-class type 'const int'
|  4774 |     p.PrintKeyBool("rectangularLines", static_cast<bool>(obj.rectangularLines));
|       |                                                              ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4775:60: error: request for member 'bresenhamLines' in 'obj', which is of non-class type 'const int'
|  4775 |     p.PrintKeyBool("bresenhamLines", static_cast<bool>(obj.bresenhamLines));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4776:57: error: request for member 'smoothLines' in 'obj', which is of non-class type 'const int'
|  4776 |     p.PrintKeyBool("smoothLines", static_cast<bool>(obj.smoothLines));
|       |                                                         ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4777:70: error: request for member 'stippledRectangularLines' in 'obj', which is of non-class type 'const int'
|  4777 |     p.PrintKeyBool("stippledRectangularLines", static_cast<bool>(obj.stippledRectangularLines));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4778:68: error: request for member 'stippledBresenhamLines' in 'obj', which is of non-class type 'const int'
|  4778 |     p.PrintKeyBool("stippledBresenhamLines", static_cast<bool>(obj.stippledBresenhamLines));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4779:65: error: request for member 'stippledSmoothLines' in 'obj', which is of non-class type 'const int'
|  4779 |     p.PrintKeyBool("stippledSmoothLines", static_cast<bool>(obj.stippledSmoothLines));
|       |                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4780:80: error: request for member 'vertexAttributeInstanceRateDivisor' in 'obj', which is of non-class type 'const int'
|  4780 |     p.PrintKeyBool("vertexAttributeInstanceRateDivisor", static_cast<bool>(obj.vertexAttributeInstanceRateDivisor));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4781:84: error: request for member 'vertexAttributeInstanceRateZeroDivisor' in 'obj', which is of non-class type 'const int'
|  4781 |     p.PrintKeyBool("vertexAttributeInstanceRateZeroDivisor", static_cast<bool>(obj.vertexAttributeInstanceRateZeroDivisor));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4782:60: error: request for member 'indexTypeUint8' in 'obj', which is of non-class type 'const int'
|  4782 |     p.PrintKeyBool("indexTypeUint8", static_cast<bool>(obj.indexTypeUint8));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4783:71: error: request for member 'dynamicRenderingLocalRead' in 'obj', which is of non-class type 'const int'
|  4783 |     p.PrintKeyBool("dynamicRenderingLocalRead", static_cast<bool>(obj.dynamicRenderingLocalRead));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4784:58: error: request for member 'maintenance5' in 'obj', which is of non-class type 'const int'
|  4784 |     p.PrintKeyBool("maintenance5", static_cast<bool>(obj.maintenance5));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4785:58: error: request for member 'maintenance6' in 'obj', which is of non-class type 'const int'
|  4785 |     p.PrintKeyBool("maintenance6", static_cast<bool>(obj.maintenance6));
|       |                                                          ^~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4786:69: error: request for member 'pipelineProtectedAccess' in 'obj', which is of non-class type 'const int'
|  4786 |     p.PrintKeyBool("pipelineProtectedAccess", static_cast<bool>(obj.pipelineProtectedAccess));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4787:64: error: request for member 'pipelineRobustness' in 'obj', which is of non-class type 'const int'
|  4787 |     p.PrintKeyBool("pipelineRobustness", static_cast<bool>(obj.pipelineRobustness));
|       |                                                                ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4788:59: error: request for member 'hostImageCopy' in 'obj', which is of non-class type 'const int'
|  4788 |     p.PrintKeyBool("hostImageCopy", static_cast<bool>(obj.hostImageCopy));
|       |                                                           ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4789:60: error: request for member 'pushDescriptor' in 'obj', which is of non-class type 'const int'
|  4789 |     p.PrintKeyBool("pushDescriptor", static_cast<bool>(obj.pushDescriptor));
|       |                                                            ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4791:81: error: 'VkPhysicalDeviceVulkan14Properties' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Properties'?
|  4791 | void DumpVkPhysicalDeviceVulkan14Properties(Printer &p, std::string name, const VkPhysicalDeviceVulkan14Properties &obj) {
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                 VkPhysicalDeviceVulkan13Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkPhysicalDeviceVulkan14Properties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4794:54: error: request for member 'lineSubPixelPrecisionBits' in 'obj', which is of non-class type 'const int'
|  4794 |     p.PrintKeyValue("lineSubPixelPrecisionBits", obj.lineSubPixelPrecisionBits);
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4795:51: error: request for member 'maxVertexAttribDivisor' in 'obj', which is of non-class type 'const int'
|  4795 |     p.PrintKeyValue("maxVertexAttribDivisor", obj.maxVertexAttribDivisor);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4796:74: error: request for member 'supportsNonZeroFirstInstance' in 'obj', which is of non-class type 'const int'
|  4796 |     p.PrintKeyBool("supportsNonZeroFirstInstance", static_cast<bool>(obj.supportsNonZeroFirstInstance));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4797:47: error: request for member 'maxPushDescriptors' in 'obj', which is of non-class type 'const int'
|  4797 |     p.PrintKeyValue("maxPushDescriptors", obj.maxPushDescriptors);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4798:94: error: request for member 'dynamicRenderingLocalReadDepthStencilAttachments' in 'obj', which is of non-class type 'const int'
|  4798 |     p.PrintKeyBool("dynamicRenderingLocalReadDepthStencilAttachments", static_cast<bool>(obj.dynamicRenderingLocalReadDepthStencilAttachments));
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4799:94: error: request for member 'dynamicRenderingLocalReadMultisampledAttachments' in 'obj', which is of non-class type 'const int'
|  4799 |     p.PrintKeyBool("dynamicRenderingLocalReadMultisampledAttachments", static_cast<bool>(obj.dynamicRenderingLocalReadMultisampledAttachments));
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4800:97: error: request for member 'earlyFragmentMultisampleCoverageAfterSampleCounting' in 'obj', which is of non-class type 'const int'
|  4800 |     p.PrintKeyBool("earlyFragmentMultisampleCoverageAfterSampleCounting", static_cast<bool>(obj.earlyFragmentMultisampleCoverageAfterSampleCounting));
|       |                                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4801:93: error: request for member 'earlyFragmentSampleMaskTestBeforeSampleCounting' in 'obj', which is of non-class type 'const int'
|  4801 |     p.PrintKeyBool("earlyFragmentSampleMaskTestBeforeSampleCounting", static_cast<bool>(obj.earlyFragmentSampleMaskTestBeforeSampleCounting));
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4802:75: error: request for member 'depthStencilSwizzleOneSupport' in 'obj', which is of non-class type 'const int'
|  4802 |     p.PrintKeyBool("depthStencilSwizzleOneSupport", static_cast<bool>(obj.depthStencilSwizzleOneSupport));
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4803:66: error: request for member 'polygonModePointSize' in 'obj', which is of non-class type 'const int'
|  4803 |     p.PrintKeyBool("polygonModePointSize", static_cast<bool>(obj.polygonModePointSize));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4804:91: error: request for member 'nonStrictSinglePixelWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  4804 |     p.PrintKeyBool("nonStrictSinglePixelWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictSinglePixelWideLinesUseParallelogram));
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4805:80: error: request for member 'nonStrictWideLinesUseParallelogram' in 'obj', which is of non-class type 'const int'
|  4805 |     p.PrintKeyBool("nonStrictWideLinesUseParallelogram", static_cast<bool>(obj.nonStrictWideLinesUseParallelogram));
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4806:84: error: request for member 'blockTexelViewCompatibleMultipleLayers' in 'obj', which is of non-class type 'const int'
|  4806 |     p.PrintKeyBool("blockTexelViewCompatibleMultipleLayers", static_cast<bool>(obj.blockTexelViewCompatibleMultipleLayers));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4807:67: error: request for member 'maxCombinedImageSamplerDescriptorCount' in 'obj', which is of non-class type 'const int'
|  4807 |     p.PrintKeyValue("maxCombinedImageSamplerDescriptorCount", obj.maxCombinedImageSamplerDescriptorCount);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4808:84: error: request for member 'fragmentShadingRateClampCombinerInputs' in 'obj', which is of non-class type 'const int'
|  4808 |     p.PrintKeyBool("fragmentShadingRateClampCombinerInputs", static_cast<bool>(obj.fragmentShadingRateClampCombinerInputs));
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4809:86: error: request for member 'defaultRobustnessStorageBuffers' in 'obj', which is of non-class type 'const int'
|  4809 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessStorageBuffers", obj.defaultRobustnessStorageBuffers);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4810:86: error: request for member 'defaultRobustnessUniformBuffers' in 'obj', which is of non-class type 'const int'
|  4810 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessUniformBuffers", obj.defaultRobustnessUniformBuffers);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4811:84: error: request for member 'defaultRobustnessVertexInputs' in 'obj', which is of non-class type 'const int'
|  4811 |     DumpVkPipelineRobustnessBufferBehavior(p, "defaultRobustnessVertexInputs", obj.defaultRobustnessVertexInputs);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4812:77: error: request for member 'defaultRobustnessImages' in 'obj', which is of non-class type 'const int'
|  4812 |     DumpVkPipelineRobustnessImageBehavior(p, "defaultRobustnessImages", obj.defaultRobustnessImages);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4813:47: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  4813 |     p.PrintKeyValue("copySrcLayoutCount", obj.copySrcLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4814:13: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  4814 |     if (obj.copySrcLayoutCount == 0 || obj.pCopySrcLayouts == nullptr) {
|       |             ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4814:44: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  4814 |     if (obj.copySrcLayoutCount == 0 || obj.pCopySrcLayouts == nullptr) {
|       |                                            ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4817:51: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  4817 |         ArrayWrapper arr(p,"pCopySrcLayouts", obj.copySrcLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4818:38: error: request for member 'copySrcLayoutCount' in 'obj', which is of non-class type 'const int'
|  4818 |         for (uint32_t i = 0; i < obj.copySrcLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4819:57: error: request for member 'pCopySrcLayouts' in 'obj', which is of non-class type 'const int'
|  4819 |             DumpVkImageLayout(p, std::to_string(i), obj.pCopySrcLayouts[i]);
|       |                                                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4822:47: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  4822 |     p.PrintKeyValue("copyDstLayoutCount", obj.copyDstLayoutCount);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4823:13: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  4823 |     if (obj.copyDstLayoutCount == 0 || obj.pCopyDstLayouts == nullptr) {
|       |             ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4823:44: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  4823 |     if (obj.copyDstLayoutCount == 0 || obj.pCopyDstLayouts == nullptr) {
|       |                                            ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4826:51: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  4826 |         ArrayWrapper arr(p,"pCopyDstLayouts", obj.copyDstLayoutCount);
|       |                                                   ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4827:38: error: request for member 'copyDstLayoutCount' in 'obj', which is of non-class type 'const int'
|  4827 |         for (uint32_t i = 0; i < obj.copyDstLayoutCount; i++) {
|       |                                      ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4828:57: error: request for member 'pCopyDstLayouts' in 'obj', which is of non-class type 'const int'
|  4828 |             DumpVkImageLayout(p, std::to_string(i), obj.pCopyDstLayouts[i]);
|       |                                                         ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4831:52: error: request for member 'optimalTilingLayoutUUID' in 'obj', which is of non-class type 'const int'
|  4831 |     p.PrintKeyValue("optimalTilingLayoutUUID", obj.optimalTilingLayoutUUID);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4832:77: error: request for member 'identicalMemoryTypeRequirements' in 'obj', which is of non-class type 'const int'
|  4832 |     p.PrintKeyBool("identicalMemoryTypeRequirements", static_cast<bool>(obj.identicalMemoryTypeRequirements));
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4864:84: error: 'VkQueueFamilyGlobalPriorityProperties' does not name a type; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  4864 | void DumpVkQueueFamilyGlobalPriorityProperties(Printer &p, std::string name, const VkQueueFamilyGlobalPriorityProperties &obj) {
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkQueueFamilyGlobalPriorityProperties(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4867:42: error: request for member 'priorityCount' in 'obj', which is of non-class type 'const int'
|  4867 |     p.PrintKeyValue("priorityCount", obj.priorityCount);
|       |                                          ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4868:42: error: request for member 'priorityCount' in 'obj', which is of non-class type 'const int'
|  4868 |     ArrayWrapper arr(p,"priorities", obj.priorityCount);
|       |                                          ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4869:34: error: request for member 'priorityCount' in 'obj', which is of non-class type 'const int'
|  4869 |     for (uint32_t i = 0; i < obj.priorityCount; i++) {
|       |                                  ^~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4871:79: error: request for member 'priorities' in 'obj', which is of non-class type 'const int'
|  4871 |            p.PrintString(std::string("VK_") + VkQueueGlobalPriorityString(obj.priorities[i]));
|       |                                                                               ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4873:58: error: request for member 'priorities' in 'obj', which is of non-class type 'const int'
|  4873 |            p.PrintString(VkQueueGlobalPriorityString(obj.priorities[i]));
|       |                                                          ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4995:78: error: 'VkVideoEncodeAV1CapabilitiesKHR' does not name a type; did you mean 'VkVideoDecodeAV1CapabilitiesKHR'?
|  4995 | void DumpVkVideoEncodeAV1CapabilitiesKHR(Printer &p, std::string name, const VkVideoEncodeAV1CapabilitiesKHR &obj) {
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              VkVideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1CapabilitiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4998:60: error: request for member 'flags' in 'obj', which is of non-class type 'const int'
|  4998 |     DumpVkVideoEncodeAV1CapabilityFlagsKHR(p, "flags", obj.flags);
|       |                                                            ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:4999:45: error: request for member 'maxLevel' in 'obj', which is of non-class type 'const int'
|  4999 |     DumpStdVideoAV1Level(p, "maxLevel", obj.maxLevel);
|       |                                             ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5000:52: error: request for member 'codedPictureAlignment' in 'obj', which is of non-class type 'const int'
|  5000 |     DumpVkExtent2D(p, "codedPictureAlignment", obj.codedPictureAlignment);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5001:39: error: request for member 'maxTiles' in 'obj', which is of non-class type 'const int'
|  5001 |     DumpVkExtent2D(p, "maxTiles", obj.maxTiles);
|       |                                       ^~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5002:42: error: request for member 'minTileSize' in 'obj', which is of non-class type 'const int'
|  5002 |     DumpVkExtent2D(p, "minTileSize", obj.minTileSize);
|       |                                          ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5003:42: error: request for member 'maxTileSize' in 'obj', which is of non-class type 'const int'
|  5003 |     DumpVkExtent2D(p, "maxTileSize", obj.maxTileSize);
|       |                                          ^~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5004:74: error: request for member 'superblockSizes' in 'obj', which is of non-class type 'const int'
|  5004 |     DumpVkVideoEncodeAV1SuperblockSizeFlagsKHR(p, "superblockSizes", obj.superblockSizes);
|       |                                                                          ^~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5005:52: error: request for member 'maxSingleReferenceCount' in 'obj', which is of non-class type 'const int'
|  5005 |     p.PrintKeyValue("maxSingleReferenceCount", obj.maxSingleReferenceCount);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5006:52: error: request for member 'singleReferenceNameMask' in 'obj', which is of non-class type 'const int'
|  5006 |     p.PrintKeyValue("singleReferenceNameMask", obj.singleReferenceNameMask);
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5007:68: error: request for member 'maxUnidirectionalCompoundReferenceCount' in 'obj', which is of non-class type 'const int'
|  5007 |     p.PrintKeyValue("maxUnidirectionalCompoundReferenceCount", obj.maxUnidirectionalCompoundReferenceCount);
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5008:74: error: request for member 'maxUnidirectionalCompoundGroup1ReferenceCount' in 'obj', which is of non-class type 'const int'
|  5008 |     p.PrintKeyValue("maxUnidirectionalCompoundGroup1ReferenceCount", obj.maxUnidirectionalCompoundGroup1ReferenceCount);
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5009:68: error: request for member 'unidirectionalCompoundReferenceNameMask' in 'obj', which is of non-class type 'const int'
|  5009 |     p.PrintKeyValue("unidirectionalCompoundReferenceNameMask", obj.unidirectionalCompoundReferenceNameMask);
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5010:67: error: request for member 'maxBidirectionalCompoundReferenceCount' in 'obj', which is of non-class type 'const int'
|  5010 |     p.PrintKeyValue("maxBidirectionalCompoundReferenceCount", obj.maxBidirectionalCompoundReferenceCount);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5011:73: error: request for member 'maxBidirectionalCompoundGroup1ReferenceCount' in 'obj', which is of non-class type 'const int'
|  5011 |     p.PrintKeyValue("maxBidirectionalCompoundGroup1ReferenceCount", obj.maxBidirectionalCompoundGroup1ReferenceCount);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5012:73: error: request for member 'maxBidirectionalCompoundGroup2ReferenceCount' in 'obj', which is of non-class type 'const int'
|  5012 |     p.PrintKeyValue("maxBidirectionalCompoundGroup2ReferenceCount", obj.maxBidirectionalCompoundGroup2ReferenceCount);
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5013:67: error: request for member 'bidirectionalCompoundReferenceNameMask' in 'obj', which is of non-class type 'const int'
|  5013 |     p.PrintKeyValue("bidirectionalCompoundReferenceNameMask", obj.bidirectionalCompoundReferenceNameMask);
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5014:50: error: request for member 'maxTemporalLayerCount' in 'obj', which is of non-class type 'const int'
|  5014 |     p.PrintKeyValue("maxTemporalLayerCount", obj.maxTemporalLayerCount);
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5015:49: error: request for member 'maxSpatialLayerCount' in 'obj', which is of non-class type 'const int'
|  5015 |     p.PrintKeyValue("maxSpatialLayerCount", obj.maxSpatialLayerCount);
|       |                                                 ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5016:47: error: request for member 'maxOperatingPoints' in 'obj', which is of non-class type 'const int'
|  5016 |     p.PrintKeyValue("maxOperatingPoints", obj.maxOperatingPoints);
|       |                                               ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5017:38: error: request for member 'minQIndex' in 'obj', which is of non-class type 'const int'
|  5017 |     p.PrintKeyValue("minQIndex", obj.minQIndex);
|       |                                      ^~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5018:38: error: request for member 'maxQIndex' in 'obj', which is of non-class type 'const int'
|  5018 |     p.PrintKeyValue("maxQIndex", obj.maxQIndex);
|       |                                      ^~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5019:71: error: request for member 'prefersGopRemainingFrames' in 'obj', which is of non-class type 'const int'
|  5019 |     p.PrintKeyBool("prefersGopRemainingFrames", static_cast<bool>(obj.prefersGopRemainingFrames));
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5020:72: error: request for member 'requiresGopRemainingFrames' in 'obj', which is of non-class type 'const int'
|  5020 |     p.PrintKeyBool("requiresGopRemainingFrames", static_cast<bool>(obj.requiresGopRemainingFrames));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5021:62: error: request for member 'stdSyntaxFlags' in 'obj', which is of non-class type 'const int'
|  5021 |     DumpVkVideoEncodeAV1StdFlagsKHR(p, "stdSyntaxFlags", obj.stdSyntaxFlags);
|       |                                                              ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5023:77: error: 'VkVideoEncodeAV1ProfileInfoKHR' does not name a type; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  5023 | void DumpVkVideoEncodeAV1ProfileInfoKHR(Printer &p, std::string name, const VkVideoEncodeAV1ProfileInfoKHR &obj) {
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                             VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1ProfileInfoKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5025:49: error: request for member 'stdProfile' in 'obj', which is of non-class type 'const int'
|  5025 |     DumpStdVideoAV1Profile(p, "stdProfile", obj.stdProfile);
|       |                                                 ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5027:93: error: 'VkVideoEncodeAV1QuantizationMapCapabilitiesKHR' does not name a type
|  5027 | void DumpVkVideoEncodeAV1QuantizationMapCapabilitiesKHR(Printer &p, std::string name, const VkVideoEncodeAV1QuantizationMapCapabilitiesKHR &obj) {
|       |                                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeAV1QuantizationMapCapabilitiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5030:43: error: request for member 'minQIndexDelta' in 'obj', which is of non-class type 'const int'
|  5030 |     p.PrintKeyValue("minQIndexDelta", obj.minQIndexDelta);
|       |                                           ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5031:43: error: request for member 'maxQIndexDelta' in 'obj', which is of non-class type 'const int'
|  5031 |     p.PrintKeyValue("maxQIndexDelta", obj.maxQIndexDelta);
|       |                                           ^~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5065:94: error: 'VkVideoEncodeH264QuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH264CapabilitiesKHR'?
|  5065 | void DumpVkVideoEncodeH264QuantizationMapCapabilitiesKHR(Printer &p, std::string name, const VkVideoEncodeH264QuantizationMapCapabilitiesKHR &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkVideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeH264QuantizationMapCapabilitiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5068:39: error: request for member 'minQpDelta' in 'obj', which is of non-class type 'const int'
|  5068 |     p.PrintKeyValue("minQpDelta", obj.minQpDelta);
|       |                                       ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5069:39: error: request for member 'maxQpDelta' in 'obj', which is of non-class type 'const int'
|  5069 |     p.PrintKeyValue("maxQpDelta", obj.maxQpDelta);
|       |                                       ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5095:94: error: 'VkVideoEncodeH265QuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  5095 | void DumpVkVideoEncodeH265QuantizationMapCapabilitiesKHR(Printer &p, std::string name, const VkVideoEncodeH265QuantizationMapCapabilitiesKHR &obj) {
|       |                                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                              VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeH265QuantizationMapCapabilitiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5098:39: error: request for member 'minQpDelta' in 'obj', which is of non-class type 'const int'
|  5098 |     p.PrintKeyValue("minQpDelta", obj.minQpDelta);
|       |                                       ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5099:39: error: request for member 'maxQpDelta' in 'obj', which is of non-class type 'const int'
|  5099 |     p.PrintKeyValue("maxQpDelta", obj.maxQpDelta);
|       |                                       ^~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5101:90: error: 'VkVideoEncodeQuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  5101 | void DumpVkVideoEncodeQuantizationMapCapabilitiesKHR(Printer &p, std::string name, const VkVideoEncodeQuantizationMapCapabilitiesKHR &obj) {
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                          VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoEncodeQuantizationMapCapabilitiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5103:55: error: request for member 'maxQuantizationMapExtent' in 'obj', which is of non-class type 'const int'
|  5103 |     DumpVkExtent2D(p, "maxQuantizationMapExtent", obj.maxQuantizationMapExtent);
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5111:91: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' does not name a type
|  5111 | void DumpVkVideoFormatAV1QuantizationMapPropertiesKHR(Printer &p, std::string name, const VkVideoFormatAV1QuantizationMapPropertiesKHR &obj) {
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoFormatAV1QuantizationMapPropertiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5113:84: error: request for member 'compatibleSuperblockSizes' in 'obj', which is of non-class type 'const int'
|  5113 |     DumpVkVideoEncodeAV1SuperblockSizeFlagsKHR(p, "compatibleSuperblockSizes", obj.compatibleSuperblockSizes);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5115:92: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' does not name a type
|  5115 | void DumpVkVideoFormatH265QuantizationMapPropertiesKHR(Printer &p, std::string name, const VkVideoFormatH265QuantizationMapPropertiesKHR &obj) {
|       |                                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoFormatH265QuantizationMapPropertiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5117:71: error: request for member 'compatibleCtbSizes' in 'obj', which is of non-class type 'const int'
|  5117 |     DumpVkVideoEncodeH265CtbSizeFlagsKHR(p, "compatibleCtbSizes", obj.compatibleCtbSizes);
|       |                                                                       ^~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5128:88: error: 'VkVideoFormatQuantizationMapPropertiesKHR' does not name a type
|  5128 | void DumpVkVideoFormatQuantizationMapPropertiesKHR(Printer &p, std::string name, const VkVideoFormatQuantizationMapPropertiesKHR &obj) {
|       |                                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void DumpVkVideoFormatQuantizationMapPropertiesKHR(Printer&, std::string, const int&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5130:55: error: request for member 'quantizationMapTexelSize' in 'obj', which is of non-class type 'const int'
|  5130 |     DumpVkExtent2D(p, "quantizationMapTexelSize", obj.quantizationMapTexelSize);
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5168:5: error: 'VkPhysicalDeviceHostImageCopyProperties' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  5168 |     VkPhysicalDeviceHostImageCopyProperties PhysicalDeviceHostImageCopyProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5176:5: error: 'VkPhysicalDeviceLineRasterizationProperties' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  5176 |     VkPhysicalDeviceLineRasterizationProperties PhysicalDeviceLineRasterizationProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5179:5: error: 'VkPhysicalDeviceMaintenance5Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  5179 |     VkPhysicalDeviceMaintenance5Properties PhysicalDeviceMaintenance5Properties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5180:5: error: 'VkPhysicalDeviceMaintenance6Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  5180 |     VkPhysicalDeviceMaintenance6Properties PhysicalDeviceMaintenance6Properties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5191:5: error: 'VkPhysicalDevicePipelineRobustnessProperties' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  5191 |     VkPhysicalDevicePipelineRobustnessProperties PhysicalDevicePipelineRobustnessProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5198:5: error: 'VkPhysicalDevicePushDescriptorProperties' does not name a type; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  5198 |     VkPhysicalDevicePushDescriptorProperties PhysicalDevicePushDescriptorProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5212:5: error: 'VkPhysicalDeviceVertexAttributeDivisorProperties' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR'?
|  5212 |     VkPhysicalDeviceVertexAttributeDivisorProperties PhysicalDeviceVertexAttributeDivisorProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5217:5: error: 'VkPhysicalDeviceVulkan14Properties' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Properties'?
|  5217 |     VkPhysicalDeviceVulkan14Properties PhysicalDeviceVulkan14Properties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVulkan13Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_props2_chain::initialize_chain(AppInstance&, AppGpu&, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5243:9: error: 'PhysicalDeviceHostImageCopyProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  5243 |         PhysicalDeviceHostImageCopyProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5243:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT'?
|  5243 |         PhysicalDeviceHostImageCopyProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5248:9: error: 'PhysicalDeviceLineRasterizationProperties' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  5248 |         PhysicalDeviceLineRasterizationProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5248:59: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR'?
|  5248 |         PhysicalDeviceLineRasterizationProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5251:9: error: 'PhysicalDeviceMaintenance5Properties' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance3Properties'?
|  5251 |         PhysicalDeviceMaintenance5Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance3Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5251:54: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  5251 |         PhysicalDeviceMaintenance5Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES;
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5252:9: error: 'PhysicalDeviceMaintenance6Properties' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance3Properties'?
|  5252 |         PhysicalDeviceMaintenance6Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance3Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5252:54: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  5252 |         PhysicalDeviceMaintenance6Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES;
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5263:9: error: 'PhysicalDevicePipelineRobustnessProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  5263 |         PhysicalDevicePipelineRobustnessProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5263:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT'?
|  5263 |         PhysicalDevicePipelineRobustnessProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5270:9: error: 'PhysicalDevicePushDescriptorProperties' was not declared in this scope; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  5270 |         PhysicalDevicePushDescriptorProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5270:56: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR'?
|  5270 |         PhysicalDevicePushDescriptorProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES;
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                        VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5284:9: error: 'PhysicalDeviceVertexAttributeDivisorProperties' was not declared in this scope; did you mean 'PhysicalDeviceVertexAttributeDivisorPropertiesEXT'?
|  5284 |         PhysicalDeviceVertexAttributeDivisorProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceVertexAttributeDivisorPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5284:64: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR'?
|  5284 |         PhysicalDeviceVertexAttributeDivisorProperties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5289:9: error: 'PhysicalDeviceVulkan14Properties' was not declared in this scope; did you mean 'PhysicalDeviceVulkan11Properties'?
|  5289 |         PhysicalDeviceVulkan14Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5289:50: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES'?
|  5289 |         PhysicalDeviceVulkan14Properties.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES;
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5340:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5340 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5356:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5356 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5365:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5365 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5368:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5368 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5392:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5392 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5406:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5406 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5440:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5440 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5450:33: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5450 |         if ((gpu.api_version >= VK_API_VERSION_1_4))
|       |                                 ^~~~~~~~~~~~~~~~~~
|       |                                 VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_props2(Printer&, AppInstance&, AppGpu&, bool, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5581:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT'?
|  5581 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5582:19: error: 'VkPhysicalDeviceHostImageCopyProperties' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyPropertiesEXT'?
|  5582 |             const VkPhysicalDeviceHostImageCopyProperties* props = (const VkPhysicalDeviceHostImageCopyProperties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceHostImageCopyPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5583:79: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5583 |             DumpVkPhysicalDeviceHostImageCopyProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceHostImageCopyProperties":"VkPhysicalDeviceHostImageCopyPropertiesEXT", *props);
|       |                                                                               ^~~~~~~~~~~~~~~~~~
|       |                                                                               VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5583:188: error: 'props' was not declared in this scope
|  5583 |             DumpVkPhysicalDeviceHostImageCopyProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceHostImageCopyProperties":"VkPhysicalDeviceHostImageCopyPropertiesEXT", *props);
|       |                                                                                                                                                                                            ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5606:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR'?
|  5606 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5607:19: error: 'VkPhysicalDeviceLineRasterizationProperties' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationPropertiesKHR'?
|  5607 |             const VkPhysicalDeviceLineRasterizationProperties* props = (const VkPhysicalDeviceLineRasterizationProperties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceLineRasterizationPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5608:83: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5608 |             DumpVkPhysicalDeviceLineRasterizationProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceLineRasterizationProperties":"VkPhysicalDeviceLineRasterizationPropertiesKHR", *props);
|       |                                                                                   ^~~~~~~~~~~~~~~~~~
|       |                                                                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5608:200: error: 'props' was not declared in this scope
|  5608 |             DumpVkPhysicalDeviceLineRasterizationProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceLineRasterizationProperties":"VkPhysicalDeviceLineRasterizationPropertiesKHR", *props);
|       |                                                                                                                                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5621:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  5621 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5622:19: error: 'VkPhysicalDeviceMaintenance5Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  5622 |             const VkPhysicalDeviceMaintenance5Properties* props = (const VkPhysicalDeviceMaintenance5Properties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5623:78: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5623 |             DumpVkPhysicalDeviceMaintenance5Properties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance5Properties":"VkPhysicalDeviceMaintenance5PropertiesKHR", *props);
|       |                                                                              ^~~~~~~~~~~~~~~~~~
|       |                                                                              VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5623:185: error: 'props' was not declared in this scope
|  5623 |             DumpVkPhysicalDeviceMaintenance5Properties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance5Properties":"VkPhysicalDeviceMaintenance5PropertiesKHR", *props);
|       |                                                                                                                                                                                         ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5626:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES'?
|  5626 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5627:19: error: 'VkPhysicalDeviceMaintenance6Properties' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Properties'?
|  5627 |             const VkPhysicalDeviceMaintenance6Properties* props = (const VkPhysicalDeviceMaintenance6Properties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceMaintenance4Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5628:78: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5628 |             DumpVkPhysicalDeviceMaintenance6Properties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance6Properties":"VkPhysicalDeviceMaintenance6PropertiesKHR", *props);
|       |                                                                              ^~~~~~~~~~~~~~~~~~
|       |                                                                              VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5628:185: error: 'props' was not declared in this scope
|  5628 |             DumpVkPhysicalDeviceMaintenance6Properties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance6Properties":"VkPhysicalDeviceMaintenance6PropertiesKHR", *props);
|       |                                                                                                                                                                                         ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5681:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT'?
|  5681 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5682:19: error: 'VkPhysicalDevicePipelineRobustnessProperties' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessPropertiesEXT'?
|  5682 |             const VkPhysicalDevicePipelineRobustnessProperties* props = (const VkPhysicalDevicePipelineRobustnessProperties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDevicePipelineRobustnessPropertiesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5683:84: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5683 |             DumpVkPhysicalDevicePipelineRobustnessProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineRobustnessProperties":"VkPhysicalDevicePipelineRobustnessPropertiesEXT", *props);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~
|       |                                                                                    VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5683:203: error: 'props' was not declared in this scope
|  5683 |             DumpVkPhysicalDevicePipelineRobustnessProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineRobustnessProperties":"VkPhysicalDevicePipelineRobustnessPropertiesEXT", *props);
|       |                                                                                                                                                                                                           ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5708:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR'?
|  5708 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5709:19: error: 'VkPhysicalDevicePushDescriptorProperties' does not name a type; did you mean 'VkPhysicalDevicePushDescriptorPropertiesKHR'?
|  5709 |             const VkPhysicalDevicePushDescriptorProperties* props = (const VkPhysicalDevicePushDescriptorProperties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDevicePushDescriptorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5710:80: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5710 |             DumpVkPhysicalDevicePushDescriptorProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePushDescriptorProperties":"VkPhysicalDevicePushDescriptorPropertiesKHR", *props);
|       |                                                                                ^~~~~~~~~~~~~~~~~~
|       |                                                                                VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5710:191: error: 'props' was not declared in this scope
|  5710 |             DumpVkPhysicalDevicePushDescriptorProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePushDescriptorProperties":"VkPhysicalDevicePushDescriptorPropertiesKHR", *props);
|       |                                                                                                                                                                                               ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5778:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR'?
|  5778 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5779:19: error: 'VkPhysicalDeviceVertexAttributeDivisorProperties' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR'?
|  5779 |             const VkPhysicalDeviceVertexAttributeDivisorProperties* props = (const VkPhysicalDeviceVertexAttributeDivisorProperties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5780:88: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  5780 |             DumpVkPhysicalDeviceVertexAttributeDivisorProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceVertexAttributeDivisorProperties":"VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR", *props);
|       |                                                                                        ^~~~~~~~~~~~~~~~~~
|       |                                                                                        VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5780:215: error: 'props' was not declared in this scope
|  5780 |             DumpVkPhysicalDeviceVertexAttributeDivisorProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceVertexAttributeDivisorProperties":"VkPhysicalDeviceVertexAttributeDivisorPropertiesKHR", *props);
|       |                                                                                                                                                                                                                       ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5803:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES'?
|  5803 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5804:19: error: 'VkPhysicalDeviceVulkan14Properties' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Properties'?
|  5804 |             const VkPhysicalDeviceVulkan14Properties* props = (const VkPhysicalDeviceVulkan14Properties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVulkan13Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5805:94: error: 'props' was not declared in this scope
|  5805 |             DumpVkPhysicalDeviceVulkan14Properties(p, "VkPhysicalDeviceVulkan14Properties", *props);
|       |                                                                                              ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'bool prepare_phys_device_props2_twocall_chain_vectors(std::unique_ptr<phys_device_props2_chain>&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5814:82: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceHostImageCopyProperties'; did you mean 'PhysicalDeviceMultiviewProperties'?
|  5814 |     chain->VkPhysicalDeviceHostImageCopyProperties_pCopySrcLayouts.resize(chain->PhysicalDeviceHostImageCopyProperties.copySrcLayoutCount);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  PhysicalDeviceMultiviewProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5815:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceHostImageCopyProperties'; did you mean 'PhysicalDeviceMultiviewProperties'?
|  5815 |     chain->PhysicalDeviceHostImageCopyProperties.pCopySrcLayouts = chain->VkPhysicalDeviceHostImageCopyProperties_pCopySrcLayouts.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceMultiviewProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5816:82: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceHostImageCopyProperties'; did you mean 'PhysicalDeviceMultiviewProperties'?
|  5816 |     chain->VkPhysicalDeviceHostImageCopyProperties_pCopyDstLayouts.resize(chain->PhysicalDeviceHostImageCopyProperties.copyDstLayoutCount);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  PhysicalDeviceMultiviewProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5817:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceHostImageCopyProperties'; did you mean 'PhysicalDeviceMultiviewProperties'?
|  5817 |     chain->PhysicalDeviceHostImageCopyProperties.pCopyDstLayouts = chain->VkPhysicalDeviceHostImageCopyProperties_pCopyDstLayouts.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceMultiviewProperties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5820:77: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceVulkan14Properties'; did you mean 'PhysicalDeviceVulkan11Properties'?
|  5820 |     chain->VkPhysicalDeviceVulkan14Properties_pCopySrcLayouts.resize(chain->PhysicalDeviceVulkan14Properties.copySrcLayoutCount);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                             PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5821:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceVulkan14Properties'; did you mean 'PhysicalDeviceVulkan11Properties'?
|  5821 |     chain->PhysicalDeviceVulkan14Properties.pCopySrcLayouts = chain->VkPhysicalDeviceVulkan14Properties_pCopySrcLayouts.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5822:77: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceVulkan14Properties'; did you mean 'PhysicalDeviceVulkan11Properties'?
|  5822 |     chain->VkPhysicalDeviceVulkan14Properties_pCopyDstLayouts.resize(chain->PhysicalDeviceVulkan14Properties.copyDstLayoutCount);
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                             PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5823:12: error: 'struct phys_device_props2_chain' has no member named 'PhysicalDeviceVulkan14Properties'; did you mean 'PhysicalDeviceVulkan11Properties'?
|  5823 |     chain->PhysicalDeviceVulkan14Properties.pCopyDstLayouts = chain->VkPhysicalDeviceVulkan14Properties_pCopyDstLayouts.data();
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            PhysicalDeviceVulkan11Properties
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5884:5: error: 'VkPhysicalDeviceDepthClampZeroOneFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT'?
|  5884 |     VkPhysicalDeviceDepthClampZeroOneFeaturesKHR PhysicalDeviceDepthClampZeroOneFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDepthClampZeroOneFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5892:5: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeatures' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  5892 |     VkPhysicalDeviceDynamicRenderingLocalReadFeatures PhysicalDeviceDynamicRenderingLocalReadFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5904:5: error: 'VkPhysicalDeviceGlobalPriorityQueryFeatures' does not name a type; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  5904 |     VkPhysicalDeviceGlobalPriorityQueryFeatures PhysicalDeviceGlobalPriorityQueryFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5906:5: error: 'VkPhysicalDeviceHostImageCopyFeatures' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  5906 |     VkPhysicalDeviceHostImageCopyFeatures PhysicalDeviceHostImageCopyFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5915:5: error: 'VkPhysicalDeviceIndexTypeUint8Features' does not name a type; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  5915 |     VkPhysicalDeviceIndexTypeUint8Features PhysicalDeviceIndexTypeUint8Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5919:5: error: 'VkPhysicalDeviceLineRasterizationFeatures' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  5919 |     VkPhysicalDeviceLineRasterizationFeatures PhysicalDeviceLineRasterizationFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5921:5: error: 'VkPhysicalDeviceMaintenance5Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  5921 |     VkPhysicalDeviceMaintenance5Features PhysicalDeviceMaintenance5Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5922:5: error: 'VkPhysicalDeviceMaintenance6Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  5922 |     VkPhysicalDeviceMaintenance6Features PhysicalDeviceMaintenance6Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5924:5: error: 'VkPhysicalDeviceMaintenance8FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance7FeaturesKHR'?
|  5924 |     VkPhysicalDeviceMaintenance8FeaturesKHR PhysicalDeviceMaintenance8FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceMaintenance7FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5942:5: error: 'VkPhysicalDevicePipelineProtectedAccessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  5942 |     VkPhysicalDevicePipelineProtectedAccessFeatures PhysicalDevicePipelineProtectedAccessFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5943:5: error: 'VkPhysicalDevicePipelineRobustnessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  5943 |     VkPhysicalDevicePipelineRobustnessFeatures PhysicalDevicePipelineRobustnessFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5948:5: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  5948 |     VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5971:5: error: 'VkPhysicalDeviceShaderExpectAssumeFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  5971 |     VkPhysicalDeviceShaderExpectAssumeFeatures PhysicalDeviceShaderExpectAssumeFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5973:5: error: 'VkPhysicalDeviceShaderFloatControls2Features' does not name a type; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  5973 |     VkPhysicalDeviceShaderFloatControls2Features PhysicalDeviceShaderFloatControls2Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5984:5: error: 'VkPhysicalDeviceShaderSubgroupRotateFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  5984 |     VkPhysicalDeviceShaderSubgroupRotateFeatures PhysicalDeviceShaderSubgroupRotateFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5998:5: error: 'VkPhysicalDeviceVertexAttributeDivisorFeatures' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  5998 |     VkPhysicalDeviceVertexAttributeDivisorFeatures PhysicalDeviceVertexAttributeDivisorFeatures{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:5999:5: error: 'VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  5999 |     VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT PhysicalDeviceVertexAttributeRobustnessFeaturesEXT{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6001:5: error: 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  6001 |     VkPhysicalDeviceVideoEncodeAV1FeaturesKHR PhysicalDeviceVideoEncodeAV1FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6002:5: error: 'VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceSynchronization2FeaturesKHR'?
|  6002 |     VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceSynchronization2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6004:5: error: 'VkPhysicalDeviceVideoMaintenance2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  6004 |     VkPhysicalDeviceVideoMaintenance2FeaturesKHR PhysicalDeviceVideoMaintenance2FeaturesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6008:5: error: 'VkPhysicalDeviceVulkan14Features' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Features'?
|  6008 |     VkPhysicalDeviceVulkan14Features PhysicalDeviceVulkan14Features{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkPhysicalDeviceVulkan13Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void phys_device_features2_chain::initialize_chain(AppGpu&, bool)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6034:9: error: 'PhysicalDeviceDepthClampZeroOneFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT'?
|  6034 |         PhysicalDeviceDepthClampZeroOneFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceDepthClampZeroOneFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6034:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT'?
|  6034 |         PhysicalDeviceDepthClampZeroOneFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6042:9: error: 'PhysicalDeviceDynamicRenderingLocalReadFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  6042 |         PhysicalDeviceDynamicRenderingLocalReadFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6042:65: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR'?
|  6042 |         PhysicalDeviceDynamicRenderingLocalReadFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES;
|       |                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6054:9: error: 'PhysicalDeviceGlobalPriorityQueryFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  6054 |         PhysicalDeviceGlobalPriorityQueryFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6054:59: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR'?
|  6054 |         PhysicalDeviceGlobalPriorityQueryFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6056:9: error: 'PhysicalDeviceHostImageCopyFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  6056 |         PhysicalDeviceHostImageCopyFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6056:53: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT'?
|  6056 |         PhysicalDeviceHostImageCopyFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6065:9: error: 'PhysicalDeviceIndexTypeUint8Features' was not declared in this scope; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  6065 |         PhysicalDeviceIndexTypeUint8Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6065:54: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR'?
|  6065 |         PhysicalDeviceIndexTypeUint8Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES;
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6069:9: error: 'PhysicalDeviceLineRasterizationFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  6069 |         PhysicalDeviceLineRasterizationFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6069:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR'?
|  6069 |         PhysicalDeviceLineRasterizationFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6071:9: error: 'PhysicalDeviceMaintenance5Features' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance4Features'?
|  6071 |         PhysicalDeviceMaintenance5Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6071:52: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  6071 |         PhysicalDeviceMaintenance5Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES;
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6072:9: error: 'PhysicalDeviceMaintenance6Features' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance4Features'?
|  6072 |         PhysicalDeviceMaintenance6Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6072:52: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  6072 |         PhysicalDeviceMaintenance6Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES;
|       |                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6074:9: error: 'PhysicalDeviceMaintenance8FeaturesKHR' was not declared in this scope; did you mean 'PhysicalDeviceMaintenance7FeaturesKHR'?
|  6074 |         PhysicalDeviceMaintenance8FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceMaintenance7FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6074:55: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR'?
|  6074 |         PhysicalDeviceMaintenance8FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR;
|       |                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                       VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6092:9: error: 'PhysicalDevicePipelineProtectedAccessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  6092 |         PhysicalDevicePipelineProtectedAccessFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6092:63: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT'?
|  6092 |         PhysicalDevicePipelineProtectedAccessFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6093:9: error: 'PhysicalDevicePipelineRobustnessFeatures' was not declared in this scope; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  6093 |         PhysicalDevicePipelineRobustnessFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6093:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT'?
|  6093 |         PhysicalDevicePipelineRobustnessFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6098:9: error: 'PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT'?
|  6098 |         PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6098:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  6098 |         PhysicalDevicePresentModeFifoLatestReadyFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6121:9: error: 'PhysicalDeviceShaderExpectAssumeFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  6121 |         PhysicalDeviceShaderExpectAssumeFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6121:58: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR'?
|  6121 |         PhysicalDeviceShaderExpectAssumeFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES;
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                          VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6123:9: error: 'PhysicalDeviceShaderFloatControls2Features' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  6123 |         PhysicalDeviceShaderFloatControls2Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6123:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR'?
|  6123 |         PhysicalDeviceShaderFloatControls2Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6133:9: error: 'PhysicalDeviceShaderSubgroupRotateFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  6133 |         PhysicalDeviceShaderSubgroupRotateFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6133:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR'?
|  6133 |         PhysicalDeviceShaderSubgroupRotateFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6147:9: error: 'PhysicalDeviceVertexAttributeDivisorFeatures' was not declared in this scope; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  6147 |         PhysicalDeviceVertexAttributeDivisorFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6147:62: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR'?
|  6147 |         PhysicalDeviceVertexAttributeDivisorFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6148:9: error: 'PhysicalDeviceVertexAttributeRobustnessFeaturesEXT' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT'?
|  6148 |         PhysicalDeviceVertexAttributeRobustnessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6148:68: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  6148 |         PhysicalDeviceVertexAttributeRobustnessFeaturesEXT.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT;
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6150:9: error: 'PhysicalDeviceVideoEncodeAV1FeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR'?
|  6150 |         PhysicalDeviceVideoEncodeAV1FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6150:57: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  6150 |         PhysicalDeviceVideoEncodeAV1FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6151:9: error: 'PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' was not declared in this scope; did you mean 'DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR'?
|  6151 |         PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6151:69: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR'?
|  6151 |         PhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR;
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6153:9: error: 'PhysicalDeviceVideoMaintenance2FeaturesKHR' was not declared in this scope; did you mean 'PhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  6153 |         PhysicalDeviceVideoMaintenance2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6153:60: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  6153 |         PhysicalDeviceVideoMaintenance2FeaturesKHR.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6157:9: error: 'PhysicalDeviceVulkan14Features' was not declared in this scope; did you mean 'PhysicalDeviceVulkan11Features'?
|  6157 |         PhysicalDeviceVulkan14Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         PhysicalDeviceVulkan11Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6157:48: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES'?
|  6157 |         PhysicalDeviceVulkan14Features.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES;
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6207:54: error: 'VK_KHR_DEPTH_CLAMP_ZERO_ONE_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DEPTH_CLAMP_ZERO_ONE_EXTENSION_NAME'?
|  6207 |          || gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_DEPTH_CLAMP_ZERO_ONE_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DEPTH_CLAMP_ZERO_ONE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6226:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6226 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6253:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6253 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6258:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6258 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6281:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6281 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6292:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6292 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6298:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6298 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6301:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6301 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6305:54: error: 'VK_KHR_MAINTENANCE_8_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_MAINTENANCE_3_EXTENSION_NAME'?
|  6305 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_MAINTENANCE_8_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_MAINTENANCE_3_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6345:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6345 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6348:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6348 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6356:54: error: 'VK_EXT_PRESENT_MODE_FIFO_LATEST_READY_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME'?
|  6356 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_PRESENT_MODE_FIFO_LATEST_READY_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_DIRECT_MODE_DISPLAY_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6410:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6410 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6416:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6416 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6439:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6439 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6476:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6476 |             && (gpu.api_version < VK_API_VERSION_1_4 || show_promoted_structs))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6478:54: error: 'VK_EXT_VERTEX_ATTRIBUTE_ROBUSTNESS_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_EXT_VERTEX_ATTRIBUTE_DIVISOR_EXTENSION_NAME'?
|  6478 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_EXT_VERTEX_ATTRIBUTE_ROBUSTNESS_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_EXT_VERTEX_ATTRIBUTE_DIVISOR_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6482:54: error: 'VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  6482 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6484:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  6484 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6488:54: error: 'VK_KHR_VIDEO_MAINTENANCE_2_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_MAINTENANCE_1_EXTENSION_NAME'?
|  6488 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_MAINTENANCE_2_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_MAINTENANCE_1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6496:33: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6496 |         if ((gpu.api_version >= VK_API_VERSION_1_4))
|       |                                 ^~~~~~~~~~~~~~~~~~
|       |                                 VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_phys_device_features2(Printer&, AppGpu&, bool, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6624:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT'?
|  6624 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6625:19: error: 'VkPhysicalDeviceDepthClampZeroOneFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceDepthClampZeroOneFeaturesEXT'?
|  6625 |             const VkPhysicalDeviceDepthClampZeroOneFeaturesKHR* props = (const VkPhysicalDeviceDepthClampZeroOneFeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceDepthClampZeroOneFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6626:114: error: 'props' was not declared in this scope
|  6626 |             DumpVkPhysicalDeviceDepthClampZeroOneFeaturesKHR(p, "VkPhysicalDeviceDepthClampZeroOneFeaturesKHR", *props);
|       |                                                                                                                  ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6664:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR'?
|  6664 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6665:19: error: 'VkPhysicalDeviceDynamicRenderingLocalReadFeatures' does not name a type; did you mean 'VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR'?
|  6665 |             const VkPhysicalDeviceDynamicRenderingLocalReadFeatures* props = (const VkPhysicalDeviceDynamicRenderingLocalReadFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6666:89: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6666 |             DumpVkPhysicalDeviceDynamicRenderingLocalReadFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceDynamicRenderingLocalReadFeatures":"VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR", *props);
|       |                                                                                         ^~~~~~~~~~~~~~~~~~
|       |                                                                                         VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6666:218: error: 'props' was not declared in this scope
|  6666 |             DumpVkPhysicalDeviceDynamicRenderingLocalReadFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceDynamicRenderingLocalReadFeatures":"VkPhysicalDeviceDynamicRenderingLocalReadFeaturesKHR", *props);
|       |                                                                                                                                                                                                                          ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6724:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR'?
|  6724 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6725:19: error: 'VkPhysicalDeviceGlobalPriorityQueryFeatures' does not name a type; did you mean 'VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR'?
|  6725 |             const VkPhysicalDeviceGlobalPriorityQueryFeatures* props = (const VkPhysicalDeviceGlobalPriorityQueryFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceGlobalPriorityQueryFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6726:83: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6726 |             DumpVkPhysicalDeviceGlobalPriorityQueryFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceGlobalPriorityQueryFeatures":"VkPhysicalDeviceGlobalPriorityQueryFeaturesEXT", *props);
|       |                                                                                   ^~~~~~~~~~~~~~~~~~
|       |                                                                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6726:200: error: 'props' was not declared in this scope
|  6726 |             DumpVkPhysicalDeviceGlobalPriorityQueryFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceGlobalPriorityQueryFeatures":"VkPhysicalDeviceGlobalPriorityQueryFeaturesEXT", *props);
|       |                                                                                                                                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6734:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT'?
|  6734 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6735:19: error: 'VkPhysicalDeviceHostImageCopyFeatures' does not name a type; did you mean 'VkPhysicalDeviceHostImageCopyFeaturesEXT'?
|  6735 |             const VkPhysicalDeviceHostImageCopyFeatures* props = (const VkPhysicalDeviceHostImageCopyFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceHostImageCopyFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6736:77: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6736 |             DumpVkPhysicalDeviceHostImageCopyFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceHostImageCopyFeatures":"VkPhysicalDeviceHostImageCopyFeaturesEXT", *props);
|       |                                                                             ^~~~~~~~~~~~~~~~~~
|       |                                                                             VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6736:182: error: 'props' was not declared in this scope
|  6736 |             DumpVkPhysicalDeviceHostImageCopyFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceHostImageCopyFeatures":"VkPhysicalDeviceHostImageCopyFeaturesEXT", *props);
|       |                                                                                                                                                                                      ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6779:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR'?
|  6779 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6780:19: error: 'VkPhysicalDeviceIndexTypeUint8Features' does not name a type; did you mean 'VkPhysicalDeviceIndexTypeUint8FeaturesKHR'?
|  6780 |             const VkPhysicalDeviceIndexTypeUint8Features* props = (const VkPhysicalDeviceIndexTypeUint8Features*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceIndexTypeUint8FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6781:78: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6781 |             DumpVkPhysicalDeviceIndexTypeUint8Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceIndexTypeUint8Features":"VkPhysicalDeviceIndexTypeUint8FeaturesKHR", *props);
|       |                                                                              ^~~~~~~~~~~~~~~~~~
|       |                                                                              VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6781:185: error: 'props' was not declared in this scope
|  6781 |             DumpVkPhysicalDeviceIndexTypeUint8Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceIndexTypeUint8Features":"VkPhysicalDeviceIndexTypeUint8FeaturesKHR", *props);
|       |                                                                                                                                                                                         ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6799:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR'?
|  6799 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6800:19: error: 'VkPhysicalDeviceLineRasterizationFeatures' does not name a type; did you mean 'VkPhysicalDeviceLineRasterizationFeaturesKHR'?
|  6800 |             const VkPhysicalDeviceLineRasterizationFeatures* props = (const VkPhysicalDeviceLineRasterizationFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceLineRasterizationFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6801:81: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6801 |             DumpVkPhysicalDeviceLineRasterizationFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceLineRasterizationFeatures":"VkPhysicalDeviceLineRasterizationFeaturesKHR", *props);
|       |                                                                                 ^~~~~~~~~~~~~~~~~~
|       |                                                                                 VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6801:194: error: 'props' was not declared in this scope
|  6801 |             DumpVkPhysicalDeviceLineRasterizationFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceLineRasterizationFeatures":"VkPhysicalDeviceLineRasterizationFeaturesKHR", *props);
|       |                                                                                                                                                                                                  ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6809:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  6809 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6810:19: error: 'VkPhysicalDeviceMaintenance5Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  6810 |             const VkPhysicalDeviceMaintenance5Features* props = (const VkPhysicalDeviceMaintenance5Features*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6811:76: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6811 |             DumpVkPhysicalDeviceMaintenance5Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance5Features":"VkPhysicalDeviceMaintenance5FeaturesKHR", *props);
|       |                                                                            ^~~~~~~~~~~~~~~~~~
|       |                                                                            VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6811:179: error: 'props' was not declared in this scope
|  6811 |             DumpVkPhysicalDeviceMaintenance5Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance5Features":"VkPhysicalDeviceMaintenance5FeaturesKHR", *props);
|       |                                                                                                                                                                                   ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6814:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES'?
|  6814 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6815:19: error: 'VkPhysicalDeviceMaintenance6Features' does not name a type; did you mean 'VkPhysicalDeviceMaintenance4Features'?
|  6815 |             const VkPhysicalDeviceMaintenance6Features* props = (const VkPhysicalDeviceMaintenance6Features*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceMaintenance4Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6816:76: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6816 |             DumpVkPhysicalDeviceMaintenance6Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance6Features":"VkPhysicalDeviceMaintenance6FeaturesKHR", *props);
|       |                                                                            ^~~~~~~~~~~~~~~~~~
|       |                                                                            VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6816:179: error: 'props' was not declared in this scope
|  6816 |             DumpVkPhysicalDeviceMaintenance6Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceMaintenance6Features":"VkPhysicalDeviceMaintenance6FeaturesKHR", *props);
|       |                                                                                                                                                                                   ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6824:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR'?
|  6824 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6825:19: error: 'VkPhysicalDeviceMaintenance8FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceMaintenance7FeaturesKHR'?
|  6825 |             const VkPhysicalDeviceMaintenance8FeaturesKHR* props = (const VkPhysicalDeviceMaintenance8FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceMaintenance7FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6826:104: error: 'props' was not declared in this scope
|  6826 |             DumpVkPhysicalDeviceMaintenance8FeaturesKHR(p, "VkPhysicalDeviceMaintenance8FeaturesKHR", *props);
|       |                                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6914:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT'?
|  6914 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6915:19: error: 'VkPhysicalDevicePipelineProtectedAccessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineProtectedAccessFeaturesEXT'?
|  6915 |             const VkPhysicalDevicePipelineProtectedAccessFeatures* props = (const VkPhysicalDevicePipelineProtectedAccessFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDevicePipelineProtectedAccessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6916:87: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6916 |             DumpVkPhysicalDevicePipelineProtectedAccessFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineProtectedAccessFeatures":"VkPhysicalDevicePipelineProtectedAccessFeaturesEXT", *props);
|       |                                                                                       ^~~~~~~~~~~~~~~~~~
|       |                                                                                       VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6916:212: error: 'props' was not declared in this scope
|  6916 |             DumpVkPhysicalDevicePipelineProtectedAccessFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineProtectedAccessFeatures":"VkPhysicalDevicePipelineProtectedAccessFeaturesEXT", *props);
|       |                                                                                                                                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6919:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT'?
|  6919 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6920:19: error: 'VkPhysicalDevicePipelineRobustnessFeatures' does not name a type; did you mean 'VkPhysicalDevicePipelineRobustnessFeaturesEXT'?
|  6920 |             const VkPhysicalDevicePipelineRobustnessFeatures* props = (const VkPhysicalDevicePipelineRobustnessFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDevicePipelineRobustnessFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6921:82: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  6921 |             DumpVkPhysicalDevicePipelineRobustnessFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineRobustnessFeatures":"VkPhysicalDevicePipelineRobustnessFeaturesEXT", *props);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6921:197: error: 'props' was not declared in this scope
|  6921 |             DumpVkPhysicalDevicePipelineRobustnessFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDevicePipelineRobustnessFeatures":"VkPhysicalDevicePipelineRobustnessFeaturesEXT", *props);
|       |                                                                                                                                                                                                     ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6936:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT'?
|  6936 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6937:19: error: 'VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT' does not name a type; did you mean 'VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT'?
|  6937 |             const VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT* props = (const VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDevicePrimitivesGeneratedQueryFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:6938:132: error: 'props' was not declared in this scope
|  6938 |             DumpVkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT(p, "VkPhysicalDevicePresentModeFifoLatestReadyFeaturesEXT", *props);
|       |                                                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7051:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR'?
|  7051 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7052:19: error: 'VkPhysicalDeviceShaderExpectAssumeFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderExpectAssumeFeaturesKHR'?
|  7052 |             const VkPhysicalDeviceShaderExpectAssumeFeatures* props = (const VkPhysicalDeviceShaderExpectAssumeFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceShaderExpectAssumeFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7053:82: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  7053 |             DumpVkPhysicalDeviceShaderExpectAssumeFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderExpectAssumeFeatures":"VkPhysicalDeviceShaderExpectAssumeFeaturesKHR", *props);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7053:197: error: 'props' was not declared in this scope
|  7053 |             DumpVkPhysicalDeviceShaderExpectAssumeFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderExpectAssumeFeatures":"VkPhysicalDeviceShaderExpectAssumeFeaturesKHR", *props);
|       |                                                                                                                                                                                                     ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7061:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR'?
|  7061 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7062:19: error: 'VkPhysicalDeviceShaderFloatControls2Features' does not name a type; did you mean 'VkPhysicalDeviceShaderFloatControls2FeaturesKHR'?
|  7062 |             const VkPhysicalDeviceShaderFloatControls2Features* props = (const VkPhysicalDeviceShaderFloatControls2Features*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceShaderFloatControls2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7063:84: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  7063 |             DumpVkPhysicalDeviceShaderFloatControls2Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderFloatControls2Features":"VkPhysicalDeviceShaderFloatControls2FeaturesKHR", *props);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~
|       |                                                                                    VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7063:203: error: 'props' was not declared in this scope
|  7063 |             DumpVkPhysicalDeviceShaderFloatControls2Features(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderFloatControls2Features":"VkPhysicalDeviceShaderFloatControls2FeaturesKHR", *props);
|       |                                                                                                                                                                                                           ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7111:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR'?
|  7111 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7112:19: error: 'VkPhysicalDeviceShaderSubgroupRotateFeatures' does not name a type; did you mean 'VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR'?
|  7112 |             const VkPhysicalDeviceShaderSubgroupRotateFeatures* props = (const VkPhysicalDeviceShaderSubgroupRotateFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7113:84: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  7113 |             DumpVkPhysicalDeviceShaderSubgroupRotateFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderSubgroupRotateFeatures":"VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR", *props);
|       |                                                                                    ^~~~~~~~~~~~~~~~~~
|       |                                                                                    VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7113:203: error: 'props' was not declared in this scope
|  7113 |             DumpVkPhysicalDeviceShaderSubgroupRotateFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceShaderSubgroupRotateFeatures":"VkPhysicalDeviceShaderSubgroupRotateFeaturesKHR", *props);
|       |                                                                                                                                                                                                           ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7181:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR'?
|  7181 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7182:19: error: 'VkPhysicalDeviceVertexAttributeDivisorFeatures' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR'?
|  7182 |             const VkPhysicalDeviceVertexAttributeDivisorFeatures* props = (const VkPhysicalDeviceVertexAttributeDivisorFeatures*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7183:86: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  7183 |             DumpVkPhysicalDeviceVertexAttributeDivisorFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceVertexAttributeDivisorFeatures":"VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR", *props);
|       |                                                                                      ^~~~~~~~~~~~~~~~~~
|       |                                                                                      VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7183:209: error: 'props' was not declared in this scope
|  7183 |             DumpVkPhysicalDeviceVertexAttributeDivisorFeatures(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkPhysicalDeviceVertexAttributeDivisorFeatures":"VkPhysicalDeviceVertexAttributeDivisorFeaturesKHR", *props);
|       |                                                                                                                                                                                                                 ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7186:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT'?
|  7186 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7187:19: error: 'VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT'?
|  7187 |             const VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT* props = (const VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVertexAttributeDivisorFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7188:130: error: 'props' was not declared in this scope
|  7188 |             DumpVkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT(p, "VkPhysicalDeviceVertexAttributeRobustnessFeaturesEXT", *props);
|       |                                                                                                                                  ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7196:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  7196 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7197:19: error: 'VkPhysicalDeviceVideoEncodeAV1FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  7197 |             const VkPhysicalDeviceVideoEncodeAV1FeaturesKHR* props = (const VkPhysicalDeviceVideoEncodeAV1FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7198:108: error: 'props' was not declared in this scope
|  7198 |             DumpVkPhysicalDeviceVideoEncodeAV1FeaturesKHR(p, "VkPhysicalDeviceVideoEncodeAV1FeaturesKHR", *props);
|       |                                                                                                            ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7201:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR'?
|  7201 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7202:19: error: 'VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceSynchronization2FeaturesKHR'?
|  7202 |             const VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR* props = (const VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceSynchronization2FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7203:132: error: 'props' was not declared in this scope
|  7203 |             DumpVkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR(p, "VkPhysicalDeviceVideoEncodeQuantizationMapFeaturesKHR", *props);
|       |                                                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7211:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR'?
|  7211 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7212:19: error: 'VkPhysicalDeviceVideoMaintenance2FeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceVideoMaintenance1FeaturesKHR'?
|  7212 |             const VkPhysicalDeviceVideoMaintenance2FeaturesKHR* props = (const VkPhysicalDeviceVideoMaintenance2FeaturesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVideoMaintenance1FeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7213:114: error: 'props' was not declared in this scope
|  7213 |             DumpVkPhysicalDeviceVideoMaintenance2FeaturesKHR(p, "VkPhysicalDeviceVideoMaintenance2FeaturesKHR", *props);
|       |                                                                                                                  ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7231:33: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES'?
|  7231 |         if (structure->sType == VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_4_FEATURES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_VULKAN_1_3_FEATURES
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7232:19: error: 'VkPhysicalDeviceVulkan14Features' does not name a type; did you mean 'VkPhysicalDeviceVulkan13Features'?
|  7232 |             const VkPhysicalDeviceVulkan14Features* props = (const VkPhysicalDeviceVulkan14Features*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkPhysicalDeviceVulkan13Features
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7233:90: error: 'props' was not declared in this scope
|  7233 |             DumpVkPhysicalDeviceVulkan14Features(p, "VkPhysicalDeviceVulkan14Features", *props);
|       |                                                                                          ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7402:5: error: 'VkQueueFamilyGlobalPriorityProperties' does not name a type; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  7402 |     VkQueueFamilyGlobalPriorityProperties QueueFamilyGlobalPriorityProperties{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void queue_properties2_chain::initialize_chain(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7406:9: error: 'QueueFamilyGlobalPriorityProperties' was not declared in this scope; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  7406 |         QueueFamilyGlobalPriorityProperties.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7406:53: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR'?
|  7406 |         QueueFamilyGlobalPriorityProperties.sType = VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7412:35: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  7412 |             && (gpu.api_version < VK_API_VERSION_1_4 ))
|       |                                   ^~~~~~~~~~~~~~~~~~
|       |                                   VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_queue_properties2(Printer&, AppGpu&, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7437:33: error: 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR'?
|  7437 |         if (structure->sType == VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7438:19: error: 'VkQueueFamilyGlobalPriorityProperties' does not name a type; did you mean 'VkQueueFamilyGlobalPriorityPropertiesKHR'?
|  7438 |             const VkQueueFamilyGlobalPriorityProperties* props = (const VkQueueFamilyGlobalPriorityProperties*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkQueueFamilyGlobalPriorityPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7439:77: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  7439 |             DumpVkQueueFamilyGlobalPriorityProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkQueueFamilyGlobalPriorityProperties":"VkQueueFamilyGlobalPriorityPropertiesEXT", *props);
|       |                                                                             ^~~~~~~~~~~~~~~~~~
|       |                                                                             VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7439:182: error: 'props' was not declared in this scope
|  7439 |             DumpVkQueueFamilyGlobalPriorityProperties(p, gpu.api_version >= VK_API_VERSION_1_4 ?"VkQueueFamilyGlobalPriorityProperties":"VkQueueFamilyGlobalPriorityPropertiesEXT", *props);
|       |                                                                                                                                                                                      ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7471:5: error: 'VkVideoEncodeAV1ProfileInfoKHR' does not name a type; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  7471 |     VkVideoEncodeAV1ProfileInfoKHR VideoEncodeAV1ProfileInfoKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void video_profile_info_chain::initialize_chain(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7480:9: error: 'VideoEncodeAV1ProfileInfoKHR' was not declared in this scope; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  7480 |         VideoEncodeAV1ProfileInfoKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7480:46: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  7480 |         VideoEncodeAV1ProfileInfoKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR;
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7493:54: error: 'VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  7493 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_video_profile_info(Printer&, AppGpu&, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7540:33: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  7540 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7541:19: error: 'VkVideoEncodeAV1ProfileInfoKHR' does not name a type; did you mean 'VkVideoDecodeAV1ProfileInfoKHR'?
|  7541 |             const VkVideoEncodeAV1ProfileInfoKHR* props = (const VkVideoEncodeAV1ProfileInfoKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkVideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7542:86: error: 'props' was not declared in this scope
|  7542 |             DumpVkVideoEncodeAV1ProfileInfoKHR(p, "VkVideoEncodeAV1ProfileInfoKHR", *props);
|       |                                                                                      ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7579:5: error: 'VkVideoEncodeAV1CapabilitiesKHR' does not name a type; did you mean 'VkVideoDecodeAV1CapabilitiesKHR'?
|  7579 |     VkVideoEncodeAV1CapabilitiesKHR VideoEncodeAV1CapabilitiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7580:5: error: 'VkVideoEncodeAV1QuantizationMapCapabilitiesKHR' does not name a type
|  7580 |     VkVideoEncodeAV1QuantizationMapCapabilitiesKHR VideoEncodeAV1QuantizationMapCapabilitiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7583:5: error: 'VkVideoEncodeH264QuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH264CapabilitiesKHR'?
|  7583 |     VkVideoEncodeH264QuantizationMapCapabilitiesKHR VideoEncodeH264QuantizationMapCapabilitiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7585:5: error: 'VkVideoEncodeH265QuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  7585 |     VkVideoEncodeH265QuantizationMapCapabilitiesKHR VideoEncodeH265QuantizationMapCapabilitiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7586:5: error: 'VkVideoEncodeQuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  7586 |     VkVideoEncodeQuantizationMapCapabilitiesKHR VideoEncodeQuantizationMapCapabilitiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void video_capabilities_chain::initialize_chain(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7592:9: error: 'VideoEncodeAV1CapabilitiesKHR' was not declared in this scope; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  7592 |         VideoEncodeAV1CapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7592:47: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  7592 |         VideoEncodeAV1CapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR;
|       |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                               VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7593:9: error: 'VideoEncodeAV1QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'DumpVkVideoEncodeAV1QuantizationMapCapabilitiesKHR'?
|  7593 |         VideoEncodeAV1QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkVideoEncodeAV1QuantizationMapCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7593:62: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  7593 |         VideoEncodeAV1QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7596:9: error: 'VideoEncodeH264QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'DumpVkVideoEncodeH264QuantizationMapCapabilitiesKHR'?
|  7596 |         VideoEncodeH264QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkVideoEncodeH264QuantizationMapCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7596:63: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR'?
|  7596 |         VideoEncodeH264QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7598:9: error: 'VideoEncodeH265QuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'DumpVkVideoEncodeH265QuantizationMapCapabilitiesKHR'?
|  7598 |         VideoEncodeH265QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkVideoEncodeH265QuantizationMapCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7598:63: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  7598 |         VideoEncodeH265QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7599:9: error: 'VideoEncodeQuantizationMapCapabilitiesKHR' was not declared in this scope; did you mean 'DumpVkVideoEncodeQuantizationMapCapabilitiesKHR'?
|  7599 |         VideoEncodeQuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkVideoEncodeQuantizationMapCapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7599:59: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  7599 |         VideoEncodeQuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7609:54: error: 'VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  7609 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7611:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  7611 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7617:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  7617 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7621:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  7621 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7623:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  7623 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_video_capabilities(Printer&, AppGpu&, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7664:33: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  7664 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7665:19: error: 'VkVideoEncodeAV1CapabilitiesKHR' does not name a type; did you mean 'VkVideoDecodeAV1CapabilitiesKHR'?
|  7665 |             const VkVideoEncodeAV1CapabilitiesKHR* props = (const VkVideoEncodeAV1CapabilitiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkVideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7666:88: error: 'props' was not declared in this scope
|  7666 |             DumpVkVideoEncodeAV1CapabilitiesKHR(p, "VkVideoEncodeAV1CapabilitiesKHR", *props);
|       |                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7669:33: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  7669 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7670:19: error: 'VkVideoEncodeAV1QuantizationMapCapabilitiesKHR' does not name a type
|  7670 |             const VkVideoEncodeAV1QuantizationMapCapabilitiesKHR* props = (const VkVideoEncodeAV1QuantizationMapCapabilitiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7671:118: error: 'props' was not declared in this scope
|  7671 |             DumpVkVideoEncodeAV1QuantizationMapCapabilitiesKHR(p, "VkVideoEncodeAV1QuantizationMapCapabilitiesKHR", *props);
|       |                                                                                                                      ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7684:33: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR'?
|  7684 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7685:19: error: 'VkVideoEncodeH264QuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH264CapabilitiesKHR'?
|  7685 |             const VkVideoEncodeH264QuantizationMapCapabilitiesKHR* props = (const VkVideoEncodeH264QuantizationMapCapabilitiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkVideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7686:120: error: 'props' was not declared in this scope
|  7686 |             DumpVkVideoEncodeH264QuantizationMapCapabilitiesKHR(p, "VkVideoEncodeH264QuantizationMapCapabilitiesKHR", *props);
|       |                                                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7694:33: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  7694 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7695:19: error: 'VkVideoEncodeH265QuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  7695 |             const VkVideoEncodeH265QuantizationMapCapabilitiesKHR* props = (const VkVideoEncodeH265QuantizationMapCapabilitiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7696:120: error: 'props' was not declared in this scope
|  7696 |             DumpVkVideoEncodeH265QuantizationMapCapabilitiesKHR(p, "VkVideoEncodeH265QuantizationMapCapabilitiesKHR", *props);
|       |                                                                                                                        ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7699:33: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  7699 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7700:19: error: 'VkVideoEncodeQuantizationMapCapabilitiesKHR' does not name a type; did you mean 'VkVideoEncodeH265CapabilitiesKHR'?
|  7700 |             const VkVideoEncodeQuantizationMapCapabilitiesKHR* props = (const VkVideoEncodeQuantizationMapCapabilitiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   VkVideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7701:112: error: 'props' was not declared in this scope
|  7701 |             DumpVkVideoEncodeQuantizationMapCapabilitiesKHR(p, "VkVideoEncodeQuantizationMapCapabilitiesKHR", *props);
|       |                                                                                                                ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7719:5: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' does not name a type
|  7719 |     VkVideoFormatAV1QuantizationMapPropertiesKHR VideoFormatAV1QuantizationMapPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7720:5: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' does not name a type
|  7720 |     VkVideoFormatH265QuantizationMapPropertiesKHR VideoFormatH265QuantizationMapPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7721:5: error: 'VkVideoFormatQuantizationMapPropertiesKHR' does not name a type
|  7721 |     VkVideoFormatQuantizationMapPropertiesKHR VideoFormatQuantizationMapPropertiesKHR{};
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In member function 'void video_format_properties_chain::initialize_chain(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7723:9: error: 'VideoFormatAV1QuantizationMapPropertiesKHR' was not declared in this scope; did you mean 'DumpVkVideoFormatAV1QuantizationMapPropertiesKHR'?
|  7723 |         VideoFormatAV1QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkVideoFormatAV1QuantizationMapPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7723:60: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  7723 |         VideoFormatAV1QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7724:9: error: 'VideoFormatH265QuantizationMapPropertiesKHR' was not declared in this scope; did you mean 'DumpVkVideoFormatH265QuantizationMapPropertiesKHR'?
|  7724 |         VideoFormatH265QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkVideoFormatH265QuantizationMapPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7724:61: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  7724 |         VideoFormatH265QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7725:9: error: 'VideoFormatQuantizationMapPropertiesKHR' was not declared in this scope; did you mean 'DumpVkVideoFormatQuantizationMapPropertiesKHR'?
|  7725 |         VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |         DumpVkVideoFormatQuantizationMapPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7725:57: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  7725 |         VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7727:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  7727 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7729:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  7729 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7731:54: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  7731 |         if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME))
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'void chain_iterator_video_format_properties(Printer&, AppGpu&, const void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7752:33: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  7752 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7753:19: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' does not name a type
|  7753 |             const VkVideoFormatAV1QuantizationMapPropertiesKHR* props = (const VkVideoFormatAV1QuantizationMapPropertiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7754:114: error: 'props' was not declared in this scope
|  7754 |             DumpVkVideoFormatAV1QuantizationMapPropertiesKHR(p, "VkVideoFormatAV1QuantizationMapPropertiesKHR", *props);
|       |                                                                                                                  ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7757:33: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  7757 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7758:19: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' does not name a type
|  7758 |             const VkVideoFormatH265QuantizationMapPropertiesKHR* props = (const VkVideoFormatH265QuantizationMapPropertiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7759:116: error: 'props' was not declared in this scope
|  7759 |             DumpVkVideoFormatH265QuantizationMapPropertiesKHR(p, "VkVideoFormatH265QuantizationMapPropertiesKHR", *props);
|       |                                                                                                                    ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7762:33: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  7762 |         if (structure->sType == VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR) {
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7763:19: error: 'VkVideoFormatQuantizationMapPropertiesKHR' does not name a type
|  7763 |             const VkVideoFormatQuantizationMapPropertiesKHR* props = (const VkVideoFormatQuantizationMapPropertiesKHR*)structure;
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7764:108: error: 'props' was not declared in this scope
|  7764 |             DumpVkVideoFormatQuantizationMapPropertiesKHR(p, "VkVideoFormatQuantizationMapPropertiesKHR", *props);
|       |                                                                                                            ^~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7833:17: error: 'VK_API_VERSION_1_4' was not declared in this scope; did you mean 'VK_API_VERSION_1_0'?
|  7833 |     FormatRange{VK_API_VERSION_1_4, nullptr, static_cast<VkFormat>(1000470000), static_cast<VkFormat>(1000470001)},
|       |                 ^~~~~~~~~~~~~~~~~~
|       |                 VK_API_VERSION_1_0
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'bool is_video_format_same(const VkVideoFormatPropertiesKHR&, const VkVideoFormatPropertiesKHR&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7854:22: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  7854 |                 case VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR:
|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                      VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7857:50: error: 'VkVideoFormatAV1QuantizationMapPropertiesKHR' was not declared in this scope; did you mean 'DumpVkVideoFormatAV1QuantizationMapPropertiesKHR'?
|  7857 |                                           sizeof(VkVideoFormatAV1QuantizationMapPropertiesKHR) - sizeof(VkBaseInStructure)) == 0;
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  DumpVkVideoFormatAV1QuantizationMapPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7859:22: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  7859 |                 case VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR:
|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                      VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7862:50: error: 'VkVideoFormatH265QuantizationMapPropertiesKHR' was not declared in this scope; did you mean 'DumpVkVideoFormatH265QuantizationMapPropertiesKHR'?
|  7862 |                                           sizeof(VkVideoFormatH265QuantizationMapPropertiesKHR) - sizeof(VkBaseInStructure)) == 0;
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  DumpVkVideoFormatH265QuantizationMapPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7864:22: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  7864 |                 case VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR:
|       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                      VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:7867:50: error: 'VkVideoFormatQuantizationMapPropertiesKHR' was not declared in this scope; did you mean 'DumpVkVideoFormatQuantizationMapPropertiesKHR'?
|  7867 |                                           sizeof(VkVideoFormatQuantizationMapPropertiesKHR) - sizeof(VkBaseInStructure)) == 0;
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  DumpVkVideoFormatQuantizationMapPropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8403:74: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8403 |                             if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8404:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8404 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8404:103: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  8404 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                       VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8405:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8405 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8406:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8406 |                                 *ppnext = &capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8407:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8407 |                                 ppnext = &capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8419:74: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8419 |                             if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8420:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeH264QuantizationMapCapabilitiesKHR'; did you mean 'VideoEncodeH264CapabilitiesKHR'?
|  8420 |                                 capabilities_chain->VideoEncodeH264QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8420:107: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR'?
|  8420 |                                 capabilities_chain->VideoEncodeH264QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                           VK_STRUCTURE_TYPE_VIDEO_ENCODE_H264_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8421:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeH264QuantizationMapCapabilitiesKHR'; did you mean 'VideoEncodeH264CapabilitiesKHR'?
|  8421 |                                 capabilities_chain->VideoEncodeH264QuantizationMapCapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8422:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeH264QuantizationMapCapabilitiesKHR'; did you mean 'VideoEncodeH264CapabilitiesKHR'?
|  8422 |                                 *ppnext = &capabilities_chain->VideoEncodeH264QuantizationMapCapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8423:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeH264QuantizationMapCapabilitiesKHR'; did you mean 'VideoEncodeH264CapabilitiesKHR'?
|  8423 |                                 ppnext = &capabilities_chain->VideoEncodeH264QuantizationMapCapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VideoEncodeH264CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8456:29: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  8456 |                             VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR,
|       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                             VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8462:82: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  8462 |                                         supported = supported && ((caps->flags & VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR) != 0);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8474:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8474 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8475:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8475 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8475:114: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8475 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8476:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8476 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8477:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8477 |                                         *ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8478:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8478 |                                         ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8486:29: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  8486 |                             VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR,
|       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                             VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8492:82: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  8492 |                                         supported = supported && ((caps->flags & VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR) != 0);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8504:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8504 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8505:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8505 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8505:114: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8505 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8506:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8506 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8507:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8507 |                                         *ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8508:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8508 |                                         ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8514:21: error: could not convert '{AppVideoProfile::CreateFormatPropertiesChainCb{std::__cxx11::basic_string<char>(((const char*)"Encode Input"), std::allocator<char>()), 16384, std::function<bool(const VkVideoCapabilitiesKHR&)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(const VkVideoCapabilitiesKHR&)>()), std::function<std::unique_ptr<video_format_properties_chain>(void**)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(void**)>())}, AppVideoProfile::CreateFormatPropertiesChainCb{std::__cxx11::basic_string<char>(((const char*)"DPB"), std::allocator<char>()), 32768, std::function<bool(const VkVideoCapabilitiesKHR&)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(const VkVideoCapabilitiesKHR&)>()), std::function<std::unique_ptr<video_format_properties_chain>(
 void**)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(void**)>())}, <expression error>, <expression error>}' from '<brace-enclosed initializer list>' to 'const AppVideoProfile::CreateFormatPropertiesChainCbList' {aka 'const std::vector<AppVideoProfile::CreateFormatPropertiesChainCb>'}
|  8514 |                     };
|       |                     ^
|       |                     |
|       |                     <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8588:74: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8588 |                             if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8589:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8589 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8589:103: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  8589 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                       VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8590:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8590 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8591:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8591 |                                 *ppnext = &capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8592:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8592 |                                 ppnext = &capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8604:74: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8604 |                             if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8605:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeH265QuantizationMapCapabilitiesKHR'; did you mean 'VideoEncodeH265CapabilitiesKHR'?
|  8605 |                                 capabilities_chain->VideoEncodeH265QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8605:107: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  8605 |                                 capabilities_chain->VideoEncodeH265QuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                           VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8606:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeH265QuantizationMapCapabilitiesKHR'; did you mean 'VideoEncodeH265CapabilitiesKHR'?
|  8606 |                                 capabilities_chain->VideoEncodeH265QuantizationMapCapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8607:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeH265QuantizationMapCapabilitiesKHR'; did you mean 'VideoEncodeH265CapabilitiesKHR'?
|  8607 |                                 *ppnext = &capabilities_chain->VideoEncodeH265QuantizationMapCapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8608:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeH265QuantizationMapCapabilitiesKHR'; did you mean 'VideoEncodeH265CapabilitiesKHR'?
|  8608 |                                 ppnext = &capabilities_chain->VideoEncodeH265QuantizationMapCapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VideoEncodeH265CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8641:29: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  8641 |                             VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR,
|       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                             VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8647:82: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  8647 |                                         supported = supported && ((caps->flags & VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR) != 0);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8659:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8659 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8660:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8660 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8660:114: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8660 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8661:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8661 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8662:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8662 |                                         *ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8663:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8663 |                                         ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8667:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8667 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8668:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatH265QuantizationMapPropertiesKHR'
|  8668 |                                         format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8668:118: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  8668 |                                         format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                      VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8669:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatH265QuantizationMapPropertiesKHR'
|  8669 |                                         format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8670:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatH265QuantizationMapPropertiesKHR'
|  8670 |                                         *ppnext = &format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8671:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatH265QuantizationMapPropertiesKHR'
|  8671 |                                         ppnext = &format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8679:29: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  8679 |                             VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR,
|       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                             VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8685:82: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  8685 |                                         supported = supported && ((caps->flags & VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR) != 0);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8697:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8697 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8698:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8698 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8698:114: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8698 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8699:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8699 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8700:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8700 |                                         *ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8701:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8701 |                                         ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8705:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8705 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8706:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatH265QuantizationMapPropertiesKHR'
|  8706 |                                         format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8706:118: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR'?
|  8706 |                                         format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                      VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8707:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatH265QuantizationMapPropertiesKHR'
|  8707 |                                         format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8708:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatH265QuantizationMapPropertiesKHR'
|  8708 |                                         *ppnext = &format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8709:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatH265QuantizationMapPropertiesKHR'
|  8709 |                                         ppnext = &format_properties_chain->VideoFormatH265QuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8715:21: error: could not convert '{AppVideoProfile::CreateFormatPropertiesChainCb{std::__cxx11::basic_string<char>(((const char*)"Encode Input"), std::allocator<char>()), 16384, std::function<bool(const VkVideoCapabilitiesKHR&)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(const VkVideoCapabilitiesKHR&)>()), std::function<std::unique_ptr<video_format_properties_chain>(void**)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(void**)>())}, AppVideoProfile::CreateFormatPropertiesChainCb{std::__cxx11::basic_string<char>(((const char*)"DPB"), std::allocator<char>()), 32768, std::function<bool(const VkVideoCapabilitiesKHR&)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(const VkVideoCapabilitiesKHR&)>()), std::function<std::unique_ptr<video_format_properties_chain>(
 void**)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(void**)>())}, <expression error>, <expression error>}' from '<brace-enclosed initializer list>' to 'const AppVideoProfile::CreateFormatPropertiesChainCbList' {aka 'const std::vector<AppVideoProfile::CreateFormatPropertiesChainCb>'}
|  8715 |                     };
|       |                     ^
|       |                     |
|       |                     <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8752:50: error: 'VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME'?
|  8752 |     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_AV1_EXTENSION_NAME)) {
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                  VK_KHR_VIDEO_DECODE_AV1_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8767:25: error: 'VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR'?
|  8767 |                         VK_VIDEO_CODEC_OPERATION_ENCODE_AV1_BIT_KHR,
|       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                         VK_VIDEO_CODEC_OPERATION_DECODE_AV1_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8776:49: error: 'struct video_profile_info_chain' has no member named 'VideoEncodeAV1ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8776 |                             profile_info_chain->VideoEncodeAV1ProfileInfoKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8776:86: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR'?
|  8776 |                             profile_info_chain->VideoEncodeAV1ProfileInfoKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_PROFILE_INFO_KHR;
|       |                                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                      VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_PROFILE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8777:49: error: 'struct video_profile_info_chain' has no member named 'VideoEncodeAV1ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8777 |                             profile_info_chain->VideoEncodeAV1ProfileInfoKHR.pNext = nullptr;
|       |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                 VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8778:60: error: 'struct video_profile_info_chain' has no member named 'VideoEncodeAV1ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8778 |                             *ppnext = &profile_info_chain->VideoEncodeAV1ProfileInfoKHR;
|       |                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                            VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8779:59: error: 'struct video_profile_info_chain' has no member named 'VideoEncodeAV1ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8779 |                             ppnext = &profile_info_chain->VideoEncodeAV1ProfileInfoKHR.pNext;
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8795:74: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8795 |                             if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                          VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8796:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8796 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8796:103: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR'?
|  8796 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR;
|       |                                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                       VK_STRUCTURE_TYPE_VIDEO_ENCODE_H265_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8797:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8797 |                                 capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8798:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8798 |                                 *ppnext = &capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8799:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeQuantizationMapCapabilitiesKHR'
|  8799 |                                 ppnext = &capabilities_chain->VideoEncodeQuantizationMapCapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8804:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeAV1CapabilitiesKHR'; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8804 |                                 capabilities_chain->VideoEncodeAV1CapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8804:91: error: 'VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR'?
|  8804 |                                 capabilities_chain->VideoEncodeAV1CapabilitiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_ENCODE_AV1_CAPABILITIES_KHR;
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VK_STRUCTURE_TYPE_VIDEO_DECODE_AV1_CAPABILITIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8805:53: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeAV1CapabilitiesKHR'; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8805 |                                 capabilities_chain->VideoEncodeAV1CapabilitiesKHR.pNext = nullptr;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8806:64: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeAV1CapabilitiesKHR'; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8806 |                                 *ppnext = &capabilities_chain->VideoEncodeAV1CapabilitiesKHR;
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8807:63: error: 'struct video_capabilities_chain' has no member named 'VideoEncodeAV1CapabilitiesKHR'; did you mean 'VideoDecodeAV1CapabilitiesKHR'?
|  8807 |                                 ppnext = &capabilities_chain->VideoEncodeAV1CapabilitiesKHR.pNext;
|       |                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                               VideoDecodeAV1CapabilitiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8840:29: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR'?
|  8840 |                             VK_IMAGE_USAGE_VIDEO_ENCODE_QUANTIZATION_DELTA_MAP_BIT_KHR,
|       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                             VK_IMAGE_USAGE_VIDEO_ENCODE_DST_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8846:82: error: 'VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR' was not declared in this scope
|  8846 |                                         supported = supported && ((caps->flags & VK_VIDEO_ENCODE_CAPABILITY_QUANTIZATION_DELTA_MAP_BIT_KHR) != 0);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8858:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8858 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8859:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8859 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8859:114: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8859 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8860:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8860 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8861:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8861 |                                         *ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8862:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8862 |                                         ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8866:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8866 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8867:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatAV1QuantizationMapPropertiesKHR'
|  8867 |                                         format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8867:117: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8867 |                                         format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                     VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8868:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatAV1QuantizationMapPropertiesKHR'
|  8868 |                                         format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8869:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatAV1QuantizationMapPropertiesKHR'
|  8869 |                                         *ppnext = &format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8870:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatAV1QuantizationMapPropertiesKHR'
|  8870 |                                         ppnext = &format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8878:29: error: 'VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR'?
|  8878 |                             VK_IMAGE_USAGE_VIDEO_ENCODE_EMPHASIS_MAP_BIT_KHR,
|       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                             VK_IMAGE_USAGE_VIDEO_ENCODE_SRC_BIT_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8884:82: error: 'VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR' was not declared in this scope; did you mean 'VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR'?
|  8884 |                                         supported = supported && ((caps->flags & VK_VIDEO_ENCODE_CAPABILITY_EMPHASIS_MAP_BIT_KHR) != 0);
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_VIDEO_ENCODE_CAPABILITY_FLAG_BITS_MAX_ENUM_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8896:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8896 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8897:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8897 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8897:114: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8897 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                  VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8898:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8898 |                                         format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8899:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8899 |                                         *ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8900:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatQuantizationMapPropertiesKHR'
|  8900 |                                         ppnext = &format_properties_chain->VideoFormatQuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8904:82: error: 'VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME' was not declared in this scope; did you mean 'VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME'?
|  8904 |                                     if (gpu.CheckPhysicalDeviceExtensionIncluded(VK_KHR_VIDEO_ENCODE_QUANTIZATION_MAP_EXTENSION_NAME)) {
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                  VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8905:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatAV1QuantizationMapPropertiesKHR'
|  8905 |                                         format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8905:117: error: 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR'?
|  8905 |                                         format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR.sType = VK_STRUCTURE_TYPE_VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR;
|       |                                                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                                     VK_STRUCTURE_TYPE_VIDEO_FORMAT_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8906:66: error: 'struct video_format_properties_chain' has no member named 'VideoFormatAV1QuantizationMapPropertiesKHR'
|  8906 |                                         format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR.pNext = nullptr;
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8907:77: error: 'struct video_format_properties_chain' has no member named 'VideoFormatAV1QuantizationMapPropertiesKHR'
|  8907 |                                         *ppnext = &format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR;
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8908:76: error: 'struct video_format_properties_chain' has no member named 'VideoFormatAV1QuantizationMapPropertiesKHR'
|  8908 |                                         ppnext = &format_properties_chain->VideoFormatAV1QuantizationMapPropertiesKHR.pNext;
|       |                                                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In function 'std::vector<std::unique_ptr<AppVideoProfile> > enumerate_supported_video_profiles(AppGpu&)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8914:21: error: could not convert '{AppVideoProfile::CreateFormatPropertiesChainCb{std::__cxx11::basic_string<char>(((const char*)"Encode Input"), std::allocator<char>()), 16384, std::function<bool(const VkVideoCapabilitiesKHR&)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(const VkVideoCapabilitiesKHR&)>()), std::function<std::unique_ptr<video_format_properties_chain>(void**)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(void**)>())}, AppVideoProfile::CreateFormatPropertiesChainCb{std::__cxx11::basic_string<char>(((const char*)"DPB"), std::allocator<char>()), 32768, std::function<bool(const VkVideoCapabilitiesKHR&)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(const VkVideoCapabilitiesKHR&)>()), std::function<std::unique_ptr<video_format_properties_chain>(
 void**)>(<lambda closure object>enumerate_supported_video_profiles(AppGpu&)::<lambda(void**)>())}, <expression error>, <expression error>}' from '<brace-enclosed initializer list>' to 'const AppVideoProfile::CreateFormatPropertiesChainCbList' {aka 'const std::vector<AppVideoProfile::CreateFormatPropertiesChainCb>'}
|  8914 |                     };
|       |                     ^
|       |                     |
|       |                     <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8920:53: error: 'struct video_profile_info_chain' has no member named 'VideoEncodeAV1ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8920 |                         profile.profile_info_chain->VideoEncodeAV1ProfileInfoKHR.stdProfile = STD_VIDEO_AV1_PROFILE_MAIN;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8926:53: error: 'struct video_profile_info_chain' has no member named 'VideoEncodeAV1ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8926 |                         profile.profile_info_chain->VideoEncodeAV1ProfileInfoKHR.stdProfile = STD_VIDEO_AV1_PROFILE_HIGH;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1ProfileInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/git/vulkaninfo/generated/vulkaninfo.hpp:8932:53: error: 'struct video_profile_info_chain' has no member named 'VideoEncodeAV1ProfileInfoKHR'; did you mean 'VideoDecodeAV1ProfileInfoKHR'?
|  8932 |                         profile.profile_info_chain->VideoEncodeAV1ProfileInfoKHR.stdProfile = STD_VIDEO_AV1_PROFILE_PROFESSIONAL;
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                     VideoDecodeAV1ProfileInfoKHR
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/temp/run.do_compile.805351:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/temp/run.do_compile.805351, line 153
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/temp/run.do_compile.805351, line 147
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/temp/run.do_compile.805351, line 142
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/temp/run.do_compile.805351, line 166
NOTE: recipe vulkan-tools-1.4.309.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1635 tasks of which 1624 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315124915.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315124915.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/temp/log.do_compile.805351
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-tools-1.4.309.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/temp/run.do_compile.805351' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-tools/1.4.309.0/temp/log.do_compile.805351
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb:do_compile) failed with exit code '1'

--===============8025916100084108519==--

