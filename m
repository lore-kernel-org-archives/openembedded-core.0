Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF878D0EE37
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:36:16 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.53279.1728588959460023581
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=TwCMrurg;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=J1OeBVBB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019277ee87c3-4205b144-2378-4fd9-aedd-fc3325eb03ca-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728588974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AhRhjpDEeEcCpWtxRLBcr1RE+j1L5EWjyLz+kmWBQQM=;
	b=TwCMrurg+KNiaYmM4Bm3Pg1j8KECW7MwO8gP7LNNtQ2r/NrkdlHkv6BQ3+CQe7fJ
	hZaTjMbPhBURt4sRmlwCz/Z2ulpaUNgMFbUyCaTFnVsDZ0/KfW0tOMhK5pZTyWFODNQ
	MqWIFyt0yaurFjl9bUtJn19C2Mc03vZYIQSDrvOc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728588974;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AhRhjpDEeEcCpWtxRLBcr1RE+j1L5EWjyLz+kmWBQQM=;
	b=J1OeBVBBLJhw3RcwkBJTzszNL6YUxpYAx86BHgWTimdTcw1m8fas22j3m0wCrYHP
	jVGzg5wEJuzZ243ZHRAI5D+cClbzNWIFFG/QtAvAkLUmJsWa/lDlLAK71ETyHN5QhUd
	8x0XDGTtQZJrFPch8am4gi4QFOCztxFsTvbKbb5w=
Content-Type: multipart/mixed; boundary="===============3422407675697608414=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-validation-layers: upgrading to 1.3.296.0 FAILED
Message-ID: <0101019277ee87c3-4205b144-2378-4fd9-aedd-fc3325eb03ca-000000@us-west-2.amazonses.com>
Date: Thu, 10 Oct 2024 19:36:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.10-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 19:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205538

--===============3422407675697608414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-validation-layers* to *1.3.296.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-validation-layers-upgrade-1.3.290.0-1.3.296.0.patch
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
From a765e4f4371b5bf6e60da67b33a5f983d01dc795 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Oct 2024 05:22:58 +0000
Subject: [PATCH] vulkan-validation-layers: upgrade 1.3.290.0 -> 1.3.296.0

---
 ...ers_1.3.290.0.bb => vulkan-validation-layers_1.3.296.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.3.290.0.bb => vulkan-validation-layers_1.3.296.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb
index cfb8954f87..a5f93bc3f1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.290.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.290;protocol=https"
-SRCREV = "a92629196a4fed15e59c74aa965dd47bd5ece3b7"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.3.296;protocol=https"
+SRCREV = "9935cdd6f9524b1da1e140393fa69a0a1b72125d"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.1


--===============3422407675697608414==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-validation-layers-upgrade-1.3.290.0-1.3.296.0.patch"

RnJvbSBhNzY1ZTRmNDM3MWI1YmY2ZTYwZGE2N2IzM2E1Zjk4M2QwMWRjNzk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgT2N0IDIwMjQgMDU6MjI6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdmFsaWRhdGlvbi1sYXllcnM6IHVwZ3JhZGUgMS4zLjI5MC4wIC0+IDEuMy4yOTYuMAoK
LS0tCiAuLi5lcnNfMS4zLjI5MC4wLmJiID0+IHZ1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMu
Mjk2LjAuYmJ9IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi12
YWxpZGF0aW9uLWxheWVyc18xLjMuMjkwLjAuYmIgPT4gdnVsa2FuLXZhbGlkYXRpb24tbGF5ZXJz
XzEuMy4yOTYuMC5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
dnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjkwLjAuYmIgYi9tZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjk2LjAuYmIK
c2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1
bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI5MC4wLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12YWxpZGF0aW9uLWxheWVyc18xLjMuMjk2
LjAuYmIKaW5kZXggY2ZiODk1NGY4Ny4uYTVmOTNiYzNmMSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdmFsaWRhdGlvbi1sYXllcnNfMS4zLjI5MC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZhbGlkYXRpb24tbGF5
ZXJzXzEuMy4yOTYuMC5iYgpAQCAtOCw4ICs4LDggQEAgU0VDVElPTiA9ICJsaWJzIgogTElDRU5T
RSA9ICJBcGFjaGUtMi4wICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS50eHQ7bWQ1PWNkM2MwYmMzNjZjZDliNmE5MDZlMjJmMGJjYjU5MTBmIgogCi1TUkNfVVJJID0g
ImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1WYWxpZGF0aW9uTGF5ZXJzLmdp
dDticmFuY2g9dnVsa2FuLXNkay0xLjMuMjkwO3Byb3RvY29sPWh0dHBzIgotU1JDUkVWID0gImE5
MjYyOTE5NmE0ZmVkMTVlNTljNzRhYTk2NWRkNDdiZDVlY2UzYjciCitTUkNfVVJJID0gImdpdDov
L2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL1Z1bGthbi1WYWxpZGF0aW9uTGF5ZXJzLmdpdDticmFu
Y2g9dnVsa2FuLXNkay0xLjMuMjk2O3Byb3RvY29sPWh0dHBzIgorU1JDUkVWID0gIjk5MzVjZGQ2
Zjk1MjRiMWRhMWUxNDAzOTNmYTY5YTBhMWI3MjEyNWQiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQi
CiAKLS0gCjIuNDQuMQoK

--===============3422407675697608414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1871 entries from dependency cache.
Parsing recipes...done.
Parsing of 917 .bb files complete (916 cached, 1 parsed). 1871 targets, 40 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:8cfa4d3019292aec1f7868520396d510395e05ed"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 223 Local 211 Mirrors 0 Missed 12 Current 364 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1458 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_recipe_qa)
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1629 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_fetch)
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_fetch: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_fetch: Succeeded
NOTE: Running task 1630 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_unpack)
NOTE: Running task 1631 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_unpack: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_unpack: Succeeded
NOTE: Running task 1632 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_patch)
NOTE: Running task 1633 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_patch: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_patch: Succeeded
NOTE: Running task 1634 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1635 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_generate_toolchain_file)
NOTE: Running task 1636 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_populate_lic)
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 1637 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_configure)
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_configure: Started
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_configure: Succeeded
NOTE: Running task 1638 of 1649 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_compile)
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=1 cmake --build /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build --target all --
| Change Dir: '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build'
| 
| Run Build Command(s): ninja -v -j 16 all
| [1/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-s
 ecurity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vul
 kan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_extension_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_extension_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_extension_utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_layer_
 extension_utils.cpp
| [2/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-s
 ecurity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vul
 kan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/image_layout_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/image_layout_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/image_layout_utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/image_layout_utils.cpp
| [3/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-s
 ecurity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vul
 kan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/ge
 nerated/vk_object_types.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_object_types.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/
 vk_object_types.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.cpp:27:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VkObjectType ConvertVulkanObjectToCoreObject(VulkanObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:165:20: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   165 |             return VK_OBJECT_TYPE_PIPELINE_BINARY_KHR;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:197:20: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   197 |             return VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:199:20: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   199 |             return VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VulkanObjectType ConvertCoreObjectToVulkanObject(VkObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:278:14: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   278 |         case VK_OBJECT_TYPE_PIPELINE_BINARY_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:310:14: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   310 |         case VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:312:14: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   312 |         case VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:21: error: 'VkPipelineBinaryKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                     ^~~~~~~~~~~~~~~~~~~
|       |                     VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:40: error: template argument 1 is invalid
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:969:13: error: 'VkPipelineBinaryKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|   969 |     typedef VkPipelineBinaryKHR Type;
|       |             ^~~~~~~~~~~~~~~~~~~
|       |             VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:21: error: 'VkIndirectExecutionSetEXT' was not declared in this scope
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:46: error: template argument 1 is invalid
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1163:13: error: 'VkIndirectExecutionSetEXT' does not name a type
|  1163 |     typedef VkIndirectExecutionSetEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:21: error: 'VkIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkIndirectCommandsLayoutNV_T
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:48: error: template argument 1 is invalid
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1175:13: error: 'VkIndirectCommandsLayoutEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1175 |     typedef VkIndirectCommandsLayoutEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkIndirectCommandsLayoutNV_T
| [4/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-s
 ecurity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vul
 kan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/ray_tracing_utils.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/ray_tracing_utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/ray_tracing_utils.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/ray_tracing_utils.cpp:19:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:653:67: error: 'VkPipelineBinaryCreateInfoKHR' does not name a type; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|   653 | VkResult DispatchCreatePipelineBinariesKHR(VkDevice device, const VkPipelineBinaryCreateInfoKHR* pCreateInfo,
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:654:85: error: 'VkPipelineBinaryHandlesInfoKHR' has not been declared
|   654 |                                            const VkAllocationCallbacks* pAllocator, VkPipelineBinaryHandlesInfoKHR* pBinaries);
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:655:56: error: 'VkPipelineBinaryKHR' has not been declared
|   655 | void DispatchDestroyPipelineBinaryKHR(VkDevice device, VkPipelineBinaryKHR pipelineBinary, const VkAllocationCallbacks* pAllocator);
|       |                                                        ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:656:59: error: 'VkPipelineCreateInfoKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|   656 | VkResult DispatchGetPipelineKeyKHR(VkDevice device, const VkPipelineCreateInfoKHR* pPipelineCreateInfo,
|       |                                                           ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                           VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:657:36: error: 'VkPipelineBinaryKeyKHR' has not been declared
|   657 |                                    VkPipelineBinaryKeyKHR* pPipelineKey);
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:658:66: error: 'VkPipelineBinaryDataInfoKHR' does not name a type; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|   658 | VkResult DispatchGetPipelineBinaryDataKHR(VkDevice device, const VkPipelineBinaryDataInfoKHR* pInfo,
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                  VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:659:43: error: 'VkPipelineBinaryKeyKHR' has not been declared
|   659 |                                           VkPipelineBinaryKeyKHR* pPipelineBinaryKey, size_t* pPipelineBinaryDataSize,
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:661:72: error: 'VkReleaseCapturedPipelineDataInfoKHR' does not name a type
|   661 | VkResult DispatchReleaseCapturedPipelineDataKHR(VkDevice device, const VkReleaseCapturedPipelineDataInfoKHR* pInfo,
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1163:54: error: 'VkAntiLagDataAMD' does not name a type
|  1163 | void DispatchAntiLagUpdateAMD(VkDevice device, const VkAntiLagDataAMD* pData);
|       |                                                      ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1170:70: error: 'VkDepthClampModeEXT' has not been declared
|  1170 | void DispatchCmdSetDepthClampRangeEXT(VkCommandBuffer commandBuffer, VkDepthClampModeEXT depthClampMode,
|       |                                                                      ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1171:45: error: 'VkDepthClampRangeEXT' does not name a type
|  1171 |                                       const VkDepthClampRangeEXT* pDepthClampRange);
|       |                                             ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1186:79: error: 'VkGeneratedCommandsMemoryRequirementsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsMemoryRequirementsInfoNV'?
|  1186 | void DispatchGetGeneratedCommandsMemoryRequirementsEXT(VkDevice device, const VkGeneratedCommandsMemoryRequirementsInfoEXT* pInfo,
|       |                                                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                               VkGeneratedCommandsMemoryRequirementsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1189:54: error: 'VkGeneratedCommandsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsInfoNV'?
|  1189 |                                                const VkGeneratedCommandsInfoEXT* pGeneratedCommandsInfo,
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1192:51: error: 'VkGeneratedCommandsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsInfoNV'?
|  1192 |                                             const VkGeneratedCommandsInfoEXT* pGeneratedCommandsInfo);
|       |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                   VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1193:73: error: 'VkIndirectCommandsLayoutCreateInfoEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutCreateInfoNV'?
|  1193 | VkResult DispatchCreateIndirectCommandsLayoutEXT(VkDevice device, const VkIndirectCommandsLayoutCreateInfoEXT* pCreateInfo,
|       |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                         VkIndirectCommandsLayoutCreateInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1195:50: error: 'VkIndirectCommandsLayoutEXT' has not been declared
|  1195 |                                                  VkIndirectCommandsLayoutEXT* pIndirectCommandsLayout);
|       |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1196:64: error: 'VkIndirectCommandsLayoutEXT' has not been declared
|  1196 | void DispatchDestroyIndirectCommandsLayoutEXT(VkDevice device, VkIndirectCommandsLayoutEXT indirectCommandsLayout,
|       |                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1198:71: error: 'VkIndirectExecutionSetCreateInfoEXT' does not name a type
|  1198 | VkResult DispatchCreateIndirectExecutionSetEXT(VkDevice device, const VkIndirectExecutionSetCreateInfoEXT* pCreateInfo,
|       |                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1200:48: error: 'VkIndirectExecutionSetEXT' has not been declared
|  1200 |                                                VkIndirectExecutionSetEXT* pIndirectExecutionSet);
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1201:62: error: 'VkIndirectExecutionSetEXT' has not been declared
|  1201 | void DispatchDestroyIndirectExecutionSetEXT(VkDevice device, VkIndirectExecutionSetEXT indirectExecutionSet,
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1203:69: error: 'VkIndirectExecutionSetEXT' has not been declared
|  1203 | void DispatchUpdateIndirectExecutionSetPipelineEXT(VkDevice device, VkIndirectExecutionSetEXT indirectExecutionSet,
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1205:58: error: 'VkWriteIndirectExecutionSetPipelineEXT' does not name a type
|  1205 |                                                    const VkWriteIndirectExecutionSetPipelineEXT* pExecutionSetWrites);
|       |                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1206:67: error: 'VkIndirectExecutionSetEXT' has not been declared
|  1206 | void DispatchUpdateIndirectExecutionSetShaderEXT(VkDevice device, VkIndirectExecutionSetEXT indirectExecutionSet,
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/layer_chassis_dispatch.h:1208:56: error: 'VkWriteIndirectExecutionSetShaderEXT' does not name a type
|  1208 |                                                  const VkWriteIndirectExecutionSetShaderEXT* pExecutionSetWrites);
|       |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [5/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/gpu/spirv/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -m64 -march=core2 -mtune=co
 re2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validat
 ion-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o -MF layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o.d -o layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o -c /srv/pok
 ybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/gpu/spirv/bindless_descriptor_pass.cpp
| FAILED: layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/gpu/spirv/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -m64 -march=core2 -mtune=core2 -mss
 e3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-laye
 rs/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o -MF layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o.d -o layers/gpu/spirv/CMakeFiles/gpu_av_spirv.dir/bindless_descriptor_pass.cpp.o -c /srv/pokybuild/y
 octo-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/gpu/spirv/bindless_descriptor_pass.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/gpu/spirv/type_manager.h:19,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/gpu/spirv/module.h:21,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/gpu/spirv/bindless_descriptor_pass.cpp:17:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr bool OpcodeHasType(uint32_t)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:266:19: error: 'OpUntypedVariableKHR' is not a member of 'spv'
|   266 |         case spv::OpUntypedVariableKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:267:19: error: 'OpUntypedAccessChainKHR' is not a member of 'spv'
|   267 |         case spv::OpUntypedAccessChainKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:268:19: error: 'OpUntypedInBoundsAccessChainKHR' is not a member of 'spv'; did you mean 'OpInBoundsAccessChain'?
|   268 |         case spv::OpUntypedInBoundsAccessChainKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpInBoundsAccessChain
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:271:19: error: 'OpUntypedPtrAccessChainKHR' is not a member of 'spv'; did you mean 'OpInBoundsPtrAccessChain'?
|   271 |         case spv::OpUntypedPtrAccessChainKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpInBoundsPtrAccessChain
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:272:19: error: 'OpUntypedInBoundsPtrAccessChainKHR' is not a member of 'spv'; did you mean 'OpInBoundsPtrAccessChain'?
|   272 |         case spv::OpUntypedInBoundsPtrAccessChainKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpInBoundsPtrAccessChain
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:273:19: error: 'OpUntypedArrayLengthKHR' is not a member of 'spv'
|   273 |         case spv::OpUntypedArrayLengthKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr bool OpcodeHasResult(uint32_t)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:646:19: error: 'OpTypeUntypedPointerKHR' is not a member of 'spv'
|   646 |         case spv::OpTypeUntypedPointerKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:647:19: error: 'OpUntypedVariableKHR' is not a member of 'spv'
|   647 |         case spv::OpUntypedVariableKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:648:19: error: 'OpUntypedAccessChainKHR' is not a member of 'spv'
|   648 |         case spv::OpUntypedAccessChainKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:649:19: error: 'OpUntypedInBoundsAccessChainKHR' is not a member of 'spv'; did you mean 'OpInBoundsAccessChain'?
|   649 |         case spv::OpUntypedInBoundsAccessChainKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpInBoundsAccessChain
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:652:19: error: 'OpUntypedPtrAccessChainKHR' is not a member of 'spv'; did you mean 'OpInBoundsPtrAccessChain'?
|   652 |         case spv::OpUntypedPtrAccessChainKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpInBoundsPtrAccessChain
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:653:19: error: 'OpUntypedInBoundsPtrAccessChainKHR' is not a member of 'spv'; did you mean 'OpInBoundsPtrAccessChain'?
|   653 |         case spv::OpUntypedInBoundsPtrAccessChainKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                   OpInBoundsPtrAccessChain
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:654:19: error: 'OpUntypedArrayLengthKHR' is not a member of 'spv'
|   654 |         case spv::OpUntypedArrayLengthKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h: In function 'constexpr SpvType GetSpvType(uint32_t)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/spirv_grammar_helper.h:1195:19: error: 'OpTypeUntypedPointerKHR' is not a member of 'spv'
|  1195 |         case spv::OpTypeUntypedPointerKHR:
|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
| [6/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-s
 ecurity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vul
 kan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-l
 ayers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/feature_requirements_helper.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.
 3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp: In function 'vkt::FeatureAndName vkt::AddFeature(APIVersion, Feature, void**)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:380:41: error: 'VkPhysicalDeviceAntiLagFeaturesAMD' does not name a type; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|   380 |             auto vk_struct = const_cast<VkPhysicalDeviceAntiLagFeaturesAMD *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceMultiDrawFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:380:76: error: expected '>' before '*' token
|   380 |             auto vk_struct = const_cast<VkPhysicalDeviceAntiLagFeaturesAMD *>(
|       |                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:380:76: error: expected '(' before '*' token
|   380 |             auto vk_struct = const_cast<VkPhysicalDeviceAntiLagFeaturesAMD *>(
|       |                                                                            ^
|       |                                                                            (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:380:77: error: expected primary-expression before '>' token
|   380 |             auto vk_struct = const_cast<VkPhysicalDeviceAntiLagFeaturesAMD *>(
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:381:45: error: 'VkPhysicalDeviceAntiLagFeaturesAMD' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|   381 |                 vku::FindStructInPNextChain<VkPhysicalDeviceAntiLagFeaturesAMD>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceMultiDrawFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:381:80: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|   381 |                 vku::FindStructInPNextChain<VkPhysicalDeviceAntiLagFeaturesAMD>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:29:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   982 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:381:80: error: template argument 1 is invalid
|   381 |                 vku::FindStructInPNextChain<VkPhysicalDeviceAntiLagFeaturesAMD>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   996 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:381:80: error: template argument 1 is invalid
|   381 |                 vku::FindStructInPNextChain<VkPhysicalDeviceAntiLagFeaturesAMD>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:381:101: error: expected ')' before ';' token
|   381 |                 vku::FindStructInPNextChain<VkPhysicalDeviceAntiLagFeaturesAMD>(*inout_pnext_chain));
|       |                                                                                                     ^
|       |                                                                                                     )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:383:33: error: 'VkPhysicalDeviceAntiLagFeaturesAMD' does not name a type; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|   383 |                 vk_struct = new VkPhysicalDeviceAntiLagFeaturesAMD;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceMultiDrawFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:391:87: error: could not convert '{<expression error>, "VkPhysicalDeviceAntiLagFeaturesAMD::antiLag"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|   391 |             return {&vk_struct->antiLag, "VkPhysicalDeviceAntiLagFeaturesAMD::antiLag"};
|       |                                                                                       ^
|       |                                                                                       |
|       |                                                                                       <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:614:41: error: 'VkPhysicalDeviceCommandBufferInheritanceFeaturesNV' does not name a type; did you mean 'VkPhysicalDeviceCudaKernelLaunchFeaturesNV'?
|   614 |             auto vk_struct = const_cast<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceCudaKernelLaunchFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:614:92: error: expected '>' before '*' token
|   614 |             auto vk_struct = const_cast<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:614:92: error: expected '(' before '*' token
|   614 |             auto vk_struct = const_cast<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(
|       |                                                                                            ^
|       |                                                                                            (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:614:93: error: expected primary-expression before '>' token
|   614 |             auto vk_struct = const_cast<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:615:45: error: 'VkPhysicalDeviceCommandBufferInheritanceFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCudaKernelLaunchFeaturesNV'?
|   615 |                 vku::FindStructInPNextChain<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceCudaKernelLaunchFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:615:96: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|   615 |                 vku::FindStructInPNextChain<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   982 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:615:96: error: template argument 1 is invalid
|   615 |                 vku::FindStructInPNextChain<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   996 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:615:96: error: template argument 1 is invalid
|   615 |                 vku::FindStructInPNextChain<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:615:117: error: expected ')' before ';' token
|   615 |                 vku::FindStructInPNextChain<VkPhysicalDeviceCommandBufferInheritanceFeaturesNV>(*inout_pnext_chain));
|       |                                                                                                                     ^
|       |                                                                                                                     )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:617:33: error: 'VkPhysicalDeviceCommandBufferInheritanceFeaturesNV' does not name a type; did you mean 'VkPhysicalDeviceCudaKernelLaunchFeaturesNV'?
|   617 |                 vk_struct = new VkPhysicalDeviceCommandBufferInheritanceFeaturesNV;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceCudaKernelLaunchFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:626:99: error: could not convert '{<expression error>, "VkPhysicalDeviceCommandBufferInheritanceFeaturesNV::commandBufferInheritance"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|   626 |                     "VkPhysicalDeviceCommandBufferInheritanceFeaturesNV::commandBufferInheritance"};
|       |                                                                                                   ^
|       |                                                                                                   |
|       |                                                                                                   <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:629:41: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|   629 |             auto vk_struct = const_cast<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:629:93: error: expected '>' before '*' token
|   629 |             auto vk_struct = const_cast<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:629:93: error: expected '(' before '*' token
|   629 |             auto vk_struct = const_cast<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(
|       |                                                                                             ^
|       |                                                                                             (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:629:94: error: expected primary-expression before '>' token
|   629 |             auto vk_struct = const_cast<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:630:45: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|   630 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:630:97: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|   630 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   982 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:630:97: error: template argument 1 is invalid
|   630 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   996 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:630:97: error: template argument 1 is invalid
|   630 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:630:118: error: expected ')' before ';' token
|   630 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                                                                                                                      ^
|       |                                                                                                                      )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:632:33: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|   632 |                 vk_struct = new VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:641:104: error: could not convert '{<expression error>, "VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR::computeDerivativeGroupLinear"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|   641 |                     "VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR::computeDerivativeGroupLinear"};
|       |                                                                                                        ^
|       |                                                                                                        |
|       |                                                                                                        <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:644:41: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|   644 |             auto vk_struct = const_cast<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:644:93: error: expected '>' before '*' token
|   644 |             auto vk_struct = const_cast<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:644:93: error: expected '(' before '*' token
|   644 |             auto vk_struct = const_cast<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(
|       |                                                                                             ^
|       |                                                                                             (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:644:94: error: expected primary-expression before '>' token
|   644 |             auto vk_struct = const_cast<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(
|       |                                                                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:645:45: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|   645 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:645:97: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|   645 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   982 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:645:97: error: template argument 1 is invalid
|   645 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   996 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:645:97: error: template argument 1 is invalid
|   645 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:645:118: error: expected ')' before ';' token
|   645 |                 vku::FindStructInPNextChain<VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR>(*inout_pnext_chain));
|       |                                                                                                                      ^
|       |                                                                                                                      )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:647:33: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|   647 |                 vk_struct = new VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:656:103: error: could not convert '{<expression error>, "VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR::computeDerivativeGroupQuads"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|   656 |                     "VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR::computeDerivativeGroupQuads"};
|       |                                                                                                       ^
|       |                                                                                                       |
|       |                                                                                                       <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:902:41: error: 'VkPhysicalDeviceDepthClampControlFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|   902 |             auto vk_struct = const_cast<VkPhysicalDeviceDepthClampControlFeaturesEXT *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:902:86: error: expected '>' before '*' token
|   902 |             auto vk_struct = const_cast<VkPhysicalDeviceDepthClampControlFeaturesEXT *>(
|       |                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:902:86: error: expected '(' before '*' token
|   902 |             auto vk_struct = const_cast<VkPhysicalDeviceDepthClampControlFeaturesEXT *>(
|       |                                                                                      ^
|       |                                                                                      (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:902:87: error: expected primary-expression before '>' token
|   902 |             auto vk_struct = const_cast<VkPhysicalDeviceDepthClampControlFeaturesEXT *>(
|       |                                                                                       ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:903:45: error: 'VkPhysicalDeviceDepthClampControlFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|   903 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDepthClampControlFeaturesEXT>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:903:90: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|   903 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDepthClampControlFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   982 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:903:90: error: template argument 1 is invalid
|   903 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDepthClampControlFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   996 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:903:90: error: template argument 1 is invalid
|   903 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDepthClampControlFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:903:111: error: expected ')' before ';' token
|   903 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDepthClampControlFeaturesEXT>(*inout_pnext_chain));
|       |                                                                                                               ^
|       |                                                                                                               )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:905:33: error: 'VkPhysicalDeviceDepthClampControlFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|   905 |                 vk_struct = new VkPhysicalDeviceDepthClampControlFeaturesEXT;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:913:117: error: could not convert '{<expression error>, "VkPhysicalDeviceDepthClampControlFeaturesEXT::depthClampControl"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|   913 |             return {&vk_struct->depthClampControl, "VkPhysicalDeviceDepthClampControlFeaturesEXT::depthClampControl"};
|       |                                                                                                                     ^
|       |                                                                                                                     |
|       |                                                                                                                     <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1691:41: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  1691 |             auto vk_struct = const_cast<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1691:92: error: expected '>' before '*' token
|  1691 |             auto vk_struct = const_cast<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1691:92: error: expected '(' before '*' token
|  1691 |             auto vk_struct = const_cast<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(
|       |                                                                                            ^
|       |                                                                                            (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1691:93: error: expected primary-expression before '>' token
|  1691 |             auto vk_struct = const_cast<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1692:45: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  1692 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1692:96: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|  1692 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   982 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1692:96: error: template argument 1 is invalid
|  1692 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   996 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1692:96: error: template argument 1 is invalid
|  1692 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1692:117: error: expected ')' before ';' token
|  1692 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                                                                                                                     ^
|       |                                                                                                                     )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1694:33: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  1694 |                 vk_struct = new VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1703:98: error: could not convert '{<expression error>, "VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT::deviceGeneratedCommands"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|  1703 |                     "VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT::deviceGeneratedCommands"};
|       |                                                                                                  ^
|       |                                                                                                  |
|       |                                                                                                  <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1706:41: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  1706 |             auto vk_struct = const_cast<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1706:92: error: expected '>' before '*' token
|  1706 |             auto vk_struct = const_cast<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(
|       |                                                                                            ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1706:92: error: expected '(' before '*' token
|  1706 |             auto vk_struct = const_cast<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(
|       |                                                                                            ^
|       |                                                                                            (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1706:93: error: expected primary-expression before '>' token
|  1706 |             auto vk_struct = const_cast<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1707:45: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  1707 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1707:96: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|  1707 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   982 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1707:96: error: template argument 1 is invalid
|  1707 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   996 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1707:96: error: template argument 1 is invalid
|  1707 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1707:117: error: expected ')' before ';' token
|  1707 |                 vku::FindStructInPNextChain<VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT>(*inout_pnext_chain));
|       |                                                                                                                     ^
|       |                                                                                                                     )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1709:33: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' does not name a type; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  1709 |                 vk_struct = new VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:1718:105: error: could not convert '{<expression error>, "VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT::dynamicGeneratedPipelineLayout"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|  1718 |                     "VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT::dynamicGeneratedPipelineLayout"};
|       |                                                                                                         ^
|       |                                                                                                         |
|       |                                                                                                         <brace-enclosed initializer list>
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3761:41: error: 'VkPhysicalDevicePipelineBinaryFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  3761 |             auto vk_struct = const_cast<VkPhysicalDevicePipelineBinaryFeaturesKHR *>(
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3761:83: error: expected '>' before '*' token
|  3761 |             auto vk_struct = const_cast<VkPhysicalDevicePipelineBinaryFeaturesKHR *>(
|       |                                                                                   ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3761:83: error: expected '(' before '*' token
|  3761 |             auto vk_struct = const_cast<VkPhysicalDevicePipelineBinaryFeaturesKHR *>(
|       |                                                                                   ^
|       |                                                                                   (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3761:84: error: expected primary-expression before '>' token
|  3761 |             auto vk_struct = const_cast<VkPhysicalDevicePipelineBinaryFeaturesKHR *>(
|       |                                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3762:45: error: 'VkPhysicalDevicePipelineBinaryFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  3762 |                 vku::FindStructInPNextChain<VkPhysicalDevicePipelineBinaryFeaturesKHR>(*inout_pnext_chain));
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3762:87: error: no matching function for call to 'FindStructInPNextChain<<expression error> >(void*&)'
|  3762 |                 vku::FindStructInPNextChain<VkPhysicalDevicePipelineBinaryFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note: candidate: 'template<class T> const T* vku::FindStructInPNextChain(const void*)'
|   982 | template <typename T> const T *FindStructInPNextChain(const void *next) {
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:982:32: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3762:87: error: template argument 1 is invalid
|  3762 |                 vku::FindStructInPNextChain<VkPhysicalDevicePipelineBinaryFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note: candidate: 'template<class T> T* vku::FindStructInPNextChain(void*)'
|   996 | template <typename T> T *FindStructInPNextChain(void *next) {
|       |                          ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot/usr/include/vulkan/utility/vk_struct_helper.hpp:996:26: note:   template argument deduction/substitution failed:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3762:87: error: template argument 1 is invalid
|  3762 |                 vku::FindStructInPNextChain<VkPhysicalDevicePipelineBinaryFeaturesKHR>(*inout_pnext_chain));
|       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3762:108: error: expected ')' before ';' token
|  3762 |                 vku::FindStructInPNextChain<VkPhysicalDevicePipelineBinaryFeaturesKHR>(*inout_pnext_chain));
|       |                                                                                                            ^
|       |                                                                                                            )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3764:33: error: 'VkPhysicalDevicePipelineBinaryFeaturesKHR' does not name a type; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  3764 |                 vk_struct = new VkPhysicalDevicePipelineBinaryFeaturesKHR;
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                 VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/feature_requirements_helper.cpp:3772:112: error: could not convert '{<expression error>, "VkPhysicalDevicePipelineBinaryFeaturesKHR::pipelineBinaries"}' from '<brace-enclosed initializer list>' to 'vkt::FeatureAndName'
|  3772 |             return {&vk_struct->pipelineBinaries, "VkPhysicalDevicePipelineBinaryFeaturesKHR::pipelineBinaries"};
|       |                                                                                                                ^
|       |                                                                                                                |
|       |                                                                                                                <brace-enclosed initializer list>
| [7/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-s
 ecurity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vul
 kan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/convert_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/convert_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/convert_utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/convert_utils.cpp
| [8/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-s
 ecurity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vul
 kan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0
 /git/layers/vulkan/generated/pnext_chain_extraction.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/pnext_chain_extraction.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/lay
 ers/vulkan/generated/pnext_chain_extraction.cpp
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp: In function 'void vvl::PnextChainFree(void*)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1131:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR'?
|  1131 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1134:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1134 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1134:43: error: expected '>' before 'VkPhysicalDevicePipelineBinaryFeaturesKHR'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1134:43: error: expected '(' before 'VkPhysicalDevicePipelineBinaryFeaturesKHR'
|  1134 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1134:43: error: 'VkPhysicalDevicePipelineBinaryFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphoreFeaturesKHR'?
|  1134 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceTimelineSemaphoreFeaturesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1134:86: error: expected primary-expression before '>' token
|  1134 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryFeaturesKHR *>(header);
|       |                                                                                      ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1134:95: error: expected ')' before ';' token
|  1134 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryFeaturesKHR *>(header);
|       |                                                                                               ^
|       |                                                                                               )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1136:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR'?
|  1136 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1139:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1139 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1139:43: error: expected '>' before 'VkPhysicalDevicePipelineBinaryPropertiesKHR'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1139:43: error: expected '(' before 'VkPhysicalDevicePipelineBinaryPropertiesKHR'
|  1139 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1139:43: error: 'VkPhysicalDevicePipelineBinaryPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceTimelineSemaphorePropertiesKHR'?
|  1139 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceTimelineSemaphorePropertiesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1139:88: error: expected primary-expression before '>' token
|  1139 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryPropertiesKHR *>(header);
|       |                                                                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1139:97: error: expected ')' before ';' token
|  1139 |             delete reinterpret_cast<const VkPhysicalDevicePipelineBinaryPropertiesKHR *>(header);
|       |                                                                                                 ^
|       |                                                                                                 )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1141:14: error: 'VK_STRUCTURE_TYPE_DEVICE_PIPELINE_BINARY_INTERNAL_CACHE_CONTROL_KHR' was not declared in this scope
|  1141 |         case VK_STRUCTURE_TYPE_DEVICE_PIPELINE_BINARY_INTERNAL_CACHE_CONTROL_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1144:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1144 |             delete reinterpret_cast<const VkDevicePipelineBinaryInternalCacheControlKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1144:43: error: expected '>' before 'VkDevicePipelineBinaryInternalCacheControlKHR'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1144:43: error: expected '(' before 'VkDevicePipelineBinaryInternalCacheControlKHR'
|  1144 |             delete reinterpret_cast<const VkDevicePipelineBinaryInternalCacheControlKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1144:43: error: 'VkDevicePipelineBinaryInternalCacheControlKHR' was not declared in this scope
|  1144 |             delete reinterpret_cast<const VkDevicePipelineBinaryInternalCacheControlKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1144:90: error: expected primary-expression before '>' token
|  1144 |             delete reinterpret_cast<const VkDevicePipelineBinaryInternalCacheControlKHR *>(header);
|       |                                                                                          ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1144:99: error: expected ')' before ';' token
|  1144 |             delete reinterpret_cast<const VkDevicePipelineBinaryInternalCacheControlKHR *>(header);
|       |                                                                                                   ^
|       |                                                                                                   )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1146:14: error: 'VK_STRUCTURE_TYPE_PIPELINE_BINARY_INFO_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR'?
|  1146 |         case VK_STRUCTURE_TYPE_PIPELINE_BINARY_INFO_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PIPELINE_INFO_KHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1149:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1149 |             delete reinterpret_cast<const VkPipelineBinaryInfoKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1149:43: error: expected '>' before 'VkPipelineBinaryInfoKHR'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1149:43: error: expected '(' before 'VkPipelineBinaryInfoKHR'
|  1149 |             delete reinterpret_cast<const VkPipelineBinaryInfoKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1149:43: error: 'VkPipelineBinaryInfoKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|  1149 |             delete reinterpret_cast<const VkPipelineBinaryInfoKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1149:68: error: expected primary-expression before '>' token
|  1149 |             delete reinterpret_cast<const VkPipelineBinaryInfoKHR *>(header);
|       |                                                                    ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1149:77: error: expected ')' before ';' token
|  1149 |             delete reinterpret_cast<const VkPipelineBinaryInfoKHR *>(header);
|       |                                                                             ^
|       |                                                                             )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1161:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  1161 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1164:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1164 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1164:43: error: expected '>' before 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1164:43: error: expected '(' before 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR'
|  1164 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1164:43: error: 'VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  1164 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1164:96: error: expected primary-expression before '>' token
|  1164 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(header);
|       |                                                                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1164:105: error: expected ')' before ';' token
|  1164 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesFeaturesKHR *>(header);
|       |                                                                                                         ^
|       |                                                                                                         )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1166:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  1166 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1169:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  1169 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1169:43: error: expected '>' before 'VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1169:43: error: expected '(' before 'VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR'
|  1169 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1169:43: error: 'VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR' was not declared in this scope; did you mean 'VkPhysicalDeviceComputeShaderDerivativesFeaturesNV'?
|  1169 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceComputeShaderDerivativesFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1169:98: error: expected primary-expression before '>' token
|  1169 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR *>(header);
|       |                                                                                                  ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:1169:107: error: expected ')' before ';' token
|  1169 |             delete reinterpret_cast<const VkPhysicalDeviceComputeShaderDerivativesPropertiesKHR *>(header);
|       |                                                                                                           ^
|       |                                                                                                           )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2769:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT'?
|  2769 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2772:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2772 |             delete reinterpret_cast<const VkPhysicalDeviceAntiLagFeaturesAMD *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2772:43: error: expected '>' before 'VkPhysicalDeviceAntiLagFeaturesAMD'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2772:43: error: expected '(' before 'VkPhysicalDeviceAntiLagFeaturesAMD'
|  2772 |             delete reinterpret_cast<const VkPhysicalDeviceAntiLagFeaturesAMD *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2772:43: error: 'VkPhysicalDeviceAntiLagFeaturesAMD' was not declared in this scope; did you mean 'VkPhysicalDeviceMultiDrawFeaturesEXT'?
|  2772 |             delete reinterpret_cast<const VkPhysicalDeviceAntiLagFeaturesAMD *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceMultiDrawFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2772:79: error: expected primary-expression before '>' token
|  2772 |             delete reinterpret_cast<const VkPhysicalDeviceAntiLagFeaturesAMD *>(header);
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2772:88: error: expected ')' before ';' token
|  2772 |             delete reinterpret_cast<const VkPhysicalDeviceAntiLagFeaturesAMD *>(header);
|       |                                                                                        ^
|       |                                                                                        )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2976:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMMAND_BUFFER_INHERITANCE_FEATURES_NV' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV'?
|  2976 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMMAND_BUFFER_INHERITANCE_FEATURES_NV:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2979:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2979 |             delete reinterpret_cast<const VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2979:43: error: expected '>' before 'VkPhysicalDeviceCommandBufferInheritanceFeaturesNV'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2979:43: error: expected '(' before 'VkPhysicalDeviceCommandBufferInheritanceFeaturesNV'
|  2979 |             delete reinterpret_cast<const VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2979:43: error: 'VkPhysicalDeviceCommandBufferInheritanceFeaturesNV' was not declared in this scope; did you mean 'VkPhysicalDeviceCudaKernelLaunchFeaturesNV'?
|  2979 |             delete reinterpret_cast<const VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceCudaKernelLaunchFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2979:95: error: expected primary-expression before '>' token
|  2979 |             delete reinterpret_cast<const VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(header);
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2979:104: error: expected ')' before ';' token
|  2979 |             delete reinterpret_cast<const VkPhysicalDeviceCommandBufferInheritanceFeaturesNV *>(header);
|       |                                                                                                        ^
|       |                                                                                                        )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2996:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV'?
|  2996 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2999:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  2999 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2999:43: error: expected '>' before 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2999:43: error: expected '(' before 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT'
|  2999 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2999:43: error: 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV'?
|  2999 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceDeviceGeneratedCommandsFeaturesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2999:95: error: expected primary-expression before '>' token
|  2999 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(header);
|       |                                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:2999:104: error: expected ')' before ';' token
|  2999 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsFeaturesEXT *>(header);
|       |                                                                                                        ^
|       |                                                                                                        )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3001:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV'?
|  3001 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3004:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  3004 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3004:43: error: expected '>' before 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3004:43: error: expected '(' before 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT'
|  3004 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3004:43: error: 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV'?
|  3004 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceDeviceGeneratedCommandsPropertiesNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3004:97: error: expected primary-expression before '>' token
|  3004 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT *>(header);
|       |                                                                                                 ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3004:106: error: expected ')' before ';' token
|  3004 |             delete reinterpret_cast<const VkPhysicalDeviceDeviceGeneratedCommandsPropertiesEXT *>(header);
|       |                                                                                                          ^
|       |                                                                                                          )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3006:14: error: 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_PIPELINE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV'?
|  3006 |         case VK_STRUCTURE_TYPE_GENERATED_COMMANDS_PIPELINE_INFO_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3009:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  3009 |             delete reinterpret_cast<const VkGeneratedCommandsPipelineInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3009:43: error: expected '>' before 'VkGeneratedCommandsPipelineInfoEXT'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3009:43: error: expected '(' before 'VkGeneratedCommandsPipelineInfoEXT'
|  3009 |             delete reinterpret_cast<const VkGeneratedCommandsPipelineInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3009:43: error: 'VkGeneratedCommandsPipelineInfoEXT' was not declared in this scope; did you mean 'VkGeneratedCommandsInfoNV'?
|  3009 |             delete reinterpret_cast<const VkGeneratedCommandsPipelineInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3009:79: error: expected primary-expression before '>' token
|  3009 |             delete reinterpret_cast<const VkGeneratedCommandsPipelineInfoEXT *>(header);
|       |                                                                               ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3009:88: error: expected ')' before ';' token
|  3009 |             delete reinterpret_cast<const VkGeneratedCommandsPipelineInfoEXT *>(header);
|       |                                                                                        ^
|       |                                                                                        )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3011:14: error: 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_SHADER_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV'?
|  3011 |         case VK_STRUCTURE_TYPE_GENERATED_COMMANDS_SHADER_INFO_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_GENERATED_COMMANDS_INFO_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3014:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  3014 |             delete reinterpret_cast<const VkGeneratedCommandsShaderInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3014:43: error: expected '>' before 'VkGeneratedCommandsShaderInfoEXT'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3014:43: error: expected '(' before 'VkGeneratedCommandsShaderInfoEXT'
|  3014 |             delete reinterpret_cast<const VkGeneratedCommandsShaderInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3014:43: error: 'VkGeneratedCommandsShaderInfoEXT' was not declared in this scope; did you mean 'VkGeneratedCommandsInfoNV'?
|  3014 |             delete reinterpret_cast<const VkGeneratedCommandsShaderInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3014:77: error: expected primary-expression before '>' token
|  3014 |             delete reinterpret_cast<const VkGeneratedCommandsShaderInfoEXT *>(header);
|       |                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3014:86: error: expected ')' before ';' token
|  3014 |             delete reinterpret_cast<const VkGeneratedCommandsShaderInfoEXT *>(header);
|       |                                                                                      ^
|       |                                                                                      )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3031:14: error: 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT'?
|  3031 |         case VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3034:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  3034 |             delete reinterpret_cast<const VkPhysicalDeviceDepthClampControlFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3034:43: error: expected '>' before 'VkPhysicalDeviceDepthClampControlFeaturesEXT'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3034:43: error: expected '(' before 'VkPhysicalDeviceDepthClampControlFeaturesEXT'
|  3034 |             delete reinterpret_cast<const VkPhysicalDeviceDepthClampControlFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3034:43: error: 'VkPhysicalDeviceDepthClampControlFeaturesEXT' was not declared in this scope; did you mean 'VkPhysicalDeviceDepthClipControlFeaturesEXT'?
|  3034 |             delete reinterpret_cast<const VkPhysicalDeviceDepthClampControlFeaturesEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPhysicalDeviceDepthClipControlFeaturesEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3034:89: error: expected primary-expression before '>' token
|  3034 |             delete reinterpret_cast<const VkPhysicalDeviceDepthClampControlFeaturesEXT *>(header);
|       |                                                                                         ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3034:98: error: expected ')' before ';' token
|  3034 |             delete reinterpret_cast<const VkPhysicalDeviceDepthClampControlFeaturesEXT *>(header);
|       |                                                                                                  ^
|       |                                                                                                  )
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3036:14: error: 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLAMP_CONTROL_CREATE_INFO_EXT' was not declared in this scope; did you mean 'VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT'?
|  3036 |         case VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLAMP_CONTROL_CREATE_INFO_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3039:43: error: ISO C++ forbids declaration of 'type name' with no type [-fpermissive]
|  3039 |             delete reinterpret_cast<const VkPipelineViewportDepthClampControlCreateInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3039:43: error: expected '>' before 'VkPipelineViewportDepthClampControlCreateInfoEXT'
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3039:43: error: expected '(' before 'VkPipelineViewportDepthClampControlCreateInfoEXT'
|  3039 |             delete reinterpret_cast<const VkPipelineViewportDepthClampControlCreateInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           (
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3039:43: error: 'VkPipelineViewportDepthClampControlCreateInfoEXT' was not declared in this scope; did you mean 'VkPipelineViewportDepthClipControlCreateInfoEXT'?
|  3039 |             delete reinterpret_cast<const VkPipelineViewportDepthClampControlCreateInfoEXT *>(header);
|       |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           VkPipelineViewportDepthClipControlCreateInfoEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3039:93: error: expected primary-expression before '>' token
|  3039 |             delete reinterpret_cast<const VkPipelineViewportDepthClampControlCreateInfoEXT *>(header);
|       |                                                                                             ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/pnext_chain_extraction.cpp:3039:102: error: expected ')' before ';' token
|  3039 |             delete reinterpret_cast<const VkPipelineViewportDepthClampControlCreateInfoEXT *>(header);
|       |                                                                                                      ^
|       |                                                                                                      )
| [9/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-s
 ecurity  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vul
 kan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/error_location_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/error_location_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/error_location_helper.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/gi
 t/layers/vulkan/generated/error_location_helper.cpp
| [10/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/hash_util.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/hash_util.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/hash_util.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/hash_util.cpp
| [11/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/error_
 location.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/error_message/error_location.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/error_location.
 cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/logging.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/error_location.h:24,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/error_location.cpp:18:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:475:5: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|   475 |     PFN_vkCreatePipelineBinariesKHR CreatePipelineBinariesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:476:5: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|   476 |     PFN_vkDestroyPipelineBinaryKHR DestroyPipelineBinaryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:477:5: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   477 |     PFN_vkGetPipelineKeyKHR GetPipelineKeyKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:478:5: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   478 |     PFN_vkGetPipelineBinaryDataKHR GetPipelineBinaryDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:479:5: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|   479 |     PFN_vkReleaseCapturedPipelineDataKHR ReleaseCapturedPipelineDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:735:5: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|   735 |     PFN_vkAntiLagUpdateAMD AntiLagUpdateAMD;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:740:5: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|   740 |     PFN_vkCmdSetDepthClampRangeEXT CmdSetDepthClampRangeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:752:5: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|   752 |     PFN_vkGetGeneratedCommandsMemoryRequirementsEXT GetGeneratedCommandsMemoryRequirementsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:753:5: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|   753 |     PFN_vkCmdPreprocessGeneratedCommandsEXT CmdPreprocessGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:754:5: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|   754 |     PFN_vkCmdExecuteGeneratedCommandsEXT CmdExecuteGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:755:5: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|   755 |     PFN_vkCreateIndirectCommandsLayoutEXT CreateIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:756:5: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|   756 |     PFN_vkDestroyIndirectCommandsLayoutEXT DestroyIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:757:5: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|   757 |     PFN_vkCreateIndirectExecutionSetEXT CreateIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:758:5: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|   758 |     PFN_vkDestroyIndirectExecutionSetEXT DestroyIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:759:5: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|   759 |     PFN_vkUpdateIndirectExecutionSetPipelineEXT UpdateIndirectExecutionSetPipelineEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:760:5: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|   760 |     PFN_vkUpdateIndirectExecutionSetShaderEXT UpdateIndirectExecutionSetShaderEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/logging.h:32:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VkObjectType ConvertVulkanObjectToCoreObject(VulkanObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:165:20: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   165 |             return VK_OBJECT_TYPE_PIPELINE_BINARY_KHR;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:197:20: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   197 |             return VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:199:20: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   199 |             return VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VulkanObjectType ConvertCoreObjectToVulkanObject(VkObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:278:14: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   278 |         case VK_OBJECT_TYPE_PIPELINE_BINARY_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:310:14: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   310 |         case VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:312:14: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   312 |         case VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:21: error: 'VkPipelineBinaryKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                     ^~~~~~~~~~~~~~~~~~~
|       |                     VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:40: error: template argument 1 is invalid
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:969:13: error: 'VkPipelineBinaryKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|   969 |     typedef VkPipelineBinaryKHR Type;
|       |             ^~~~~~~~~~~~~~~~~~~
|       |             VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:21: error: 'VkIndirectExecutionSetEXT' was not declared in this scope
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:46: error: template argument 1 is invalid
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1163:13: error: 'VkIndirectExecutionSetEXT' does not name a type
|  1163 |     typedef VkIndirectExecutionSetEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:21: error: 'VkIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkIndirectCommandsLayoutNV_T
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:48: error: template argument 1 is invalid
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1175:13: error: 'VkIndirectCommandsLayoutEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1175 |     typedef VkIndirectCommandsLayoutEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkIndirectCommandsLayoutNV_T
| [12/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_layer_utils.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/vk_layer_utils.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_layer_utils.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/./error_message/logging.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_layer_utils.h:34,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_layer_utils.cpp:18:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:475:5: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|   475 |     PFN_vkCreatePipelineBinariesKHR CreatePipelineBinariesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:476:5: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|   476 |     PFN_vkDestroyPipelineBinaryKHR DestroyPipelineBinaryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:477:5: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   477 |     PFN_vkGetPipelineKeyKHR GetPipelineKeyKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:478:5: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   478 |     PFN_vkGetPipelineBinaryDataKHR GetPipelineBinaryDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:479:5: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|   479 |     PFN_vkReleaseCapturedPipelineDataKHR ReleaseCapturedPipelineDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:735:5: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|   735 |     PFN_vkAntiLagUpdateAMD AntiLagUpdateAMD;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:740:5: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|   740 |     PFN_vkCmdSetDepthClampRangeEXT CmdSetDepthClampRangeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:752:5: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|   752 |     PFN_vkGetGeneratedCommandsMemoryRequirementsEXT GetGeneratedCommandsMemoryRequirementsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:753:5: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|   753 |     PFN_vkCmdPreprocessGeneratedCommandsEXT CmdPreprocessGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:754:5: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|   754 |     PFN_vkCmdExecuteGeneratedCommandsEXT CmdExecuteGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:755:5: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|   755 |     PFN_vkCreateIndirectCommandsLayoutEXT CreateIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:756:5: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|   756 |     PFN_vkDestroyIndirectCommandsLayoutEXT DestroyIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:757:5: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|   757 |     PFN_vkCreateIndirectExecutionSetEXT CreateIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:758:5: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|   758 |     PFN_vkDestroyIndirectExecutionSetEXT DestroyIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:759:5: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|   759 |     PFN_vkUpdateIndirectExecutionSetPipelineEXT UpdateIndirectExecutionSetPipelineEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:760:5: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|   760 |     PFN_vkUpdateIndirectExecutionSetShaderEXT UpdateIndirectExecutionSetShaderEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/./error_message/logging.h:32:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VkObjectType ConvertVulkanObjectToCoreObject(VulkanObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:165:20: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   165 |             return VK_OBJECT_TYPE_PIPELINE_BINARY_KHR;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:197:20: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   197 |             return VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:199:20: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   199 |             return VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VulkanObjectType ConvertCoreObjectToVulkanObject(VkObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:278:14: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   278 |         case VK_OBJECT_TYPE_PIPELINE_BINARY_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:310:14: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   310 |         case VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:312:14: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   312 |         case VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:21: error: 'VkPipelineBinaryKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                     ^~~~~~~~~~~~~~~~~~~
|       |                     VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:40: error: template argument 1 is invalid
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:969:13: error: 'VkPipelineBinaryKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|   969 |     typedef VkPipelineBinaryKHR Type;
|       |             ^~~~~~~~~~~~~~~~~~~
|       |             VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:21: error: 'VkIndirectExecutionSetEXT' was not declared in this scope
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:46: error: template argument 1 is invalid
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1163:13: error: 'VkIndirectExecutionSetEXT' does not name a type
|  1163 |     typedef VkIndirectExecutionSetEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:21: error: 'VkIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkIndirectCommandsLayoutNV_T
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:48: error: template argument 1 is invalid
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1175:13: error: 'VkIndirectCommandsLayoutEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1175 |     typedef VkIndirectCommandsLayoutEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkIndirectCommandsLayoutNV_T
| [13/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_struct_compare.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/utils/vk_struct_compare.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_struct_compare.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/./error_message/logging.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/./utils/vk_layer_utils.h:34,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_struct_compare.cpp:19:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:475:5: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|   475 |     PFN_vkCreatePipelineBinariesKHR CreatePipelineBinariesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:476:5: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|   476 |     PFN_vkDestroyPipelineBinaryKHR DestroyPipelineBinaryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:477:5: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   477 |     PFN_vkGetPipelineKeyKHR GetPipelineKeyKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:478:5: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   478 |     PFN_vkGetPipelineBinaryDataKHR GetPipelineBinaryDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:479:5: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|   479 |     PFN_vkReleaseCapturedPipelineDataKHR ReleaseCapturedPipelineDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:735:5: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|   735 |     PFN_vkAntiLagUpdateAMD AntiLagUpdateAMD;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:740:5: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|   740 |     PFN_vkCmdSetDepthClampRangeEXT CmdSetDepthClampRangeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:752:5: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|   752 |     PFN_vkGetGeneratedCommandsMemoryRequirementsEXT GetGeneratedCommandsMemoryRequirementsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:753:5: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|   753 |     PFN_vkCmdPreprocessGeneratedCommandsEXT CmdPreprocessGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:754:5: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|   754 |     PFN_vkCmdExecuteGeneratedCommandsEXT CmdExecuteGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:755:5: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|   755 |     PFN_vkCreateIndirectCommandsLayoutEXT CreateIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:756:5: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|   756 |     PFN_vkDestroyIndirectCommandsLayoutEXT DestroyIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:757:5: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|   757 |     PFN_vkCreateIndirectExecutionSetEXT CreateIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:758:5: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|   758 |     PFN_vkDestroyIndirectExecutionSetEXT DestroyIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:759:5: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|   759 |     PFN_vkUpdateIndirectExecutionSetPipelineEXT UpdateIndirectExecutionSetPipelineEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:760:5: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|   760 |     PFN_vkUpdateIndirectExecutionSetShaderEXT UpdateIndirectExecutionSetShaderEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/./error_message/logging.h:32:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VkObjectType ConvertVulkanObjectToCoreObject(VulkanObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:165:20: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   165 |             return VK_OBJECT_TYPE_PIPELINE_BINARY_KHR;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:197:20: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   197 |             return VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:199:20: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   199 |             return VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VulkanObjectType ConvertCoreObjectToVulkanObject(VkObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:278:14: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   278 |         case VK_OBJECT_TYPE_PIPELINE_BINARY_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:310:14: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   310 |         case VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:312:14: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   312 |         case VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:21: error: 'VkPipelineBinaryKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                     ^~~~~~~~~~~~~~~~~~~
|       |                     VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:40: error: template argument 1 is invalid
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:969:13: error: 'VkPipelineBinaryKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|   969 |     typedef VkPipelineBinaryKHR Type;
|       |             ^~~~~~~~~~~~~~~~~~~
|       |             VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:21: error: 'VkIndirectExecutionSetEXT' was not declared in this scope
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:46: error: template argument 1 is invalid
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1163:13: error: 'VkIndirectExecutionSetEXT' does not name a type
|  1163 |     typedef VkIndirectExecutionSetEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:21: error: 'VkIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkIndirectCommandsLayoutNV_T
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:48: error: template argument 1 is invalid
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1175:13: error: 'VkIndirectCommandsLayoutEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1175 |     typedef VkIndirectCommandsLayoutEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkIndirectCommandsLayoutNV_T
| [14/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vk_layer_config.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vk_layer_config.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vk_layer_config.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/./error_message/logging.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/utils/vk_layer_utils.h:34,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vk_layer_config.cpp:30:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:475:5: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|   475 |     PFN_vkCreatePipelineBinariesKHR CreatePipelineBinariesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:476:5: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|   476 |     PFN_vkDestroyPipelineBinaryKHR DestroyPipelineBinaryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:477:5: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   477 |     PFN_vkGetPipelineKeyKHR GetPipelineKeyKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:478:5: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   478 |     PFN_vkGetPipelineBinaryDataKHR GetPipelineBinaryDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:479:5: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|   479 |     PFN_vkReleaseCapturedPipelineDataKHR ReleaseCapturedPipelineDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:735:5: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|   735 |     PFN_vkAntiLagUpdateAMD AntiLagUpdateAMD;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:740:5: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|   740 |     PFN_vkCmdSetDepthClampRangeEXT CmdSetDepthClampRangeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:752:5: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|   752 |     PFN_vkGetGeneratedCommandsMemoryRequirementsEXT GetGeneratedCommandsMemoryRequirementsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:753:5: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|   753 |     PFN_vkCmdPreprocessGeneratedCommandsEXT CmdPreprocessGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:754:5: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|   754 |     PFN_vkCmdExecuteGeneratedCommandsEXT CmdExecuteGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:755:5: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|   755 |     PFN_vkCreateIndirectCommandsLayoutEXT CreateIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:756:5: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|   756 |     PFN_vkDestroyIndirectCommandsLayoutEXT DestroyIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:757:5: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|   757 |     PFN_vkCreateIndirectExecutionSetEXT CreateIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:758:5: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|   758 |     PFN_vkDestroyIndirectExecutionSetEXT DestroyIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:759:5: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|   759 |     PFN_vkUpdateIndirectExecutionSetPipelineEXT UpdateIndirectExecutionSetPipelineEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:760:5: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|   760 |     PFN_vkUpdateIndirectExecutionSetShaderEXT UpdateIndirectExecutionSetShaderEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/./error_message/logging.h:32:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VkObjectType ConvertVulkanObjectToCoreObject(VulkanObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:165:20: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   165 |             return VK_OBJECT_TYPE_PIPELINE_BINARY_KHR;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:197:20: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   197 |             return VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:199:20: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   199 |             return VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VulkanObjectType ConvertCoreObjectToVulkanObject(VkObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:278:14: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   278 |         case VK_OBJECT_TYPE_PIPELINE_BINARY_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:310:14: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   310 |         case VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:312:14: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   312 |         case VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:21: error: 'VkPipelineBinaryKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                     ^~~~~~~~~~~~~~~~~~~
|       |                     VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:40: error: template argument 1 is invalid
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:969:13: error: 'VkPipelineBinaryKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|   969 |     typedef VkPipelineBinaryKHR Type;
|       |             ^~~~~~~~~~~~~~~~~~~
|       |             VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:21: error: 'VkIndirectExecutionSetEXT' was not declared in this scope
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:46: error: template argument 1 is invalid
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1163:13: error: 'VkIndirectExecutionSetEXT' does not name a type
|  1163 |     typedef VkIndirectExecutionSetEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:21: error: 'VkIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkIndirectCommandsLayoutNV_T
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:48: error: template argument 1 is invalid
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1175:13: error: 'VkIndirectCommandsLayoutEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1175 |     typedef VkIndirectCommandsLayoutEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkIndirectCommandsLayoutNV_T
| [15/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.
 3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_dispatch_table_helper.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/g
 it/layers/vulkan/generated/vk_dispatch_table_helper.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.h:32,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:25:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:475:5: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|   475 |     PFN_vkCreatePipelineBinariesKHR CreatePipelineBinariesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:476:5: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|   476 |     PFN_vkDestroyPipelineBinaryKHR DestroyPipelineBinaryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:477:5: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   477 |     PFN_vkGetPipelineKeyKHR GetPipelineKeyKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:478:5: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   478 |     PFN_vkGetPipelineBinaryDataKHR GetPipelineBinaryDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:479:5: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|   479 |     PFN_vkReleaseCapturedPipelineDataKHR ReleaseCapturedPipelineDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:735:5: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|   735 |     PFN_vkAntiLagUpdateAMD AntiLagUpdateAMD;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:740:5: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|   740 |     PFN_vkCmdSetDepthClampRangeEXT CmdSetDepthClampRangeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:752:5: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|   752 |     PFN_vkGetGeneratedCommandsMemoryRequirementsEXT GetGeneratedCommandsMemoryRequirementsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:753:5: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|   753 |     PFN_vkCmdPreprocessGeneratedCommandsEXT CmdPreprocessGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:754:5: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|   754 |     PFN_vkCmdExecuteGeneratedCommandsEXT CmdExecuteGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:755:5: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|   755 |     PFN_vkCreateIndirectCommandsLayoutEXT CreateIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:756:5: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|   756 |     PFN_vkDestroyIndirectCommandsLayoutEXT DestroyIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:757:5: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|   757 |     PFN_vkCreateIndirectExecutionSetEXT CreateIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:758:5: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|   758 |     PFN_vkDestroyIndirectExecutionSetEXT DestroyIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:759:5: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|   759 |     PFN_vkUpdateIndirectExecutionSetPipelineEXT UpdateIndirectExecutionSetPipelineEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:760:5: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|   760 |     PFN_vkUpdateIndirectExecutionSetShaderEXT UpdateIndirectExecutionSetShaderEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:545:85: error: 'VkPipelineBinaryCreateInfoKHR' does not name a type; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|   545 | static VKAPI_ATTR VkResult VKAPI_CALL StubCreatePipelineBinariesKHR(VkDevice, const VkPipelineBinaryCreateInfoKHR*,
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                     VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:546:99: error: 'VkPipelineBinaryHandlesInfoKHR' has not been declared
|   546 |                                                                     const VkAllocationCallbacks*, VkPipelineBinaryHandlesInfoKHR*) {
|       |                                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:549:74: error: 'VkPipelineBinaryKHR' has not been declared
|   549 | static VKAPI_ATTR void VKAPI_CALL StubDestroyPipelineBinaryKHR(VkDevice, VkPipelineBinaryKHR, const VkAllocationCallbacks*) {}
|       |                                                                          ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:550:77: error: 'VkPipelineCreateInfoKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|   550 | static VKAPI_ATTR VkResult VKAPI_CALL StubGetPipelineKeyKHR(VkDevice, const VkPipelineCreateInfoKHR*, VkPipelineBinaryKeyKHR*) {
|       |                                                                             ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                             VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:550:103: error: 'VkPipelineBinaryKeyKHR' has not been declared
|   550 | static VKAPI_ATTR VkResult VKAPI_CALL StubGetPipelineKeyKHR(VkDevice, const VkPipelineCreateInfoKHR*, VkPipelineBinaryKeyKHR*) {
|       |                                                                                                       ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:553:84: error: 'VkPipelineBinaryDataInfoKHR' does not name a type; did you mean 'VkPipelineLibraryCreateInfoKHR'?
|   553 | static VKAPI_ATTR VkResult VKAPI_CALL StubGetPipelineBinaryDataKHR(VkDevice, const VkPipelineBinaryDataInfoKHR*,
|       |                                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                    VkPipelineLibraryCreateInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:554:68: error: 'VkPipelineBinaryKeyKHR' has not been declared
|   554 |                                                                    VkPipelineBinaryKeyKHR*, size_t*, void*) {
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:557:90: error: 'VkReleaseCapturedPipelineDataInfoKHR' does not name a type
|   557 | static VKAPI_ATTR VkResult VKAPI_CALL StubReleaseCapturedPipelineDataKHR(VkDevice, const VkReleaseCapturedPipelineDataInfoKHR*,
|       |                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1223:72: error: 'VkAntiLagDataAMD' does not name a type
|  1223 | static VKAPI_ATTR void VKAPI_CALL StubAntiLagUpdateAMD(VkDevice, const VkAntiLagDataAMD*) {}
|       |                                                                        ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1232:81: error: 'VkDepthClampModeEXT' has not been declared
|  1232 | static VKAPI_ATTR void VKAPI_CALL StubCmdSetDepthClampRangeEXT(VkCommandBuffer, VkDepthClampModeEXT, const VkDepthClampRangeEXT*) {}
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1232:108: error: 'VkDepthClampRangeEXT' does not name a type
|  1232 | static VKAPI_ATTR void VKAPI_CALL StubCmdSetDepthClampRangeEXT(VkCommandBuffer, VkDepthClampModeEXT, const VkDepthClampRangeEXT*) {}
|       |                                                                                                            ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1258:87: error: 'VkGeneratedCommandsMemoryRequirementsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsMemoryRequirementsInfoNV'?
|  1258 |                                                                                 const VkGeneratedCommandsMemoryRequirementsInfoEXT*,
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                       VkGeneratedCommandsMemoryRequirementsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1260:96: error: 'VkGeneratedCommandsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsInfoNV'?
|  1260 | static VKAPI_ATTR void VKAPI_CALL StubCmdPreprocessGeneratedCommandsEXT(VkCommandBuffer, const VkGeneratedCommandsInfoEXT*,
|       |                                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1262:103: error: 'VkGeneratedCommandsInfoEXT' does not name a type; did you mean 'VkGeneratedCommandsInfoNV'?
|  1262 | static VKAPI_ATTR void VKAPI_CALL StubCmdExecuteGeneratedCommandsEXT(VkCommandBuffer, VkBool32, const VkGeneratedCommandsInfoEXT*) {
|       |                                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                                       VkGeneratedCommandsInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1264:91: error: 'VkIndirectCommandsLayoutCreateInfoEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutCreateInfoNV'?
|  1264 | static VKAPI_ATTR VkResult VKAPI_CALL StubCreateIndirectCommandsLayoutEXT(VkDevice, const VkIndirectCommandsLayoutCreateInfoEXT*,
|       |                                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                                           VkIndirectCommandsLayoutCreateInfoNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1266:75: error: 'VkIndirectCommandsLayoutEXT' has not been declared
|  1266 |                                                                           VkIndirectCommandsLayoutEXT*) {
|       |                                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1269:82: error: 'VkIndirectCommandsLayoutEXT' has not been declared
|  1269 | static VKAPI_ATTR void VKAPI_CALL StubDestroyIndirectCommandsLayoutEXT(VkDevice, VkIndirectCommandsLayoutEXT,
|       |                                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1271:89: error: 'VkIndirectExecutionSetCreateInfoEXT' does not name a type
|  1271 | static VKAPI_ATTR VkResult VKAPI_CALL StubCreateIndirectExecutionSetEXT(VkDevice, const VkIndirectExecutionSetCreateInfoEXT*,
|       |                                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1272:103: error: 'VkIndirectExecutionSetEXT' has not been declared
|  1272 |                                                                         const VkAllocationCallbacks*, VkIndirectExecutionSetEXT*) {
|       |                                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1275:80: error: 'VkIndirectExecutionSetEXT' has not been declared
|  1275 | static VKAPI_ATTR void VKAPI_CALL StubDestroyIndirectExecutionSetEXT(VkDevice, VkIndirectExecutionSetEXT,
|       |                                                                                ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1277:87: error: 'VkIndirectExecutionSetEXT' has not been declared
|  1277 | static VKAPI_ATTR void VKAPI_CALL StubUpdateIndirectExecutionSetPipelineEXT(VkDevice, VkIndirectExecutionSetEXT, uint32_t,
|       |                                                                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1278:83: error: 'VkWriteIndirectExecutionSetPipelineEXT' does not name a type
|  1278 |                                                                             const VkWriteIndirectExecutionSetPipelineEXT*) {}
|       |                                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1279:85: error: 'VkIndirectExecutionSetEXT' has not been declared
|  1279 | static VKAPI_ATTR void VKAPI_CALL StubUpdateIndirectExecutionSetShaderEXT(VkDevice, VkIndirectExecutionSetEXT, uint32_t,
|       |                                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1280:81: error: 'VkWriteIndirectExecutionSetShaderEXT' does not name a type
|  1280 |                                                                           const VkWriteIndirectExecutionSetShaderEXT*) {}
|       |                                                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp: In function 'void layer_init_device_dispatch_table(VkDevice, VkLayerDispatchTable*, PFN_vkGetDeviceProcAddr)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2773:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreatePipelineBinariesKHR'; did you mean 'CreatePipelineCache'?
|  2773 |     table->CreatePipelineBinariesKHR = (PFN_vkCreatePipelineBinariesKHR)gpa(device, "vkCreatePipelineBinariesKHR");
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |            CreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2773:41: error: 'PFN_vkCreatePipelineBinariesKHR' was not declared in this scope; did you mean 'StubCreatePipelineBinariesKHR'?
|  2773 |     table->CreatePipelineBinariesKHR = (PFN_vkCreatePipelineBinariesKHR)gpa(device, "vkCreatePipelineBinariesKHR");
|       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                         StubCreatePipelineBinariesKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2774:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreatePipelineBinariesKHR'; did you mean 'CreatePipelineCache'?
|  2774 |     if (table->CreatePipelineBinariesKHR == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                CreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2775:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreatePipelineBinariesKHR'; did you mean 'CreatePipelineCache'?
|  2775 |         table->CreatePipelineBinariesKHR = (PFN_vkCreatePipelineBinariesKHR)StubCreatePipelineBinariesKHR;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                CreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2777:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyPipelineBinaryKHR'; did you mean 'DestroyPipelineLayout'?
|  2777 |     table->DestroyPipelineBinaryKHR = (PFN_vkDestroyPipelineBinaryKHR)gpa(device, "vkDestroyPipelineBinaryKHR");
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~
|       |            DestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2777:40: error: 'PFN_vkDestroyPipelineBinaryKHR' was not declared in this scope; did you mean 'StubDestroyPipelineBinaryKHR'?
|  2777 |     table->DestroyPipelineBinaryKHR = (PFN_vkDestroyPipelineBinaryKHR)gpa(device, "vkDestroyPipelineBinaryKHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        StubDestroyPipelineBinaryKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2778:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyPipelineBinaryKHR'; did you mean 'DestroyPipelineLayout'?
|  2778 |     if (table->DestroyPipelineBinaryKHR == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                DestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2779:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyPipelineBinaryKHR'; did you mean 'DestroyPipelineLayout'?
|  2779 |         table->DestroyPipelineBinaryKHR = (PFN_vkDestroyPipelineBinaryKHR)StubDestroyPipelineBinaryKHR;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                DestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2781:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetPipelineKeyKHR'
|  2781 |     table->GetPipelineKeyKHR = (PFN_vkGetPipelineKeyKHR)gpa(device, "vkGetPipelineKeyKHR");
|       |            ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2781:33: error: 'PFN_vkGetPipelineKeyKHR' was not declared in this scope; did you mean 'StubGetPipelineKeyKHR'?
|  2781 |     table->GetPipelineKeyKHR = (PFN_vkGetPipelineKeyKHR)gpa(device, "vkGetPipelineKeyKHR");
|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                 StubGetPipelineKeyKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2782:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetPipelineKeyKHR'
|  2782 |     if (table->GetPipelineKeyKHR == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2783:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetPipelineKeyKHR'
|  2783 |         table->GetPipelineKeyKHR = (PFN_vkGetPipelineKeyKHR)StubGetPipelineKeyKHR;
|       |                ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2785:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetPipelineBinaryDataKHR'
|  2785 |     table->GetPipelineBinaryDataKHR = (PFN_vkGetPipelineBinaryDataKHR)gpa(device, "vkGetPipelineBinaryDataKHR");
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2785:40: error: 'PFN_vkGetPipelineBinaryDataKHR' was not declared in this scope; did you mean 'StubGetPipelineBinaryDataKHR'?
|  2785 |     table->GetPipelineBinaryDataKHR = (PFN_vkGetPipelineBinaryDataKHR)gpa(device, "vkGetPipelineBinaryDataKHR");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        StubGetPipelineBinaryDataKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2786:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetPipelineBinaryDataKHR'
|  2786 |     if (table->GetPipelineBinaryDataKHR == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2787:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetPipelineBinaryDataKHR'
|  2787 |         table->GetPipelineBinaryDataKHR = (PFN_vkGetPipelineBinaryDataKHR)StubGetPipelineBinaryDataKHR;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2789:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'ReleaseCapturedPipelineDataKHR'
|  2789 |     table->ReleaseCapturedPipelineDataKHR = (PFN_vkReleaseCapturedPipelineDataKHR)gpa(device, "vkReleaseCapturedPipelineDataKHR");
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2789:46: error: 'PFN_vkReleaseCapturedPipelineDataKHR' was not declared in this scope; did you mean 'StubReleaseCapturedPipelineDataKHR'?
|  2789 |     table->ReleaseCapturedPipelineDataKHR = (PFN_vkReleaseCapturedPipelineDataKHR)gpa(device, "vkReleaseCapturedPipelineDataKHR");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              StubReleaseCapturedPipelineDataKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2790:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'ReleaseCapturedPipelineDataKHR'
|  2790 |     if (table->ReleaseCapturedPipelineDataKHR == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:2791:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'ReleaseCapturedPipelineDataKHR'
|  2791 |         table->ReleaseCapturedPipelineDataKHR = (PFN_vkReleaseCapturedPipelineDataKHR)StubReleaseCapturedPipelineDataKHR;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3891:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'AntiLagUpdateAMD'
|  3891 |     table->AntiLagUpdateAMD = (PFN_vkAntiLagUpdateAMD)gpa(device, "vkAntiLagUpdateAMD");
|       |            ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3891:32: error: 'PFN_vkAntiLagUpdateAMD' was not declared in this scope; did you mean 'StubAntiLagUpdateAMD'?
|  3891 |     table->AntiLagUpdateAMD = (PFN_vkAntiLagUpdateAMD)gpa(device, "vkAntiLagUpdateAMD");
|       |                                ^~~~~~~~~~~~~~~~~~~~~~
|       |                                StubAntiLagUpdateAMD
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3892:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'AntiLagUpdateAMD'
|  3892 |     if (table->AntiLagUpdateAMD == nullptr) {
|       |                ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3893:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'AntiLagUpdateAMD'
|  3893 |         table->AntiLagUpdateAMD = (PFN_vkAntiLagUpdateAMD)StubAntiLagUpdateAMD;
|       |                ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3911:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdSetDepthClampRangeEXT'; did you mean 'CmdSetDepthClampEnableEXT'?
|  3911 |     table->CmdSetDepthClampRangeEXT = (PFN_vkCmdSetDepthClampRangeEXT)gpa(device, "vkCmdSetDepthClampRangeEXT");
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~
|       |            CmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3911:40: error: 'PFN_vkCmdSetDepthClampRangeEXT' was not declared in this scope; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|  3911 |     table->CmdSetDepthClampRangeEXT = (PFN_vkCmdSetDepthClampRangeEXT)gpa(device, "vkCmdSetDepthClampRangeEXT");
|       |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                        PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3912:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdSetDepthClampRangeEXT'; did you mean 'CmdSetDepthClampEnableEXT'?
|  3912 |     if (table->CmdSetDepthClampRangeEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                CmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3913:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdSetDepthClampRangeEXT'; did you mean 'CmdSetDepthClampEnableEXT'?
|  3913 |         table->CmdSetDepthClampRangeEXT = (PFN_vkCmdSetDepthClampRangeEXT)StubCmdSetDepthClampRangeEXT;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                CmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3958:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetGeneratedCommandsMemoryRequirementsEXT'; did you mean 'GetGeneratedCommandsMemoryRequirementsNV'?
|  3958 |     table->GetGeneratedCommandsMemoryRequirementsEXT =
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            GetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3959:10: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' was not declared in this scope; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|  3959 |         (PFN_vkGetGeneratedCommandsMemoryRequirementsEXT)gpa(device, "vkGetGeneratedCommandsMemoryRequirementsEXT");
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3960:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetGeneratedCommandsMemoryRequirementsEXT'; did you mean 'GetGeneratedCommandsMemoryRequirementsNV'?
|  3960 |     if (table->GetGeneratedCommandsMemoryRequirementsEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                GetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3961:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'GetGeneratedCommandsMemoryRequirementsEXT'; did you mean 'GetGeneratedCommandsMemoryRequirementsNV'?
|  3961 |         table->GetGeneratedCommandsMemoryRequirementsEXT =
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                GetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3964:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdPreprocessGeneratedCommandsEXT'; did you mean 'CmdPreprocessGeneratedCommandsNV'?
|  3964 |     table->CmdPreprocessGeneratedCommandsEXT =
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            CmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3965:10: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' was not declared in this scope; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|  3965 |         (PFN_vkCmdPreprocessGeneratedCommandsEXT)gpa(device, "vkCmdPreprocessGeneratedCommandsEXT");
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3966:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdPreprocessGeneratedCommandsEXT'; did you mean 'CmdPreprocessGeneratedCommandsNV'?
|  3966 |     if (table->CmdPreprocessGeneratedCommandsEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                CmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3967:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdPreprocessGeneratedCommandsEXT'; did you mean 'CmdPreprocessGeneratedCommandsNV'?
|  3967 |         table->CmdPreprocessGeneratedCommandsEXT = (PFN_vkCmdPreprocessGeneratedCommandsEXT)StubCmdPreprocessGeneratedCommandsEXT;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                CmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3969:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdExecuteGeneratedCommandsEXT'; did you mean 'CmdExecuteGeneratedCommandsNV'?
|  3969 |     table->CmdExecuteGeneratedCommandsEXT = (PFN_vkCmdExecuteGeneratedCommandsEXT)gpa(device, "vkCmdExecuteGeneratedCommandsEXT");
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            CmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3969:46: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' was not declared in this scope; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|  3969 |     table->CmdExecuteGeneratedCommandsEXT = (PFN_vkCmdExecuteGeneratedCommandsEXT)gpa(device, "vkCmdExecuteGeneratedCommandsEXT");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3970:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdExecuteGeneratedCommandsEXT'; did you mean 'CmdExecuteGeneratedCommandsNV'?
|  3970 |     if (table->CmdExecuteGeneratedCommandsEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                CmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3971:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CmdExecuteGeneratedCommandsEXT'; did you mean 'CmdExecuteGeneratedCommandsNV'?
|  3971 |         table->CmdExecuteGeneratedCommandsEXT = (PFN_vkCmdExecuteGeneratedCommandsEXT)StubCmdExecuteGeneratedCommandsEXT;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                CmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3973:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreateIndirectCommandsLayoutEXT'; did you mean 'CreateIndirectCommandsLayoutNV'?
|  3973 |     table->CreateIndirectCommandsLayoutEXT =
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            CreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3974:10: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|  3974 |         (PFN_vkCreateIndirectCommandsLayoutEXT)gpa(device, "vkCreateIndirectCommandsLayoutEXT");
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3975:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreateIndirectCommandsLayoutEXT'; did you mean 'CreateIndirectCommandsLayoutNV'?
|  3975 |     if (table->CreateIndirectCommandsLayoutEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                CreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3976:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreateIndirectCommandsLayoutEXT'; did you mean 'CreateIndirectCommandsLayoutNV'?
|  3976 |         table->CreateIndirectCommandsLayoutEXT = (PFN_vkCreateIndirectCommandsLayoutEXT)StubCreateIndirectCommandsLayoutEXT;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                CreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3978:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyIndirectCommandsLayoutEXT'; did you mean 'DestroyIndirectCommandsLayoutNV'?
|  3978 |     table->DestroyIndirectCommandsLayoutEXT =
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |            DestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3979:10: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|  3979 |         (PFN_vkDestroyIndirectCommandsLayoutEXT)gpa(device, "vkDestroyIndirectCommandsLayoutEXT");
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3980:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyIndirectCommandsLayoutEXT'; did you mean 'DestroyIndirectCommandsLayoutNV'?
|  3980 |     if (table->DestroyIndirectCommandsLayoutEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                DestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3981:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyIndirectCommandsLayoutEXT'; did you mean 'DestroyIndirectCommandsLayoutNV'?
|  3981 |         table->DestroyIndirectCommandsLayoutEXT = (PFN_vkDestroyIndirectCommandsLayoutEXT)StubDestroyIndirectCommandsLayoutEXT;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                DestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3983:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreateIndirectExecutionSetEXT'
|  3983 |     table->CreateIndirectExecutionSetEXT = (PFN_vkCreateIndirectExecutionSetEXT)gpa(device, "vkCreateIndirectExecutionSetEXT");
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3983:45: error: 'PFN_vkCreateIndirectExecutionSetEXT' was not declared in this scope; did you mean 'StubCreateIndirectExecutionSetEXT'?
|  3983 |     table->CreateIndirectExecutionSetEXT = (PFN_vkCreateIndirectExecutionSetEXT)gpa(device, "vkCreateIndirectExecutionSetEXT");
|       |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                             StubCreateIndirectExecutionSetEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3984:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreateIndirectExecutionSetEXT'
|  3984 |     if (table->CreateIndirectExecutionSetEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3985:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'CreateIndirectExecutionSetEXT'
|  3985 |         table->CreateIndirectExecutionSetEXT = (PFN_vkCreateIndirectExecutionSetEXT)StubCreateIndirectExecutionSetEXT;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3987:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyIndirectExecutionSetEXT'
|  3987 |     table->DestroyIndirectExecutionSetEXT = (PFN_vkDestroyIndirectExecutionSetEXT)gpa(device, "vkDestroyIndirectExecutionSetEXT");
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3987:46: error: 'PFN_vkDestroyIndirectExecutionSetEXT' was not declared in this scope; did you mean 'StubDestroyIndirectExecutionSetEXT'?
|  3987 |     table->DestroyIndirectExecutionSetEXT = (PFN_vkDestroyIndirectExecutionSetEXT)gpa(device, "vkDestroyIndirectExecutionSetEXT");
|       |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                              StubDestroyIndirectExecutionSetEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3988:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyIndirectExecutionSetEXT'
|  3988 |     if (table->DestroyIndirectExecutionSetEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3989:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'DestroyIndirectExecutionSetEXT'
|  3989 |         table->DestroyIndirectExecutionSetEXT = (PFN_vkDestroyIndirectExecutionSetEXT)StubDestroyIndirectExecutionSetEXT;
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3991:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'UpdateIndirectExecutionSetPipelineEXT'
|  3991 |     table->UpdateIndirectExecutionSetPipelineEXT =
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3992:10: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' was not declared in this scope; did you mean 'StubUpdateIndirectExecutionSetPipelineEXT'?
|  3992 |         (PFN_vkUpdateIndirectExecutionSetPipelineEXT)gpa(device, "vkUpdateIndirectExecutionSetPipelineEXT");
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          StubUpdateIndirectExecutionSetPipelineEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3993:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'UpdateIndirectExecutionSetPipelineEXT'
|  3993 |     if (table->UpdateIndirectExecutionSetPipelineEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3994:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'UpdateIndirectExecutionSetPipelineEXT'
|  3994 |         table->UpdateIndirectExecutionSetPipelineEXT =
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3997:12: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'UpdateIndirectExecutionSetShaderEXT'
|  3997 |     table->UpdateIndirectExecutionSetShaderEXT =
|       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3998:10: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' was not declared in this scope; did you mean 'StubUpdateIndirectExecutionSetShaderEXT'?
|  3998 |         (PFN_vkUpdateIndirectExecutionSetShaderEXT)gpa(device, "vkUpdateIndirectExecutionSetShaderEXT");
|       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |          StubUpdateIndirectExecutionSetShaderEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:3999:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'UpdateIndirectExecutionSetShaderEXT'
|  3999 |     if (table->UpdateIndirectExecutionSetShaderEXT == nullptr) {
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:4000:16: error: 'VkLayerDispatchTable' {aka 'struct VkLayerDispatchTable_'} has no member named 'UpdateIndirectExecutionSetShaderEXT'
|  4000 |         table->UpdateIndirectExecutionSetShaderEXT =
|       |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1279:35: warning: 'void StubUpdateIndirectExecutionSetShaderEXT(VkDevice, int, uint32_t, const int*)' defined but not used [-Wunused-function]
|  1279 | static VKAPI_ATTR void VKAPI_CALL StubUpdateIndirectExecutionSetShaderEXT(VkDevice, VkIndirectExecutionSetEXT, uint32_t,
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1277:35: warning: 'void StubUpdateIndirectExecutionSetPipelineEXT(VkDevice, int, uint32_t, const int*)' defined but not used [-Wunused-function]
|  1277 | static VKAPI_ATTR void VKAPI_CALL StubUpdateIndirectExecutionSetPipelineEXT(VkDevice, VkIndirectExecutionSetEXT, uint32_t,
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1275:35: warning: 'void StubDestroyIndirectExecutionSetEXT(VkDevice, int, const VkAllocationCallbacks*)' defined but not used [-Wunused-function]
|  1275 | static VKAPI_ATTR void VKAPI_CALL StubDestroyIndirectExecutionSetEXT(VkDevice, VkIndirectExecutionSetEXT,
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1271:39: warning: 'VkResult StubCreateIndirectExecutionSetEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)' defined but not used [-Wunused-function]
|  1271 | static VKAPI_ATTR VkResult VKAPI_CALL StubCreateIndirectExecutionSetEXT(VkDevice, const VkIndirectExecutionSetCreateInfoEXT*,
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1269:35: warning: 'void StubDestroyIndirectCommandsLayoutEXT(VkDevice, int, const VkAllocationCallbacks*)' defined but not used [-Wunused-function]
|  1269 | static VKAPI_ATTR void VKAPI_CALL StubDestroyIndirectCommandsLayoutEXT(VkDevice, VkIndirectCommandsLayoutEXT,
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1264:39: warning: 'VkResult StubCreateIndirectCommandsLayoutEXT(VkDevice, const int*, const VkAllocationCallbacks*, int*)' defined but not used [-Wunused-function]
|  1264 | static VKAPI_ATTR VkResult VKAPI_CALL StubCreateIndirectCommandsLayoutEXT(VkDevice, const VkIndirectCommandsLayoutCreateInfoEXT*,
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1262:35: warning: 'void StubCmdExecuteGeneratedCommandsEXT(VkCommandBuffer, VkBool32, const int*)' defined but not used [-Wunused-function]
|  1262 | static VKAPI_ATTR void VKAPI_CALL StubCmdExecuteGeneratedCommandsEXT(VkCommandBuffer, VkBool32, const VkGeneratedCommandsInfoEXT*) {
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1260:35: warning: 'void StubCmdPreprocessGeneratedCommandsEXT(VkCommandBuffer, const int*, VkCommandBuffer)' defined but not used [-Wunused-function]
|  1260 | static VKAPI_ATTR void VKAPI_CALL StubCmdPreprocessGeneratedCommandsEXT(VkCommandBuffer, const VkGeneratedCommandsInfoEXT*,
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1257:35: warning: 'void StubGetGeneratedCommandsMemoryRequirementsEXT(VkDevice, const int*, VkMemoryRequirements2*)' defined but not used [-Wunused-function]
|  1257 | static VKAPI_ATTR void VKAPI_CALL StubGetGeneratedCommandsMemoryRequirementsEXT(VkDevice,
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1232:35: warning: 'void StubCmdSetDepthClampRangeEXT(VkCommandBuffer, int, const int*)' defined but not used [-Wunused-function]
|  1232 | static VKAPI_ATTR void VKAPI_CALL StubCmdSetDepthClampRangeEXT(VkCommandBuffer, VkDepthClampModeEXT, const VkDepthClampRangeEXT*) {}
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:1223:35: warning: 'void StubAntiLagUpdateAMD(VkDevice, const int*)' defined but not used [-Wunused-function]
|  1223 | static VKAPI_ATTR void VKAPI_CALL StubAntiLagUpdateAMD(VkDevice, const VkAntiLagDataAMD*) {}
|       |                                   ^~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:557:39: warning: 'VkResult StubReleaseCapturedPipelineDataKHR(VkDevice, const int*, const VkAllocationCallbacks*)' defined but not used [-Wunused-function]
|   557 | static VKAPI_ATTR VkResult VKAPI_CALL StubReleaseCapturedPipelineDataKHR(VkDevice, const VkReleaseCapturedPipelineDataInfoKHR*,
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:553:39: warning: 'VkResult StubGetPipelineBinaryDataKHR(VkDevice, const int*, int*, size_t*, void*)' defined but not used [-Wunused-function]
|   553 | static VKAPI_ATTR VkResult VKAPI_CALL StubGetPipelineBinaryDataKHR(VkDevice, const VkPipelineBinaryDataInfoKHR*,
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:550:39: warning: 'VkResult StubGetPipelineKeyKHR(VkDevice, const int*, int*)' defined but not used [-Wunused-function]
|   550 | static VKAPI_ATTR VkResult VKAPI_CALL StubGetPipelineKeyKHR(VkDevice, const VkPipelineCreateInfoKHR*, VkPipelineBinaryKeyKHR*) {
|       |                                       ^~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:549:35: warning: 'void StubDestroyPipelineBinaryKHR(VkDevice, int, const VkAllocationCallbacks*)' defined but not used [-Wunused-function]
|   549 | static VKAPI_ATTR void VKAPI_CALL StubDestroyPipelineBinaryKHR(VkDevice, VkPipelineBinaryKHR, const VkAllocationCallbacks*) {}
|       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_dispatch_table_helper.cpp:545:39: warning: 'VkResult StubCreatePipelineBinariesKHR(VkDevice, const int*, const VkAllocationCallbacks*, int*)' defined but not used [-Wunused-function]
|   545 | static VKAPI_ATTR VkResult VKAPI_CALL StubCreatePipelineBinariesKHR(VkDevice, const VkPipelineBinaryCreateInfoKHR*,
|       |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [16/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/logging.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/error_message/logging.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/logging.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/logging.h:31,
|                  from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/logging.cpp:17:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:475:5: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|   475 |     PFN_vkCreatePipelineBinariesKHR CreatePipelineBinariesKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:476:5: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|   476 |     PFN_vkDestroyPipelineBinaryKHR DestroyPipelineBinaryKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:477:5: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   477 |     PFN_vkGetPipelineKeyKHR GetPipelineKeyKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:478:5: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   478 |     PFN_vkGetPipelineBinaryDataKHR GetPipelineBinaryDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:479:5: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|   479 |     PFN_vkReleaseCapturedPipelineDataKHR ReleaseCapturedPipelineDataKHR;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:735:5: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|   735 |     PFN_vkAntiLagUpdateAMD AntiLagUpdateAMD;
|       |     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:740:5: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|   740 |     PFN_vkCmdSetDepthClampRangeEXT CmdSetDepthClampRangeEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:752:5: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|   752 |     PFN_vkGetGeneratedCommandsMemoryRequirementsEXT GetGeneratedCommandsMemoryRequirementsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:753:5: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|   753 |     PFN_vkCmdPreprocessGeneratedCommandsEXT CmdPreprocessGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:754:5: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|   754 |     PFN_vkCmdExecuteGeneratedCommandsEXT CmdExecuteGeneratedCommandsEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:755:5: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|   755 |     PFN_vkCreateIndirectCommandsLayoutEXT CreateIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:756:5: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|   756 |     PFN_vkDestroyIndirectCommandsLayoutEXT DestroyIndirectCommandsLayoutEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:757:5: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|   757 |     PFN_vkCreateIndirectExecutionSetEXT CreateIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:758:5: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|   758 |     PFN_vkDestroyIndirectExecutionSetEXT DestroyIndirectExecutionSetEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:759:5: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|   759 |     PFN_vkUpdateIndirectExecutionSetPipelineEXT UpdateIndirectExecutionSetPipelineEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_layer_dispatch_table.h:760:5: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|   760 |     PFN_vkUpdateIndirectExecutionSetShaderEXT UpdateIndirectExecutionSetShaderEXT;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/error_message/logging.h:32:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VkObjectType ConvertVulkanObjectToCoreObject(VulkanObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:165:20: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   165 |             return VK_OBJECT_TYPE_PIPELINE_BINARY_KHR;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:197:20: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   197 |             return VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:199:20: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   199 |             return VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT;
|       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                    VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: In function 'constexpr VulkanObjectType ConvertCoreObjectToVulkanObject(VkObjectType)':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:278:14: error: 'VK_OBJECT_TYPE_PIPELINE_BINARY_KHR' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_PIPELINE_LAYOUT'?
|   278 |         case VK_OBJECT_TYPE_PIPELINE_BINARY_KHR:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_PIPELINE_LAYOUT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:310:14: error: 'VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT' was not declared in this scope
|   310 |         case VK_OBJECT_TYPE_INDIRECT_EXECUTION_SET_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:312:14: error: 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT' was not declared in this scope; did you mean 'VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV'?
|   312 |         case VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_EXT:
|       |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |              VK_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h: At global scope:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:21: error: 'VkPipelineBinaryKHR' was not declared in this scope; did you mean 'VkPipelineInfoKHR'?
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                     ^~~~~~~~~~~~~~~~~~~
|       |                     VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:961:40: error: template argument 1 is invalid
|   961 | struct VkHandleInfo<VkPipelineBinaryKHR> {
|       |                                        ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:969:13: error: 'VkPipelineBinaryKHR' does not name a type; did you mean 'VkPipelineInfoKHR'?
|   969 |     typedef VkPipelineBinaryKHR Type;
|       |             ^~~~~~~~~~~~~~~~~~~
|       |             VkPipelineInfoKHR
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:21: error: 'VkIndirectExecutionSetEXT' was not declared in this scope
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1155:46: error: template argument 1 is invalid
|  1155 | struct VkHandleInfo<VkIndirectExecutionSetEXT> {
|       |                                              ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1163:13: error: 'VkIndirectExecutionSetEXT' does not name a type
|  1163 |     typedef VkIndirectExecutionSetEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:21: error: 'VkIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                     VkIndirectCommandsLayoutNV_T
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1167:48: error: template argument 1 is invalid
|  1167 | struct VkHandleInfo<VkIndirectCommandsLayoutEXT> {
|       |                                                ^
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_object_types.h:1175:13: error: 'VkIndirectCommandsLayoutEXT' does not name a type; did you mean 'VkIndirectCommandsLayoutNV_T'?
|  1175 |     typedef VkIndirectCommandsLayoutEXT Type;
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |             VkIndirectCommandsLayoutNV_T
| [17/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/
 layers/vulkan/generated/vk_function_pointers.cpp
| FAILED: layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security 
  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-vali
 dation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_function_pointers.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vu
 lkan/generated/vk_function_pointers.cpp
| In file included from /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:26:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:422:8: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|   422 | extern PFN_vkCreatePipelineBinariesKHR CreatePipelineBinariesKHR;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:423:8: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|   423 | extern PFN_vkDestroyPipelineBinaryKHR DestroyPipelineBinaryKHR;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:424:8: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   424 | extern PFN_vkGetPipelineKeyKHR GetPipelineKeyKHR;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:425:8: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   425 | extern PFN_vkGetPipelineBinaryDataKHR GetPipelineBinaryDataKHR;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:426:8: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|   426 | extern PFN_vkReleaseCapturedPipelineDataKHR ReleaseCapturedPipelineDataKHR;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:737:8: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|   737 | extern PFN_vkAntiLagUpdateAMD AntiLagUpdateAMD;
|       |        ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:742:8: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|   742 | extern PFN_vkCmdSetDepthClampRangeEXT CmdSetDepthClampRangeEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:754:8: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|   754 | extern PFN_vkGetGeneratedCommandsMemoryRequirementsEXT GetGeneratedCommandsMemoryRequirementsEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:755:8: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|   755 | extern PFN_vkCmdPreprocessGeneratedCommandsEXT CmdPreprocessGeneratedCommandsEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:756:8: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|   756 | extern PFN_vkCmdExecuteGeneratedCommandsEXT CmdExecuteGeneratedCommandsEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:757:8: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|   757 | extern PFN_vkCreateIndirectCommandsLayoutEXT CreateIndirectCommandsLayoutEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:758:8: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|   758 | extern PFN_vkDestroyIndirectCommandsLayoutEXT DestroyIndirectCommandsLayoutEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |        PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:759:8: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|   759 | extern PFN_vkCreateIndirectExecutionSetEXT CreateIndirectExecutionSetEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:760:8: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|   760 | extern PFN_vkDestroyIndirectExecutionSetEXT DestroyIndirectExecutionSetEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:761:8: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|   761 | extern PFN_vkUpdateIndirectExecutionSetPipelineEXT UpdateIndirectExecutionSetPipelineEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.h:762:8: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|   762 | extern PFN_vkUpdateIndirectExecutionSetShaderEXT UpdateIndirectExecutionSetShaderEXT;
|       |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:459:1: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|   459 | PFN_vkCreatePipelineBinariesKHR CreatePipelineBinariesKHR;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:460:1: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|   460 | PFN_vkDestroyPipelineBinaryKHR DestroyPipelineBinaryKHR;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:461:1: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   461 | PFN_vkGetPipelineKeyKHR GetPipelineKeyKHR;
|       | ^~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:462:1: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|   462 | PFN_vkGetPipelineBinaryDataKHR GetPipelineBinaryDataKHR;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:463:1: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|   463 | PFN_vkReleaseCapturedPipelineDataKHR ReleaseCapturedPipelineDataKHR;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:774:1: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|   774 | PFN_vkAntiLagUpdateAMD AntiLagUpdateAMD;
|       | ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:779:1: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|   779 | PFN_vkCmdSetDepthClampRangeEXT CmdSetDepthClampRangeEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:791:1: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|   791 | PFN_vkGetGeneratedCommandsMemoryRequirementsEXT GetGeneratedCommandsMemoryRequirementsEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:792:1: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|   792 | PFN_vkCmdPreprocessGeneratedCommandsEXT CmdPreprocessGeneratedCommandsEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:793:1: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|   793 | PFN_vkCmdExecuteGeneratedCommandsEXT CmdExecuteGeneratedCommandsEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:794:1: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|   794 | PFN_vkCreateIndirectCommandsLayoutEXT CreateIndirectCommandsLayoutEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:795:1: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|   795 | PFN_vkDestroyIndirectCommandsLayoutEXT DestroyIndirectCommandsLayoutEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       | PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:796:1: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|   796 | PFN_vkCreateIndirectExecutionSetEXT CreateIndirectExecutionSetEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:797:1: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|   797 | PFN_vkDestroyIndirectExecutionSetEXT DestroyIndirectExecutionSetEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:798:1: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|   798 | PFN_vkUpdateIndirectExecutionSetPipelineEXT UpdateIndirectExecutionSetPipelineEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:799:1: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|   799 | PFN_vkUpdateIndirectExecutionSetShaderEXT UpdateIndirectExecutionSetShaderEXT;
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1768:17: error: 'CreatePipelineBinariesKHR' was not declared in this scope; did you mean 'CreatePipelineCache'?
|  1768 |                 CreatePipelineBinariesKHR = reinterpret_cast<PFN_vkCreatePipelineBinariesKHR>(GetDeviceProcAddr(device, "vkCreatePipelineBinariesKHR"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |                 CreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1768:62: error: 'PFN_vkCreatePipelineBinariesKHR' does not name a type; did you mean 'PFN_vkCreatePipelineCache'?
|  1768 |                 CreatePipelineBinariesKHR = reinterpret_cast<PFN_vkCreatePipelineBinariesKHR>(GetDeviceProcAddr(device, "vkCreatePipelineBinariesKHR"));
|       |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                              PFN_vkCreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1769:17: error: 'DestroyPipelineBinaryKHR' was not declared in this scope; did you mean 'DestroyPipelineLayout'?
|  1769 |                 DestroyPipelineBinaryKHR = reinterpret_cast<PFN_vkDestroyPipelineBinaryKHR>(GetDeviceProcAddr(device, "vkDestroyPipelineBinaryKHR"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                 DestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1769:61: error: 'PFN_vkDestroyPipelineBinaryKHR' does not name a type; did you mean 'PFN_vkDestroyPipelineLayout'?
|  1769 |                 DestroyPipelineBinaryKHR = reinterpret_cast<PFN_vkDestroyPipelineBinaryKHR>(GetDeviceProcAddr(device, "vkDestroyPipelineBinaryKHR"));
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             PFN_vkDestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1770:17: error: 'GetPipelineKeyKHR' was not declared in this scope
|  1770 |                 GetPipelineKeyKHR = reinterpret_cast<PFN_vkGetPipelineKeyKHR>(GetDeviceProcAddr(device, "vkGetPipelineKeyKHR"));
|       |                 ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1770:54: error: 'PFN_vkGetPipelineKeyKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|  1770 |                 GetPipelineKeyKHR = reinterpret_cast<PFN_vkGetPipelineKeyKHR>(GetDeviceProcAddr(device, "vkGetPipelineKeyKHR"));
|       |                                                      ^~~~~~~~~~~~~~~~~~~~~~~
|       |                                                      PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1771:17: error: 'GetPipelineBinaryDataKHR' was not declared in this scope
|  1771 |                 GetPipelineBinaryDataKHR = reinterpret_cast<PFN_vkGetPipelineBinaryDataKHR>(GetDeviceProcAddr(device, "vkGetPipelineBinaryDataKHR"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1771:61: error: 'PFN_vkGetPipelineBinaryDataKHR' does not name a type; did you mean 'PFN_vkGetPipelineCacheData'?
|  1771 |                 GetPipelineBinaryDataKHR = reinterpret_cast<PFN_vkGetPipelineBinaryDataKHR>(GetDeviceProcAddr(device, "vkGetPipelineBinaryDataKHR"));
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             PFN_vkGetPipelineCacheData
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1772:17: error: 'ReleaseCapturedPipelineDataKHR' was not declared in this scope
|  1772 |                 ReleaseCapturedPipelineDataKHR = reinterpret_cast<PFN_vkReleaseCapturedPipelineDataKHR>(GetDeviceProcAddr(device, "vkReleaseCapturedPipelineDataKHR"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:1772:67: error: 'PFN_vkReleaseCapturedPipelineDataKHR' does not name a type
|  1772 |                 ReleaseCapturedPipelineDataKHR = reinterpret_cast<PFN_vkReleaseCapturedPipelineDataKHR>(GetDeviceProcAddr(device, "vkReleaseCapturedPipelineDataKHR"));
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2329:17: error: 'AntiLagUpdateAMD' was not declared in this scope
|  2329 |                 AntiLagUpdateAMD = reinterpret_cast<PFN_vkAntiLagUpdateAMD>(GetDeviceProcAddr(device, "vkAntiLagUpdateAMD"));
|       |                 ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2329:53: error: 'PFN_vkAntiLagUpdateAMD' does not name a type
|  2329 |                 AntiLagUpdateAMD = reinterpret_cast<PFN_vkAntiLagUpdateAMD>(GetDeviceProcAddr(device, "vkAntiLagUpdateAMD"));
|       |                                                     ^~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2387:17: error: 'CmdSetDepthClampRangeEXT' was not declared in this scope; did you mean 'CmdSetDepthClampEnableEXT'?
|  2387 |                 CmdSetDepthClampRangeEXT = reinterpret_cast<PFN_vkCmdSetDepthClampRangeEXT>(GetDeviceProcAddr(device, "vkCmdSetDepthClampRangeEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                 CmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2387:61: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|  2387 |                 CmdSetDepthClampRangeEXT = reinterpret_cast<PFN_vkCmdSetDepthClampRangeEXT>(GetDeviceProcAddr(device, "vkCmdSetDepthClampRangeEXT"));
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2419:17: error: 'GetGeneratedCommandsMemoryRequirementsEXT' was not declared in this scope; did you mean 'GetGeneratedCommandsMemoryRequirementsNV'?
|  2419 |                 GetGeneratedCommandsMemoryRequirementsEXT = reinterpret_cast<PFN_vkGetGeneratedCommandsMemoryRequirementsEXT>(GetDeviceProcAddr(device, "vkGetGeneratedCommandsMemoryRequirementsEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                 GetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2419:78: error: 'PFN_vkGetGeneratedCommandsMemoryRequirementsEXT' does not name a type; did you mean 'PFN_vkGetGeneratedCommandsMemoryRequirementsNV'?
|  2419 |                 GetGeneratedCommandsMemoryRequirementsEXT = reinterpret_cast<PFN_vkGetGeneratedCommandsMemoryRequirementsEXT>(GetDeviceProcAddr(device, "vkGetGeneratedCommandsMemoryRequirementsEXT"));
|       |                                                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                              PFN_vkGetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2420:17: error: 'CmdPreprocessGeneratedCommandsEXT' was not declared in this scope; did you mean 'CmdPreprocessGeneratedCommandsNV'?
|  2420 |                 CmdPreprocessGeneratedCommandsEXT = reinterpret_cast<PFN_vkCmdPreprocessGeneratedCommandsEXT>(GetDeviceProcAddr(device, "vkCmdPreprocessGeneratedCommandsEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                 CmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2420:70: error: 'PFN_vkCmdPreprocessGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdPreprocessGeneratedCommandsNV'?
|  2420 |                 CmdPreprocessGeneratedCommandsEXT = reinterpret_cast<PFN_vkCmdPreprocessGeneratedCommandsEXT>(GetDeviceProcAddr(device, "vkCmdPreprocessGeneratedCommandsEXT"));
|       |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                      PFN_vkCmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2421:17: error: 'CmdExecuteGeneratedCommandsEXT' was not declared in this scope; did you mean 'CmdExecuteGeneratedCommandsNV'?
|  2421 |                 CmdExecuteGeneratedCommandsEXT = reinterpret_cast<PFN_vkCmdExecuteGeneratedCommandsEXT>(GetDeviceProcAddr(device, "vkCmdExecuteGeneratedCommandsEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                 CmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2421:67: error: 'PFN_vkCmdExecuteGeneratedCommandsEXT' does not name a type; did you mean 'PFN_vkCmdExecuteGeneratedCommandsNV'?
|  2421 |                 CmdExecuteGeneratedCommandsEXT = reinterpret_cast<PFN_vkCmdExecuteGeneratedCommandsEXT>(GetDeviceProcAddr(device, "vkCmdExecuteGeneratedCommandsEXT"));
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                   PFN_vkCmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2422:17: error: 'CreateIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'CreateIndirectCommandsLayoutNV'?
|  2422 |                 CreateIndirectCommandsLayoutEXT = reinterpret_cast<PFN_vkCreateIndirectCommandsLayoutEXT>(GetDeviceProcAddr(device, "vkCreateIndirectCommandsLayoutEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                 CreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2422:68: error: 'PFN_vkCreateIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkCreateIndirectCommandsLayoutNV'?
|  2422 |                 CreateIndirectCommandsLayoutEXT = reinterpret_cast<PFN_vkCreateIndirectCommandsLayoutEXT>(GetDeviceProcAddr(device, "vkCreateIndirectCommandsLayoutEXT"));
|       |                                                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                    PFN_vkCreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2423:17: error: 'DestroyIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'DestroyIndirectCommandsLayoutNV'?
|  2423 |                 DestroyIndirectCommandsLayoutEXT = reinterpret_cast<PFN_vkDestroyIndirectCommandsLayoutEXT>(GetDeviceProcAddr(device, "vkDestroyIndirectCommandsLayoutEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                 DestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2423:69: error: 'PFN_vkDestroyIndirectCommandsLayoutEXT' does not name a type; did you mean 'PFN_vkDestroyIndirectCommandsLayoutNV'?
|  2423 |                 DestroyIndirectCommandsLayoutEXT = reinterpret_cast<PFN_vkDestroyIndirectCommandsLayoutEXT>(GetDeviceProcAddr(device, "vkDestroyIndirectCommandsLayoutEXT"));
|       |                                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                                     PFN_vkDestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2424:17: error: 'CreateIndirectExecutionSetEXT' was not declared in this scope
|  2424 |                 CreateIndirectExecutionSetEXT = reinterpret_cast<PFN_vkCreateIndirectExecutionSetEXT>(GetDeviceProcAddr(device, "vkCreateIndirectExecutionSetEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2424:66: error: 'PFN_vkCreateIndirectExecutionSetEXT' does not name a type
|  2424 |                 CreateIndirectExecutionSetEXT = reinterpret_cast<PFN_vkCreateIndirectExecutionSetEXT>(GetDeviceProcAddr(device, "vkCreateIndirectExecutionSetEXT"));
|       |                                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2425:17: error: 'DestroyIndirectExecutionSetEXT' was not declared in this scope
|  2425 |                 DestroyIndirectExecutionSetEXT = reinterpret_cast<PFN_vkDestroyIndirectExecutionSetEXT>(GetDeviceProcAddr(device, "vkDestroyIndirectExecutionSetEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2425:67: error: 'PFN_vkDestroyIndirectExecutionSetEXT' does not name a type
|  2425 |                 DestroyIndirectExecutionSetEXT = reinterpret_cast<PFN_vkDestroyIndirectExecutionSetEXT>(GetDeviceProcAddr(device, "vkDestroyIndirectExecutionSetEXT"));
|       |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2426:17: error: 'UpdateIndirectExecutionSetPipelineEXT' was not declared in this scope
|  2426 |                 UpdateIndirectExecutionSetPipelineEXT = reinterpret_cast<PFN_vkUpdateIndirectExecutionSetPipelineEXT>(GetDeviceProcAddr(device, "vkUpdateIndirectExecutionSetPipelineEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2426:74: error: 'PFN_vkUpdateIndirectExecutionSetPipelineEXT' does not name a type
|  2426 |                 UpdateIndirectExecutionSetPipelineEXT = reinterpret_cast<PFN_vkUpdateIndirectExecutionSetPipelineEXT>(GetDeviceProcAddr(device, "vkUpdateIndirectExecutionSetPipelineEXT"));
|       |                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2427:17: error: 'UpdateIndirectExecutionSetShaderEXT' was not declared in this scope
|  2427 |                 UpdateIndirectExecutionSetShaderEXT = reinterpret_cast<PFN_vkUpdateIndirectExecutionSetShaderEXT>(GetDeviceProcAddr(device, "vkUpdateIndirectExecutionSetShaderEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2427:72: error: 'PFN_vkUpdateIndirectExecutionSetShaderEXT' does not name a type
|  2427 |                 UpdateIndirectExecutionSetShaderEXT = reinterpret_cast<PFN_vkUpdateIndirectExecutionSetShaderEXT>(GetDeviceProcAddr(device, "vkUpdateIndirectExecutionSetShaderEXT"));
|       |                                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp: In lambda function:
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2432:17: error: 'CmdSetDepthClampRangeEXT' was not declared in this scope; did you mean 'CmdSetDepthClampEnableEXT'?
|  2432 |                 CmdSetDepthClampRangeEXT = reinterpret_cast<PFN_vkCmdSetDepthClampRangeEXT>(GetDeviceProcAddr(device, "vkCmdSetDepthClampRangeEXT"));
|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~
|       |                 CmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2432:61: error: 'PFN_vkCmdSetDepthClampRangeEXT' does not name a type; did you mean 'PFN_vkCmdSetDepthClampEnableEXT'?
|  2432 |                 CmdSetDepthClampRangeEXT = reinterpret_cast<PFN_vkCmdSetDepthClampRangeEXT>(GetDeviceProcAddr(device, "vkCmdSetDepthClampRangeEXT"));
|       |                                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                             PFN_vkCmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp: In function 'void vk::ResetAllExtensions()':
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2645:5: error: 'CreatePipelineBinariesKHR' was not declared in this scope; did you mean 'CreatePipelineCache'?
|  2645 |     CreatePipelineBinariesKHR = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~
|       |     CreatePipelineCache
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2646:5: error: 'DestroyPipelineBinaryKHR' was not declared in this scope; did you mean 'DestroyPipelineLayout'?
|  2646 |     DestroyPipelineBinaryKHR = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     DestroyPipelineLayout
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2647:5: error: 'GetPipelineKeyKHR' was not declared in this scope
|  2647 |     GetPipelineKeyKHR = nullptr;
|       |     ^~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2648:5: error: 'GetPipelineBinaryDataKHR' was not declared in this scope
|  2648 |     GetPipelineBinaryDataKHR = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2649:5: error: 'ReleaseCapturedPipelineDataKHR' was not declared in this scope
|  2649 |     ReleaseCapturedPipelineDataKHR = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2960:5: error: 'AntiLagUpdateAMD' was not declared in this scope
|  2960 |     AntiLagUpdateAMD = nullptr;
|       |     ^~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2965:5: error: 'CmdSetDepthClampRangeEXT' was not declared in this scope; did you mean 'CmdSetDepthClampEnableEXT'?
|  2965 |     CmdSetDepthClampRangeEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~
|       |     CmdSetDepthClampEnableEXT
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2977:5: error: 'GetGeneratedCommandsMemoryRequirementsEXT' was not declared in this scope; did you mean 'GetGeneratedCommandsMemoryRequirementsNV'?
|  2977 |     GetGeneratedCommandsMemoryRequirementsEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     GetGeneratedCommandsMemoryRequirementsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2978:5: error: 'CmdPreprocessGeneratedCommandsEXT' was not declared in this scope; did you mean 'CmdPreprocessGeneratedCommandsNV'?
|  2978 |     CmdPreprocessGeneratedCommandsEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     CmdPreprocessGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2979:5: error: 'CmdExecuteGeneratedCommandsEXT' was not declared in this scope; did you mean 'CmdExecuteGeneratedCommandsNV'?
|  2979 |     CmdExecuteGeneratedCommandsEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     CmdExecuteGeneratedCommandsNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2980:5: error: 'CreateIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'CreateIndirectCommandsLayoutNV'?
|  2980 |     CreateIndirectCommandsLayoutEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     CreateIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2981:5: error: 'DestroyIndirectCommandsLayoutEXT' was not declared in this scope; did you mean 'DestroyIndirectCommandsLayoutNV'?
|  2981 |     DestroyIndirectCommandsLayoutEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |     DestroyIndirectCommandsLayoutNV
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2982:5: error: 'CreateIndirectExecutionSetEXT' was not declared in this scope
|  2982 |     CreateIndirectExecutionSetEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2983:5: error: 'DestroyIndirectExecutionSetEXT' was not declared in this scope
|  2983 |     DestroyIndirectExecutionSetEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2984:5: error: 'UpdateIndirectExecutionSetPipelineEXT' was not declared in this scope
|  2984 |     UpdateIndirectExecutionSetPipelineEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan/generated/vk_function_pointers.cpp:2985:5: error: 'UpdateIndirectExecutionSetShaderEXT' was not declared in this scope
|  2985 |     UpdateIndirectExecutionSetShaderEXT = nullptr;
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| [18/181] /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot -DVK_ENABLE_BETA_EXTENSIONS -DVK_USE_PLATFORM_WAYLAND_KHR -DVK_USE_PLATFORM_XCB_KHR -DVK_USE_PLATFORM_XLIB_KHR -DVK_USE_PLATFORM_XLIB_XRANDR_EXT -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/. -I/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/vulkan -isystem /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/layers/external -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-
 security  --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot  -O2 -g -fcanon-prefix-map  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build=/usr/src/debug/vulkan-validation-layers/1.3.296.0  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vu
 lkan-validation-layers/1.3.296.0/recipe-sysroot=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot=  -fdebug-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -fmacro-prefix-map=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/recipe-sysroot-native=  -pipe -fvisibility-inlines-hidden -std=c++17 -fPIC -fvisibility=hidden -fvisibility-inlines-hidden -Wall -Wextra -Wpointer-arith -MD -MT layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_extension_helper.cpp.o -MF layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_extension_helper.cpp.o.d -o layers/CMakeFiles/VkLayer_utils.dir/vulkan/generated/vk_extension_helper.cpp.o -c /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/git/lay
 ers/vulkan/generated/vk_extension_helper.cpp
| ninja: build stopped: subcommand failed.
| 
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/temp/run.do_compile.2756776:153 exit 1 from 'eval ${DESTDIR:+DESTDIR=${DESTDIR} }VERBOSE=1 cmake --build '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/build' "$@" -- ${EXTRA_OECMAKE_BUILD}'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_runcmake_build, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/temp/run.do_compile.2756776, line 153
| 	#2: cmake_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/temp/run.do_compile.2756776, line 147
| 	#3: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/temp/run.do_compile.2756776, line 142
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/temp/run.do_compile.2756776, line 166
NOTE: recipe vulkan-validation-layers-1.3.296.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1638 tasks of which 1627 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010052237.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20241010052237.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/temp/log.do_compile.2756776
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: vulkan-validation-layers-1.3.296.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/temp/run.do_compile.2756776' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/vulkan-validation-layers/1.3.296.0/temp/log.do_compile.2756776
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.296.0.bb:do_compile) failed with exit code '1'

--===============3422407675697608414==--

